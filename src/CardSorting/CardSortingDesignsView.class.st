Class {
	#name : #CardSortingDesignsView,
	#superclass : #BlElement,
	#instVars : [
		'bar',
		'pane',
		'session'
	],
	#category : #'CardSorting-Views'
}

{ #category : #accessing }
CardSortingDesignsView class >> onSession: aSession [
	^self new
		session: aSession;
		yourself
]

{ #category : #accessing }
CardSortingDesignsView >> addDesign [
	session addDesign.
	self updateDesigns
]

{ #category : #accessing }
CardSortingDesignsView >> addDesignButton [
	^ BrButton new
		margin:
			(BlInsets
				top: 10
				left: 10
				bottom: 10
				right: 0);
		label: 'Add Design';
		aptitude:
			BrGlamorousButtonWithLabelAndIconAptitude
				+ BrGlamorousButtonRectangularAptitude;
		icon: BrGlamorousVectorIcons add;
		action: [ self addDesign ];
		yourself
]

{ #category : #accessing }
CardSortingDesignsView >> createBar [
	bar := BlElement new
		size: 800 @ 40;
		background: Color lightGray muchLighter;
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 40 ];
		addChild: self addDesignButton.
	^bar

]

{ #category : #accessing }
CardSortingDesignsView >> createPane [
	pane := BlElement new
		size: 800@600;
		background: Color lightGray muchLighter lighter;
		padding: (BlInsets all: 2);
		layout: BlLinearLayout horizontal;
		yourself.
	^pane
]

{ #category : #initialization }
CardSortingDesignsView >> initialize [
	super initialize.
	self constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ];
	layout: BlLinearLayout vertical;
	addChild: self createBar;
	addChild: self createPane.
]

{ #category : #accessing }
CardSortingDesignsView >> openDesign: aDesign [
	session openDesign: aDesign
]

{ #category : #accessing }
CardSortingDesignsView >> session: aSession [
	session := aSession.
	self updateDesigns
]

{ #category : #initialization }
CardSortingDesignsView >> updateDesigns [
	pane removeChildren.
	session designs do: [ :each| 
		pane addChild: (CardSortingDesignCard onSession: session design: each)]
]
