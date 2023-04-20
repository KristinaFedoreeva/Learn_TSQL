CREATE TRIGGER tr_Basket_DiscountUpdate
ON dbo.Basket
AFTER INSERT
AS
BEGIN
    WITH SKUCounts AS (
        SELECT ID_SKU, COUNT(*) AS cnt
        FROM inserted
        GROUP BY ID_SKU
    ), Discounts AS (
        SELECT i.ID, 
               CASE WHEN sc.cnt >= 2 THEN i.Value * 0.05 ELSE 0 END AS Discount
        FROM inserted i
        JOIN SKUCounts sc ON i.ID_SKU = sc.ID_SKU
    )
    UPDATE b
    SET b.DiscountValue = d.Discount
    FROM dbo.Basket b
    JOIN Discounts d ON b.ID = d.ID;
END;
