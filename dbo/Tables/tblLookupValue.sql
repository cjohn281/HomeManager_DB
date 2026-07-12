CREATE TABLE [dbo].[tblLookupValue] (
    [lvlID]               INT              IDENTITY (1, 1) NOT NULL,
    [lvlLookupType_lktID] INT              NOT NULL,
    [lvlOrdinal]          INT              NULL,
    [lvlText]             VARCHAR (300)    NOT NULL,
    [lvlExtendedValue1]   VARCHAR (300)    NULL,
    [lvlExtendedValue2]   VARCHAR (300)    NULL,
    [lvlDateCreated]      DATETIME         CONSTRAINT [DF_tblLookupValue_lvlDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [lvlCreatedBy_prnID]  INT              NULL,
    [lvlDateModified]     DATETIME         NULL,
    [lvlModifiedBy_prnID] INT              NULL,
    [lvlGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([lvlID] ASC),
    CONSTRAINT [fk_tblLookupValue_lvlCreatedBy_prnID_tblPerson] FOREIGN KEY ([lvlCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblLookupValue_lvlModifiedBy_prnID_tblPerson] FOREIGN KEY ([lvlModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);

