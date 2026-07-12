CREATE TABLE [dbo].[tblIncidentalItem] (
    [iciID]               INT              IDENTITY (1, 1) NOT NULL,
    [iciIncidental_incID] INT              NULL,
    [iciName]             VARCHAR (300)    NOT NULL,
    [iciDescription]      VARCHAR (300)    NULL,
    [iciDate]             DATE             NOT NULL,
    [iciAmount]           MONEY            NOT NULL,
    [iciCategory_lvlID]   INT              NOT NULL,
    [iciDateCreated]      DATETIME         CONSTRAINT [DF_tblIncidentalItem_iciDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [iciCreatedBy_prnID]  INT              NULL,
    [iciDateModified]     DATETIME         NULL,
    [iciModifiedBy_prnID] INT              NULL,
    [iciGUID]             UNIQUEIDENTIFIER CONSTRAINT [DF__tblIncide__iciGU__662B2B3B] DEFAULT (newid()) NOT NULL,
    CONSTRAINT [PK__tblIncid__2E769869099E6490] PRIMARY KEY CLUSTERED ([iciID] ASC),
    CONSTRAINT [fk_tblIncidentalItem_iciCategory_lvlID_tblLookupValue] FOREIGN KEY ([iciCategory_lvlID]) REFERENCES [dbo].[tblLookupValue] ([lvlID]),
    CONSTRAINT [fk_tblIncidentalItem_iciCreatedBy_prnID_tblPerson] FOREIGN KEY ([iciCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblIncidentalItem_iciIncidental_incID_tblIncidental] FOREIGN KEY ([iciIncidental_incID]) REFERENCES [dbo].[tblIncidental] ([incID]),
    CONSTRAINT [fk_tblIncidentalItem_iciModifiedBy_prnID_tblPerson] FOREIGN KEY ([iciModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID])
);

