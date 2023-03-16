pageextension 50111 "Recource Card Ext." extends "Resource Card"
{
    layout
    {
        addafter("Time Sheet Approver User ID")
        {
            field("External No."; Rec."External No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the External No. field.';
            }

        }
    }
}
