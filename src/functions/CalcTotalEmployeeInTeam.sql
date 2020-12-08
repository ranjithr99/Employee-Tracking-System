CREATE FUNCTION CalcTotalEmployeeInTeam(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS TotalEmployee
    FROM tblTeam T
        JOIN tblTeamEmployee TE ON T.TeamID = TE.TeamID
        JOIN tblEmployee E on TE.EmployeeID = E.EmployeeID
    WHERE T.TeamID = @PK
)
RETURN @RET
END