pageextension 50113 "Resource Journal Ext." extends "Resource Journal"
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
