codeunit 50201 "PRJ ChangeBrandFunction"
{
    trigger OnRun()
    begin
        Item.Get(ItemNo);
        SalesLine.SetRange("No.", Item."No.");
        SalesLine.SetFilter("Outstanding Qty. (Base)", '>%1', 0);
        if SalesLine.IsEmpty then
            Error(NoSalesLineFoundErr, Item.Description);
        Deviance := (Item."PRJ Proteins per 100g" * (AllowedDeviation / 100));
        MaxProtein := Item."PRJ Proteins per 100g" + Deviance;
        MinProtein := Item."PRJ Proteins per 100g" - Deviance;

        Deviance := (Item."PRJ Carbohydrates per 100g" * (AllowedDeviation / 100));
        MaxCarbohydrates := Item."PRJ Carbohydrates per 100g" + Deviance;
        MinCarbohydrates := Item."PRJ Carbohydrates per 100g" - Deviance;

        Deviance := (Item."PRJ Fat per 100g" * (AllowedDeviation / 100));
        MaxFat := Item."PRJ Fat per 100g" + Deviance;
        MinFat := Item."PRJ Fat per 100g" - Deviance;

        ItemToSubstitute.SetRange("PRJ Proteins per 100g", MinProtein, MaxProtein);
        ItemToSubstitute.SetRange("PRJ Fat per 100g", MinFat, MaxFat);
        ItemToSubstitute.SetRange("PRJ Carbohydrates per 100g", MinCarbohydrates, MaxCarbohydrates);

        ItemToSubstitute.SetFilter("PRJ Brand Code", '<>%1', Item."PRJ Brand Code");

        if ItemToSubstitute.FindFirst() then begin
            SalesLine.Reset();
            SalesLine.SetRange("No.", Item."No.");
            SalesLine.SetFilter("Outstanding Qty. (Base)", '>%1', 0);
            if SalesLine.FindSet() then
                repeat
                    SalesLine.Validate("No.", ItemToSubstitute."No.");
                    SalesLine.Modify(true); //Always true if a DB physical table is modified
                until SalesLine.Next() = 0;
        end else begin
            Error(NotFoundErr, Item.Description);
        end;
    end;

    procedure SetItemNo(NewItemValue: Code[20]; AllowedDeviation1: Decimal)
    begin
        ItemNo := NewItemValue;
        AllowedDeviation := AllowedDeviation1;
    end;

    var
        Item, ItemToSubstitute : Record Item;
        SalesLine: Record "Sales Line";
        ItemNo: Code[20];
        Deviance, AllowedDeviation : Decimal;
        MaxProtein, MaxFat, MaxCarbohydrates : Decimal;
        MinProtein, MinFat, MinCarbohydrates : Decimal;
        NotFoundErr: Label 'No item to substitute found for %1';
        NoSalesLineFoundErr: Label 'No sales line with item %1 to be shipped found';
}