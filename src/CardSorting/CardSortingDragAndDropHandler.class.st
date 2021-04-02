Class {
	#name : #CardSortingDragAndDropHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'originalPosition',
		'overlay',
		'draggable',
		'parent',
		'pane',
		'placeholder',
		'panes',
		'dragStartPosition',
		'draggableOffset',
		'maxWidth'
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
CardSortingDragAndDropHandler >> addPaneWith: aDraggable at: anEvent [ 
	|column|
	column := self columnBlock value.
	panes add: column.
	column addChild: aDraggable.
	pane addChild: column.
	column relocate: (column globalPointToParent: anEvent position) - draggableOffset + (-4@ -12). 
	column when: BlPullStartEvent do: [ self makeLast: column]. 

]

{ #category : #accessing }
CardSortingDragAndDropHandler >> columnBlock [
	^ [ CardSortingCategoryCard new
		margin: (BlInsets all: 1);
		padding: (BlInsets top: 10 left: 2 bottom: 2 right: 2);
		constraintsDo: [ :c | 
			c vertical fitContent ]]
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> dragEndEvent: anEvent [
	"anEvent consumed: true."
	overlay removeChild: draggable.
	parent ifNil: [self addPaneWith: draggable at: anEvent] ifNotNil: [
		(parent containsGlobalPoint: anEvent position) ifTrue: [
			parent replaceChild: placeholder with: draggable] 
		ifFalse: [ 
			parent removeChild: placeholder.
			self addPaneWith: draggable at: anEvent]].
	overlay detach.
	panes do: [:each | |nrOfChildren|
		nrOfChildren := each childrenCount.
		nrOfChildren = 0 ifTrue: [ 
			pane removeChild: each]
		ifFalse: [ 
			self fitCategory: each]].
	(panes removeAllSuchThat: [:each | each childrenCount = 0]).
	anEvent currentTarget dispatchEvent: BlPullEndEvent new
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> dragEvent: anEvent [
	| dragPosition dragDelta aNewPosition |
	dragPosition := anEvent currentTarget
		globalPointToParent: anEvent position.
	self movePlaceholderIfOverOtherChild: anEvent.
	dragDelta := dragPosition
		- (dragStartPosition ifNil: [ dragStartPosition := dragPosition ]).
	aNewPosition := (originalPosition
		ifNil: [ originalPosition := anEvent currentTarget position ])
		+ dragDelta.
	anEvent currentTarget relocate: aNewPosition.
	anEvent consumed: true.
	anEvent currentTarget
		dispatchEvent:
			(BlPullEvent new
				initialPosition: originalPosition;
				oldPosition: dragPosition;
				newPosition: aNewPosition;
				delta: dragDelta)
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> dragStartEvent: anEvent [
	anEvent consumed: true.
	draggable := anEvent currentTarget.
	parent := panes detect: [ :aPane | (aPane containsGlobalPoint: anEvent position) 
		and: [ draggable hasParent: aPane]] ifNone: [nil].
	overlay := BlOverlayElement on: pane.
	pane parent addChild: overlay.

	"drag start position in parent"
	dragStartPosition := draggable globalPointToParent: anEvent position.
	draggableOffset := dragStartPosition - draggable position.
	"element position in parent"
	originalPosition := draggable position.
	placeholder := self placeholderFor: draggable.
	parent ifNotNil: [parent replaceChild: draggable with: placeholder]
		ifNil: [draggable parent removeChild: draggable].
	overlay addChild: draggable.

	anEvent currentTarget dispatchEvent: BlPullStartEvent new
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> eventsToHandle [
	^ { BlDragStartEvent . BlDragEvent . BlDragEndEvent }
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> fitCategory: aCategory [
	aCategory constraintsDo: [ :c | 
		c horizontal exact: (maxWidth+16)*((aCategory childrenCount -1) sqrt roundUpTo: 1)].
	aCategory childrenCount = 2 ifTrue: [ 
		aCategory padding: (BlInsets top: 1 left: 1 bottom: 1 right: 1)] 
	ifFalse: [ 
		aCategory padding: (BlInsets top: 1 left: 2 bottom: 2 right: 2)]
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> initialize [
	super initialize.
	panes := OrderedCollection new
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> makeLast: aPane [
	| thePanes|
	panes swap: (panes indexOf: aPane) with: panes size.
	thePanes := pane children select: [ :each | each class ~= CardSortingSortCard ].
	pane removeChildren: thePanes.
	pane addChildren: panes
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> maxWidth: aWidth [
	maxWidth := aWidth
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> movePlaceholderIfOverOtherChild: anEvent [
	| mouseOverOther |
	self movePlaceholderToCorrectParent: anEvent.
	mouseOverOther := placeholder.
	parent ifNotNil: [
		parent children
			do: [ :each | 
				(each containsGlobalPoint: anEvent position)
					ifTrue: [ mouseOverOther := each ] ].
		mouseOverOther = placeholder
			ifFalse: [ | index |
				index := parent childIndexOf: mouseOverOther.
				parent removeChild: placeholder.
				parent addChild: placeholder at: index ]]
]

{ #category : #accessing }
CardSortingDragAndDropHandler >> movePlaceholderToCorrectParent: anEvent [
	| currentPane |
	currentPane := panes reversed
		detect: [ :aPane |(aPane containsGlobalPoint: anEvent position)]
	ifNone: [ parent ].
	currentPane = parent
		ifFalse: [ 
			parent ifNotNil: [
				parent removeChild: placeholder.
				self fitCategory: parent ].
			parent := currentPane.
			placeholder ifNil: [ placeholder := self placeholderFor: draggable].
			parent addChild: placeholder.
			self fitCategory: parent]
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

{ #category : #accessing }
CardSortingDragAndDropHandler >> placeholderFor: aDraggable [ 
	^BlElement new
		size: aDraggable size;
		border: (aDraggable border copyWithStyle: BlStrokeStyle dashed);
		margin: aDraggable margin;
		background: (aDraggable background paint color alpha: 0.2);
		yourself
]
