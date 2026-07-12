CREATE TABLE [dbo].[tblLedgerBalance] (
    [lblID]                      INT              IDENTITY (1, 1) NOT NULL,
    [lblLedger_ldgID]            INT              NOT NULL,
    [lblStartingCheckingBalance] MONEY            NOT NULL,
    [lblEndingCheckingBalance]   MONEY            NULL,
    [lblStartingSavingsBalance]  MONEY            NOT NULL,
    [lblEndingSavingsBalance]    MONEY            NULL,
    [lblDateCreated]             DATETIME         CONSTRAINT [DF_tblLedgerBalance_lblDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [lblCreatedBy_prnID]         INT              NULL,
    [lblDateModified]            DATETIME         NULL,
    [lblModifiedBy_prnID]        INT              NULL,
    [lblGUID]                    UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([lblID] ASC),
    CONSTRAINT [fk_tblLedgerBalance_lblCreatedBy_prnID_tblPerson] FOREIGN KEY ([lblCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblLedgerBalance_lblLedger_ldgID_tblLedger] FOREIGN KEY ([lblLedger_ldgID]) REFERENCES [dbo].[tblLedger] ([ldgID]),
    CONSTRAINT [fk_tblLedgerBalance_lblModifiedBy_prnID_tblPerson] FOREIGN KEY ([lblModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);

