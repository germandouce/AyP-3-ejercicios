!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'SG 4/30/2022 13:40:22'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook cronometro|
	
	customerBook := CustomerBook new.
	cronometro := Cronometro new.
	
	cronometro iniciar.
	customerBook addCustomerNamed: 'John Lennon'.
	cronometro terminar.
	
	self assert: (cronometro tiempoPasado) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SG 4/30/2022 14:35:12'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook cronometro |
	
	cronometro := Cronometro new.
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: 'Paul McCartney'.
	  
	cronometro iniciar.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	cronometro terminar.
	
	self assert: (cronometro tiempoPasado ) < (100 * millisecond)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SG 4/30/2022 14:18:18'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SG 4/30/2022 14:35:15'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook |
			
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'John Lennon'.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail	]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:25'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 1 equals: customerBook numberOfSuspendedCustomers.
	self assert: 1 equals: customerBook numberOfCustomers.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SG 4/30/2022 14:35:20'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assert: 0 equals: customerBook numberOfActiveCustomers.
	self assert: 0 equals: customerBook numberOfSuspendedCustomers.
	self assert: 0 equals: customerBook numberOfCustomers.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'SG 4/30/2022 14:29:49'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 9/19/2018 17:57:11'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
! !


!classDefinition: #Cronometro category: 'CodigoRepetido-Ejercicio'!
Object subclass: #Cronometro
	instanceVariableNames: 'tiempoInicial tiempoFinal'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!Cronometro methodsFor: 'funcionalidad' stamp: 'SG 4/29/2022 13:08:11'!
iniciar
	tiempoInicial := Time millisecondClockValue * millisecond! !

!Cronometro methodsFor: 'funcionalidad' stamp: 'SG 4/29/2022 13:08:41'!
terminar
	tiempoFinal := Time millisecondClockValue * millisecond! !

!Cronometro methodsFor: 'funcionalidad' stamp: 'SG 4/29/2022 13:09:19'!
tiempoPasado
	^tiempoFinal - tiempoInicial! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cronometro class' category: 'CodigoRepetido-Ejercicio'!
Cronometro class
	instanceVariableNames: 'tiempoInicial tiempoFinal'!


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'SG 4/30/2022 13:01:28'!
addCustomerNamed: aName

	aName isEmpty 
	ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	
	(self includesCustomerNamed: aName) 
	ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'SG 4/30/2022 13:47:34'!
numberOfCustomers
	
	^self numberOfActiveCustomers + self numberOfSuspendedCustomers ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'SG 4/30/2022 14:34:48'!
removeCustomerNamed: aName 
	
	(self tryRemoveFrom: active customerNamed: aName) = '' 
	ifFalse: [^aName].
	
	(self tryRemoveFrom: suspended customerNamed: aName) = '' 
	ifFalse: [^aName].
	
	^ NotFound signal.! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !

!CustomerBook methodsFor: 'customer management' stamp: 'SG 4/29/2022 17:01:57'!
tryRemoveFrom: aCollection customerNamed: aName
 
	1 to: aCollection size do: 
	[ :index |
		aName = (aCollection at: index)
			ifTrue: [
				aCollection removeAt: index.
				^ aName 
			] 
	].
	
	^''.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
