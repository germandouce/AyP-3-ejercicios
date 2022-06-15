!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:16:26'!
test01BalanceOfPortfolioWithoutAccountsIsZero

	self assert: 0 equals: Portfolio new balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:00'!
test02BalanceOfPortfolioWithOneAccountIsAccountBalance

	| account portfolio |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: account balance equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:06'!
test03BalanceOfPortfolioIsCalculatedRecursivelyOnPortfolios

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortofolio |
	
	simplePortfolioAccount := ReceptiveAccount new.
	Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortofolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolioAccount balance + simplePortfolio balance) equals: composedPortofolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:12'!
test04PortfolioWithoutAccountsHasNoRegisteredTransaction

	self deny: (Portfolio new hasRegistered: (Deposit for: 100 * peso))! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:18'!
test05PortfolioHasRegisteredItsAccountsTransactions

	| account portfolio deposit |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	self assert: (portfolio hasRegistered: deposit)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:27:26'!
test06PortfolioLooksForRegisteredTransactionsRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	self assert: (composedPortfolio hasRegistered: simplePortfolioAccountDeposit).
	self assert: (composedPortfolio hasRegistered: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:10'!
test07PortfolioHasNoTransactionWhenHasNoAccounts

	self assert: Portfolio new transactions isEmpty! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:08'!
test08PortfolioTransactionsIncludesAllItsAccountsTransactions

	| account portfolio accountDeposit portfolioTransactions anotherAccountWithdraw |
	
	account := ReceptiveAccount new.
	accountDeposit := Deposit register: 100 * peso on: account.
	anotherAccountWithdraw := Withdraw register: 100 * peso on: account.
	portfolio := Portfolio with: account.
	
	portfolioTransactions := portfolio transactions.
	
	self assert: 2 equals: portfolioTransactions size.
	self assert: (portfolioTransactions includes: accountDeposit).
	self assert: (portfolioTransactions includes: anotherAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:28:20'!
test09PortfolioTransactionsAreCalculatedRecursively

	| simplePortfolioAccount simplePortfolio composedPortfolioAccount composedPortfolio composedPortfolioAccountWithdraw simplePortfolioAccountDeposit composedPortfolioTransactions |
	
	simplePortfolioAccount := ReceptiveAccount new.
	simplePortfolioAccountDeposit := Deposit register: 100 * peso on: simplePortfolioAccount.
	simplePortfolio := Portfolio with: simplePortfolioAccount.
	
	composedPortfolioAccount := ReceptiveAccount new.
	composedPortfolioAccountWithdraw := Withdraw register: 50 * peso on: composedPortfolioAccount.
	composedPortfolio := Portfolio with: simplePortfolio with: composedPortfolioAccount.
	
	composedPortfolioTransactions := composedPortfolio transactions.
	self assert: 2 equals: composedPortfolioTransactions size.
	self assert: (composedPortfolioTransactions includes: simplePortfolioAccountDeposit).
	self assert: (composedPortfolioTransactions includes: composedPortfolioAccountWithdraw)! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:24'!
test10PortfolioCanNotIncludeTheSameAccountMoreThanOnce

	| account portfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio with: account.
	
	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: portfolio accountsSize.
			self assert: (portfolio accountsIncludes: account) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 11:58:28'!
test11PortfolioCanNotIncludeAccountOfItsPortfolios

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio with: account.
	composedPortfolio := Portfolio with: simplePortfolio.
	
	self 
		should: [ composedPortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 1 equals: composedPortfolio accountsSize.
			self assert: (composedPortfolio accountsIncludes: simplePortfolio) ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'LL 11/29/2021 18:55:37'!
test12PortfolioCanNotIncludeItself

	| simplePortfolio |
	
	simplePortfolio := Portfolio new.
	
	self 
		should: [ simplePortfolio add: simplePortfolio ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: 0 equals: simplePortfolio accountsSize. ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:01:51'!
test13ComposedPortfolioCanNotHaveParentPortfolioAccount

	| account simplePortfolio composedPortfolio |
	
	account := ReceptiveAccount new.
	simplePortfolio := Portfolio new.
	composedPortfolio := Portfolio with: simplePortfolio.
	composedPortfolio add: account.
	
	self 
		should: [ simplePortfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: simplePortfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/25/2019 12:12:16'!
test14ComposedPortfolioCanNotHaveAccountOfAnyRootParentRecursively

	| account leftParentPortfolio leftRootParentPortfolio portfolio rightParentPortfolio rightRootParentPortfolio |
	
	account := ReceptiveAccount new.
	portfolio := Portfolio new.
	leftParentPortfolio := Portfolio with: portfolio .
	leftRootParentPortfolio := Portfolio with: leftParentPortfolio.
	leftRootParentPortfolio add: account.
	
	rightParentPortfolio := Portfolio with: portfolio .
	rightRootParentPortfolio := Portfolio with: rightParentPortfolio.
	rightRootParentPortfolio add: account.

	self 
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolio accountsIsEmpty ]! !

!PortfolioTest methodsFor: 'tests' stamp: 'HAW 5/29/2019 16:31:18'!
test15PortfolioCanNotIncludeAnyOfTheComposedAccountOfPortfolioToAdd

	| portfolioToAdd portfolioToModify rootPortfolio sharedAccount |
	
	sharedAccount := ReceptiveAccount new.
	portfolioToModify := Portfolio new.
	rootPortfolio := Portfolio with: sharedAccount with: portfolioToModify.
	portfolioToAdd := Portfolio with: sharedAccount.
	
	self 
		should: [ portfolioToModify add: portfolioToAdd ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError | 
			self assert: Portfolio canNotAddAccountErrorMessage equals: anError messageText.
			self assert: portfolioToModify accountsIsEmpty ]! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #ReportsTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #ReportsTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReportsTest methodsFor: 'AccountSummary Tests' stamp: 'SG 6/15/2022 11:17:00'!
test01AnEmptyAccountGeneratesAnAccountSummaryWithOneElement
	| accountSummary account |
	
	account := ReceptiveAccount new.
	
	accountSummary := AccountSummary generateReportFor: account.
	
	self assert: 1 equals: (accountSummary showReport) size.
	self assert: ((accountSummary showReport) at: 1) equals: 'Balance = 0 peso'.
	! !

!ReportsTest methodsFor: 'AccountSummary Tests' stamp: 'SG 6/15/2022 11:10:39'!
test02AnAccountWithOneDepositGeneratesAnAccountSummaryWithTwoElements
	| accountSummary account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	accountSummary := AccountSummary generateReportFor: account.
	
	self assert: 2 equals: (accountSummary showReport) size.
	self assert: ((accountSummary showReport) at: 1) equals: 'Deposito por 100 peso'.
	self assert: ((accountSummary showReport) at: 2) equals: 'Balance = 100 peso'.! !

!ReportsTest methodsFor: 'AccountSummary Tests' stamp: 'SG 6/15/2022 11:12:37'!
test03AnAccountWithOneWithdrawGeneratesAnAccountSummaryWithTwoElements
	| accountSummary account |
	
	account := ReceptiveAccount new.
	Withdraw register: 200 * peso on: account.
	
	accountSummary := AccountSummary generateReportFor: account.
	
	self assert: 2 equals: (accountSummary showReport) size.
	self assert: ((accountSummary showReport) at: 1) equals: 'Extraccion por 200 peso'.
	self assert: ((accountSummary showReport) at: 2) equals: 'Balance = -200 peso'.! !

!ReportsTest methodsFor: 'AccountSummary Tests' stamp: 'SG 6/15/2022 11:21:51'!
test04AnAccountWithOneTransferGeneratesAnAccountSummaryWithTwoElements
	| accountSummary1 accountSummary2 account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer amount: 300 * peso from: account1 to: account2.
	
	accountSummary1 := AccountSummary generateReportFor: account1.
	accountSummary2 := AccountSummary generateReportFor: account2.
	
	self assert: 2 equals: (accountSummary1 showReport) size.
	self assert: 2 equals: (accountSummary2 showReport) size.
	
	self assert: ((accountSummary1 showReport) at: 1) equals: 'Salida por transferencia de 300 peso'.
	self assert: ((accountSummary1 showReport) at: 2) equals: 'Balance = -300 peso'.
	
	self assert: ((accountSummary2 showReport) at: 1) equals: 'Entrada por transferencia de 300 peso'.
	self assert: ((accountSummary2 showReport) at: 2) equals: 'Balance = 300 peso'.! !

!ReportsTest methodsFor: 'AccountSummary Tests' stamp: 'SG 6/15/2022 11:22:29'!
test05AnAccountWithMoreThanOneTransactionGeneratesAnAccountSummaryWithSameAmountOfElementsPlusOne
	| accountSummary account1 account2 |
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	
	Transfer amount: 20 * peso from: account1 to: account2.
	Transfer amount: 30 * peso from: account2 to: account1.
	
	
	accountSummary := AccountSummary generateReportFor: account1.
	
	self assert: 5 equals: (accountSummary showReport) size.
	self assert: ((accountSummary showReport) at: 1) equals: 'Deposito por 100 peso'.
	self assert: ((accountSummary showReport) at: 2) equals: 'Extraccion por 50 peso'.
	self assert: ((accountSummary showReport) at: 3) equals: 'Salida por transferencia de 20 peso'.
	self assert: ((accountSummary showReport) at: 4) equals: 'Entrada por transferencia de 30 peso'.
	
	self assert: ((accountSummary showReport) at: 5) equals: 'Balance = 60 peso'.! !

!ReportsTest methodsFor: 'AccountSummary Tests' stamp: 'SG 6/15/2022 11:22:36'!
test06APortfolioWithTwoAccountsWithOneTransactionEachGeneratesAnAccountSummaryWithThreeElements
	| accountSummary portfolio account1 account2|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Withdraw register: 50 * peso on: account2.
	
	portfolio := (Portfolio with: account1) add: account2.
	
	accountSummary := AccountSummary generateReportFor: portfolio.
	
	self assert: 3 equals: (accountSummary showReport ) size.
	self assert: ((accountSummary showReport) at: 1) equals: 'Deposito por 100 peso'.
	self assert: ((accountSummary showReport) at: 2) equals: 'Extraccion por 50 peso'.
	self assert: ((accountSummary showReport) at: 3) equals: 'Balance = 50 peso'.! !


!ReportsTest methodsFor: 'TransferNet Tests' stamp: 'SG 6/15/2022 11:37:22'!
test07AnEmptyAccountGeneratesATransferNetWithBalanceZero
	| transferNet account |
	
	account := ReceptiveAccount new.
	
	transferNet := TransferNet generateReportFor: account.
	
	self assert: (transferNet showReport) equals: 'Neto de transferencias = 0 peso'.
	! !

!ReportsTest methodsFor: 'TransferNet Tests' stamp: 'SG 6/15/2022 11:37:31'!
test08AnAccountWithOneTransferGeneratesATransferNet
	| transferNet1 transferNet2 account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer amount: 100 * peso from: account1 to: account2.
	
	transferNet1 := TransferNet generateReportFor: account1.
	transferNet2 := TransferNet generateReportFor: account2.
	
	
	self assert: (transferNet1 showReport) equals: 'Neto de transferencias = -100 peso'.
	self assert: (transferNet2 showReport) equals: 'Neto de transferencias = 100 peso'.! !

!ReportsTest methodsFor: 'TransferNet Tests' stamp: 'SG 6/15/2022 11:39:47'!
test09AnAccountWithOneDepositGeneratesAZeroTransferNet
	| transferNet account  |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	transferNet := TransferNet generateReportFor: account.
	
	self assert: (transferNet showReport) equals: 'Neto de transferencias = 0 peso'.! !

!ReportsTest methodsFor: 'TransferNet Tests' stamp: 'SG 6/15/2022 11:39:56'!
test10AnAccountWithOneWithdrawGeneratesAZeroTransferNet
	| transferNet account  |
	
	account := ReceptiveAccount new.
	Withdraw register: 50 * peso on: account.	
	
	transferNet := TransferNet generateReportFor: account.
	
	self assert: (transferNet showReport) equals: 'Neto de transferencias = 0 peso'.! !

!ReportsTest methodsFor: 'TransferNet Tests' stamp: 'SG 6/15/2022 11:38:39'!
test11AnAccountWithMoreThanOneTransferGeneratesATransferNet
	| transferNet1 transferNet2 account1 account2 |
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer amount: 100 * peso from: account1 to: account2.
	Transfer amount: 500 * peso from: account2 to: account1.
	Transfer amount: 300 * peso from: account2 to: account1.
	
	transferNet1 := TransferNet generateReportFor: account1.
	transferNet2 := TransferNet generateReportFor: account2.
	
	
	self assert: (transferNet1 showReport) equals: 'Neto de transferencias = 700 peso'.
	self assert: (transferNet2 showReport) equals: 'Neto de transferencias = -700 peso'.! !

!ReportsTest methodsFor: 'TransferNet Tests' stamp: 'SG 6/15/2022 11:38:50'!
test12APortfolioWithTwoAccountsWithOneTransferEachGeneratesATransferNet
	| transferNet portfolio account1 account2|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	Transfer amount: 100 * peso from: account1 to: account2.
	Transfer amount: 500 * peso from: account2 to: account1.
	Transfer amount: 300 * peso from: account2 to: account1.
	
	portfolio := (Portfolio with: account1) add: account2.
	
	transferNet := TransferNet generateReportFor: portfolio.
	
	
	self assert: (transferNet showReport) equals: 'Neto de transferencias = 0 peso'.! !


!ReportsTest methodsFor: 'PortfolioDetailedTreePrinter Tests' stamp: 'SG 6/15/2022 16:06:58'!
test17AnEmptyPortfolioGeneratesAnEmptyPortfolioDetailedTreePrinter
	| portfolioTreePrinter portfolio |
	
	portfolio := Portfolio new named: 'Portfolio vacio'.
	
	portfolioTreePrinter := PortfolioDetailedTreePrinter generateReportFor: portfolio.
	
	self assert: (portfolioTreePrinter showReport) equals: 
	(OrderedCollection with: 'Portfolio vacio'
	with: '    Balance = 0 peso').
	! !

!ReportsTest methodsFor: 'PortfolioDetailedTreePrinter Tests' stamp: 'SG 6/15/2022 16:24:38'!
test18AnPortfolioWithOneAccountGeneratesAPortfolioDetailedTreePrinter
	| portfolioTreePrinter portfolio account |
	
	account := ReceptiveAccount new named: 'Cuenta de Juan'.
	Deposit register: 100 * peso on: account.
	
	portfolio := (Portfolio new named: 'Portfolio de Juan') add: account.
	
	portfolioTreePrinter := PortfolioDetailedTreePrinter generateReportFor: portfolio.
	
	self assert: (OrderedCollection 
	with: 'Portfolio de Juan' 
	with: '    Cuenta de Juan'
	with: '        Deposito por 100 peso'
	with: '        Balance = 100 peso'
	with: '    Balance = 100 peso')
	equals: (portfolioTreePrinter showReport).
	! !

!ReportsTest methodsFor: 'PortfolioDetailedTreePrinter Tests' stamp: 'SG 6/15/2022 16:27:37'!
test19AnPortfolioWithOneAccountWithAWithdrawGeneratesAPortfolioDetailedTreePrinter
	| portfolioTreePrinter portfolio account |
	
	account := ReceptiveAccount new named: 'Cuenta de Pedro'.
	Withdraw register: 200 * peso on: account.
	
	portfolio := (Portfolio new named: 'Portfolio de Pedro') add: account.
	
	portfolioTreePrinter := PortfolioDetailedTreePrinter generateReportFor: portfolio.
	
	self assert: (OrderedCollection 
	with: 'Portfolio de Pedro' 
	with: '    Cuenta de Pedro'
	with: '        Extraccion por 200 peso'
	with: '        Balance = -200 peso'
	with: '    Balance = -200 peso')
	equals: (portfolioTreePrinter showReport).
	! !

!ReportsTest methodsFor: 'PortfolioDetailedTreePrinter Tests' stamp: 'SG 6/15/2022 16:37:30'!
test20AnPortfolioWithOneAccountWithATransferGeneratesAPortfolioDetailedTreePrinter
	| portfolioTreePrinter1 portfolio1 account1 portfolioTreePrinter2 portfolio2 account2|
	
	account1 := ReceptiveAccount new named: 'Cuenta de Juan'.
	portfolio1 := (Portfolio new named: 'Portfolio de Juan') add: account1.
	
	
	account2 := ReceptiveAccount new named: 'Cuenta de Pedro'.
	portfolio2 := (Portfolio new named: 'Portfolio de Pedro') add: account2.
	
	Transfer amount: 300 * peso from: account1 to: account2.
	
	portfolioTreePrinter1 := PortfolioDetailedTreePrinter generateReportFor: portfolio1.
	portfolioTreePrinter2 := PortfolioDetailedTreePrinter generateReportFor: portfolio2.
	
	
	
	self assert: (OrderedCollection 
	with: 'Portfolio de Juan' 
	with: '    Cuenta de Juan'
	with: '        Salida por transferencia de 300 peso'
	with: '        Balance = -300 peso'
	with: '    Balance = -300 peso')
	equals: (portfolioTreePrinter1 showReport).
	
	self assert: (OrderedCollection 
	with: 'Portfolio de Pedro' 
	with: '    Cuenta de Pedro'
	with: '        Entrada por transferencia de 300 peso'
	with: '        Balance = 300 peso'
	with: '    Balance = 300 peso')
	equals: (portfolioTreePrinter2 showReport).
	! !

!ReportsTest methodsFor: 'PortfolioDetailedTreePrinter Tests' stamp: 'SG 6/15/2022 17:25:01'!
test21AnPortfolioWithOneAccountAndAPortfolioWithTwoAccountsGeneratesAPortfolioDetailedTreePrinter
	| portfolioTreePrinter portfolio innerPortfolio mainAccount subAccount1 subAccount2 orderedAssert |
	
	subAccount1 := ReceptiveAccount new named: 'Cuenta de Juan'.
	subAccount2 := ReceptiveAccount new named: 'Cuenta de Angeles'.
	
	innerPortfolio := (((Portfolio new named: 'Portfolio de hijos') 
	add: subAccount1) add: subAccount2).
	
	mainAccount := ReceptiveAccount new named: 'Cuenta Mia'.
	
	portfolio := ((Portfolio new named: 'Portfolio de la familia') 
	add: mainAccount) 
	add: innerPortfolio.
	
	Deposit register: 100 * peso on: mainAccount.
	Withdraw register: 50 * peso on: mainAccount.
	
	Deposit register: 200 * peso on: subAccount1 .
	Withdraw register: 300 * peso on: subAccount1.
	
	Transfer amount: 500 * peso from: subAccount2 to: ReceptiveAccount new.
	
	portfolioTreePrinter := PortfolioDetailedTreePrinter generateReportFor: portfolio.
	
	orderedAssert := OrderedCollection withAll: {
	'Portfolio de la familia'.
	'    Cuenta Mia'.
	'        Deposito por 100 peso'.
	'        Extraccion por 50 peso'.
	'        Balance = 50 peso'.
	'    Portfolio de hijos'.
	'        Cuenta de Juan'.
	'            Deposito por 200 peso'.
	'            Extraccion por 300 peso'.
	'            Balance = -100 peso'.
	'        Cuenta de Angeles'.
	'            Salida por transferencia de 500 peso'.
	'            Balance = -500 peso'.
	'        Balance = -600 peso'.
	'    Balance = -550 peso'
	}.
	
	self assert: orderedAssert equals: (portfolioTreePrinter showReport).
! !

!ReportsTest methodsFor: 'PortfolioDetailedTreePrinter Tests' stamp: 'SG 6/15/2022 17:25:48'!
test22AnPortfolioWithAPortfolioAndOneAccountGeneratesAPortfolioDetailedTreePrinter
	| portfolioTreePrinter portfolio innerPortfolio mainAccount subAccount1 subAccount2 orderedAssert |
	
	subAccount1 := ReceptiveAccount new named: 'Cuenta de Juan'.
	subAccount2 := ReceptiveAccount new named: 'Cuenta de Angeles'.
	
	innerPortfolio := (((Portfolio new named: 'Portfolio de hijos') 
	add: subAccount1) add: subAccount2).
	
	mainAccount := ReceptiveAccount new named: 'Cuenta Mia'.
	
	portfolio := ((Portfolio new named: 'Portfolio de la familia') 
	add: innerPortfolio)
	add: mainAccount.
	
	Deposit register: 100 * peso on: mainAccount.
	Withdraw register: 50 * peso on: mainAccount.
	
	Deposit register: 200 * peso on: subAccount1 .
	Withdraw register: 300 * peso on: subAccount1.
	
	Transfer amount: 500 * peso from: subAccount2 to: ReceptiveAccount new.
	
	portfolioTreePrinter := PortfolioDetailedTreePrinter generateReportFor: portfolio.
	
	orderedAssert := OrderedCollection withAll: {
	'Portfolio de la familia'.
	'    Portfolio de hijos'.
	'        Cuenta de Juan'.
	'            Deposito por 200 peso'.
	'            Extraccion por 300 peso'.
	'            Balance = -100 peso'.
	'        Cuenta de Angeles'.
	'            Salida por transferencia de 500 peso'.
	'            Balance = -500 peso'.
	'        Balance = -600 peso'.
	'    Cuenta Mia'.
	'        Deposito por 100 peso'.
	'        Extraccion por 50 peso'.
	'        Balance = 50 peso'.
	'    Balance = -550 peso'
	}.
	
	self assert: orderedAssert equals: (portfolioTreePrinter showReport).
! !


!ReportsTest methodsFor: 'PortfolioTreePrinter Tests' stamp: 'SG 6/15/2022 14:09:01'!
test13AnEmptyPortfolioGeneratesAnEmptyPortfolioTreePrinter
	| portfolioTreePrinter portfolio |
	
	portfolio := Portfolio new named: 'Portfolio vacio'.
	
	portfolioTreePrinter := PortfolioTreePrinter generateReportFor: portfolio.
	
	self assert: (portfolioTreePrinter showReport) equals: (OrderedCollection with: 'Portfolio vacio').
	! !

!ReportsTest methodsFor: 'PortfolioTreePrinter Tests' stamp: 'SG 6/15/2022 14:38:33'!
test14AnPortfolioWithOneAccountGeneratesAPortfolioTreePrinter
	| portfolioTreePrinter portfolio account |
	
	account := ReceptiveAccount new named: 'Cuenta de Juan'.
	
	portfolio := (Portfolio new named: 'Portfolio de Juan') add: account.
	
	portfolioTreePrinter := PortfolioTreePrinter generateReportFor: portfolio.
	
	self assert: (OrderedCollection with: 'Portfolio de Juan' with: '    Cuenta de Juan') equals: (portfolioTreePrinter showReport).
	! !

!ReportsTest methodsFor: 'PortfolioTreePrinter Tests' stamp: 'SG 6/15/2022 15:35:30'!
test15AnPortfolioWithOneAccountAndAPortfolioWithTwoAccountsGeneratesAPortfolioTreePrinter
	| portfolioTreePrinter portfolio innerPortfolio account |
	
	innerPortfolio := (((Portfolio new named: 'Portfolio de hijos') 
	add: (ReceptiveAccount new named: 'Cuenta de Juan')) 
	add: (ReceptiveAccount new named: 'Cuenta de Angeles')).
	
	account := ReceptiveAccount new named: 'Cuenta mia'.
	
	portfolio := ((Portfolio new named: 'Portfolio de la familia') 
	add: account) 
	add: innerPortfolio.
	
	portfolioTreePrinter := PortfolioTreePrinter generateReportFor: portfolio.
	
	self assert: (OrderedCollection with: 'Portfolio de la familia' 
	with: '    Cuenta mia'
	with: '    Portfolio de hijos'
	with: '        Cuenta de Juan'
	with: '        Cuenta de Angeles')
	equals: (portfolioTreePrinter showReport).
	! !

!ReportsTest methodsFor: 'PortfolioTreePrinter Tests' stamp: 'SG 6/15/2022 15:40:26'!
test16AnPortfolioWithAPortfolioAndOneAccountGeneratesAPortfolioTreePrinter
	| portfolioTreePrinter portfolio innerPortfolio account |
	
	innerPortfolio := (((Portfolio new named: 'Portfolio de hijos') 
	add: (ReceptiveAccount new named: 'Cuenta de Juan')) 
	add: (ReceptiveAccount new named: 'Cuenta de Angeles')).
	
	account := ReceptiveAccount new named: 'Cuenta mia'.
	
	portfolio := ((Portfolio new named: 'Portfolio de la familia') 
	add: innerPortfolio) 
	add: account.
	
	portfolioTreePrinter := PortfolioTreePrinter generateReportFor: portfolio.
	
	self assert: (OrderedCollection with: 'Portfolio de la familia' 
	with: '    Portfolio de hijos'
	with: '        Cuenta de Juan'
	with: '        Cuenta de Angeles'
	with: '    Cuenta mia')
	equals: (portfolioTreePrinter showReport).
	! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Solucion'!
TestCase subclass: #TransferTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:07:03'!
test01ATransferDecreasesBalanceFromOriginAccountAndIncreasesItForDestinationAccount

	| destinationAccount originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 8 * peso equals: originAccount balance.
	self assert: 12 * peso equals: destinationAccount balance.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 21:12:28'!
test02ATransferKnowsItsValue

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: 2 * peso equals: transfer value.! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:44'!
test03DepositLegKnowsItsWithdrawCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer withdrawLeg equals: transfer depositLeg withdrawLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:01:51'!
test04WithdrawLegKnowsItsDepositCounterpart

	| destinationAccount originAccount transfer |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: destinationAccount.
	
	transfer := Transfer amount: 2 * peso from: originAccount to: destinationAccount.
	
	self assert: transfer depositLeg equals: transfer withdrawLeg depositLeg! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:36'!
test05OriginAndDestinationAccountsCannotBeTheSame

	| originAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	self should: [ Transfer amount: 2 * peso from: originAccount to: originAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferToOriginErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !

!TransferTest methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 23:02:44'!
test06CannotTransferAZeroAmount

	| originAccount destinationAccount |
	
	originAccount := ReceptiveAccount new.
	Deposit register: 10 * peso on: originAccount.
	
	destinationAccount := ReceptiveAccount new.
	Deposit register: 5 * peso on: destinationAccount.
	
	self should: [ Transfer amount: 0 from: originAccount to: destinationAccount ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Transfer cannotTransferZeroErrorDescription equals: anError messageText.
			self assert: 10 * peso equals: originAccount balance.
		]
! !


!classDefinition: #Account category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Account
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:40'!
balance

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:47'!
hasRegistered: aTransaction

	self subclassResponsibility ! !

!Account methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 12:23:15'!
transactions

	self subclassResponsibility ! !


!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:45:50'!
addedTo: aPortfolio

	self subclassResponsibility! !

!Account methodsFor: 'composition' stamp: 'LL 7/8/2021 21:46:48'!
isComposedBy: anAccount

	self subclassResponsibility! !


!Account methodsFor: 'private' stamp: 'HAW 5/25/2019 12:23:27'!
addTransactionsTo: aCollectionOfTransactions

	self subclassResponsibility ! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Solucion'!
Account subclass: #Portfolio
	instanceVariableNames: 'accounts parents portfolioName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Portfolio methodsFor: 'initialization' stamp: 'SG 6/15/2022 14:07:59'!
initialize

	accounts := OrderedCollection new.
	parents := OrderedCollection new.
	portfolioName := 'Portfolio sin nombre'! !

!Portfolio methodsFor: 'initialization' stamp: 'SG 6/15/2022 14:08:18'!
named: aName
	portfolioName := aName! !


!Portfolio methodsFor: 'main protocol' stamp: 'SG 6/15/2022 16:09:11'!
balance
	
	^accounts sum: [ :anAccount | anAccount balance ] ifEmpty: [ 0 * peso ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:28:29'!
hasRegistered: aTransaction

	^accounts anySatisfy: [ :anAccount | anAccount hasRegistered: aTransaction ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'HAW 5/25/2019 11:38:32'!
transactions
	
	| transactions |
	
	transactions := OrderedCollection new.
	accounts do: [ :anAccount | anAccount addTransactionsTo: transactions ].
	
	^transactions ! !


!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:20'!
accountsIncludes: anAccount

	^accounts includes: anAccount ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:05:04'!
accountsIsEmpty
	
	^accounts isEmpty ! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 11:49:06'!
accountsSize
	
	^accounts size! !

!Portfolio methodsFor: 'accounts management' stamp: 'HAW 5/25/2019 12:19:20'!
add: accountToAdd

	self assertCanAdd: accountToAdd.
		
	accounts add: accountToAdd.
	accountToAdd addedTo: self 
	! !


!Portfolio methodsFor: 'private' stamp: 'HAW 5/25/2019 11:42:55'!
addTransactionsTo: aCollectionOfTransactions

	accounts do: [ :anAccount | anAccount addTransactionsTo: aCollectionOfTransactions ]! !


!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
addRootParentsTo: rootParents

	parents 
		ifEmpty: [ rootParents add: self ] 
		ifNotEmpty: [ parents do: [ :aParent | aParent addRootParentsTo: rootParents ]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:02:59'!
addedTo: aPortfolio 
	
	parents add: aPortfolio ! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:56'!
anyRootParentIsComposedBy: accountToAdd

	^self rootParents anySatisfy: [ :aParent | aParent isComposedBy: accountToAdd]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:20:36'!
assertCanAdd: accountToAdd

	(self anyRootParentIsComposedBy: accountToAdd) ifTrue: [ self signalCanNotAddAccount ].
! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/29/2019 16:24:54'!
isComposedBy: anAccount

	^ self = anAccount or: [ accounts anySatisfy: [ :composedAccount | (composedAccount isComposedBy: anAccount) or: [ anAccount isComposedBy: composedAccount ]]]! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:17:31'!
rootParents
	
	| rootParents |
	
	rootParents := Set new.
	self addRootParentsTo: rootParents.
	
	^ rootParents! !

!Portfolio methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:48:34'!
signalCanNotAddAccount
	
	self error: self class canNotAddAccountErrorMessage! !


!Portfolio methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 14:30:08'!
affectReport: aReport
	^aReport beAffectedByPortfolio: self.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 14:13:53'!
name
	^portfolioName ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 14:56:53'!
printAccountsInAReport: aReport
	accounts do: [ :anAccount | 
		anAccount affectReport: aReport
		]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Solucion'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:48:55'!
canNotAddAccountErrorMessage
	
	^'Can not add repeated account to a portfolio'! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:18:21'!
with: anAccount

	^self new 
		add: anAccount;
		yourself! !

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'HAW 5/25/2019 11:23:59'!
with: anAccount with: anotherAccount

	^self new 
		add: anAccount;
		add: anotherAccount;
		yourself! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Solucion'!
Account subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions accountName'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:35'!
initialize

	super initialize.
	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'SG 6/15/2022 11:16:22'!
balance

	^transactions 
		inject: 0 * peso
		into: [ :currentBalance :transaction | transaction affectBalance: currentBalance ]! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/21/2019 18:55:56'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'private' stamp: 'HAW 5/25/2019 11:38:52'!
addTransactionsTo: aCollectionOfTransactions

	aCollectionOfTransactions addAll: transactions ! !


!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 12:03:32'!
addedTo: aPortfolio 
	
	! !

!ReceptiveAccount methodsFor: 'composition' stamp: 'HAW 5/25/2019 11:54:51'!
isComposedBy: anAccount

	^self = anAccount ! !


!ReceptiveAccount methodsFor: 'nil' stamp: 'SG 6/15/2022 14:56:28'!
affectReport: aReport
	^aReport beAffectedByAccount: self.! !

!ReceptiveAccount methodsFor: 'nil' stamp: 'SG 6/15/2022 14:13:19'!
named: aName
	accountName := aName! !


!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 14:13:41'!
name
	^accountName ! !

!ReceptiveAccount methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 16:16:55'!
printTransactionsInAReport: aReport
	transactions do: [ :aTransaction | 
		aTransaction affectReport: aReport
		]! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Solucion'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !


!AccountTransaction methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:39'!
affectBalance: aBalance

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'balance' stamp: 'SG 6/14/2022 16:02:28'!
affectReport: aReport

	self subclassResponsibility ! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !


!Deposit methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:02'!
affectBalance: aBalance

	^aBalance + value ! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'SG 6/14/2022 15:45:31'!
affectReport: aReport
	^aReport beAffectedByDeposit: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Solucion'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!Deposit class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferLeg category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #TransferLeg
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferLeg methodsFor: 'value' stamp: 'LL 9/20/2020 22:27:32'!
value

	^transfer value! !


!TransferLeg methodsFor: 'initialization' stamp: 'LL 9/20/2020 22:28:14'!
initializeWith: aTransfer

	transfer := aTransfer! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferLeg class' category: 'ServiciosFinancieros-Solucion'!
TransferLeg class
	instanceVariableNames: ''!

!TransferLeg class methodsFor: 'as yet unclassified' stamp: 'LL 9/20/2020 22:45:01'!
of: aTransfer on: anAccount

	| transaction |
	
	transaction := self new initializeWith: 	aTransfer.
	anAccount register: transaction.	
	
	^transaction! !


!classDefinition: #TransferDepositLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferDepositLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferDepositLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:26:10'!
withdrawLeg

	^transfer withdrawLeg! !


!TransferDepositLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:49'!
affectBalance: aBalance

	^aBalance + self value! !


!TransferDepositLeg methodsFor: 'as yet unclassified' stamp: 'SG 6/14/2022 15:45:31'!
affectReport: aReport
	^aReport beAffectedByTransferDeposit: self! !


!classDefinition: #TransferWithdrawLeg category: 'ServiciosFinancieros-Solucion'!
TransferLeg subclass: #TransferWithdrawLeg
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferWithdrawLeg methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:25:47'!
depositLeg

	^transfer depositLeg! !


!TransferWithdrawLeg methodsFor: 'balance' stamp: 'LL 9/20/2020 22:27:55'!
affectBalance: aBalance

	^aBalance - self value! !


!TransferWithdrawLeg methodsFor: 'as yet unclassified' stamp: 'SG 6/14/2022 15:45:32'!
affectReport: aReport
	^aReport beAffectedByTransferWithdraw: self! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Solucion'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !


!Withdraw methodsFor: 'balance' stamp: 'HAW 5/25/2019 11:25:15'!
affectBalance: aBalance

	^aBalance - value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'SG 6/14/2022 15:45:32'!
affectReport: aReport
	^aReport beAffectedByWithdraw: self! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Solucion'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!Withdraw class methodsFor: 'as yet unclassified' stamp: 'LL 7/8/2021 21:45:05'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Report category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Report
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Report methodsFor: 'as yet unclassified' stamp: 'SG 6/11/2022 17:27:51'!
canBeAdded: anAccount
	^self subclassResponsibility ! !

!Report methodsFor: 'as yet unclassified' stamp: 'SG 6/11/2022 17:26:34'!
createReportFor: anAccount
	^self subclassResponsibility ! !

!Report methodsFor: 'as yet unclassified' stamp: 'SG 6/11/2022 17:27:21'!
initialize
	^self subclassResponsibility ! !

!Report methodsFor: 'as yet unclassified' stamp: 'SG 6/11/2022 17:26:07'!
showReport
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Report class' category: 'ServiciosFinancieros-Solucion'!
Report class
	instanceVariableNames: ''!

!Report class methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 15:54:49'!
generateReportFor: anAccount
	^self new createReportFor: anAccount.! !


!classDefinition: #AccountSummary category: 'ServiciosFinancieros-Solucion'!
Report subclass: #AccountSummary
	instanceVariableNames: 'reportCollection'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!AccountSummary methodsFor: 'public' stamp: 'SG 6/14/2022 15:56:47'!
createReportFor: anAccount
	anAccount transactions do: [ :aTransaction |
			 aTransaction affectReport: self].
	
	self generateString: anAccount ! !

!AccountSummary methodsFor: 'public' stamp: 'SG 6/11/2022 13:09:06'!
showReport
	^reportCollection ! !


!AccountSummary methodsFor: 'initialization' stamp: 'SG 6/11/2022 13:04:29'!
initialize
	reportCollection := OrderedCollection new.! !


!AccountSummary methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:33:03'!
beAffectedByDeposit: aDeposit
	reportCollection add: ('Deposito por ', 
	(aDeposit value amount) printString,
	' ', 
	(aDeposit value unit) printString)! !

!AccountSummary methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:34:31'!
beAffectedByTransferDeposit: aTransferDeposit
	reportCollection add: ('Entrada por transferencia de ', 
	(aTransferDeposit value amount) printString,
	' ', 
	(aTransferDeposit value unit) printString)! !

!AccountSummary methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:34:57'!
beAffectedByTransferWithdraw: aTransferWithdraw
	reportCollection add: ('Salida por transferencia de ', 
	(aTransferWithdraw value amount) printString,
	' ', 
	(aTransferWithdraw value unit) printString)! !

!AccountSummary methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:33:14'!
beAffectedByWithdraw: aWithdraw
	reportCollection add: ('Extraccion por ', 
	(aWithdraw value amount) printString,
	' ', 
	(aWithdraw value unit) printString)! !

!AccountSummary methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:57:14'!
generateString: anAccount
	reportCollection add: 'Balance = ', 
	(anAccount balance amount) printString, 
	' '
	, (anAccount balance unit) printString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountSummary class' category: 'ServiciosFinancieros-Solucion'!
AccountSummary class
	instanceVariableNames: ''!

!AccountSummary class methodsFor: 'as yet unclassified' stamp: 'SG 6/11/2022 14:38:17'!
onlyAccountsCanGenerateAccountSummaryError
	^'Only accounts can generate an accountSummary'! !


!classDefinition: #PortfolioDetailedTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioDetailedTreePrinter
	instanceVariableNames: 'treeCollection space'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 16:14:04'!
beAffectedByAccount: aAccount
	| originalSpace |
	
	treeCollection add: space, aAccount name.
	
	originalSpace := space copy.
	space := space, '    '.
	
	aAccount printTransactionsInAReport: self.
	
	treeCollection add: space, 'Balance = ', (aAccount balance amount) printString, ' ', (aAccount balance unit) printString.
	
	space := originalSpace.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 16:21:41'!
beAffectedByDeposit: aDeposit
	treeCollection add: (space, 'Deposito por ', 
	(aDeposit value amount) printString,
	' ', 
	(aDeposit value unit) printString)! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 17:14:29'!
beAffectedByPortfolio: aPortfolio
	| originalSpace |
	
	treeCollection add: space, aPortfolio name.
	
	originalSpace := space copy.
	space := space, '    '.
	
	aPortfolio printAccountsInAReport: self.
	
	treeCollection add: space, 'Balance = ', (aPortfolio balance amount) printString, ' ', (aPortfolio balance unit) printString.
	
	space := originalSpace.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 16:21:53'!
beAffectedByTransferDeposit: aTransferDeposit
	treeCollection add: (space, 'Entrada por transferencia de ', 
	(aTransferDeposit value amount) printString,
	' ', 
	(aTransferDeposit value unit) printString)! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 16:22:09'!
beAffectedByTransferWithdraw: aTransferWithdraw
	treeCollection add: (space, 'Salida por transferencia de ', 
	(aTransferWithdraw value amount) printString,
	' ', 
	(aTransferWithdraw value unit) printString)! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 16:21:32'!
beAffectedByWithdraw: aWithdraw
	treeCollection add: (space, 'Extraccion por ', 
	(aWithdraw value amount) printString,
	' ', 
	(aWithdraw value unit) printString)! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 15:58:06'!
createReportFor: anAccount
	anAccount affectReport: self! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 15:57:01'!
initialize
	treeCollection := OrderedCollection new.
	space := ''.! !

!PortfolioDetailedTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 15:57:27'!
showReport
	^treeCollection ! !


!classDefinition: #PortfolioTreePrinter category: 'ServiciosFinancieros-Solucion'!
Report subclass: #PortfolioTreePrinter
	instanceVariableNames: 'treeCollection space'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 15:17:42'!
beAffectedByAccount: aAccount
	treeCollection add: space, aAccount name.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 15:21:36'!
beAffectedByPortfolio: aPortfolio
	| originalSpace |
	
	treeCollection add: space, aPortfolio name.
	
	originalSpace := space copy.
	space := space, '    '.
	
	aPortfolio printAccountsInAReport: self.
	space := originalSpace.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 14:31:38'!
createReportFor: anAccount
	anAccount affectReport: self.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 15:42:52'!
initialize
	treeCollection := OrderedCollection new.
	space := ''.! !

!PortfolioTreePrinter methodsFor: 'as yet unclassified' stamp: 'SG 6/15/2022 14:22:31'!
showReport
	^treeCollection ! !


!classDefinition: #TransferNet category: 'ServiciosFinancieros-Solucion'!
Report subclass: #TransferNet
	instanceVariableNames: 'netBalance netReport'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!TransferNet methodsFor: 'public' stamp: 'SG 6/14/2022 15:56:20'!
createReportFor: anAccount
	
	anAccount transactions do: [ :aTransaction |
			aTransaction affectReport: self
			].
		
		
	self generateString! !

!TransferNet methodsFor: 'public' stamp: 'SG 6/11/2022 15:29:50'!
showReport
	^netReport 
! !


!TransferNet methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:01:03'!
beAffectedByDeposit: aDeposit 
	! !

!TransferNet methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 14:59:31'!
beAffectedByTransferDeposit: aTransferDeposit
	netBalance := aTransferDeposit affectBalance: netBalance ! !

!TransferNet methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 14:59:19'!
beAffectedByTransferWithdraw: aTransferWithdraw
	netBalance := aTransferWithdraw affectBalance: netBalance ! !

!TransferNet methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:00:58'!
beAffectedByWithdraw: aWithdraw! !

!TransferNet methodsFor: 'Internal Operations' stamp: 'SG 6/14/2022 15:03:18'!
generateString
	netReport := 'Neto de transferencias = ',
			(netBalance value amount) printString,
			' ',
			 (netBalance value unit) printString! !


!TransferNet methodsFor: 'initialization' stamp: 'SG 6/14/2022 15:02:09'!
initialize
	netBalance := 0 * peso.
	netReport := 'Neto de transferencias = 0'.
	! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Solucion'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawLeg depositLeg'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Solucion'!

!Transfer methodsFor: 'value' stamp: 'LL 9/20/2020 21:13:00'!
value

	^value! !


!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 22:39:46'!
depositLeg

	^depositLeg! !

!Transfer methodsFor: 'accessing' stamp: 'LL 9/20/2020 21:25:56'!
withdrawLeg
	
	^withdrawLeg! !


!Transfer methodsFor: 'initialization' stamp: 'LL 9/20/2020 21:25:21'!
initializeWith: aValue withdrawLeg: aWithdraw depositLeg: aDeposit

	value := aValue.
	withdrawLeg := aWithdraw.
	depositLeg := aDeposit! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Solucion'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:57:30'!
cannotTransferToOriginErrorDescription
	
	^'Transfer destionation cannot be the origin account'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:00:53'!
cannotTransferZeroErrorDescription

	^'Transfer amount should be positive'! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 22:56:35'!
signalCannotTransferToOrigin
	
	self error: self cannotTransferToOriginErrorDescription! !

!Transfer class methodsFor: 'errors' stamp: 'LL 9/20/2020 23:06:17'!
signalCannotTransferZero

	self error: self cannotTransferZeroErrorDescription! !


!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:05:22'!
assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount

	self assertCanTransferTo: destinationAccount from: originAccount.
	self assertCanTransfer: anAmountOfMoney! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:11:50'!
assertCanTransfer: anAmountOfMoney

	^ anAmountOfMoney isZero ifTrue: [ self signalCannotTransferZero ]! !

!Transfer class methodsFor: 'assertions' stamp: 'LL 9/20/2020 23:04:58'!
assertCanTransferTo: destinationAccount from: originAccount

	^ originAccount = destinationAccount ifTrue: [ self signalCannotTransferToOrigin ]! !


!Transfer class methodsFor: 'instance creation' stamp: 'LL 9/20/2020 23:11:34'!
amount: anAmountOfMoney from: originAccount to: destinationAccount 
	
	| transfer depositLeg withdrawLeg |
	
	self assert: anAmountOfMoney canBeTransferedTo: destinationAccount from: originAccount.
	
	transfer := self new.
	
	withdrawLeg := TransferWithdrawLeg of: transfer on: originAccount.
	depositLeg := TransferDepositLeg of: transfer on: destinationAccount.
	
	^transfer initializeWith: anAmountOfMoney withdrawLeg: withdrawLeg depositLeg: depositLeg
	
	
	! !
