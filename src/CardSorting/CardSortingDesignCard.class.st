Class {
	#name : #CardSortingDesignCard,
	#superclass : #BrButton,
	#instVars : [
		'session',
		'design',
		'label',
		'startButton'
	],
	#category : #'CardSorting-Views'
}

{ #category : #initialization }
CardSortingDesignCard class >> onSession: aSession design: aDesign [
	^self new
		session: aSession;
		design: aDesign;
		yourself
]

{ #category : #accessing }
CardSortingDesignCard >> createLabel [
	label :=  BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		padding: (BlInsets left: 2);
		text: '';
		yourself.
	^label 
]

{ #category : #accessing }
CardSortingDesignCard >> createStartButton [
	^BrButton new
		margin:
			(BlInsets
				top: 10
				left: 10
				bottom: 10
				right: 0);
		label: 'Start';
		aptitude: BrGlamorousButtonWithLabelAndIconAptitude+BrGlamorousButtonRectangularAptitude;
		icon: BrGlamorousVectorIcons play;
		action: [ self start ];
		yourself
]

{ #category : #accessing }
CardSortingDesignCard >> design: aDesign [
	design := aDesign.
	self updateLabel
]

{ #category : #accessing }
CardSortingDesignCard >> edit [
	session edit: design
]

{ #category : #accessing }
CardSortingDesignCard >> initialize [
	super initialize.
	self
		size: 120 @ 90;
		background: Color lightYellow muchLighter;
		border: (BlBorder paint: Color lightGray muchLighter width: 1);
		layout: BlLinearLayout vertical;
		margin: (BlInsets all: 6);
		padding:
			(BlInsets
				top: 2
				left: 2
				bottom: 2
				right: 2);
		addAptitude: BrShadowAptitude new;
		addAptitude:
			(BrGlamorousWithContextMenuAptitude
				content: [ BrGlamorousSimpleContextMenuContent new
						items: self menuItems;
						yourself ]);
		addChild: self createLabel.
	startButton := self createStartButton.
	self addChild: startButton
]

{ #category : #accessing }
CardSortingDesignCard >> menuItems [

    ^{(#'Edit' -> [ :e | self edit]).
      (#'Start' -> [ :e | self start ])}.
 
]

{ #category : #accessing }
CardSortingDesignCard >> newlabel [
	^ BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		padding: (BlInsets left: 2);
		text: ''
]

{ #category : #accessing }
CardSortingDesignCard >> session: aSession [
	session := aSession.
	self action: [ session openDesign: design]
]

{ #category : #accessing }
CardSortingDesignCard >> start [
	design hasConcepts ifFalse: [^self].
	session start: design
]

{ #category : #accessing }
CardSortingDesignCard >> updateLabel [
	label text: design label.
	design concepts size > 1 ifTrue: [startButton visibility: BlVisibility visible]
		ifFalse: [startButton visibility: BlVisibility hidden.]
]
