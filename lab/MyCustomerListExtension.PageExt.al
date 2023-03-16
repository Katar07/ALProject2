// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!

pageextension 50100 "MyCustomer List Extension" extends "Customer List"
{
    //     trigger OnOpenPage();
    //     begin
    //         Report.Run(report::LAB_CustomerList);
    //     end;
    // 

    actions
    {
        addafter("&Customer")
        {
            action(ExportToXml)
            {
                Caption = 'Export to XML';
                ApplicationArea = All;
                Image = XMLFile;

                trigger OnAction()
                var
                    CustomerXml: XmlPort "Customer XML";
                    TempBlob: Codeunit "Temp Blob";
                    OutStr: OutStream;
                    InStr: InStream;
                    FileName: Text;
                begin
                    TempBlob.CreateOutStream(OutStr);
                    CustomerXml.SetDestination(OutStr);
                    CustomerXml.Export();
                    TempBlob.CreateInStream(InStr);
                    FileName := 'Customers.xml';
                    File.DownloadFromStream(InStr, 'Download', '',
                                            '', FileName);
                end;
            }
        }
    }
}