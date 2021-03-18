Class {
	#name : #CardSortingDesignCard,
	#superclass : #BrButton,
	#instVars : [
		'design',
		'label'
	],
	#category : #CardSorting
}

{ #category : #initialization }
CardSortingDesignCard class >> onDesign: aDesign [
	^self new
		design: aDesign;
		yourself
]

{ #category : #accessing }
CardSortingDesignCard >> createLabel [
	label :=  BrLabel new
		look: BrGlamorousLabelLook;
		padding: (BlInsets left: 2);
		text: '';
		yourself.
	^label 
]

{ #category : #accessing }
CardSortingDesignCard >> design: aDesign [
	design := aDesign.
	self updateLabel
]

{ #category : #accessing }
CardSortingDesignCard >> edit [
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
		addLook: BrShadowLook new;
		addLook: (BrGlamorousWithContextMenuLook
               content: [ BrGlamorousSimpleContextMenuContent new
                   items:self menuItems ;
                   yourself ]);
		addChild: self createLabel
]

{ #category : #accessing }
CardSortingDesignCard >> menuItems [

    ^{(#'Edit' -> [ :e | self edit]).
      (#'Start' -> [ :e | self start ])}.
 
]

{ #category : #accessing }
CardSortingDesignCard >> newlabel [
	^ BrLabel new
		look: BrGlamorousLabelLook;
		padding: (BlInsets left: 2);
		text: ''
]

{ #category : #accessing }
CardSortingDesignCard >> start [
]

{ #category : #accessing }
CardSortingDesignCard >> updateLabel [
	label text: design label
]
