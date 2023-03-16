pageextension 50101 "Customer Card Ext." extends "Customer Card"
{
    layout
    {
        addafter("Disable Search by Name")
        {
            field("Sales Type"; Rec."Sales Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the SalesType field.';
            }
        }
    }
}
