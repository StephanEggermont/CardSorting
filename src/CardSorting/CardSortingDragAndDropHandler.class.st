Class {
	#name : #CardSortingDragAndDropHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'dragStartGlobalPosition',
		'originalPosition',
		'overlay',
		'draggable',
		'parent',
		'pane'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortingDragAndDropHandler class >> onPane: pane [ 
	^ self new
		pane: pane;
		yourself
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> dragEndEvent: anEvent [
	"anEvent consumed: true."

	anEvent currentTarget dispatchEvent: BlPullEndEvent new
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> dragEvent: anEvent [
	| aStartPosition aCurrentPosition aPreviousPosition dragDelta aNewPosition |
	
	dragStartGlobalPosition ifNil: [ dragStartGlobalPosition := anEvent position ].
	
	aCurrentPosition := anEvent currentTarget globalPointToParentChildren: anEvent position.
		aStartPosition := anEvent currentTarget globalPointToParentChildren: dragStartGlobalPosition.

	dragDelta := aCurrentPosition - aStartPosition.
		
	aNewPosition := ((originalPosition ifNil: [ originalPosition := anEvent currentTarget constraints position ]) + dragDelta).
	aPreviousPosition := anEvent currentTarget constraints position.

	anEvent currentTarget relocate: aNewPosition.
	anEvent consumed: true.
	
	self
		onPulled: anEvent currentTarget
		from: aPreviousPosition
		to: aNewPosition
		by: dragDelta
		starting: originalPosition
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.

	anEvent currentTarget dispatchEvent: BlPullStartEvent new.

	"drag start position in space coordinates"
	dragStartGlobalPosition := anEvent position.

	"element position in parent"
	originalPosition := anEvent currentTarget constraints position
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> eventsToHandle [
	^ { BlDragStartEvent . BlDragEvent . BlDragEndEvent }
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> initialize [
	super initialize
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> onPulled: aPulledElement from: aPreviousPosition to: aNewPosition  by: aDragDelta starting: anOriginalPosition [
	aPulledElement dispatchEvent: (BlPullEvent new
		initialPosition: anOriginalPosition;
		oldPosition: aPreviousPosition;
		newPosition: aNewPosition;
		delta: aDragDelta)
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> pane: aPane [
	pane := aPane 
]
