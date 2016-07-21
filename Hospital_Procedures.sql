USE HospitalStudy;
CREATE PROC AddWard
  @Ward_Name AS VARCHAR(20),
  @Ward_Location AS VARCHAR(20),
  @Beds_Avaliable AS INT,
  @Extention_Number AS INT,
  @Ward_Type AS VARCHAR(30)
AS BEGIN
  -- If try fails then Ward already exists
  BEGIN TRY
    --BEGIN TRANSACTION
    DECLARE @wt AS INT;
	EXEC AddWardType @Type_Name = @Ward_Type, @Type_Id = @wt OUTPUT;
			
	INSERT INTO Wards (wardName, wardLocation, numberOfBeds, extNum, wardTypeId)
	VALUES (@Ward_Name, @Ward_Location, @Beds_Avaliable, @Extention_Number, @wt);
	--COMMIT TRANSACTION
  END TRY
  BEGIN CATCH
	--ROLLBACK TRANSACTION
	--Raiseerror('Some error message',16,1) 
	SELECT
	ERROR_NUMBER() AS ErrorNumber
  END CATCH
  RETURN;
END

 CREATE PROC AddWardType
  @Type_Name AS VARCHAR(30),
  @Type_Id AS INT = -1 OUTPUT
AS BEGIN
  BEGIN TRY
    INSERT INTO WardTypes(wardType)
      VALUES(@Type_Name)
    SET @Type_Id = SCOPE_IDENTITY()
  END TRY
  BEGIN CATCH
    SELECT @Type_Id = T.wardTypeId
    FROM WardTypes T
    WHERE T.wardtype = @Type_Name;
  END CATCH
  RETURN;
END

CREATE PROC AddPosition
  @Position AS VARCHAR(50),
  @Base_Salary AS MONEY,
  @Type_Id AS INT = -1 OUTPUT
AS BEGIN
  BEGIN TRY
    INSERT INTO Positions(position, baseSalary)
	  VALUES (@Position, @Base_Salary)
    SET @Type_Id = SCOPE_IDENTITY()
  END TRY
  BEGIN CATCH
    SELECT @Type_Id = P.positionId
	FROM Positions P
	WHERE P.position = @Position; 
  END CATCH
  RETURN;
END
SELECT * FROM Positions

ALTER TABLE Positions
ADD baseSalary MONEY;
BEGIN TRANSACTION 
DECLARE @t AS INT;
EXEC AddPosition @Position = 'Junior Nurse', @Base_Salary = 10000, @Type_Id = @t OUTPUT;
ROLLBACK
	