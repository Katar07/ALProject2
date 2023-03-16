tableextension 50107 "Sales Invoice Line Ext." extends "Sales Invoice Line"
{
    fields
    {
        field(50100; "Free Delivery"; Boolean)
        {
            Caption = 'Free Delivery';
            DataClassification = ToBeClassified;
        }
        field(50101; "External No."; Code[20])
        {
            Caption = 'External No.';
            DataClassification = ToBeClassified;

        }
    }
}
