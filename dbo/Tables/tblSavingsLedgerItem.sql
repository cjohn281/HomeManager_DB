CREATE TABLE [dbo].[tblSavingsLedgerItem] (
    [sliID]                    INT              IDENTITY (1, 1) NOT NULL,
    [sliLedger_ldgID]          INT              NOT NULL,
    [sliTransactionType_lvlID] INT              NOT NULL,
    [sliDate]                  DATE             NOT NULL,
    [sliAmount]                MONEY            NOT NULL,
    [sliPaid]                  BIT              NOT NULL,
    [sliRecurring_rsdID]       INT              NULL,
    [sliDateCreated]           DATETIME         CONSTRAINT [DF_tblSavingsLedgerItem_sliDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [sliCreatedBy_prnID]       INT              NULL,
    [sliDateModified]          DATETIME         NULL,
    [sliModifiedBy_prnID]      INT              NULL,
    [sliGUID]                  UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([sliID] ASC),
    CONSTRAINT [fk_tblSavingsLedgerItem_sliCreatedBy_prnID_tblPerson] FOREIGN KEY ([sliCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSavingsLedgerItem_sliLedger_ldgID_tblLedger] FOREIGN KEY ([sliLedger_ldgID]) REFERENCES [dbo].[tblLedger] ([ldgID]),
    CONSTRAINT [fk_tblSavingsLedgerItem_sliModifiedBy_prnID_tblPerson] FOREIGN KEY ([sliModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSavingsLedgerItem_sliRecurring_rsdID_tblRecurringSavings] FOREIGN KEY ([sliRecurring_rsdID]) REFERENCES [dbo].[tblRecurringSavingsTransferDetail] ([rsdID]),
    CONSTRAINT [fk_tblSavingsLedgerItem_sliTransactionType_lvlID_tblLookupValue] FOREIGN KEY ([sliTransactionType_lvlID]) REFERENCES [dbo].[tblLookupValue] ([lvlID])
);

