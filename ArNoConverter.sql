CREATE FUNCTION [dbo].[udf_replaceIntegersWithArabicNumbers]
    (@str NVARCHAR(1000))
    RETURNS NVARCHAR(2000)
AS
BEGIN

    DECLARE @i INT = 1
    WHILE @i<=LEN(@str)

    BEGIN
        DECLARE @val NVARCHAR(1)
        SET @val = SUBSTRING(@str, @i, 1)
        IF(@val) >= '0' and (@val) <= '9'
        
        BEGIN
            DECLARE @newchar NVARCHAR(1)
            SET @newchar = CASE(@val)
                WHEN N'١' THEN '1'
                WHEN N'٢' THEN '2'
                WHEN N'٣' THEN '3'
                WHEN N'٤' THEN '4'
                WHEN N'٥' THEN '5'
                WHEN N'٦' THEN '6'
                WHEN N'٧' THEN '7'
                WHEN N'٨' THEN '8'
                WHEN N'٩' THEN '9'
                WHEN N'٠' THEN '0'
        END
        SET @str = REPLACE(@str, @val, @newchar)
    END        
    SET @i+=1
END
RETURN @str
END



