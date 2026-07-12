CREATE TABLE [dbo].[tblIncomeLedgerItem] (
    [iliID]               INT              IDENTITY (1, 1) NOT NULL,
    [iliLedger_ldgID]     INT              NOT NULL,
    [iliPerson_prnID]     INT              NOT NULL,
    [iliCategory_lvlID]   INT              NOT NULL,
    [iliDate]             DATE             NOT NULL,
    [iliAmount]           MONEY            NOT NULL,
    [iliPaid]             BIT              NOT NULL,
    [iliDateCreated]      DATETIME         CONSTRAINT [DF_tblIncomeLedgerItem_iliDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [iliCreatedBy_prnID]  INT              NULL,
    [iliDateModified]     DATETIME         NULL,
    [iliModifiedBy_prnID] INT              NULL,
    [iliGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([iliID] ASC),
    CONSTRAINT [fk_tblIncomeLedgerItem_iliCategory_lvlID_tblLookupValue] FOREIGN KEY ([iliCategory_lvlID]) REFERENCES [dbo].[tblLookupValue] ([lvlID]),
    CONSTRAINT [fk_tblIncomeLedgerItem_iliCreatedBy_prnID_tblPerson] FOREIGN KEY ([iliCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblIncomeLedgerItem_iliLedger_ldgID_tblLedger] FOREIGN KEY ([iliLedger_ldgID]) REFERENCES [dbo].[tblLedger] ([ldgID]),
    CONSTRAINT [fk_tblIncomeLedgerItem_iliModifiedBy_prnID_tblPerson] FOREIGN KEY ([iliModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblIncomeLedgerItem_iliPerson_prnID_tblPerson] FOREIGN KEY ([iliPerson_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);

