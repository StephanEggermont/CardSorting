Class {
	#name : #CardSortingDesignView,
	#superclass : #BlElement,
	#instVars : [
		'design',
		'backBlock',
		'bar',
		'pane',
		'categories',
		'concepts',
		'participants',
		'session'
	],
	#category : #'CardSorting-Views'
}

{ #category : #accessing }
CardSortingDesignView class >> onSession: aSession design: aDesign [ 
	^self new
		session: aSession;
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
		aptitude: BrGlamorousButtonWithLabelAndIconAptitude+BrGlamorousButtonRectangularAptitude;
		action: [ self back ];
		yourself
]

{ #category : #accessing }
CardSortingDesignView >> back [
	self save.
	session designBack 
]

{ #category : #accessing }
CardSortingDesignView >> createAccordionLabeled: aLabel text: aText [
	| anAccordion |
	anAccordion := BrAccordion new.
	anAccordion
		hMatchParent;
		vFitContent.
	anAccordion aptitude: GtCoderExpanderAptitude new.
	anAccordion
		header: [ BrButton new
				aptitude: BrGlamorousAccordionHeaderAptitude new;
				label: aLabel;
				action: [ anAccordion toggleExpanded ] ].
	anAccordion
		content: [ BrEditor new
				aptitude: BrGlamorousEditorAptitude new;
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
	categories := self createAccordionLabeled: 'The predefined categories (', design categories size asString, ') to sort the concepts into' text: design categoriesText.
	^categories
]

{ #category : #accessing }
CardSortingDesignView >> createConcepts [
	concepts := self createAccordionLabeled: 'The concepts (', design concepts size asString, ') to sort' text: design conceptsText.
	^concepts
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
	participants := self createAccordionLabeled: 'The participants (', design categories size asString, ')' text: design participantsText.
	^participants
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
CardSortingDesignView >> save [
	concepts expand.
	categories expand.
	participants expand.
	design conceptsFromString: (((concepts childNamed: #content) childAt: 1) text) asString.
	design categoriesFromString: (((categories childNamed: #content) childAt: 1) text) asString.
	design participantsFromString: (((participants childNamed: #content) childAt: 1) text) asString.
	
]

{ #category : #accessing }
CardSortingDesignView >> session: aSession [
	session := aSession
]

{ #category : #accessing }
CardSortingDesignView >> updatePane [
	pane removeChildren.
	pane addChild: self createConcepts;
		addChild: self createCategories;
		addChild: self createParticipants
]
