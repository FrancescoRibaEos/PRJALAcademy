codeunit 50200 "PRJ Sales Functions"
{
    trigger OnRun()
    begin

    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', false, false)]
    local procedure C_ReleaseSalesDocument_OnBeforeReleaseSalesDoc_VerifyDiscount(PreviewMode: Boolean; SkipCheckReleaseRestrictions: Boolean; var IsHandled: Boolean; var SalesHeader: Record "Sales Header")
    var
        Brands: Record Item temporary;
        SalesLine: Record "Sales Line";
        Item: Record Item;
        BrandsCampaign: Record "PRJ Brand Campaign";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                Item.Get(SalesLine."No.");
                if not Brands.Get(Item."PRJ Brand Code") then begin
                    Brands.Init();
                    Brands."No." := Item."PRJ Brand Code";
                    Brands.Insert();
                end;
                Brands."Unit Price" += SalesLine.Amount;
                Brands.Modify();
            until SalesLine.Next() = 0;
        if Brands.FindSet() then
            repeat
                BrandsCampaign.SetRange("Brand Code", Brands."No.");
                BrandsCampaign.setFilter("Starting Date", '<=%1', Today());
                BrandsCampaign.setFilter("Ending Date", '>=%1', Today());
                if BrandsCampaign.FindFirst() and (Brands."Unit Price" >= BrandsCampaign."Threshold Amount") then
                    Brands."Unit Cost" := BrandsCampaign."Discount Percentage";
                Brands.Modify();
            until Brands.Next() = 0;
        Brands.SetFilter("Unit Cost", '>%1', 0);
        if Brands.FindSet() then
            repeat
                if SalesLine.FindSet() then
                    repeat
                        Item.Get(SalesLine."No.");
                        if Brands."No." = Item."PRJ Brand Code" then begin
                            SalesLine.Validate("Line Discount %", Brands."Unit Cost");
                            SalesLine.Modify();
                        end;
                    until SalesLine.Next() = 0;
            until Brands.Next() = 0;
    end;

    var
}