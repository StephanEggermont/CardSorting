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
CardSortingDesignView >> back [
	backBlock value
]

{ #category : #accessing }
CardSortingDesignView >> backBlock: aBlock [
	backBlock := aBlock
]

{ #category : #accessing }
CardSortingDesignView >> createAccordionLabeled: aLabel text: aText [
	| anAccordion |
	anAccordion := BrAccordion new.
	anAccordion
		hMatchParent;
		vFitContent.
	anAccordion look: GtCoderExpanderLook new.
	anAccordion
		header: [ BrButton new
				look: BrGlamorousAccordionHeaderLook new;
				label: aLabel;
				action: [ anAccordion toggleExpanded ] ].
	anAccordion
		content: [ BrEditor new
				look: BrGlamorousEditorLook new;
				beEditable;
				text: aText];
		collapse.
	^ anAccordion
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
CardSortingDesignView >> createCategories [
	^self createAccordionLabeled: 'The predefined categories to sort the concepts into' text: design categoriesText
]

{ #category : #accessing }
CardSortingDesignView >> createConcepts [
	^self createAccordionLabeled: 'The concepts to sort' text: design conceptsText
]

{ #category : #accessing }
CardSortingDesignView >> createPane [
	pane := BlElement new
		size: 800@600;
		background: Color lightGray muchLighter lighter;
		padding: (BlInsets all: 2);
		layout: BlLinearLayout vertical;
		yourself.
	^pane
]

{ #category : #accessing }
CardSortingDesignView >> createParticipants [
	^self createAccordionLabeled: 'The participants' text: design participantsText
]

{ #category : #accessing }
CardSortingDesignView >> design: aDesign [
	design := aDesign.
	self updatePane
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

{ #category : #accessing }
CardSortingDesignView >> updatePane [
	pane removeChildren.
	pane addChild: self createConcepts;
		addChild: self createCategories;
		addChild: self createParticipants
]
