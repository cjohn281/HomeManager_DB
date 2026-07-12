CREATE TABLE [dbo].[tblLedgerItem] (
    [lgiID]                  INT              IDENTITY (1, 1) NOT NULL,
    [lgiLedger_ldgID]        INT              NULL,
    [lgiRecurringItem_rciID] INT              NULL,
    [lgiAmount]              MONEY            NOT NULL,
    [lgiIsPaid]              BIT              NOT NULL,
    [lgiDateCreated]         DATETIME         CONSTRAINT [DF_tblLedgerItem_lgiDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [lgiCreatedBy_prnID]     INT              NULL,
    [lgiDateModified]        DATETIME         NULL,
    [lgiModifiedBy_prnID]    INT              NULL,
    [lgiGUID]                UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([lgiID] ASC),
    CONSTRAINT [fk_tblLedgerItem_lgiCreatedBy_prnID_tblPerson] FOREIGN KEY ([lgiCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblLedgerItem_lgiLedger_ldgID_tblLedger] FOREIGN KEY ([lgiLedger_ldgID]) REFERENCES [dbo].[tblLedger] ([ldgID]),
    CONSTRAINT [fk_tblLedgerItem_lgiModifiedBy_prnID_tblPerson] FOREIGN KEY ([lgiModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblLedgerItem_lgiRecurringItem_rciID_tblRecurringItem] FOREIGN KEY ([lgiRecurringItem_rciID]) REFERENCES [dbo].[tblRecurringItem] ([rciID])
);

