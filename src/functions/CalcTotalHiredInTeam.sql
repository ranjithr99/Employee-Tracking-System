CREATE FUNCTION CalcTotalHiredInTeam(@PK INT)
RETURNS INT
AS
BEGIN
DECLARE @RET INT = (
    SELECT COUNT(*) AS NumHiredInTeam
    FROM tblTeam T
        JOIN tblTeam_Employee TE ON T.TeamID = TE.TeamID
        JOIN tblEmployee_Event E ON TE.TeamEmployeeID = E.TeamEmployeeID
        JOIN tblEvent EV on E.EventID = EV.EventID
        JOIN tblEvent_Type ET on ET.EventTypeID = EV.EventTypeID
    WHERE T.TeamID = @PK and ET.EventTypeName like 'Hired'
)
RETURN @RET
END