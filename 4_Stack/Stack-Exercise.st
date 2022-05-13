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
	instanceVariableNames: 'tope'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'SG 5/13/2022 17:35:17'!
initialize
	tope := NullTop new.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SG 5/13/2022 17:35:04'!
isEmpty
	^tope isEmpty! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SG 5/13/2022 18:17:18'!
pop
	|removedTop|
	removedTop := tope.
	tope := removedTop previousTop.
	
	^removedTop data
		
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SG 5/13/2022 18:22:13'!
push: anObject
	|newTop|
	newTop := RealTop new.
	
	newTop data: anObject.
	newTop previousTop: tope.
	newTop numberTop: (tope numberTop) +1.
	
	tope := newTop.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SG 5/13/2022 18:18:47'!
size
	^tope numberTop.! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'SG 5/13/2022 18:18:15'!
top
	^tope data
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


!classDefinition: #Top category: 'Stack-Exercise'!
Object subclass: #Top
	instanceVariableNames: 'previousTop data numberTop'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Top methodsFor: 'as yet unclassified' stamp: 'SG 5/13/2022 18:07:13'!
initialize
	previousTop := nil.
	data := nil.
	numberTop := 0.
	^self! !


!classDefinition: #NullTop category: 'Stack-Exercise'!
Top subclass: #NullTop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!NullTop methodsFor: 'getters' stamp: 'SG 5/13/2022 18:20:07'!
data
	self error: OOStack stackEmptyErrorDescription! !

!NullTop methodsFor: 'getters' stamp: 'SG 5/11/2022 15:30:22'!
isEmpty
	^true! !

!NullTop methodsFor: 'getters' stamp: 'SG 5/13/2022 18:11:54'!
numberTop
	^0! !

!NullTop methodsFor: 'getters' stamp: 'SG 5/13/2022 18:19:48'!
previousTop
	self error: OOStack stackEmptyErrorDescription! !


!classDefinition: #RealTop category: 'Stack-Exercise'!
Top subclass: #RealTop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!RealTop methodsFor: 'getters' stamp: 'SG 5/13/2022 18:15:01'!
data
	^data! !

!RealTop methodsFor: 'getters' stamp: 'SG 5/11/2022 15:54:50'!
isEmpty
	^false! !

!RealTop methodsFor: 'getters' stamp: 'SG 5/13/2022 17:51:24'!
numberTop
	^numberTop! !

!RealTop methodsFor: 'getters' stamp: 'SG 5/13/2022 18:14:41'!
previousTop
	^previousTop! !


!RealTop methodsFor: 'setters' stamp: 'SG 5/13/2022 17:56:27'!
data: anObject
	data := anObject! !

!RealTop methodsFor: 'setters' stamp: 'SG 5/13/2022 17:50:33'!
numberTop: aNumber
	numberTop := aNumber! !

!RealTop methodsFor: 'setters' stamp: 'SG 5/13/2022 18:21:52'!
previousTop: aTop
	previousTop := aTop! !
