pageextension 50200 "PRJ PageExt50200" extends "Item Card" // 30
{
    layout
    {
        addafter(Item)
        {
            group(PRJNutritionalInformationGroup)
            {
                Caption = 'Nutritional Information';
                field("PRJ Fat per 100g"; Rec."PRJ Fat per 100g")
                {
                    ToolTip = 'Specifies the value of the Fat per 100g field.';
                    ApplicationArea = All;
                }
                field("PRJ Proteins per 100g"; Rec."PRJ Proteins per 100g")
                {
                    ToolTip = 'Specifies the value of the Proteins per 100g field.';
                    ApplicationArea = All;
                }
                field("PRJ Carbohydrates per 100g"; Rec."PRJ Carbohydrates per 100g")
                {
                    ToolTip = 'Specifies the value of the Carbohydrates per 100g field.';
                    ApplicationArea = All;
                }
            }
        }
        addafter(Description)
        {
            field("PRJ Brand Code"; Rec."PRJ Brand Code")
            {
                ToolTip = 'Specifies the value of the Brand Code field.';
                ApplicationArea = All;
            }
            field("PRJ Brand Name"; Rec."PRJ Brand Name")
            {
                ToolTip = 'Specifies the value of the Brand Name field.';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}