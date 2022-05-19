report 50201 "PRJ BrandChange"
{
    UsageCategory = Administration;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Brands Change';

    // dataset
    // {
    //     dataitem(DataItemName; SourceTableName)
    //     {
    //         column(ColumnName; SourceFieldName)
    //         {

    //         }
    //     }
    // }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field("BrandToChangeCodeField"; BrandToRemoveCode)
                    {
                        Caption = 'Brand to change code field';
                        ApplicationArea = All;
                        TableRelation = "PRJ Brand".Code;
                    }
                    field("Deviation"; AllowedDeviation)
                    {
                        Caption = 'Allowed deviation';
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    trigger OnPostReport()
    var
        Item: Record Item;
    begin
        if BrandToRemoveCode = '' then
            Error('No brand selected!');
        Item.SetRange("PRJ Brand Code", BrandToRemoveCode);
        if Item.FindSet() then
            repeat
                Clear(CodeUnitChageBrandFunction);
                ClearLastError();
                CodeUnitChageBrandFunction.SetItemNo(Item."No.", AllowedDeviation);
                if CodeUnitChageBrandFunction.Run() then begin
                    Message(MessageSuccessfulLbl, Item.Description);
                    LogMessage := StrSubstNo(MessageSuccessfulLbl, Item."No.");
                    CodeUnitLogTable.InsertIntoLogTable("PRJ EnumProceduresLogType"::SuccessfulChangeBrandProcedures, LogMessage, Item."No.");
                end else begin
                    Message(MessageUnsuccessfulLbl, Item.Description, GetLastErrorText());
                    LogMessage := StrSubstNo(MessageUnsuccessfulLbl, Item."No.", GetLastErrorText());
                    CodeUnitLogTable.InsertIntoLogTable("PRJ EnumProceduresLogType"::UnsuccessfulChangeBrandProcedures, LogMessage, Item."No.");
                end;
                Commit();
            until Item.Next() = 0;
    end;

    var
        LogTable: Record "PRJ LogProcedure";
        CodeUnitChageBrandFunction: Codeunit "PRJ ChangeBrandFunction";
        CodeUnitLogTable: Codeunit "PRJ CommonFunctions";
        BrandToRemoveCode: Code[10];
        AllowedDeviation: Decimal;
        MessageSuccessfulLbl: Label 'Item %1 substituted correctly';
        MessageUnsuccessfulLbl: Label 'Item %1 not substituted \\Error: %2';
        LogMessage: Text[500];

}