CREATE FUNCTION CalcTotalEmployeeFired(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS EmpFired
    FROM tblTeam_Employee TE
        JOIN tblEmployee_Event E ON TE.TeamEmployeeID = E.TeamEmployeeID
        JOIN tblEvent EV on E.EventID = EV.EventID
        JOIN tblEvent_Type ET on ET.EventTypeID = EV.EventTypeID
    WHERE TE.TeamEmployeeID = @PK and ET.EventTypeName like 'Fired'
)
RETURN @RET
END