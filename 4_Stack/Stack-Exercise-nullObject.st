!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:20'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'contenido'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 14:38:33'!
AAA
	^ listaElementos removeLast.
		
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 14:38:57'!
BBB
	self error: self class stackEmptyErrorDescription.
		
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 15:08:41'!
initialize
	contenido := NullList new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 15:21:49'!
isEmpty
	^ contenido isEmpty.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 16:20:03'!
pop
	|poppedElement|
	poppedElement := contenido pop.
	contenido:=contenido chequeo.
	^poppedElement .
		
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 16:06:17'!
push: anObject
	contenido := contenido push: anObject .
	
	"contenido add: anObject.
	"! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 14:18:36'!
size
	^listaElementos size.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 14:36:20'!
top
	listaElementos isEmpty ifFalse:
		[^listaElementos at: listaElementos size.].
	listaElementos isEmpty ifTrue:
		[self error: self class stackEmptyErrorDescription].
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #StackContent category: 'Stack-Exercise'!
Object subclass: #StackContent
	instanceVariableNames: 'listaElementos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!


!classDefinition: #NullList category: 'Stack-Exercise'!
StackContent subclass: #NullList
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 15:30:53'!
isEmpty
	^true.! !

!NullList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 16:16:12'!
pop
	self error: self class stackEmptyErrorDescription.! !

!NullList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 15:36:30'!
push: anObject
	|lista|
	lista:= StackList new.
	lista push: anObject.
	^lista.! !


!classDefinition: #StackList category: 'Stack-Exercise'!
StackContent subclass: #StackList
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!StackList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 16:27:48'!
chequeo
	listaElementos isEmpty ifTrue:
		[^NullList new	]! !

!StackList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 16:03:06'!
initialize
	listaElementos := OrderedCollection new.! !

!StackList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 15:31:12'!
isEmpty
	^false.! !

!StackList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 16:26:32'!
pop
	^listaElementos removeLast.! !

!StackList methodsFor: 'as yet unclassified' stamp: 'GD 5/11/2022 15:55:07'!
push: anObject
	listaElementos add: anObject.! !
