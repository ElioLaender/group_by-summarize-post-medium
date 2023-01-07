Use DBST_SelfService

IF OBJECT_ID(N'tempdb..#Fact_Pagamentos') IS NOT NULL
	BEGIN
		DROP TABLE #Fact_Pagamentos
	END

GO

Create Table #Fact_Pagamentos (
    Classe_Custo Varchar(30)
  , Descricao Varchar(255)
  , Ano Char(4)
  , Janeiro Decimal(18,3)
  , Fevereiro Decimal(18,3)
  , Marco Decimal(18,3)
  , Abril Decimal(18,3)
  , Maio Decimal(18,3)
  , Junho Decimal(18,3)
  , Julho Decimal(18,3)
  , Agosto Decimal(18,3)
  , Setembro Decimal(18,3)
  , Outubro Decimal(18,3)
  , Novembro Decimal(18,3)
  , Dezembro Decimal(18,3)
  , Total Decimal(18,3)
)

Insert Into #Fact_Pagamentos
	(Classe_Custo, Descricao, Ano, Janeiro, Fevereiro, Marco, Abril, Maio, Junho, Julho, Agosto, Setembro, Outubro, Novembro, Dezembro, Total) Values
	('45222000', 'PG Salários', '2022', 5380.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5380.00)
,	('45222000', 'PG Salários', '2022', 0.00, 5400.10, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5400.10)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 5380.90, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5380.90)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 5600.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5600.00)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 5470.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5470.00)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 0.00, 5500.20, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5500.20)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5430.70, 0.00, 0.00, 0.00, 0.00, 0.00, 5430.70)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5410.00, 0.00, 0.00, 0.00, 0.00, 5410.00)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5780.00, 0.00, 0.00, 0.00, 5780.00)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5460.40, 0.00, 0.00, 5460.40)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 5930.90, 0.00, 5930.90)
,	('45222000', 'PG Salários', '2022', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 6000.00, 6000.00)

-- Select  * From #Fact_Pagamentos  

Select
		Classe_Custo 
	,	Descricao 
	,	Ano
	,	Janeiro   =  SUM(Janeiro)
	,	Fevereiro  =  SUM(Fevereiro)
	,	Marco	   =  SUM(Marco)
	,	Abril      =  SUM(Abril)		
	,	Maio	   =  SUM(Maio)
	,	Junho	   =  SUM(Junho)
	,	Julho	   =  SUM(Julho)
	,	Agosto	   =  SUM(Agosto)
	,	Setembro   =  SUM(Setembro)
	,	Outubro	   =  SUM(Outubro)
	,	Novembro   =  SUM(Novembro)
	,	Dezembro   =  SUM(Dezembro)
	,	Total	   =  SUM(Total)
From #Fact_Pagamentos
Group By 
		Classe_Custo 
	,	Descricao 
	,	Ano