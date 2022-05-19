report 50200 "PRJ ReportNutritionalInfo"
{
    UsageCategory = Administration;
    Caption = 'Report Nutritional Information';
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;

    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            column(No_DataItemName; "No.")
            {
            }
            column(SelltoCustomerNo_DataItemName; "Sell-to Customer No.")
            {
            }
            column(SelltoCustomerName_DataItemName; "Sell-to Customer Name")
            {
            }
            column(Protein; Protein)
            {
            }
            column(Fat; Fat)
            {
            }
            column(Carbohydrates; Carbohydrates)
            {
            }

            trigger OnAfterGetRecord()
            var
                SalesLine: Record "Sales Line";
                Item: Record Item;
                TotalWeight: Decimal;
            begin
                SalesLine.SetRange("Document No.", SalesHeader."No.");
                SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                if SalesLine.FindSet() then
                    repeat
                        Item.Get(SalesLine."No.");
                        TotalWeight := Item."Net Weight" * SalesLine."Quantity (Base)";
                        TotalWeight /= 10; //Conversione da kg a 100g
                        Carbohydrates += Item."PRJ Carbohydrates per 100g" * TotalWeight;
                        Fat += Item."PRJ Fat per 100g" * TotalWeight;
                        Protein += Item."PRJ Proteins per 100g" * TotalWeight;
                    until SalesLine.Next() = 0;
            end;
        }
    }


    // requestpage
    // {
    //     layout
    //     {
    //         area(Content)
    //         {
    //             group(GroupName)
    //             {
    //                 field(Name; SourceExpression)
    //                 {
    //                     ApplicationArea = All;

    //                 }
    //             }
    //         }
    //     }

    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }

    labels
    {
        OrderNoLbl = 'Order Number';
        CustomerNameLbl = 'Customer Name';
        ProteinLbl = 'Proteins';
        FatLbl = 'Fats';
        CarbohydratesLbl = 'Carbohydrates';
    }

    var
        Protein, Fat, Carbohydrates : Decimal;
}