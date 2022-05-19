pageextension 50201 "PRJ PageExt50201" extends "PRJ Brands List" // 50200
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addfirst(Navigation)
        {
            action(ShowCampaignsAction)
            {
                Caption = 'Show Campaigns';
                ApplicationArea = All;
                Image = Campaign;
                trigger OnAction()
                var
                    Campaign: Record "PRJ Brand Campaign";
                    CampaignsPage: Page "PRJ Brand Campaign List";
                begin
                    Campaign.SetRange("Brand Code", Rec.Code);
                    CampaignsPage.SetTableView(Campaign);
                    CampaignsPage.RunModal();
                end;
            }
        }
    }

    var
        myInt: Integer;
}