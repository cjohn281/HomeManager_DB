CREATE TABLE [dbo].[tblLedger] (
    [ldgID]               INT              IDENTITY (1, 1) NOT NULL,
    [ldgMonth]            INT              NOT NULL,
    [ldgYear]             INT              NOT NULL,
    [ldgDateCreated]      DATETIME         CONSTRAINT [DF_tblLedger_ldgDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [ldgCreatedBy_prnID]  INT              NULL,
    [ldgDateModified]     DATETIME         NULL,
    [ldgModifiedBy_prnID] INT              NULL,
    [ldgGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ldgID] ASC),
    CONSTRAINT [fk_tblLedger_ldgCreatedBy_prnID_tblPerson] FOREIGN KEY ([ldgCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblLedger_ldgModifiedBy_prnID_tblPerson] FOREIGN KEY ([ldgModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);

