CREATE TABLE [dbo].[tblRecurringSavingsTransferDetail] (
    [rsdID]                 INT              IDENTITY (1, 1) NOT NULL,
    [rsdAmount]             MONEY            NOT NULL,
    [rsdTransferType_lvlID] INT              NOT NULL,
    [rsdFrequency_lvlID]    INT              NOT NULL,
    [rsdStartDate]          DATE             NOT NULL,
    [rsdDateCreated]        DATETIME         CONSTRAINT [DF_tblRecurringSavingsTransferDetail_rsdDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [rsdCreatedBy_prnID]    INT              NULL,
    [rsdDateModified]       DATETIME         NULL,
    [rsdModifiedBy_prnID]   INT              NULL,
    [rsdGUID]               UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([rsdID] ASC),
    CONSTRAINT [fk_tblRecurringSavings_rsdCreatedBy_prnID_tblPerson] FOREIGN KEY ([rsdCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblRecurringSavings_rsdFrequency_lvlID_tblLookupValue] FOREIGN KEY ([rsdFrequency_lvlID]) REFERENCES [dbo].[tblLookupValue] ([lvlID]),
    CONSTRAINT [fk_tblRecurringSavings_rsdModifiedBy_prnID_tblPerson] FOREIGN KEY ([rsdModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblRecurringSavings_rsdTransferType_lvlID_tblLookupValue] FOREIGN KEY ([rsdTransferType_lvlID]) REFERENCES [dbo].[tblLookupValue] ([lvlID])
);

