Class {
	#name : #CardSortingDesignView,
	#superclass : #BlElement,
	#instVars : [
		'design',
		'backBlock',
		'bar',
		'pane'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortingDesignView class >> onDesign: aDesign [ 
	^self new
		design: aDesign;
		yourself
]

{ #category : #accessing }
CardSortingDesignView >> addBackButton [
	^BrButton new
		margin:
			(BlInsets
				top: 10
				left: 40
				bottom: 10
				right: 0);
		label: 'Back';
		look: BrGlamorousButtonWithLabelAndIconLook+BrGlamorousButtonRectangularLook;
		icon: BrGlamorousVectorIcons add;
		action: [ self back ];
		yourself
]

{ #category : #accessing }
CardSortingDesignView >> back [
	backBlock value
]

{ #category : #accessing }
CardSortingDesignView >> backBlock: aBlock [
	backBlock := aBlock
]

{ #category : #accessing }
CardSortingDesignView >> createBar [
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
CardSortingDesignView >> createPane [
	pane := BlElement new
		size: 800@600;
		background: Color lightGray muchLighter lighter;
		padding: (BlInsets all: 2);
		layout: BlLinearLayout horizontal;
		yourself.
	^pane
]

{ #category : #accessing }
CardSortingDesignView >> design: aDesign [
	design := aDesign
]

{ #category : #accessing }
CardSortingDesignView >> initialize [
	super initialize.
	self constraintsDo: [ :c | 
		c horizontal matchParent.
		c vertical matchParent ];
	layout: BlLinearLayout vertical;
	addChild: self createBar;
	addChild: self createPane;
	yourself 
]
