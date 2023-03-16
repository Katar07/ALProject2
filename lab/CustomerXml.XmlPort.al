xmlport 50100 "Customer Xml"
{
    Caption = 'Customer XML';
    Direction = Export;
    Format = Xml;

    schema
    {
        textelement(Customers)
        {
            XmlName = 'Customers';

            tableelement(Customer; Customer)
            {
                fieldattribute(Number; Customer."No.") { }
                fieldattribute(Language; Customer."Language Code") { }
                fieldelement(Name; Customer.Name) { }
                fieldelement(Phone; Customer."Phone No.") { }
                textelement(Address)
                {
                    XmlName = 'Address';
                    fieldelement(StreetAndNr; Customer.Address) { }
                    fieldelement(Zipcode; Customer."Post Code") { }
                    fieldelement(City; Customer.City) { }
                }
            }
        }
    }

}