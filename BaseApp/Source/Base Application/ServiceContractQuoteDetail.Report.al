report 5973 "Service Contract Quote-Detail"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ServiceContractQuoteDetail.rdlc';
    Caption = 'Service Contract Quote-Detail';

    dataset
    {
        dataitem("Service Contract Header"; "Service Contract Header")
        {
            CalcFields = "Bill-to Name";
            DataItemTableView = SORTING("Contract Type", "Contract No.") WHERE("Contract Type" = CONST(Quote));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Contract No.", "Customer No.";
            column(ContractType_ServContract; "Contract Type")
            {
            }
            column(ContractNo_ServContract; "Contract No.")
            {
            }
            dataitem(PageLoop; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(CustAddr6; CustAddr[6])
                {
                }
                column(CustAddr5; CustAddr[5])
                {
                }
                column(CustAddr4; CustAddr[4])
                {
                }
                column(CustAddr2; CustAddr[2])
                {
                }
                column(CustAddr3; CustAddr[3])
                {
                }
                column(CustAddr1; CustAddr[1])
                {
                }
                column(BilltoName_ServContract; "Service Contract Header"."Bill-to Name")
                {
                }
                column(CompanyAddr7; CompanyAddr[7])
                {
                }
                column(CompanyAddr8; CompanyAddr[8])
                {
                }
                column(CompanyAddr6; CompanyAddr[6])
                {
                }
                column(CompanyAddr5; CompanyAddr[5])
                {
                }
                column(CompanyAddr4; CompanyAddr[4])
                {
                }
                column(CompanyAddr3; CompanyAddr[3])
                {
                }
                column(CompanyAddr2; CompanyAddr[2])
                {
                }
                column(CompanyAddr1; CompanyAddr[1])
                {
                }
                column(ContractNo1_ServContract; "Service Contract Header"."Contract No.")
                {
                    IncludeCaption = true;
                }
                column(AcceptBefore_ServContract; "Service Contract Header"."Accept Before")
                {
                    IncludeCaption = true;
                }
                column(StartingDate_ServContract; Format("Service Contract Header"."Starting Date"))
                {
                }
                column(InvPeriod_ServContract; "Service Contract Header"."Invoice Period")
                {
                    IncludeCaption = true;
                }
                column(NextInvDate_ServContract; Format("Service Contract Header"."Next Invoice Date"))
                {
                }
                column(AnnualAmount_ServContract; "Service Contract Header"."Annual Amount")
                {
                    IncludeCaption = true;
                }
                column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                {
                }
                column(CompanyInfoFaxNo; CompanyInfo."Fax No.")
                {
                }
                column(EMail_ServContract; "Service Contract Header"."E-Mail")
                {
                }
                column(PhoneNo_ServContract; "Service Contract Header"."Phone No.")
                {
                }
                column(ShowComments; ShowComments)
                {
                }
                column(InvoicetoCaption; InvoicetoCaptionLbl)
                {
                }
                column(ServiceContractQuoteCaption; ServiceContractQuoteCaptionLbl)
                {
                }
                column(ServiceContractHeaderStartingDateCaption; ServiceContractHeaderStartingDateCaptionLbl)
                {
                }
                column(ServiceContractHeaderNextInvoiceDateCaption; ServiceContractHeaderNextInvoiceDateCaptionLbl)
                {
                }
                column(CompanyInfoPhoneNoCaption; CompanyInfoPhoneNoCaptionLbl)
                {
                }
                column(CompanyInfoFaxNoCaption; CompanyInfoFaxNoCaptionLbl)
                {
                }
                column(ServiceContractHeaderEMailCaption; ServiceContractHeaderEMailCaptionLbl)
                {
                }
                dataitem("Contract/Service Discount"; "Contract/Service Discount")
                {
                    DataItemLink = "Contract Type" = FIELD("Contract Type"), "Contract No." = FIELD("Contract No.");
                    DataItemLinkReference = "Service Contract Header";
                    DataItemTableView = SORTING("Contract Type", "Contract No.", Type, "No.", "Starting Date");
                    column(Type_ContractDisc; Type)
                    {
                        IncludeCaption = true;
                    }
                    column(No_ContractDisc; "No.")
                    {
                        IncludeCaption = true;
                    }
                    column(StartingDate_ContractDisc; Format("Starting Date"))
                    {
                    }
                    column(Disc_ContractDisc; "Discount %")
                    {
                        IncludeCaption = true;
                    }
                    column(ContractNo_ContractDisc; "Contract No.")
                    {
                    }
                    column(ServiceDiscountsCaption; ServiceDiscountsCaptionLbl)
                    {
                    }
                }
                dataitem("Service Contract Line"; "Service Contract Line")
                {
                    DataItemLink = "Contract Type" = FIELD("Contract Type"), "Contract No." = FIELD("Contract No.");
                    DataItemLinkReference = "Service Contract Header";
                    DataItemTableView = SORTING("Contract Type", "Contract No.", "Line No.");
                    column(ServItemNo_ServContractLine; "Service Item No.")
                    {
                    }
                    column(Desc_ServContractLine; Description)
                    {
                        IncludeCaption = true;
                    }
                    column(ItemNo_ServContractLine; "Item No.")
                    {
                        IncludeCaption = true;
                    }
                    column(SerialNo_ServContractLine; "Serial No.")
                    {
                        IncludeCaption = true;
                    }
                    column(ServicePeriod_ServContractLine; "Service Period")
                    {
                        IncludeCaption = true;
                    }
                    column(LineDis_ServContractLine; "Line Discount %")
                    {
                        IncludeCaption = true;
                    }
                    column(LineAmount_ServContractLine; "Line Amount")
                    {
                        IncludeCaption = true;
                    }
                    column(LineValue_ServContractLine; "Line Value")
                    {
                        IncludeCaption = true;
                    }
                    column(UnitofMeasureCode_ServContractLine; "Unit of Measure Code")
                    {
                        IncludeCaption = true;
                    }
                    column(ResTimeHrs_ServContractLine; "Response Time (Hours)")
                    {
                        IncludeCaption = true;
                    }
                    column(ContractType_ServContractLine; "Contract Type")
                    {
                    }
                    column(ContractNo_ServContractLine; "Contract No.")
                    {
                    }
                    column(LineNo_ServContractLine; "Line No.")
                    {
                    }
                    column(ServItemNo_ServContractLineCaption; FieldCaption("Service Item No."))
                    {
                    }
                    dataitem("Service Comment Line"; "Service Comment Line")
                    {
                        DataItemLink = "Table Subtype" = FIELD("Contract Type"), "Table Line No." = FIELD("Line No."), "No." = FIELD("Contract No.");
                        DataItemTableView = SORTING("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") ORDER(Ascending) WHERE("Table Name" = FILTER("Service Contract"));
                        column(Date_ServCommentLine; Format(Date))
                        {
                        }
                        column(Comment_ServCommentLine; Comment)
                        {
                            IncludeCaption = true;
                        }
                        column(TableSubtype_ServContractLine; "Table Subtype")
                        {
                        }
                        column(Type_ServCommentLine; Type)
                        {
                        }
                        column(LineNoServ_ServCommentLine; "Line No.")
                        {
                        }
                        column(ServiceCommentLineDateCaption; ServiceCommentLineDateCaptionLbl)
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if not ShowComments then
                                CurrReport.Break();
                        end;
                    }
                }
            }
            dataitem(Shipto; "Integer")
            {
                DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                column(ShipToAddr6; ShipToAddr[6])
                {
                }
                column(ShipToAddr5; ShipToAddr[5])
                {
                }
                column(ShipToAddr4; ShipToAddr[4])
                {
                }
                column(ShipToAddr3; ShipToAddr[3])
                {
                }
                column(ShipToAddr2; ShipToAddr[2])
                {
                }
                column(ShipToAddr1; ShipToAddr[1])
                {
                }
                column(ShiptoAddressCaption; ShiptoAddressCaptionLbl)
                {
                }

                trigger OnPreDataItem()
                begin
                    if not ShowShippingAddr then
                        CurrReport.Break();
                end;
            }
            dataitem(servcommentline2; "Service Comment Line")
            {
                DataItemLink = "Table Subtype" = FIELD("Contract Type"), "No." = FIELD("Contract No.");
                DataItemTableView = SORTING("Table Name", "Table Subtype", "No.", Type, "Table Line No.", "Line No.") ORDER(Ascending) WHERE("Table Name" = FILTER("Service Contract"), "Table Line No." = FILTER(0));
                column(Date2_ServCommentLine; Format(Date))
                {
                }
                column(Comment2_ServCommentLine; Comment)
                {
                    IncludeCaption = true;
                }
                column(TableSubtype2_ServCommentLine; "Table Subtype")
                {
                }
                column(Type2_ServCommentLine; Type)
                {
                }
                column(LineNo2_ServCommentLine; "Line No.")
                {
                }
                column(CommentsCaption; CommentsCaptionLbl)
                {
                }

                trigger OnPreDataItem()
                begin
                    if not ShowComments then
                        CurrReport.Break();
                end;
            }

            trigger OnAfterGetRecord()
            begin
                FormatAddr.GetCompanyAddr("Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
                FormatAddr.ServContractSellto(CustAddr, "Service Contract Header");
                ShowShippingAddr := "Ship-to Code" <> '';
                if ShowShippingAddr then
                    FormatAddr.ServContractShipto(ShipToAddr, "Service Contract Header");
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(ShowComments; ShowComments)
                    {
                        ApplicationArea = Service;
                        Caption = 'Show Comments';
                        ToolTip = 'Specifies if you want the printed report to show any comments to a service contract quote item.';
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
    end;

    var
        CompanyInfo: Record "Company Information";
        RespCenter: Record "Responsibility Center";
        FormatAddr: Codeunit "Format Address";
        CustAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        ShowShippingAddr: Boolean;
        ShowComments: Boolean;
        InvoicetoCaptionLbl: Label 'Invoice to';
        ServiceContractQuoteCaptionLbl: Label 'Service Contract Quote';
        ServiceContractHeaderStartingDateCaptionLbl: Label 'Starting Date';
        ServiceContractHeaderNextInvoiceDateCaptionLbl: Label 'Next Invoice Date';
        CompanyInfoPhoneNoCaptionLbl: Label 'Phone No.';
        CompanyInfoFaxNoCaptionLbl: Label 'Fax No.';
        ServiceContractHeaderEMailCaptionLbl: Label 'Email';
        ServiceDiscountsCaptionLbl: Label 'Service Discounts';
        ServiceCommentLineDateCaptionLbl: Label 'Date';
        ShiptoAddressCaptionLbl: Label 'Ship-to Address';
        CommentsCaptionLbl: Label 'Comments';

    procedure InitializeRequest(ShowCommentsFrom: Boolean)
    begin
        ShowComments := ShowCommentsFrom;
    end;
}

