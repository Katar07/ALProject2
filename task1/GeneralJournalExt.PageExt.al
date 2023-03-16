pageextension 50104 "General Journal Ext." extends "General Journal"
{
    layout
    {
        addafter("Account No.")
        {
            field("Sales Type"; Rec."Sales Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Type field.';
            }
        }
    }
}
