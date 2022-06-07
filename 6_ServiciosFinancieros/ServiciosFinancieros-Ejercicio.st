!classDefinition: #PortolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortolioTest methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:53:52'!
test00SeCreaUnPortfollioSinSaldo
	
	| portfolio |
	
	portfolio := Portfolio new.
	
	self assert: 0 equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:52:26'!
test01SeCreaUnPortfollioSinSaldo
	
	|account portfolio|
	
	account := ReceptiveAccount new.
	portfolio := Portfolio initializeWith: account.
	
	self assert: 0 equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:56:30'!
test02PortfolioConCuentaConSaldoDevuelveElSaldoDeLaCuenta
	
	|account portfolio|
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio initializeWith: account.
	
	self assert: 100 * peso equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:52:34'!
test03PortfolioConVariasCuentasDevuelveElBalanceTotal
	
	|account1 account2 portfolio|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 200 * peso on: account2.
	
	portfolio := (Portfolio initializeWith: account1) with: account2.
	
	self assert: 300 * peso equals: portfolio balance
	
	
	! !

!PortolioTest methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 21:44:58'!
test04
	
	|account transaction portfolio|
	
	account := ReceptiveAccount new.
	transaction := Deposit register: 100 * peso on: account.
	
	portfolio := Portfolio initializeWith: account.
	
	self assert: (portfolio hasRegistered: transaction). 
	
	
	! !

!PortolioTest methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 21:48:32'!
test05
	
	|account1 account2 transaction portfolio|
	
	account1 := ReceptiveAccount new.
	transaction := Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 300 * peso on: account2.
	
	portfolio := (Portfolio initializeWith: account1) with: account2 .
	
	self assert: (portfolio hasRegistered: transaction). 
	
	
	! !

!PortolioTest methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 21:48:44'!
test06
	"TEST DE PRUEBA"
	|account1 account2 account3 transaction portfolio|
	
	account1 := ReceptiveAccount new.
	Deposit register: 100 * peso on: account1.
	
	account2 := ReceptiveAccount new.
	Deposit register: 300 * peso on: account2.
	
	portfolio := (Portfolio initializeWith: account1) with: account2 .
	
	account3 := ReceptiveAccount new.
	transaction := Deposit register: 300 * peso on: account3.
	
	self deny: (portfolio hasRegistered: transaction). 
	
	
	! !


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

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
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
	instanceVariableNames: 'accountList'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:42:58'!
balance
	
	^accountList sum: [ :account | account balance ] ifEmpty: [ 0 ]! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 21:33:30'!
hasRegistered: transaction

	"| booltest|
	accountList do: [ :anAccount | booltest := (anAccount hasRegistered: transaction)].
	^booltest"
	
	"| test|
	test := accountList detect: [ :anAccount | anAccount hasRegistered: transaction ].
	Transcript show: test.
	^test"
	
	| booltest|
	booltest := false.
	accountList do: [ :anAccount | 
		booltest := ((anAccount hasRegistered: transaction) or: booltest)].
	^booltest
	
	
	! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:32:24'!
initialize
	accountList := OrderedCollection new.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:28:42'!
with: anAccount
	accountList add: anAccount ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'SG 6/6/2022 20:28:12'!
initializeWith: anAccount
	| portfolio |
	portfolio := self new with: anAccount.
	
	^portfolio! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'GD 6/6/2022 15:29:17'!
balance

	^transactions sum: [ :aTransaction | aTransaction transactionValueFor: self] ifEmpty: [ 0 ]
	
	"^transactions inject: 0 into: [ :balance :aTransaction | aTransaction xxx: balance]"
	
	
	"^transactions sum: [ :aTransaction | 
		(aTransaction isKindOf: Deposit) 
		ifTrue: [aTransaction value]
		ifFalse: [aTransaction value negated]
		] ifEmpty: [ 0 ]"
	! !

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


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value senderAccount receiverAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'initialization' stamp: 'GD 6/6/2022 15:04:35'!
initializeFor: aValue from: aSenderAccount to: aReceiverAccount 
	value := aValue.
	senderAccount := aSenderAccount.
	receiverAccount := aReceiverAccount.! !


!Transfer methodsFor: 'as yet unclassified' stamp: 'GD 6/6/2022 15:25:50'!
transactionValueFor: anAccount
	anAccount = senderAccount ifTrue: [
		^value negated
	].
	anAccount = receiverAccount ifTrue: [
		^value
	]! !

!Transfer methodsFor: 'as yet unclassified' stamp: 'GD 6/6/2022 15:46:50'!
value
	^value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: ''!

!Transfer class methodsFor: 'as yet unclassified' stamp: 'GD 6/6/2022 16:21:20'!
NegativeTransferValueError
	^'transfer value cannot be negative'! !

!Transfer class methodsFor: 'as yet unclassified' stamp: 'GD 6/6/2022 16:24:30'!
register: aValue from: aSenderAccount to: aReceiverAccount
	|transfer|
	aValue < 0 ifTrue: [self error: self NegativeTransferValueError ].
	
	transfer := self new initializeFor: aValue from: aSenderAccount to: aReceiverAccount.
	aSenderAccount register: transfer.
	aReceiverAccount register: transfer.
	^transfer
	! !
