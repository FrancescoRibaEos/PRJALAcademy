pageextension 50203 "PRJ PageExt50203" extends "Sales Order List" // 9305
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Print")
        {
            action(PRJPrintNutrInfoAction)
            {
                ApplicationArea = All;
                Image = PrintReport;
                Caption = 'Print Nutritional Information';
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;

                trigger OnAction()
                var
                    Header: Record "Sales Header";
                    NutrInfoReport: Report "PRJ ReportNutritionalInfo";
                begin
                    Header.SetRange("Document Type", Rec."Document Type");
                    Header.SetRange("No.", Rec."No.");
                    NutrInfoReport.SetTableView(Header);
                    NutrInfoReport.Run();
                end;
            }
        }
    }
}