page 50201 "PRJ Brand Campaign List"
{
    PageType = List;
    // ApplicationArea = All;
    // UsageCategory = Administration;
    SourceTable = "PRJ Brand Campaign";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                // field("Brand Code"; Rec."Brand Code")
                // {
                //     ToolTip = 'Specifies the value of the Brand Code field.';
                //     ApplicationArea = All;
                // }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                }
                field("Threshold Amount"; Rec."Threshold Amount")
                {
                    ToolTip = 'Specifies the value of the Threshold Amount field.';
                    ApplicationArea = All;
                }
                field("Discount Percentage"; Rec."Discount Percentage")
                {
                    ToolTip = 'Specifies the value of the Discount Percentage field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}