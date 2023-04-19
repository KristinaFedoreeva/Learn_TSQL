CREATE FUNCTION dbo.udf_GetSKUPrice (@ID_SKU INT)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @AvgPrice DECIMAL(18, 2);

    SELECT @AvgPrice = (SUM(Value) * 1.0) / SUM(Quantity)
    FROM dbo.Basket
    WHERE ID_SKU = @ID_SKU;

    RETURN @AvgPrice;
END;