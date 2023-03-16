pageextension 50106 "Item Card Ext." extends "Item Card"
{
    layout
    {
        addafter("Base Unit of Measure")
        {
            field("Free Delivery"; Rec."Free Delivery")
            {
                ApplicationArea = All;
            }

        }
    }
}
