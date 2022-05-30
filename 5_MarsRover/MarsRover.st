!classDefinition: #MarsRoverTest category: 'MarsRover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTest methodsFor: 'tests' stamp: 'SG 5/29/2022 17:46:58'!
test01
	| marsRover |
	marsRover := MarsRover new.
	
	self assert: marsRover position = (0@0)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'SG 5/29/2022 17:51:59'!
test02
	| marsRover |
	marsRover := MarsRover new.
	marsRover receiveCommand: 'f'.
	
	self assert: marsRover position = (1@0)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'SG 5/29/2022 17:59:24'!
test03
	| marsRover |
	marsRover := MarsRover new.
	marsRover receiveCommand: 'b'.
	
	self assert: marsRover position = (-1@0)! !

!MarsRoverTest methodsFor: 'tests' stamp: 'SG 5/29/2022 18:10:04'!
test04
	| marsRover |
	marsRover := MarsRover new.
	marsRover receiveCommand: 'fff'.
	
	self assert: marsRover position = (3@0)! !


!classDefinition: #Command category: 'MarsRover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Command methodsFor: 'as yet unclassified' stamp: 'GD 5/29/2022 18:45:45'!
initialize! !

!Command methodsFor: 'as yet unclassified' stamp: 'GD 5/29/2022 19:00:41'!
name
	^'f' asciiValue. 
	! !


!classDefinition: #Direction category: 'MarsRover'!
Object subclass: #Direction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!Direction methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:45:58'!
moveBackward: aMarsRover
	self subclassResponsibility ! !

!Direction methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:45:53'!
moveForward: aMarsRover
	self subclassResponsibility ! !


!classDefinition: #East category: 'MarsRover'!
Direction subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #North category: 'MarsRover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:40:55'!
moveBackward: aMarsRover
	aMarsRover moveX: -1
	! !

!North methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:38:37'!
moveForward: aMarsRover
	aMarsRover moveX: 1
	! !


!classDefinition: #South category: 'MarsRover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:41:59'!
moveBackward: aMarsRover
	aMarsRover moveX: 1
	! !

!South methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:42:09'!
moveForward: aMarsRover
	aMarsRover moveX: 1
	! !


!classDefinition: #West category: 'MarsRover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'positionX positionY direction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SG 5/29/2022 18:02:06'!
moveBackward
	positionX := positionX -1! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:38:17'!
moveX: aNumber
	positionX := positionX + aNumber! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:38:24'!
moveY: aNumber
	positionY := positionY + aNumber! !


!MarsRover methodsFor: 'Movement' stamp: 'GD 5/29/2022 18:00:32'!
moveForward
	positionX := positionX +1.
		! !

!MarsRover methodsFor: 'Movement' stamp: 'GD 5/29/2022 17:44:34'!
position
	^positionX@positionY! !

!MarsRover methodsFor: 'Movement' stamp: 'SG 5/30/2022 13:39:24'!
receiveCommand: aCommand
	
	"
	aCommand = 'f' ifTrue: [self moveForward].
	aCommand = 'b' ifTrue: [self moveBackwards].
	"
	"
	aCommand do: [:ALetter |
		Transcript show: ALetter. 
		ALetter = 'f' ifTrue: [self moveForward].
		ALetter = 'b' ifTrue: [self moveBackwards].
		].
	"
	"|comando|
	comando := Command new.
	 "
	aCommand do: [:ALetter |
		Transcript show: ALetter. 
		ALetter asString = 'f' ifTrue: [direction moveForward: self].
		ALetter asString = 'b' ifTrue: [self moveBackward].
		].
	! !


!MarsRover methodsFor: 'Initialization' stamp: 'SG 5/30/2022 13:35:00'!
initialize
	positionX := 0.
	positionY := 0.
	direction := North new.! !
