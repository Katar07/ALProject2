codeunit 50100 "PostCodeunit"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', true, true)]
    local procedure SalesTypeOnAfterValidateEvent(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        If Customer.Get(Rec."Sell-to Customer No.") then
            Rec."Sales Type" := Customer."Sales Type"
    end;

    [EventSubscriber(ObjectType::Table, Database::"Gen. Journal Line", 'OnAfterCopyGenJnlLineFromSalesHeader', '', true, true)]
    local procedure CopyGenJnlLineFromSalesHeader(var GenJournalLine: Record "Gen. Journal Line"; SalesHeader: Record "Sales Header")
    begin
        GenJournalLine.SetRange("Document No.", SalesHeader."No.");
        GenJournalLine."Sales Type" := SalesHeader."Sales Type";
    end;


    [EventSubscriber(ObjectType::Table, Database::"Cust. Ledger Entry", 'OnAfterCopyCustLedgerEntryFromGenJnlLine', '', true, true)]
    local procedure CustomerSalesType(GenJournalLine: Record "Gen. Journal Line"; var CustLedgerEntry: Record "Cust. Ledger Entry")
    begin
        CustLedgerEntry."Sales Type" := GenJournalLine."Sales Type";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'No.', true, true)]
    local procedure DeliveryOnAfterValidateEvent(var Rec: Record "Sales Line")
    var
        Item: Record Item;
        Resource: Record Resource;
    begin
        case Rec.Type of
            Rec.Type::Item:
                if Item.Get(Rec."No.") then
                    Rec."Free Delivery" := Item."Free delivery";
            Rec.Type::Resource:
                if Resource.get(Rec."No.") then
                    Rec."External No." := Resource."External No.";
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', true, true)]
    local procedure DeliveryOnAfterCopyItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine.SetRange("Line No.", SalesLine."Line No.");
        ItemJnlLine."Free Delivery" := SalesLine."Free Delivery";
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInitItemLedgEntry', '', true, true)]
    local procedure OnBeforeInsertEvent(var ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."Free Delivery" := ItemJournalLine."Free Delivery";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Res. Journal Line", 'OnAfterCopyResJnlLineFromSalesLine', '', true, true)]
    local procedure ExternalNoOnAfterCopyResJnlLineFromSalesLine(var ResJnlLine: Record "Res. Journal Line"; var SalesLine: Record "Sales Line")
    begin
        ResJnlLine.SetRange("Line No.", SalesLine."Line No.");
        ResJnlLine."External No." := SalesLine."External No.";
    end;

    [EventSubscriber(ObjectType::Table, Database::"Res. Ledger Entry", 'OnAfterCopyFromResJnlLine', '', true, true)]
    local procedure ExternalNoCopyFromResJnlLine(ResJournalLine: Record "Res. Journal Line"; var ResLedgerEntry: Record "Res. Ledger Entry")
    begin
        ResLedgerEntry."External No." := ResJournalLine."External No.";
    end;
}
