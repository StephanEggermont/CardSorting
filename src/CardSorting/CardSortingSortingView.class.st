Class {
	#name : #CardSortingSortingView,
	#superclass : #BlElement,
	#instVars : [
		'session',
		'design',
		'pane',
		'bar'
	],
	#category : #CardSorting
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
		look: BrGlamorousButtonWithLabelAndIconLook+BrGlamorousButtonRectangularLook;
		action: [ self back ];
		yourself
]

{ #category : #accessing }
CardSortingSortingView >> back [
	self save.
	session designBack 
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
	self constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ];
	layout: BlLinearLayout vertical;
	addChild: self createBar;
	addChild: self createPane;
	yourself 
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

]
