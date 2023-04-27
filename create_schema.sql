CREATE TABLE [dbo].[DimTweet]
(
    tweet_key int IDENTITY,
    batch INT NOT NULL,
    CONSTRAINT PK_DimTweet PRIMARY KEY NONCLUSTERED (tweet_key) NOT ENFORCED
)
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
)
GO
CREATE TABLE [dbo].[DimDate]
(
    date_key int IDENTITY,
    month int NOT NULL,
    day int NOT NULL,
    year int NOT NULL,
    quarter int NOT NULL,
    hour int NOT NULL,
    complete_date DATETIME NOT NULL,
	CONSTRAINT PK_DimDate PRIMARY KEY NONCLUSTERED (date_key) NOT ENFORCED
)
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
)
GO
CREATE TABLE [dbo].[DimProvider]
(
    provider_key int IDENTITY,
    description VARCHAR(30),
	CONSTRAINT PK_DimProvider PRIMARY KEY NONCLUSTERED (provider_key) NOT ENFORCED
)
WITH
(
    DISTRIBUTION = REPLICATE,
    CLUSTERED COLUMNSTORE INDEX
)
GO

CREATE TABLE [dbo].[FactTweet]
(
    id int IDENTITY,
    date_key int NOT NULL,
    tweet_key int NOT NULL,
    provider_key int NOT NULL,
    alt_id int NOT NULL,
    message VARCHAR(280),
    original VARCHAR(280),
    genre VARCHAR(280),
    related int NOT NULL,
	request int NOT NULL,
	offer int NOT NULL,
	aid_related int NOT NULL,
	medical_help int NOT NULL,
	medical_products int NOT NULL,
	search_and_rescue int NOT NULL,
	security int NOT NULL,
	military int NOT NULL,
	child_alone int NOT NULL,
	water int NOT NULL,
	food int NOT NULL,
	shelter int NOT NULL,
	clothing int NOT NULL,
	money int NOT NULL,
	missing_people int NOT NULL,
	refugees int NOT NULL,
	death int NOT NULL,
	other_aid int NOT NULL,
	infrastructure_related int NOT NULL,
	transport int NOT NULL,
	buildings int NOT NULL,
	electricity int NOT NULL,
	tools int NOT NULL,
	hospitals int NOT NULL,
	shops int NOT NULL,
	aid_centers int NOT NULL,
	other_infrastructure int NOT NULL,
	weather_related int NOT NULL,
	floods int NOT NULL,
	storm int NOT NULL,
	fire int NOT NULL,
	earthquake int NOT NULL,
	cold int NOT NULL,
	other_weather int NOT NULL,
    CONSTRAINT FK_TempSales_SalesReason FOREIGN KEY (tweet_key)
    REFERENCES dbo.DimTweet (tweet_key)
    ON DELETE CASCADE
    ON UPDATE CASCADE
)
WITH
(
    DISTRIBUTION = HASH(id),
    CLUSTERED COLUMNSTORE INDEX
)
GO