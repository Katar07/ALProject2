pageextension 50110 "Item Ledger Entries" extends "Item Ledger Entries"
{
    layout
    {
        addafter("Item No.")
        {
            field("Free Delivery"; Rec."Free Delivery")
            {
                ApplicationArea = All;
            }

        }
    }
}
