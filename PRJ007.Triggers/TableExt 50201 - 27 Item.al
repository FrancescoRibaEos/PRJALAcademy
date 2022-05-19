tableextension 50201 "PRJ TableExt50201" extends Item //27
{
    fields
    {
        modify("PRJ Proteins per 100g")
        {
            trigger OnBeforeValidate()
            begin
                if Rec."PRJ Proteins per 100g" < 0 then
                    Error(NegativeValue_Err, Rec.FieldCaption("PRJ Proteins per 100g"));
            end;
        }
        modify("PRJ Fat per 100g")
        {
            trigger OnBeforeValidate()
            begin
                if Rec."PRJ Fat per 100g" < 0 then
                    Error(NegativeValue_Err, Rec.FieldCaption("PRJ Fat per 100g"));
            end;
        }
        modify("PRJ Carbohydrates per 100g")
        {
            trigger OnBeforeValidate()
            begin
                if Rec."PRJ Carbohydrates per 100g" < 0 then
                    Error(NegativeValue_Err, Rec.FieldCaption("PRJ Carbohydrates per 100g"));
            end;
        }
        modify("PRJ Brand Code")
        {
            TableRelation = "PRJ Brand".Code;
        }
    }

    var
        NegativeValue_Err: Label 'The value of field %1 can''t be negative!';
}