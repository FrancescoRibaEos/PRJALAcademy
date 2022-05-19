codeunit 50202 "PRJ CommonFunctions"
{
    trigger OnRun()
    begin
        
    end;

    procedure InsertIntoLogTable(LogType: Enum "PRJ EnumProceduresLogType"; Message: Text[500]; SourceNo: Code[20])
    var
        LogTableRecord: Record "PRJ LogProcedure";
        LastLogLine: Integer;
    begin
        LogTableRecord.LockTable();
        LogTableRecord.SetRange(ProceduresLogType, LogType);
        if LogTableRecord.FindLast() then
            LastLogLine := LogTableRecord.LogLineNumber;
        LogTableRecord.LogLineNumber := LastLogLine + 1;
        LogTableRecord.Message := Message;
        LogTableRecord.SourceNo := SourceNo;
        LogTableRecord.ProceduresLogType := LogType;
        LogTableRecord.Insert();
    end;
}