-- @Author: Ranjith
-- Check Constraint

CREATE FUNCTION EmpOlderThan18()
   RETURNS INT
   AS
   BEGIN
     DECLARE @RET INT = 0
     IF EXISTS(
       SELECT *
       FROM tblEmployee
       WHERE DATEDIFF(YEAR, DOB, GetDate()) < 18
     )
     BEGIN
       SET @RET = 1
     END
     RETURN @RET
   END
GO

ALTER TABLE tblEmployee
ADD CONSTRAINT CK_EMPLOYEE_DOB
CHECK (dbo.EmpOlderThan18() = 0)
GO