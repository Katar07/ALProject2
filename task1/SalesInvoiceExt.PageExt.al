pageextension 50102 "Sales Invoice Ext." extends "Sales Invoice"
{
    layout
    {
        addafter(Status)
        {
            field("Sales Type"; Rec."Sales Type")
            {
                Caption = 'Sales Type';
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the SalesType field.';
            }

        }
    }
}
