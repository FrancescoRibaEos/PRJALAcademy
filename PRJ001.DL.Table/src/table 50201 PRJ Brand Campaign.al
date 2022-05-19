table 50201 "PRJ Brand Campaign"
{
    Caption = 'Brand Campaign';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Brand Code"; Code[10])
        {
            Caption = 'Brand Code';
            DataClassification = ToBeClassified;
        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = ToBeClassified;
        }
        field(4; "Threshold Amount"; Decimal)
        {
            Caption = 'Threshold Amount';
            DataClassification = ToBeClassified;
        }
        field(5; "Discount Percentage"; Decimal)
        {
            Caption = 'Discount Percentage';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Brand Code", "Starting Date")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}