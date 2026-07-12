CREATE TABLE [dbo].[tblIncomeDetail] (
    [icdID]               INT              IDENTITY (1, 1) NOT NULL,
    [icdPerson_prnID]     INT              NOT NULL,
    [icdDefaultAmount]    MONEY            NOT NULL,
    [icdFrequency_lvlID]  INT              NOT NULL,
    [icdPayDate1]         INT              NULL,
    [icdPayDate2]         INT              NULL,
    [icdFirstPay]         DATE             NULL,
    [icdDateCreated]      DATETIME         CONSTRAINT [DF_tblIncomeDetail_icdDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [icdCreatedBy_prnID]  INT              NULL,
    [icdDateModified]     DATETIME         NULL,
    [icdModifiedBy_prnID] INT              NULL,
    [icdGUID]             UNIQUEIDENTIFIER CONSTRAINT [DF__tblIncome__icdGU__7755B73D] DEFAULT (newid()) NOT NULL,
    CONSTRAINT [PK__tblIncom__2E4B094F353DDBDD] PRIMARY KEY CLUSTERED ([icdID] ASC),
    CONSTRAINT [fk_tblIncomeDetail_icdCreatedBy_prnID_tblPerson] FOREIGN KEY ([icdCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblIncomeDetail_icdFrequency_lvlID_tblLookupValue] FOREIGN KEY ([icdFrequency_lvlID]) REFERENCES [dbo].[tblLookupValue] ([lvlID]),
    CONSTRAINT [fk_tblIncomeDetail_icdModifiedBy_prnID_tblPerson] FOREIGN KEY ([icdModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblIncomeDetail_icdPerson_prnID_tblPerson] FOREIGN KEY ([icdPerson_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);

