page 50203 "PRJ UnsuccessfulBrandChangeLog"
{
    Caption='Unsuccessful Brand Change Log';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "PRJ LogProcedure";
    SourceTableView = where(ProceduresLogType = const(UnsuccessfulChangeBrandProcedures));
    
    layout
    {
        area(Content)
        {
            repeater(Data)
            {

                field(LogLineNumber; Rec.LogLineNumber)
                {
                    ToolTip = 'Specifies the value of the Number of log line field.';
                    ApplicationArea = All;
                }
                field(SourceNo; Rec.SourceNo)
                {
                    ToolTip = 'Specifies the value of the Source No. field.';
                    ApplicationArea = All;
                }
                field("Message"; Rec.Message)
                {
                    ToolTip = 'Specifies the value of the Message field.';
                    ApplicationArea = All;
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
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