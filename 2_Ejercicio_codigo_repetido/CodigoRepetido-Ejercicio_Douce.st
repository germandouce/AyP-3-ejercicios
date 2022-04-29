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

!CustomerBookTest methodsFor: 'testing' stamp: 'GD 4/29/2022 13:27:43'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook cronometro |
	
	cronometro:= Cronometro new.
	customerBook := CustomerBook new.
	
	cronometro iniciar. 
	customerBook addCustomerNamed: 'John Lennon'.
	cronometro terminar.
	
	self assert: (cronometro tiempoTranscurrido ) < (50 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GD 4/29/2022 15:01:23'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook cronometro |
	
	cronometro := Cronometro new.
	customerBook := CustomerBook new.
	
	customerBook addCustomerNamed: 'Paul McCartney'.
	  
	cronometro iniciar.
	customerBook removeCustomerNamed: 'Paul McCartney'.
	cronometro terminar.
	
	self assert: (cronometro tiempoTranscurrido ) < (100 * millisecond)
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'GD 4/29/2022 13:44:30'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	[ customerBook addCustomerNamed: ''.
	self fail ]
		on: Error 
		do: [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'HAW 8/28/2017 08:57:25'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
		on: NotFound 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
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

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/3/2019 10:50:28'!
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

!CustomerBookTest methodsFor: 'testing' stamp: 'NR 4/30/2020 09:08:46'!
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

!Cronometro methodsFor: 'as yet unclassified' stamp: 'GD 4/29/2022 13:22:05'!
iniciar
	tiempoInicial := Time millisecondClockValue * millisecond.
	! !

!Cronometro methodsFor: 'as yet unclassified' stamp: 'GD 4/29/2022 13:23:19'!
terminar
	tiempoFinal := Time millisecondClockValue * millisecond.
	! !

!Cronometro methodsFor: 'as yet unclassified' stamp: 'GD 4/29/2022 13:24:23'!
tiempoTranscurrido
	^tiempoFinal - tiempoInicial.! !


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


!CustomerBook methodsFor: 'customer management' stamp: 'GD 4/29/2022 13:16:07'!
addCustomerNamed: aName
	
	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfCustomers
	
	^active size + suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'GD 4/29/2022 15:29:13'!
removeCustomerNamed: aName
	|posicion|
	
	posicion := self returnPositionFromCollection: active ofClientNamed: aName	.	
	(posicion = 0) ifTrue:
	[
		[posicion := self returnPositionFromCollection: suspended ofClientNamed: aName	].
		(posicion = 0) ifTrue:
			[^ NotFound signal]
		ifFalse:
			[suspended removeAt: posicion].
			^aName.
			
	]
	ifFalse:
		[active removeAt: posicion].
		^aName.
	
	"
	1 to: active size do: 
		[ :index |
			aName = (active at: index)
				ifTrue: [
					active removeAt: index.
					^ aName 
				] 
		].
	1 to: suspended size do: 
		[ :index |
			aName = (suspended at: index)
				ifTrue: [
					suspended removeAt: index.
					^ aName 
				] 
		].
	
	(active, suspended) do:
		[:lista| 1 to: lista size do: 
			[ :index |
				aName = (lista at: index)
					ifTrue: [
						lista removeAt: index.
						^ aName 
					] 
			].
		].
	
	^NotFound signal.
	"! !

!CustomerBook methodsFor: 'customer management' stamp: 'GD 4/29/2022 14:13:07'!
removeCustomerNamedFromActive: aName
	1 to: active size do: 
			[ :index |
				aName = (active at: index)
					ifTrue: [
						active removeAt: index.
						^ aName 
					] 
			].! !

!CustomerBook methodsFor: 'customer management' stamp: 'GD 4/29/2022 14:07:40'!
removeCustomerNamedFromSuspended: aName
	1 to: suspended size do: 
		[ :index |
			aName = (suspended at: index)
				ifTrue: [
					suspended removeAt: index.
					^ aName 
				] 
		].! !

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


!CustomerBook methodsFor: 'yet-unclasified' stamp: 'GD 4/29/2022 15:26:27'!
returnPositionFromCollection: unaColeccion ofClientNamed: aName
	1 to: unaColeccion size do:
		[:index|
			aName = (unaColeccion at: index)
				ifTrue: [
					^index
				]
		].
	
	^ 0.
					
	
! !

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
