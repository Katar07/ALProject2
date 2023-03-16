pageextension 50109 "Item Journal Ext." extends "Item Journal"
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
