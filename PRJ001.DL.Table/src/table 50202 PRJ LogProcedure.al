table 50202 "PRJ LogProcedure"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ProceduresLogType; Enum "PRJ EnumProceduresLogType")
        {
            DataClassification = ToBeClassified;
            Caption = 'Procedures Log Type';

        }
        field(10; LogLineNumber; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Number of log line';

        }
        field(20; Message; Text[500])
        {
            DataClassification = ToBeClassified;
            Caption = 'Message';

        }
        field(30; SourceNo; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Source No.';

        }
    }

    keys
    {
        key(Key1; ProceduresLogType, LogLineNumber)
        {
            Clustered = true;
        }
    }


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