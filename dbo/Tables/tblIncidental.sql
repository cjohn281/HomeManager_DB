CREATE TABLE [dbo].[tblIncidental] (
    [incID]               INT              IDENTITY (1, 1) NOT NULL,
    [incLedger_ldgID]     INT              NULL,
    [incDateCreated]      DATETIME         CONSTRAINT [DF_tblIncidental_incDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [incCreatedBy_prnID]  INT              NULL,
    [incDateModified]     DATETIME         NULL,
    [incModifiedBy_prnID] INT              NULL,
    [incGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([incID] ASC),
    CONSTRAINT [fk_tblIncidental_incCreatedBy_prnID_tblPerson] FOREIGN KEY ([incCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblIncidental_incLedger_ldgID_tblLedger] FOREIGN KEY ([incLedger_ldgID]) REFERENCES [dbo].[tblLedger] ([ldgID]),
    CONSTRAINT [fk_tblIncidental_incModifiedBy_prnID_tblPerson] FOREIGN KEY ([incModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);

