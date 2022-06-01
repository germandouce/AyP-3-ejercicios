!classDefinition: #MarsRoverTests category: 'MarsRover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRoverTests methodsFor: 'MovementTests' stamp: 'GD 5/30/2022 14:39:40'!
test01WhenMarsRoverIsCreatedPositionIs00
	| marsRover |
	marsRover _ MarsRover new.
	self assert: ( marsRover position = (0@0) )! !

!MarsRoverTests methodsFor: 'MovementTests' stamp: 'GD 5/30/2022 14:38:23'!
test02WhenForwardCommandIsSentMarsRoverMovesForward1Unit
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'f'.
	self assert: ( marsRover position = (0@1) )! !

!MarsRoverTests methodsFor: 'MovementTests' stamp: 'GD 5/30/2022 14:38:40'!
test03WhenBackwardsCommandIsSentMarsRoverMovesBackwards1Unit
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'b'.
	self assert: ( marsRover position = (0@-1) )! !

!MarsRoverTests methodsFor: 'MovementTests' stamp: 'GD 6/1/2022 13:58:47'!
test04WhenMoreThan1CommandIsSentMarsRoverMovesManyUnits
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'fff' .
	self assert: ( marsRover position = (0@3) )! !

!MarsRoverTests methodsFor: 'MovementTests' stamp: 'GD 6/1/2022 13:57:38'!
test05WhenTwoDifferentCommandsAreSentMarsRoverMovesCorrectly
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'fbbf' .
	self assert: ( marsRover position = (0@0) )! !


!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 5/30/2022 14:17:26'!
test06WhenCommandLeftIsSentAndActualDirectionIsNorthDirectionTurnsWest
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'l' .
	self assert: ( marsRover direction class = West)! !

!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 6/1/2022 14:15:07'!
test07WhenCommandLeftIsSentTwoTimesAndActualDirectionIsNorthDirectionTurnsSouth
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'll' .
	self assert: ( marsRover direction class = South)! !

!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 6/1/2022 14:14:25'!
test08WhenCommandLeftIsSentThreeTimesAndActualDirectionIsNorthDirectionTurnsEast
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'lll'.
	self assert: ( marsRover direction class = East)! !

!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 6/1/2022 14:17:14'!
test09WhenCommandLeftIsSentFourTimesAndActualDirectionIsNorthDirectionIsNorth
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'IIII'.
	self assert: ( marsRover direction class = North)! !

!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 6/1/2022 14:17:54'!
test10WhenCommandRightIsSentAndActualDirectionIsNorthDirectionTurnsEast
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'r' .
	self assert: ( marsRover direction class = East)! !

!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 6/1/2022 14:19:22'!
test11WhenCommandRightIsSentTwoTimesAndActualDirectionIsNorthDirectionTurnsSouth	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'rr' .
	self assert: ( marsRover direction class = South)! !

!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 6/1/2022 14:20:27'!
test12WhenCommandRightIsSentThreeTimesAndActualDirectionIsNorthDirectionTurnsWest	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'rrr' .
	self assert: ( marsRover direction class = West)! !

!MarsRoverTests methodsFor: 'RotateTests' stamp: 'GD 6/1/2022 14:26:35'!
test13WhenCommandRightIsSentFourTimesAndActualDirectionIsNorthDirectionIsNorth
	| marsRover |
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'rrrr' .
	self assert: ( marsRover direction class = North)! !


!MarsRoverTests methodsFor: 'UnknownCommandsTests' stamp: 'GD 6/1/2022 15:02:56'!
test20WhenUnknownSingleAlphanumericCommandIsSentMarsRoverDoesNotMove
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 's' .
	self assert: (marsRover position = (0@0) ).! !

!MarsRoverTests methodsFor: 'UnknownCommandsTests' stamp: 'GD 6/1/2022 14:51:49'!
test21WhenEmptyCommandIsSentMarsRoverDoesNotMove
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: '' .
	self assert: (marsRover position = (0@0) ).! !

!MarsRoverTests methodsFor: 'UnknownCommandsTests' stamp: 'GD 6/1/2022 15:01:59'!
test22WhenUnknownCommandInMiddleSequenceIsSentMarsRoverStopsMoving
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'f flflfflffrfflflfffffbblbr' .
	self assert: (marsRover position = (0@1) ).! !

!MarsRoverTests methodsFor: 'UnknownCommandsTests' stamp: 'GD 6/1/2022 15:04:10'!
test23WhenUnknownCommandAtStartOfSequenceIsSentMarsRoverDoesNotMove
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: '1fflflfflffrfflflfffffbblbr' .
	self assert: (marsRover position = (0@0) ).! !


!MarsRoverTests methodsFor: 'MovementAndRotateTests' stamp: 'GD 6/1/2022 14:29:37'!
test14WhenCommandsSequenceRFIsSentMarsRoverPositionIs10
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'rf' .
	self assert: (marsRover position = (1@0) ).! !

!MarsRoverTests methodsFor: 'MovementAndRotateTests' stamp: 'GD 6/1/2022 14:31:30'!
test15WhenCommandsSequenceLFIsSentMarsRoverPositionIsMinus10
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'lf' .
	self assert: (marsRover position = (-1@0) ).! !

!MarsRoverTests methodsFor: 'MovementAndRotateTests' stamp: 'GD 6/1/2022 14:36:58'!
test16WhenCommandsSequenceRBIsSentMarsRoverPositionIsMinus10
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'rb' .
	self assert: (marsRover position = (-1@0) ).! !

!MarsRoverTests methodsFor: 'MovementAndRotateTests' stamp: 'GD 6/1/2022 14:37:43'!
test17WhenCommandsSequenceLBIsSentMarsRoverPositionIs10
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'lb' .
	self assert: (marsRover position = ( 1@0) ).! !

!MarsRoverTests methodsFor: 'MovementAndRotateTests' stamp: 'GD 6/1/2022 14:40:42'!
test18WhenCommandsSequenceLLBIsSentMarsRoverPositionIs01
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'llb' .
	self assert: (marsRover position = ( 0@1) ).! !

!MarsRoverTests methodsFor: 'MovementAndRotateTests' stamp: 'GD 6/1/2022 14:55:00'!
test19WhenCharacterSequenceCombiningAllFourCommandsIsSentMarsRoverMovesCorrectly
	| marsRover |
	
	marsRover _ MarsRover new.
	marsRover receiveCommand: 'frflflfflffrfflflfffffbblbr' .
	self assert: (marsRover position = (0@-2) ).! !


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

!East methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:36:37'!
moveBackward: aMarsRover
	aMarsRover moveX: -1
	! !

!East methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:36:51'!
moveForward: aMarsRover
	aMarsRover moveX: 1
	! !

!East methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:19:16'!
rotateLeft: aMarsRover
	aMarsRover changeDirectionTo: North new.
	! !

!East methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:19:27'!
rotateRight: aMarsRover
	aMarsRover changeDirectionTo: South new.
	! !


!classDefinition: #North category: 'MarsRover'!
Direction subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!North methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:37:07'!
moveBackward: aMarsRover
	aMarsRover moveY: -1
	! !

!North methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:37:15'!
moveForward: aMarsRover
	aMarsRover moveY: 1
	! !

!North methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:17:51'!
rotateLeft: aMarsRover
	aMarsRover changeDirectionTo: West new.
	! !

!North methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:10:00'!
rotateRight: aMarsRover
	aMarsRover changeDirectionTo: East new.
	! !


!classDefinition: #South category: 'MarsRover'!
Direction subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!South methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:37:23'!
moveBackward: aMarsRover
	aMarsRover moveY: 1
	! !

!South methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:37:29'!
moveForward: aMarsRover
	aMarsRover moveY: -1
	! !

!South methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:19:47'!
rotateLeft: aMarsRover
	aMarsRover changeDirectionTo: East new.
	! !

!South methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:19:59'!
rotateRight: aMarsRover
	aMarsRover changeDirectionTo: West new.
	! !


!classDefinition: #West category: 'MarsRover'!
Direction subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!West methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:37:39'!
moveBackward: aMarsRover
	aMarsRover moveX: 1
	! !

!West methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:37:45'!
moveForward: aMarsRover
	aMarsRover moveX: -1
	! !

!West methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:20:18'!
rotateLeft: aMarsRover
	aMarsRover changeDirectionTo: South new.! !

!West methodsFor: 'as yet unclassified' stamp: 'GD 5/30/2022 14:20:28'!
rotateRight: aMarsRover
	aMarsRover changeDirectionTo: North new.! !


!classDefinition: #MarsRover category: 'MarsRover'!
Object subclass: #MarsRover
	instanceVariableNames: 'positionX positionY direction commands'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'MarsRover'!

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 16:25:27'!
createCommandDictionary
	|dict|
	dict := Dictionary new.
	dict at: 'f' put: (direction moveForward: self).
	dict at: 'b' put: (direction moveBackward: self).
	dict at: 'r' put: (direction rotateRight: self).
	dict at: 'l' put: (direction rotateLeft: self).
	
	^dict! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:38:17'!
moveX: aNumber
	positionX := positionX + aNumber! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'SG 5/30/2022 13:38:24'!
moveY: aNumber
	positionY := positionY + aNumber! !


!MarsRover methodsFor: 'Movement' stamp: 'GD 5/30/2022 14:10:45'!
changeDirectionTo: aDirection
	direction := aDirection.! !

!MarsRover methodsFor: 'Movement' stamp: 'GD 5/30/2022 14:07:35'!
direction
	^direction.! !

!MarsRover methodsFor: 'Movement' stamp: 'GD 5/29/2022 17:44:34'!
position
	^positionX@positionY! !

!MarsRover methodsFor: 'Movement' stamp: 'GD 6/1/2022 13:47:52'!
receiveCommand: aCommand
	
	aCommand do: [:ALetter |
		('fbrl' includesSubString: ALetter asString) ifFalse:[^0].
		ALetter asString = 'f' ifTrue: [direction moveForward: self].
		ALetter asString = 'b' ifTrue: [direction moveBackward: self]	.
		ALetter asString = 'r' ifTrue: [direction rotateRight: self]		.
		ALetter asString = 'l' ifTrue: [direction rotateLeft: self]
		]
	
	"aCommand do:[:aLetter |
		commands methodDictionary at: aLetter
		]"! !


!MarsRover methodsFor: 'Initialization' stamp: 'SG 5/30/2022 15:46:02'!
initialize
	positionX := 0.
	positionY := 0.
	direction := North new.
	commands := self createCommandDictionary.! !
