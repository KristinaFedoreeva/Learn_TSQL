CREATE VIEW dbo.vw_SKUPrice as 
SELECT t.*, dbo.udf_GetSKUPrice(t.ID) as Col1 from dbo.SKU t
