page 50149 "User Info Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = ' User information Card';

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(ID; ID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ID field.';
                    trigger OnValidate()
                    begin
                        GetUserInfo();
                    end;
                }
                field(Name; Name)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Email; Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Phone; Phone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Phone field.';
                }

                field(CompanyName; CompanyName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CompanyName field.';
                }
            }
        }
        area(Factboxes)
        {

        }
    }
    procedure GetUserInfo()
    var
        Client: HttpClient;
        ResponseMessage: HttpResponseMessage;
        Token: JsonToken;
        Object: JsonObject;
        JsonText: Text;
        Url: Text;
    begin
        Url := 'https://jsonplaceholder.typicode.com/users/' + Format(Id);
        if not client.Get(Url, responseMessage) then
            Error('The call to the web service failed.');
        if not ResponseMessage.IsSuccessStatusCode then
            Error('The web service returned an error message:\\' +
                    'Status code: %1\' +
                    'Description: %2',
                    ResponseMessage.HttpStatusCode,
                    ResponseMessage.ReasonPhrase);
        ResponseMessage.Content.ReadAs(JsonText);

        if not Object.ReadFrom(JsonText) then
            Error('Invalid response, expected a JSON object');

        Object.Get('name', Token);
        Name := Token.AsValue().AsText();
        Object.Get('phone', Token);
        Phone := Token.AsValue().AsText();
        Object.Get('email', Token);
        Email := Token.AsValue().AsText();
        Object.Get('company', Token);
        Token.AsObject.Get('name', Token);
        CompanyName := Token.AsValue().AsText();
    end;

    var
        ID: Integer;
        Name: Text;
        Email: Text;
        Phone: Text;
        CompanyName: Text;
}