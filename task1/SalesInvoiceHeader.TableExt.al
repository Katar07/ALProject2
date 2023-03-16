tableextension 50102 "Sales Invoice Header" extends "Sales Invoice Header"
{
    fields
    {

        field(50100; "Sales Type"; Enum "Sales Type")
        {
            Caption = 'Sales Type';
            DataClassification = ToBeClassified;
        }
    }


}
