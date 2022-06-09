!classDefinition: #PortolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:34:38'!
test11EmptyPortfolioInsideAnotherPortfolioHasCeroBalance
	
	|mainPortfolio subPortfolio|
	
	subPortfolio := Portfolio new.
	
	mainPortfolio := (Portfolio initializeWith: subPortfolio).

	
	self assert: 0 equals: mainPortfolio balance.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:34:33'!
test12PortfolioWithOneEmptyAccountInsideAnotherPorfolioHasCeroBalance
		
	|mainPortfolio subPortfolio account|
	
	account := ReceptiveAccount new.
	
	subPortfolio := Portfolio initializeWith: account.
	
	mainPortfolio := Portfolio initializeWith: subPortfolio.

	
	self assert: 0 equals: mainPortfolio balance.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:34:24'!
test13PortfolioWithOneNotEmptyAccountInsideAnotherPorfolioHasItsOnlyAccountBalance
		
	|mainPortfolio subPortfolio account|
	
	account := ReceptiveAccount new.
	
	Deposit register: 100* peso on: account.
	
	subPortfolio := Portfolio initializeWith: account.
	
	mainPortfolio := Portfolio initializeWith: subPortfolio.

	
	self assert: 100* peso equals: mainPortfolio balance.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:34:19'!
test14PortfolioWithTwoAccountsInsideAnotherPorfolioHasTotalBalanceOfTheSumOfitsAccounts
		
	|mainPortfolio subPortfolio account1 account2|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100* peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 200* peso on: account2.
	
	subPortfolio := (Portfolio initializeWith: account1) add: account2.
	
	mainPortfolio := Portfolio initializeWith: subPortfolio.

	
	self assert: 300* peso equals: mainPortfolio balance.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:34:15'!
test15PortfolioWithTwoSubportfoliosEachOneWithAnAccountHasTotalBalanceOfTheSumOfItsAccountsBalance
	
	|mainPortfolio subPortfolio1 account1 subPortfolio2 account2|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100* peso on: account1.
	subPortfolio1 := (Portfolio initializeWith: account1).

	account2 := ReceptiveAccount new.
	Deposit register: 200* peso on: account2.	
	subPortfolio2 := (Portfolio initializeWith: account2).
	
	mainPortfolio := (Portfolio initializeWith: subPortfolio1) add: subPortfolio2.

	
	self assert: 300* peso equals: mainPortfolio balance.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:34:11'!
test16PortfolioWithOneNonEmptyAccountInsideAnotherPorfolioAnswersIfItsAccountHasRegisteredATransaction
	
	|mainPortfolio subPortfolio account transaction|
	
	account := ReceptiveAccount new.
	
	transaction := Deposit register: 100* peso on: account.
	
	subPortfolio := Portfolio initializeWith: account.
	
	mainPortfolio := Portfolio initializeWith: subPortfolio.

	
	self assert: (mainPortfolio hasRegistered: transaction).! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:34:03'!
test17PortfolioWithTwoAccountsInsideAnotherPortfolioAnwsersIfContainsAspecificTransaction
	
	|mainPortfolio subPortfolio account1 transaction1 account2 transaction2|
	
	account1 := ReceptiveAccount new.
	transaction1 := Deposit register: 100* peso on: account1.
	
	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 200* peso on: account2.
	
	subPortfolio := (Portfolio initializeWith: account1) add: account2.
	
	mainPortfolio := Portfolio initializeWith: subPortfolio.

	
	self assert: (mainPortfolio hasRegistered: transaction1). 
	self assert: (mainPortfolio hasRegistered: transaction2).! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:33:56'!
test18PortfolioWithTwoSubportfoliosEachOneWithAnAccountAnswersIfItContainsATransaction
	
	|mainPortfolio subPortfolio1 account1 transaction1 subPortfolio2 transaction2 account2|
	
	account1 := ReceptiveAccount new.
	transaction1 := Deposit register: 100* peso on: account1.
	subPortfolio1 := (Portfolio initializeWith: account1).

	account2 := ReceptiveAccount new.
	transaction2 := Deposit register: 200* peso on: account2.	
	subPortfolio2 := (Portfolio initializeWith: account2).
	
	mainPortfolio := (Portfolio initializeWith: subPortfolio1) add: subPortfolio2.
	
	self assert: (mainPortfolio hasRegistered: transaction1).
	self assert: (mainPortfolio hasRegistered: transaction2).! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:33:49'!
test19PortfolioWithOneEmptyPortfolioKnowsCeroTransactions
	
	|mainPortfolio subPortfolio account|
	
	account := ReceptiveAccount new.
	subPortfolio := (Portfolio initializeWith: account).

	mainPortfolio := (Portfolio initializeWith: subPortfolio).
	
	self assert: 0 equals: (mainPortfolio getTransactionsFromAccount: account) size.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:33:44'!
test20PortfolioWithNonEmptyPortfolioWithOneAccountKnowsItsAccountTransactions
	
	|mainPortfolio subPortfolio account|
	
	account := ReceptiveAccount new.
	Deposit register: 100* peso  on: account.
	subPortfolio := (Portfolio initializeWith: account).

	mainPortfolio := (Portfolio initializeWith: subPortfolio).
	
	self assert: 1 equals: (mainPortfolio getTransactionsFromAccount: account) size.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:33:37'!
test21PortfolioWithTwoSubportofoliosTheFirstOfWhichHasOneAccountInsideKnowsItsAccountTransactions
	
	
	|mainPortfolio subPortfolio1 account1 subPortfolio2 account2 |
	
	account1 := ReceptiveAccount new.
	subPortfolio1 := (Portfolio initializeWith: account1).
	Deposit register: 100* peso  on: account1.
	
	account2 := ReceptiveAccount new.
	subPortfolio2 := (Portfolio initializeWith: account2).

	mainPortfolio := (Portfolio initializeWith: subPortfolio1) add: subPortfolio2 .
	
	self assert: 1 equals: (mainPortfolio getTransactionsFromAccount: account1) size.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:33:28'!
test22PortfolioWithTwoSubportofoliosTheSecondOfWhichHasOneAccountInsideKnowsItsAccountTransactions
	
	|mainPortfolio subPortfolio1 account1 subPortfolio2 account2 |
	
	account1 := ReceptiveAccount new.
	subPortfolio1 := (Portfolio initializeWith: account1).
	
	account2 := ReceptiveAccount new.
	subPortfolio2 := (Portfolio initializeWith: account2).
	Deposit register: 100* peso  on: account2.

	mainPortfolio := (Portfolio initializeWith: subPortfolio1) add: subPortfolio2 .
	
	self assert: 1 equals: (mainPortfolio getTransactionsFromAccount: account2) size.! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:33:17'!
test23PortfolioWithTwoSubportfoliosEachOneWithAnAccountKnowsItsAccountsTransactions
	
	|mainPortfolio subPortfolio1 account1 
	subPortfolio2 account2
	subPortfolio3 account3|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100* peso on: account1.
	subPortfolio1 := (Portfolio initializeWith: account1).

	account2 := ReceptiveAccount new.
	Deposit register: 100* peso on: account2.	
	Deposit register: 100* peso on: account2.	
	subPortfolio2 := (Portfolio initializeWith: account2).
	
	account3 := ReceptiveAccount new.
	Deposit register: 100* peso on: account3.	
	Deposit register: 100* peso on: account3.	
	Deposit register: 100* peso on: account3.	
	subPortfolio3 := (Portfolio initializeWith: account3).
	
	mainPortfolio := ((Portfolio initializeWith: subPortfolio1) add: subPortfolio2) add: subPortfolio3.
	
	self assert: 1 equals: (mainPortfolio getTransactionsFromAccount: account1) size.
	self assert: 2 equals: (mainPortfolio getTransactionsFromAccount: account2) size.
	self assert: 3 equals: (mainPortfolio getTransactionsFromAccount: account3) size.
	! !

!PortolioTest methodsFor: 'PortofolioWithPorfoliosTests' stamp: 'GD 6/8/2022 18:32:29'!
test24PortfolioWithTwoSubportfoliosEachOneWithAnAccountDoesNotKnowAThirdAccountTransactions

	|mainPortfolio subPortfolio1 account1 
	subPortfolio2 account2
	account3|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100* peso on: account1.
	subPortfolio1 := (Portfolio initializeWith: account1).

	account2 := ReceptiveAccount new.
	Deposit register: 100* peso on: account2.	
	Deposit register: 100* peso on: account2.	
	subPortfolio2 := (Portfolio initializeWith: account2).
	
	account3 := ReceptiveAccount new.
	Deposit register: 100* peso on: account3.	
	Deposit register: 100* peso on: account3.	
	Deposit register: 100* peso on: account3.	
	
	mainPortfolio := ((Portfolio initializeWith: subPortfolio1) add: subPortfolio2).
	
	self assert: 0 equals: (mainPortfolio getTransactionsFromAccount: account3) size.
	! !


!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 17:25:36'!
test00ANewPortfolioIsCreatedWithCeroBalance
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 17:27:22'!
test01APortfolioWithAnAccountIsCreatedWithCeroBalance
	
	|account portfolio|
	
	account := ReceptiveAccount new.
	portfolio := Portfolio initializeWith: account.
	
	self assert: 0 equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 17:30:32'!
test02PortfolioWithOneAccountHasHasSameBalanceAsAccountContained
	
	|account portfolio|
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio initializeWith: account.
	
	self assert: 100 * peso equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 17:33:23'!
test03PortfolioWithManyAccountsHasBalanceOfAllAccountsTotalBalance
	
	|account1 account2 portfolio|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 200 * peso on: account2.
	
	portfolio := (Portfolio initializeWith: account1) add: account2.
	
	self assert: 300 * peso equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 17:59:45'!
test04PortfolioWithOneAccountCanAnswerIfItsAccountHasRegisteredATransaction
	
	|account transaction portfolio|
	
	account := ReceptiveAccount new.
	transaction := Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio initializeWith: account.
	
	self assert: (portfolio hasRegistered: transaction). 
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 18:00:39'!
test05PortfolioWithManyAccountsCanAnswerIfItsAccountsContainATransaction
	
	|account1 account2 transaction portfolio|
	
	account1 := ReceptiveAccount new.
	transaction := Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 300 * peso on: account2.
	
	portfolio := (Portfolio initializeWith: account1) add: account2 .
	
	self assert: (portfolio hasRegistered: transaction). 
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 18:00:53'!
test06EmptyPortfolioKnowsCeroTransactions
	
	|account portfolio|
	
	account := ReceptiveAccount new.
	
	portfolio := Portfolio new. 
	
	self assert: 0 equals: (portfolio getTransactionsFromAccount: account) size. 
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 17:55:53'!
test07PortfolioWithOneAccountKnowsOneTransaction
	
	|account portfolio|
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio := (Portfolio initializeWith: account). 
	
	self assert: 1 equals: (portfolio getTransactionsFromAccount: account) size. 
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 18:02:05'!
test08PortfolioWhichDoesNotInlcudeAnAccountDoesNotKnowItsRegisteredTransactions
	
	|account1 account2  portfolio|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 300 * peso on: account2.
	
	portfolio := Portfolio initializeWith: account1.
	
	self assert: 0 equals: (portfolio getTransactionsFromAccount: account2) size. 
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 18:02:47'!
test09PortfolioWithManyAccountsKnowsItsAccountsTransctions
	
	|account1 account2  portfolio|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 300 * peso on: account2.
	Deposit register: 301 * peso on: account2.
			
	portfolio := (Portfolio initializeWith: account1) add: account2.
	
	self assert: 1 equals: (portfolio getTransactionsFromAccount: account1) size. 
	self assert: 2 equals: (portfolio getTransactionsFromAccount: account2) size. 
	
	
	! !

!PortolioTest methodsFor: 'PortofoliosWithAccountsTests' stamp: 'GD 6/8/2022 17:53:27'!
test10PortfolioWithTwoAccountsDoesNotKnowAThirdAccountTransactions
	
	|account1 account2  portfolio account3|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 300 * peso on: account2.
	Deposit register: 301 * peso on: account2.
			
	account3 := ReceptiveAccount new.
	
	portfolio := (Portfolio initializeWith: account1) add: account2.
	
	self assert: 0 equals: (portfolio getTransactionsFromAccount: account3) size. 

	
	! !


!PortolioTest methodsFor: 'Extra tests' stamp: 'SG 6/9/2022 03:27:43'!
test25PortfolioWithAnAccountCantAddThatAccountAgain
	| portfolio account |
	
	account := ReceptiveAccount new.
	
	portfolio := Portfolio initializeWith: account.
	
	self
		should: [ portfolio add: account ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: Portfolio AccountAlreadyInPortfolioError equals: anError messageText]! !

!PortolioTest methodsFor: 'Extra tests' stamp: 'SG 6/9/2022 03:32:10'!
test26PortfolioCantAddAccountIfItsPresentInASubPortfolio
	| mainPortfolio subPortfolio account |
	
	account := ReceptiveAccount new.
	
	subPortfolio := Portfolio initializeWith: account.
	mainPortfolio := Portfolio initializeWith: subPortfolio.
	
	self
		should: [ mainPortfolio add: account ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio AccountAlreadyInPortfolioError ]! !

!PortolioTest methodsFor: 'Extra tests' stamp: 'SG 6/9/2022 03:32:40'!
test27PortfolioCannotAddItself
	| portfolio |
	
	portfolio := Portfolio new.
	
	self
		should: [ portfolio add: portfolio ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio SamePortfolioError ]! !

!PortolioTest methodsFor: 'Extra tests' stamp: 'SG 6/9/2022 04:23:49'!
test28PortfolioWithAccoundCannotAddPortfolioWithSameAccount
	| mainPortfolio subPortfolio account |
	
	account := ReceptiveAccount new.
	
	subPortfolio := Portfolio new.
	mainPortfolio := (Portfolio initializeWith: subPortfolio) add: account.
	
	self
		should: [ subPortfolio add: account ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio AccountAlreadyInPortfolioError ]! !

!PortolioTest methodsFor: 'Extra tests' stamp: 'SG 6/9/2022 04:34:52'!
test29
	| mainPortfolio subPortfolio account |
	'
	account := ReceptiveAccount new.
	
	subPortfolio := Portfolio initializeWith: account.
	mainPortfolio := Portfolio initializeWith: account.
	
	self
		should: [ mainPortfolio add: subPortfolio ]
		raise: Error 
		withExceptionDo: [ :anError |
			self assert: anError messageText = Portfolio AccountAlreadyInPortfolioError ]'! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

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

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'GD 6/6/2022 16:07:38'!
test08TransferIncreasesBalanceOnReceiverAccountAndDecreasesBalanceOnSenderAccount
	
	|account1 account2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self assert: 100* peso equals: (Transfer register: 100 *peso from: account1 to: account2) value.	

	self assert: 100* peso equals: account2 balance.	
	self assert: -100* peso equals: account1 balance.	
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'GD 6/6/2022 16:21:22'!
test09TransferCanNotBeANegativeValue
	
	|account1 account2|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	self should: [Transfer register: -100 *peso from: account1 to: account2]
	raise: Error
	withExceptionDo: [:Anerror | self assert: Transfer NegativeTransferValueError equals: Anerror messageText]
	
	
	! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SG 6/9/2022 02:28:10'!
test10TransferKnowsItsValue
	
	|account1 account2 transfer|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	transfer := Transfer register: 100 *peso from: account1 to: account2.
	
	self assert: 100 * peso equals: transfer value.! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'SG 6/9/2022 02:43:16'!
test11EachTransactionMembersKnowsItsCounterpart
	
	|account1 account2 transferDeposit transferWithdraw|
	
	account1 := ReceptiveAccount new.
	account2 := ReceptiveAccount new.
	
	Transfer register: 100 *peso from: account1 to: account2.
	
	transferDeposit := account1 transactions first.
	transferWithdraw := account2 transactions first.
	
	self assert: transferDeposit equals: transferWithdraw counterpart.
	self assert: transferWithdraw equals: transferDeposit counterpart.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'GD 6/6/2022 15:29:36'!
transactionValueFor: anAccount

	^ value! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'GD 6/8/2022 19:34:14'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'GD 6/6/2022 15:29:49'!
transactionValueFor: anAccount

	^ value negated! !

!Withdraw methodsFor: 'value' stamp: 'SG 6/2/2022 21:25:28'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'SG 6/2/2022 21:15:46'!
for: aValue

	^ self new initializeFor: aValue! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accountList superiorPortfolio'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'private' stamp: 'SG 6/9/2022 04:15:02'!
hasSuperiorPortfolio
	Transcript show: (superiorPortfolio = self).
	^(superiorPortfolio = 0) ifTrue:[^false] ifFalse:[^true].! !

!Portfolio methodsFor: 'private' stamp: 'SG 6/9/2022 04:33:50'!
includesAccount: anAccount
	(anAccount = self) ifTrue: [^self error: self class SamePortfolioError].
	
	(self hasSuperiorPortfolio) ifTrue: [^superiorPortfolio includesAccount: anAccount].
	^ self includesAccountInPortfolio: anAccount.! !

!Portfolio methodsFor: 'private' stamp: 'SG 6/9/2022 04:22:07'!
includesAccountInPortfolio: anAccount
	accountList do: [ :account | (account includesAccountInPortfolio: anAccount ) ifTrue: [^true]].
	^false! !


!Portfolio methodsFor: 'initialization' stamp: 'SG 6/9/2022 04:14:55'!
initialize
	accountList := OrderedCollection new.
	superiorPortfolio := 0.! !

!Portfolio methodsFor: 'initialization' stamp: 'SG 6/9/2022 03:39:29'!
setSuperiorPortfolio: aPortfolio
	superiorPortfolio := aPortfolio ! !


!Portfolio methodsFor: 'main protocol' stamp: 'SG 6/9/2022 03:42:31'!
add: anAccount
	(self includesAccount: anAccount) ifTrue: [^self error: self class AccountAlreadyInPortfolioError].
	accountList add: anAccount.
	anAccount setSuperiorPortfolio: self. ! !

!Portfolio methodsFor: 'main protocol' stamp: 'GD 6/8/2022 15:08:49'!
balance
	^accountList sum: [ :account | account balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'main protocol' stamp: 'GD 6/8/2022 16:50:19'!
getTransactionsFromAccount: aReceptiveAccount 
	
	|resultado|
	
	accountList do: [:anAccount |
		anAccount = aReceptiveAccount ifTrue: [
			^anAccount transactions
			].
		anAccount class = Portfolio ifTrue: [
			resultado := anAccount getTransactionsFromAccount: aReceptiveAccount.
			resultado size = 0 ifFalse:[	
				^resultado

				]
			]
		 ].
	^ OrderedCollection new.
	! !

!Portfolio methodsFor: 'main protocol' stamp: 'SG 6/8/2022 20:27:06'!
hasRegistered: transaction

	|answer|
	answer := false.
	accountList do: [ :anAccount | 
		answer := ((anAccount hasRegistered: transaction) or: answer)].
	^answer
	
	
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'initialization' stamp: 'GD 6/8/2022 13:50:45'!
initializeWith: anAccount
	| portfolio |
	portfolio := self new add: anAccount.
	
	^portfolio! !


!Portfolio class methodsFor: 'error' stamp: 'SG 6/9/2022 03:00:09'!
AccountAlreadyInPortfolioError
	^'Account already present in the selected portfolio'! !

!Portfolio class methodsFor: 'error' stamp: 'SG 6/9/2022 03:01:03'!
SamePortfolioError
	^'Cant add portfolio to itself'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GD 6/8/2022 18:36:57'!
balance

	^transactions sum: [ :aTransaction | aTransaction transactionValueFor: self] ifEmpty: [ 0 ].! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
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


!ReceptiveAccount methodsFor: 'private' stamp: 'SG 6/9/2022 04:22:27'!
includesAccountInPortfolio: anAccount
	^self = anAccount ! !

!ReceptiveAccount methodsFor: 'private' stamp: 'SG 6/9/2022 03:44:33'!
setSuperiorPortfolio: aPortfolio
	^self! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value withdrawAccount depositAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:54:44'!
initializeFor: aValue from: aSenderAccount to: aReceiverAccount 
	value := aValue.
	withdrawAccount := TransferWithdraw register: self on: aSenderAccount.
	depositAccount := TransferDeposit register: self on: aReceiverAccount.! !


!Transfer methodsFor: 'getters' stamp: 'GD 6/8/2022 19:25:24'!
getDepositAccount
	^depositAccount	! !

!Transfer methodsFor: 'getters' stamp: 'GD 6/8/2022 19:25:31'!
getWithdrawAccount
	^withdrawAccount
	! !

!Transfer methodsFor: 'getters' stamp: 'GD 6/6/2022 15:46:50'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'instance creation' stamp: 'SG 6/8/2022 20:25:16'!
register: aValue from: aSenderAccount to: aReceiverAccount
	|transfer|
	aValue < 0 ifTrue: [self error: self NegativeTransferValueError ].
	
	transfer := self new initializeFor: aValue from: aSenderAccount to: aReceiverAccount.
	^transfer
	! !


!Transfer class methodsFor: 'error' stamp: 'GD 6/6/2022 16:21:20'!
NegativeTransferValueError
	^'transfer value cannot be negative'! !


!classDefinition: #TransferMember category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #TransferMember
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferMember class' category: 'ServiciosFinancieros-Ejercicio'!
TransferMember class
	instanceVariableNames: ''!

!TransferMember class methodsFor: 'instance creation' stamp: 'GD 6/8/2022 19:52:31'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferMember subclass: #TransferDeposit
	instanceVariableNames: 'depositAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'main protocol' stamp: 'GD 6/8/2022 19:25:14'!
counterpart
	^transfer getWithdrawAccount.! !

!TransferDeposit methodsFor: 'main protocol' stamp: 'GD 6/8/2022 19:43:42'!
transactionValueFor: anAccount
	^ transfer value.! !


!TransferDeposit methodsFor: 'initialization' stamp: 'GD 6/8/2022 20:03:18'!
initializeFor: aTransfer
	transfer := aTransfer.! !

!TransferDeposit methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:10:47'!
initializeWith: aTransfer to: aDepositAccount
	transfer := aTransfer.
	depositAccount := aDepositAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:34:52'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferDeposit class methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:16:54'!
initializeWith: aTransfer to: aDepositAccount
	|senderAccount|
	senderAccount := self new initializeWith: aTransfer to: aDepositAccount.
	^senderAccount! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferMember subclass: #TransferWithdraw
	instanceVariableNames: 'withdrawAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'main protocol' stamp: 'GD 6/8/2022 19:24:52'!
counterpart
	^transfer getDepositAccount.! !

!TransferWithdraw methodsFor: 'main protocol' stamp: 'GD 6/8/2022 19:43:54'!
transactionValueFor: anAccount
	^ transfer value negated.! !


!TransferWithdraw methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:37:11'!
initializeFor: aValue
	transfer := aValue ! !

!TransferWithdraw methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:14:59'!
initializeWith: aTransfer to: aWithdrawAccount
	transfer := aTransfer.
	withdrawAccount := aWithdrawAccount.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:40:02'!
for: aValue

	^ self new initializeFor: aValue ! !

!TransferWithdraw class methodsFor: 'initialization' stamp: 'GD 6/8/2022 19:15:59'!
initializeWith: aTransfer to: aWithdrawAccount
	^ self new initializeWith: aTransfer to: aWithdrawAccount.! !
