CREATE PROCEDURE uspInsertTeam
  @T_Name_I VARCHAR(50),
  @T_Desc_I VARCHAR (200),
  @D_Name_I VARCHAR(50),
  @O_Name_I VARCHAR(50)
  AS
  DECLARE @D_ID_I INT

  EXEC uspGetDepartmentID
    @D_Name = @D_Name_I,
    @O_Name_1 = @O_Name_I,
    @D_ID = @D_ID_I OUTPUT

  IF @D_ID_I IS NULL
  BEGIN
      PRINT '@D_ID_I (DepartmentID) IS NULL and that is a problem'
      RAISERROR ('@D_ID_I (DepartmentID) cannot be NULL; check spelling because transaction is failing', 11,1)
      RETURN
  END

    BEGIN TRANSACTION T1
        INSERT INTO tblTeam(DepartmentID, TeamName, TeamDesc)
        VALUES (@D_ID_I, @T_Name_I, @T_Desc_I)
    IF @@ERROR <> 0
        ROLLBACK TRANSACTION T1
    ELSE
        COMMIT TRANSACTION T1
GO

EXEC uspInsertTeam
    @T_Name_I = '',
    @T_Desc_I = '',
    @D_Name_I = '',
    @O_Name_I = ''

EXEC uspInsertTeam
    @T_Name_I = '',
    @T_Desc_I = '',
    @D_Name_I = '',
    @O_Name_I = ''

EXEC uspInsertTeam
    @T_Name_I = '',
    @T_Desc_I = '',
    @D_Name_I = '',
    @O_Name_I = ''



