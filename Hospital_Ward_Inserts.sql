USE HospitalStudy;

EXEC AddWard @Ward_Name = 'General #1',
	@Ward_Location = 'W1',
	@Beds_Available = 15,
	@Extension_Number = 1347,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #2',
	@Ward_Location = 'W2',
	@Beds_Available = 15,
	@Extension_Number = 1348,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #3',
	@Ward_Location = 'W3',
	@Beds_Available = 15,
	@Extension_Number = 1349,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #4',
	@Ward_Location = 'W4',
	@Beds_Available = 15,
	@Extension_Number = 1355,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #5',
	@Ward_Location = 'N1',
	@Beds_Available = 15,
	@Extension_Number = 1356,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #6',
	@Ward_Location = 'N2',
	@Beds_Available = 15,
	@Extension_Number = 1357,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #7',
	@Ward_Location = 'N3',
	@Beds_Available = 15,
	@Extension_Number = 1358,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #8',
	@Ward_Location = 'N4',
	@Beds_Available = 7,
	@Extension_Number = 1359,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'General #9',
	@Ward_Location = 'N5',
	@Beds_Available = 8,
	@Extension_Number = 1362,
	@Ward_Type = 'General';

EXEC AddWard @Ward_Name = 'Cardiac #1',
	@Ward_Location = 'E1',
	@Beds_Available = 15,
	@Extension_Number = 1300,
	@Ward_Type = 'Cardiac';

EXEC AddWard @Ward_Name = 'Cardiac #2',
	@Ward_Location = 'E2',
	@Beds_Available = 15,
	@Extension_Number = 1305,
	@Ward_Type = 'Cardiac';

EXEC AddWard @Ward_Name = 'Orthopedic #1',
	@Ward_Location = 'E3',
	@Beds_Available = 10,
	@Extension_Number = 1306,
	@Ward_Type = 'Orthopedic';

EXEC AddWard @Ward_Name = 'Cancer #1',
	@Ward_Location = 'S1',
	@Beds_Available = 15,
	@Extension_Number = 1472,
	@Ward_Type = 'Cancer';
	
EXEC AddWard @Ward_Name = 'Cancer #2',
	@Ward_Location = 'S2',
	@Beds_Available = 15,
	@Extension_Number = 1479,
	@Ward_Type = 'Cancer';

EXEC AddWard @Ward_Name = 'Diagonistic Imaging #1',
	@Ward_Location = 'E4',
	@Beds_Available = 10,
	@Extension_Number = 1455,
	@Ward_Type = 'Diagonistic Imaging';


EXEC AddWard @Ward_Name = 'ENT #1',
	@Ward_Location = 'C1',
	@Beds_Available = 20,
	@Extension_Number = 1360,
	@Ward_Type = 'ENT';

EXEC AddWard @Ward_Name = 'Locomotor #1',
	@Ward_Location = 'C2',
	@Beds_Available = 20,
	@Extension_Number = 1364,
	@Ward_Type = 'Locomotor';

EXEC AddWard @Ward_Name = 'OutPatient Clinic',
	@Ward_Location = 'O',
	@Beds_Available = 0,
	@Extension_Number = 1200,
	@Ward_Type = 'OutPatient';