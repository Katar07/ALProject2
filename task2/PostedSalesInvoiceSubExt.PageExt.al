pageextension 50108 "Posted Sales Invoice Sub. Ext." extends "Posted Sales Invoice Subform"
{
    layout
    {
        addafter(Description)
        {
            field("Free Delivery"; Rec."Free Delivery")
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("External No."; Rec."External No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the External No. field.';
            }

        }

    }
}
