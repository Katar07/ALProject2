pageextension 50103 "Posted Sales Invoice" extends "Posted Sales Invoice"
{
    layout
    {
        addafter(Closed)
        {
            field("Sales Type"; Rec."Sales Type")
            {
                ApplicationArea = All;
                Caption = 'Sales Type';
                Editable = false;
            }

        }
    }
}
