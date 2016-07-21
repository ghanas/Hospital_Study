USE HospitalStudy;
ALTER TABLE Wards
	ADD CONSTRAINT FK_Wards_wardTypeId FOREIGN KEY(wardTypeId)
		REFERENCES WardTypes(wardTypeId);

ALTER TABLE WardRequests
	ADD CONSTRAINT FK_WardRequests_staffId FOREIGN KEY(staffId)
		REFERENCES Staff(staffId),
	CONSTRAINT FK_WardRequests_wardId FOREIGN KEY(wardId)
		REFERENCES Wards(wardId),
	CONSTRAINT FK_WardRequests_supplyId FOREIGN KEY(supplyId)
		REFERENCES Supplies(supplyId),
	CONSTRAINT FK_WardRequests_drugId FOREIGN KEY(drugId)
		REFERENCES Drugs(drugId);

ALTER TABLE WardStaff
	ADD CONSTRAINT FK_WardStaff_staffId FOREIGN KEY(staffId)
		REFERENCES Staff(staffId),
	CONSTRAINT FK_WardStaff_wardId FOREIGN KEY(wardId)
		REFERENCES Wards(wardId);

ALTER TABLE StaffQualifications
	ADD CONSTRAINT FK_StaffQualificiations_staffId FOREIGN KEY(staffId)
		REFERENCES Staff(staffId),
	CONSTRAINT FK_StaffQualifications_qualificationId FOREIGN KEY(qualificationId)
		REFERENCES Qualifications(qualificationId);

ALTER TABLE StaffWorkExperience
	ADD CONSTRAINT FK_StaffWorkExperience_staffId FOREIGN KEY(staffId)
		REFERENCES Staff(staffId),
	CONSTRAINT FK_StaffWorkExperience_workExpId FOREIGN KEY(workExpId)
		REFERENCES WorkExperience(workExpId);

ALTER TABLE PersonalInfo
	ADD CONSTRAINT FK_PersonalInfo_addressId FOREIGN KEY(addressId)
		REFERENCES "Address"(addressId);

ALTER TABLE Staff
	ADD CONSTRAINT FK_Staff_positionId FOREIGN KEY(positionId)
		REFERENCES Positions(positionId),
	CONSTRAINT FK_Staff_managerId FOREIGN KEY(managerId)
		REFERENCES Staff(staffId);

ALTER TABLE PatientMedication
 ADD CONSTRAINT FK_PatientMedication_patientId FOREIGN KEY (patientId)
   REFERENCES Patients (patientId),
 CONSTRAINT FK_PatientMedication_drugId FOREIGN KEY (drugId)
   REFERENCES Drugs (drugId);

ALTER TABLE Suppliers
 ADD CONSTRAINT FK_Suppliers_addressId FOREIGN KEY (addressId)
   REFERENCES "Address" (addressId);
 
ALTER TABLE Patients
 ADD CONSTRAINT FK_Patient_personalInfoId FOREIGN KEY (personalInfoId)
   REFERENCES PersonalInfo (personalInfoId),
 CONSTRAINT FK_Patient_nextOfKinId FOREIGN KEY (nextOfKinId)
   REFERENCES NextOfKin (NextOfKinId),
 CONSTRAINT FK_Patient_localDoctorId FOREIGN KEY (localDoctorId)
   REFERENCES LocalDoctor (localDoctorId);
 
ALTER TABLE OutPatient
 ADD CONSTRAINT FK_OutPatient_patientId FOREIGN KEY(patientId)
   REFERENCES Patients (patientId),
 CONSTRAINT FK_OutPatient_appointmentId FOREIGN KEY(appointmentId)
   REFERENCES Appointments (appointmentId);
 
ALTER TABLE InPatient
 ADD CONSTRAINT FK_InPatient_patientId FOREIGN KEY (patientId)
   REFERENCES Patients (patientId),
 CONSTRAINT FK_InPatient_wardId FOREIGN KEY (wardId)
   REFERENCES Wards (wardId),
 CONSTRAINT FK_InPatient_wardTypeId FOREIGN KEY (wardTypeId)
   REFERENCES WardTypes (wardTypeId);
 
ALTER TABLE LocalDoctor
 ADD CONSTRAINT FK_LocalDoctor_addressId FOREIGN KEY (addressId)
   REFERENCES "Address" (addressId)
 
ALTER TABLE Appointments
 ADD CONSTRAINT FK_Appointments_staffId FOREIGN KEY (staffId)
   REFERENCES Staff (staffId),
 CONSTRAINT FK_Appointments_patientId FOREIGN KEY (patientId)
   REFERENCES Patients (patientId);

ALTER TABLE Schedule 
 ADD CONSTRAINT FK_Schedule_staffId FOREIGN KEY (staffId)
   REFERENCES Staff (staffId);