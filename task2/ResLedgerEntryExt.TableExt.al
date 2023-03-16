tableextension 50111 "Res. Ledger Entry Ext." extends "Res. Ledger Entry"
{
    fields
    {
        field(50100; "External No."; Code[20])
        {
            Caption = 'External No.';
            DataClassification = ToBeClassified;
        }
    }
}
