pageextension 50105 "Customer Ledger Entries Ext." extends "Customer Ledger Entries"
{
    layout
    {
        addafter("Customer Name")
        {
            field("Sales Type"; Rec."Sales Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Type field.';
                Editable = false;
            }

        }
    }
}
