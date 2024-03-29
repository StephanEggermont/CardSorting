Class {
	#name : #CardSortingSortingView,
	#superclass : #BlElement,
	#instVars : [
		'session',
		'design',
		'pane',
		'bar',
		'dragDropHandler',
		'maxWidth'
	],
	#category : #'CardSorting-Views'
}

{ #category : #'instance creation' }
CardSortingSortingView class >> onSession: aSession design: aDesign [ 
	^self new
		session:  aSession;
		design: aDesign;
		yourself
		
]

{ #category : #accessing }
CardSortingSortingView >> addBackButton [
	^BrButton new
		margin:
			(BlInsets
				top: 10
				left: 10
				bottom: 10
				right: 0);
		icon: BrGlamorousVectorIcons left;
		label: 'Back';
		aptitude: BrGlamorousButtonWithLabelAndIconAptitude+BrGlamorousButtonRectangularAptitude;
		action: [ self back ];
		yourself
]

{ #category : #accessing }
CardSortingSortingView >> back [
	self save.
	session designBack 
]

{ #category : #accessing }
CardSortingSortingView >> calculateCardWidth: aCollection [
	^(aCollection max: [ :each | session measureTextParagraph: (BlSingleLineTextParagraph new text: ((each asRopedText)
	  fontName: 'Source Sans Pro') yourself)])+8
]

{ #category : #accessing }
CardSortingSortingView >> card: aCard wasDroppedOn: anElement [.
	anElement = pane ifTrue: [self inform:'do nothing'. ^self].
	(pane hasChild: anElement) ifTrue: [self inform: 'combine'] 
]

{ #category : #accessing }
CardSortingSortingView >> createBar [
	bar := BlElement new
		size: 800 @ 40;
		background: Color lightGray muchLighter;
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c |  
			c horizontal matchParent.
			c vertical exact: 40 ];
		addChild: self addBackButton.
	^bar
]

{ #category : #accessing }
CardSortingSortingView >> createPane [
	pane := BlElement new
		size: 800@600;
		background: Color lightGray muchLighter lighter;
		padding: (BlInsets all: 2);
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical matchParent];
		layout: (BlOnceLayout on: (BlFlowLayout new));
		yourself.
	^pane
]

{ #category : #accessing }
CardSortingSortingView >> design: aDesign [
	design := aDesign.
	self updatePane
]

{ #category : #accessing }
CardSortingSortingView >> initialize [
	super initialize.
	dragDropHandler := CardSortingDragAndDropHandler new.
	self constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ];
	layout: BlLinearLayout vertical;
	addChild: self createBar;
	addChild: self createPane.
	dragDropHandler pane: pane.
]

{ #category : #accessing }
CardSortingSortingView >> save [

]

{ #category : #accessing }
CardSortingSortingView >> session: aSession [
	session := aSession
]

{ #category : #accessing }
CardSortingSortingView >> updatePane [
	pane removeChildren.
	maxWidth := self calculateCardWidth: design concepts.
	dragDropHandler maxWidth: maxWidth. 
	design concepts do: [ :concept |
		pane addChild: (CardSortingSortCard new 
			size: maxWidth @ 30;
			concept: concept;
			addEventHandler: dragDropHandler;
			yourself) ].

]
