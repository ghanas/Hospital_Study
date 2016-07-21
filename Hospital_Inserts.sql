USE HospitalStudy;
CREATE TABLE Wards (
  wardId INT IDENTITY NOT NULL
		CONSTRAINT PK_Ward_wardId PRIMARY KEY (wardId),
  wardName VARCHAR(20) NOT NULL
		CONSTRAINT UN_Wards_wardName UNIQUE,
  wardLocation VARCHAR(20) NOT NULL
		CONSTRAINT UN_Wards_wardLocation UNIQUE,
  numberOfBeds INT NOT NULL,
  extNum INT NOT NULL
		CONSTRAINT UN_Wards_extNum UNIQUE
		CONSTRAINT CK_Wards_extNum CHECK(extNum BETWEEN 1000 AND 9999),
  wardTypeId INT NOT NULL --FK to WardType
);
CREATE TABLE WardTypes (
  wardTypeId INT IDENTITY NOT NULL
	CONSTRAINT PK_WardType_wardTypeId PRIMARY KEY (wardTypeId),
  wardType VARCHAR(30) NOT NULL
	CONSTRAINT UN_WardType_wardType UNIQUE(wardType)
);
CREATE TABLE WardRequests (
  requestId INT IDENTITY NOT NULL
	CONSTRAINT PK_WardRequests_requestId PRIMARY KEY(requestId), 
  staffId INT NOT NULL, --FK to Staff
  wardId INT NOT NULL, -- FK to Wards
  supplyId INT, -- FK Supplies
  drugId INT, -- FK to Drugs
  quantityReq INT NOT NULL,
  dateOrdered DATE NOT NULL,
  dateRecieved DATE,
  recievedBy VARCHAR(40)
);
CREATE TABLE WardStaff (
  wardStaffId INT IDENTITY NOT NULL
	CONSTRAINT PK_WardStaff_wardStaffId PRIMARY KEY  (wardStaffId),
  staffId INT NOT NULL, -- FK to staff
  wardId INT NOT NULL, -- FK to Ward
);

CREATE TABLE Positions(
  positionId INT IDENTITY NOT NULL
	CONSTRAINT PK_Positions_positionId PRIMARY KEY (positionId),
  position VARCHAR(50) NOT NULL
	CONSTRAINT UN_Positions_position UNIQUE,
  baseSalary MONEY
);
CREATE TABLE Qualifications (
  qualificationId INT IDENTITY NOT NULL
	CONSTRAINT PK_Qualifications_qualificationId  PRIMARY KEY (qualificationId),
  dateObtained DATE NOT NULL,
  institutionId VARCHAR(50) NOT NULL
);
CREATE TABLE WorkExperience (
  workExpId INT IDENTITY NOT NULL
	CONSTRAINT PK_WorkExperience_workExpId PRIMARY KEY (workExpId),
  position VARCHAR(20) NOT NULL,
  startDate DATE NOT NULL,
  finishDate DATE NOT NULL
);
CREATE TABLE StaffQualifications (
  staffQualificationsId INT IDENTITY NOT NULL
	CONSTRAINT PK_StaffQulaifications_staffQualificationsId PRIMARY KEY (staffQualificationsId),
  staffId INT NOT NULL, -- FK to Staff
  qualificationId INT NOT NULL -- FK to Qualifications 
);
CREATE TABLE StaffWorkExperience (
  staffWorkExpId INT IDENTITY NOT NULL
	CONSTRAINT PK_StaffWorkExperience_staffWorkExpId PRIMARY KEY (staffWorkExpId),
  staffId INT NOT NULL, -- FK to Staff
  workExpId INT NOT NULL -- FK to WorkExperience 
);
CREATE TABLE PersonalInfo (
	personalInfoId INT IDENTITY NOT NULL
		CONSTRAINT PK_PersonalInfo_personalInfoId PRIMARY KEY (personalInfoId),
	firstName VARCHAR(30) NOT NULL,
	lastName VARCHAR(30) NOT NULL,
	phoneNum BIGINT,
	birthDate DATE NOT NULL,
	sex CHAR(1)
		CONSTRAINT CK_PersonalInfo_sex CHECK(sex IN('M','F','U')),
	addressId INT NOT NULL-- FK to Address
);
CREATE TABLE Staff(
  staffId INT IDENTITY NOT NULL
	CONSTRAINT PK_Staff_staffId PRIMARY KEY (staffId),
  insuranceNo INT NOT NULL
	CONSTRAINT UN_Staff_insuranceNo UNIQUE,
  positionId INT NOT NULL, -- FK to Position
  salary MONEY NOT NULL,
  salaryScale VARCHAR(10) NOT NULL,
  payType CHAR(1) NOT NULL
	CONSTRAINT DF_Staff_payType DEFAULT('W')
	CONSTRAINT CK_Staff_payType CHECK(payType IN('W','M')),
  contractType CHAR(1) NOT NULL
	CONSTRAINT DF_Staff_contractType DEFAULT('P')
	CONSTRAINT CK_Staff_contractType CHECK(contractType IN('P','T')),
  managerId INT -- FK to Staff
);
CREATE TABLE PatientMedication (
  perscriptionId INT IDENTITY NOT NULL
	CONSTRAINT PK_PatientMedication_perscriptionId PRIMARY KEY (perscriptionId),
  patientId INT NOT NULL, -- FK to Patient
  drugId INT NOT NULL, -- FK to Drugs
  unitsPerDay VARCHAR(10) NOT NULL,
  startDate DATE NOT NULL,
  finishDate DATE NOT NULL
);
CREATE TABLE Suppliers (
  supplierId INT IDENTITY NOT NULL
	CONSTRAINT PK_Suppliers_supplierId PRIMARY KEY(supplierId),
  supplierName VARCHAR(30) NOT NULL,
  addressId INT NOT NULL, --FK to Address
  email VARCHAR(30) NOT NULL,
  phoneNum BIGINT
);
CREATE TABLE NextOfKin (
  nextOfKinId INT IDENTITY NOT NULL
	CONSTRAINT PK_NextOfKin_nextOfKinId PRIMARY KEY(nextOfKinId),
  firstName VARCHAR(30) NOT NULL,
  lastName VARCHAR(30) NOT NULL,
  phoneNum BIGINT NOT NULL,
  relationship VARCHAR(30) NOT NULL
);
CREATE TABLE Patients
(
	patientId INT IDENTITY NOT NULL 
		CONSTRAINT PK_Patients_patientId PRIMARY KEY(patientId),
	personalInfoId INT NOT NULL, --FK to PersonalInfo
	maritalStatus CHAR(1) NOT NULL
		CONSTRAINT CK_Patients_maritalStatus CHECK( maritalStatus IN ('S', 'M', 'D') )
		CONSTRAINT DF_Patients_maritalStatus DEFAULT('S'),
	registrationDate DATE NOT NULL,
	nextOfKinId INT NOT NULL, --FK to NextOfKin
	localDoctorId INT NOT NULL --FK to LocalDoctors
);
CREATE TABLE OutPatient (
  outPatientId INT IDENTITY NOT NULL
	CONSTRAINT PK_OutPatient_outPatientId PRIMARY KEY(outPatientId),
  patientId INT NOT NULL, --FK to Patients
  appointmentId INT NOT NULL --FK to Appointments
);
CREATE TABLE InPatient (
  inPatientId INT IDENTITY NOT NULL
	CONSTRAINT PK_InPatient_inPatientId PRIMARY KEY(inPatientId),
  patientId INT NOT NULL, --FK to Patients
  wardId INT, --FK to Wards
  dateOnWaitlist DATETIME,
  expectedCheckOutDate DATETIME,
  actualCheckOutDate DATETIME,
  admittanceDate DATETIME,
  expectedDuration INT NOT NULL,
  wardTypeId INT NOT NULL, --FK to WardType
  bedNumber INT,
);
CREATE TABLE LocalDoctor (
  localDoctorId INT IDENTITY NOT NULL
	CONSTRAINT PK_LocalDoctor_localDoctorId PRIMARY KEY(localDoctorId),
  firstName VARCHAR(20) NOT NULL,
  lastName VARCHAR(20) NOT NULL,
  clinicNum INT UNIQUE NOT NULL,
  addressId INT NOT NULL, --FK to Address
  clinicPhoneNum BIGINT NOT NULL,
);
CREATE TABLE Appointments(
	appointmentId INT IDENTITY NOT NULL 
		CONSTRAINT PK_Appointments_appointmentId PRIMARY KEY(appointmentId),
	staffId INT NOT NULL, --FK to Staff
	patientId INT NOT NULL, --FK to Patients
	appointmentTime DATETIME NOT NULL,
	room INT NOT NULL,
	recommendation VARCHAR(30) NOT NULL,
	appointmentType CHAR(1) NOT NULL
		CONSTRAINT CK_Appointments_appointmentType CHECK(appointmentType IN ('I','O'))
		CONSTRAINT DF_Appointments_appointmentType DEFAULT('I')
);
CREATE TABLE Drugs(
	drugId INT IDENTITY NOT NULL
		CONSTRAINT PK_Drugs_drugId PRIMARY KEY(drugId),
	drugName VARCHAR(30) NOT NULL,
	adminMethod VARCHAR(30) NOT NULL,
	dosage VARCHAR(10) NOT NULL,
	"description" VARCHAR(50),
	stockQty INT NOT NULL,
	reorderLvl INT NOT NULL,
	costPerUnit MONEY NOT NULL
);
CREATE TABLE Supplies(
	supplyId INT IDENTITY NOT NULL
		CONSTRAINT PK_Supplies_supplyId PRIMARY KEY(supplyId),
	itemName VARCHAR(50) NOT NULL,
	surgical TINYINT NOT NULL
		CONSTRAINT DF_Supplies_surgical DEFAULT(0)
		CONSTRAINT CK_Supplies_surgical CHECK(surgical IN(0,1)),
	"description" VARCHAR(50),
	stockQty INT NOT NULL,
	reorderLvl INT NOT NULL,
	costPerUnit MONEY NOT NULL
);
CREATE TABLE "Address" (
	addressId INT IDENTITY NOT NULL
		CONSTRAINT PK_Address_addressId PRIMARY KEY(addressId),
	street VARCHAR(50) NOT NULL, 
	city VARCHAR(50) NOT NULL,
	zipCode INT NOT NULL,
);
CREATE TABLE Schedule(
	scheduleId INT IDENTITY NOT NULL
		CONSTRAINT PK_Schedule_scheduleId PRIMARY KEY(scheduleId),
	staffId INT NOT NULL, --FK to Staff
	"shift" DATETIME NOT NULL
);
