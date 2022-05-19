pageextension 50202 "PRJ PageExt50202" extends "Sales Order" // 42
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addlast("&Print")
        {
            action(PrintNutrInfoAction)
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