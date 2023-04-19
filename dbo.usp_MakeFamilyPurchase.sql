CREATE PROCEDURE dbo.usp_MakeFamilyPurchase
    @FamilySurName VARCHAR(255)
AS
BEGIN
    DECLARE @NewBudgetValue DECIMAL(18, 2);

    -- Проверка на существование семьи с указанной фамилией
    IF NOT EXISTS (SELECT 1 FROM dbo.Family WHERE SurName = @FamilySurName)
    BEGIN
        RAISERROR('Такой семьи нет', 16, 1);
    END;

    SELECT @NewBudgetValue = (f.BudgetValue - SUM(b.Value))
    FROM dbo.Family f
    JOIN dbo.Basket b ON f.ID = b.ID_Family
    WHERE f.SurName = @FamilySurName
    GROUP BY f.BudgetValue;

	UPDATE dbo.Family SET BudgetValue = @NewBudgetValue WHERE SurName = @FamilySurName

END;