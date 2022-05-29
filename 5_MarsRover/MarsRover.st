!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'GD 5/29/2022 17:26:02'!
test01WhenMarsRoverIsCreatedItsPositionIs00
	| marsRover |
	marsRover _ MarsRover new.
	self assert: ( marsRover position = (0@0) )! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'GD 5/29/2022 18:04:33'!
test02WhenForwardCommandIsSentMarsRoverMovesForward1Unit
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'f'.
	self assert: ( marsRover position = (1@0) )! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'GD 5/29/2022 18:04:44'!
test03WhenBackwardsCommandIsSentMarsRoverMovesBackwards1Unit
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'b'.
	self assert: ( marsRover position = (-1@0) )! !

!MarsRoverTests methodsFor: 'as yet unclassified' stamp: 'GD 5/29/2022 18:29:49'!
test04WhenMoreMoreThan1CommandIsSentMarsRoverMovesManyUnits
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'fff' .
	self assert: ( marsRover position = (3@0) )! !


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


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'positionX positionY'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'Movement' stamp: 'GD 5/29/2022 18:04:53'!
moveBackwards
	positionX := positionX - 1.
		! !

!MarsRover methodsFor: 'Movement' stamp: 'GD 5/29/2022 18:00:32'!
moveForward
	positionX := positionX +1.
		! !

!MarsRover methodsFor: 'Movement' stamp: 'GD 5/29/2022 17:44:34'!
position
	^positionX@positionY! !

!MarsRover methodsFor: 'Movement' stamp: 'GD 5/29/2022 19:24:02'!
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
		ALetter asString = 'f' ifTrue: [self moveForward].
		ALetter asString = 'b' ifTrue: [self moveBackwards].
		].
	! !


!MarsRover methodsFor: 'Initialization' stamp: 'GD 5/29/2022 17:44:58'!
initialize
	positionX := 0.
	positionY := 0.! !
