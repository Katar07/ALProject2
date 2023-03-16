pageextension 50107 "Sales Invoice Subform Ext." extends "Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Free Delivery"; Rec."Free Delivery")
            {
                ApplicationArea = All;
            }
            field("External No."; Rec."External No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the External No. field.';
            }

        }
    }
}
