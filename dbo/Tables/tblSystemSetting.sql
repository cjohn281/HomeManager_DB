CREATE TABLE [dbo].[tblSystemSetting] (
    [sstID]               INT              IDENTITY (1, 1) NOT NULL,
    [sstName]             VARCHAR (300)    NOT NULL,
    [sstValue]            VARCHAR (300)    NOT NULL,
    [sstSystem_sysID]     INT              NOT NULL,
    [sstDateCreated]      DATETIME         CONSTRAINT [DF_tblSystemSetting_sstDateCreated] DEFAULT ([dbo].[fncGetLocalDateTime]()) NULL,
    [sstCreatedBy_prnID]  INT              NULL,
    [sstDateModified]     DATETIME         NULL,
    [sstModifiedBy_prnID] INT              NULL,
    [sstGUID]             UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    PRIMARY KEY CLUSTERED ([sstID] ASC),
    CONSTRAINT [fk_tblSystemSetting_sstCreatedBy_prnID_tblPerson] FOREIGN KEY ([sstCreatedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSystemSetting_sstModifiedBy_prnID_tblPerson] FOREIGN KEY ([sstModifiedBy_prnID]) REFERENCES [dbo].[tblPerson] ([prnID]),
    CONSTRAINT [fk_tblSystemSetting_sstSystem_sysID_tblSystem] FOREIGN KEY ([sstSystem_sysID]) REFERENCES [dbo].[tblSystem] ([sysID]),
    CONSTRAINT [UQ_tblSystemSetting] UNIQUE NONCLUSTERED ([sstName] ASC, [sstSystem_sysID] ASC)
);

