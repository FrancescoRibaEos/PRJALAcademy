tableextension 50200 "PRJ TableExt50200" extends Item // 27
{
    fields
    {
        field(50200; "PRJ Proteins per 100g"; Decimal)
        {
            Caption = 'Proteins per 100g';
            DataClassification = ToBeClassified;
        }
        field(50210; "PRJ Fat per 100g"; Decimal)
        {
            Caption = 'Fat per 100g';
            DataClassification = ToBeClassified;
        }
        field(50220; "PRJ Carbohydrates per 100g"; Decimal)
        {
            Caption = 'Carbohydrates per 100g';
            DataClassification = ToBeClassified;
        }
        field(50230; "PRJ Brand Code"; Code[10])
        {
            Caption = 'Brand Code';
            DataClassification = ToBeClassified;
        }
        field(50235; "PRJ Brand Name"; Text[100])
        {
            Caption = 'Brand Name';
            FieldClass = FlowField;
            CalcFormula = lookup("PRJ Brand".Name where(Code = field("PRJ Brand Code")));
        }

    }

    var
        myInt: Integer;
}