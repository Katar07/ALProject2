enum 50100 "Sales Type"
{
    Extensible = true;

    value(0; " ")
    {
        Caption = ' ', Locked = true;
    }

    value(1; Retail)
    {
        Caption = 'Retail';
    }
    value(2; Wholesale)
    {
        Caption = 'Wholesale';
    }
}