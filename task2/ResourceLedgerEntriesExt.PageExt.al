pageextension 50112 "Resource Ledger Entries Ext." extends "Resource Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("External No."; Rec."External No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the External No. field.';
            }

        }
    }
}
