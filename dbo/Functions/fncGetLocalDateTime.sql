
CREATE FUNCTION [dbo].[fncGetLocalDateTime]()
RETURNS DATETIME
AS
BEGIN
	DECLARE @fltTimeOffset FLOAT
	DECLARE @dteUtc DATETIME
	DECLARE @dteNow DATETIME

	SELECT @dteUtc = GETDATE(), @fltTimeOffset = DATEPART(TZOFFSET, SWITCHOFFSET('', current_utc_offset))
	FROM tblSystemSetting
	JOIN sys.time_zone_info ON sstValue = name
	WHERE sstName = 'TimeZone'

	SET @dteNow = DATEADD(MINUTE, @fltTimeOffset, @dteUtc)

	RETURN @dteNow
END