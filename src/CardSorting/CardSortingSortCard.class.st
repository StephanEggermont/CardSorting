Class {
	#name : #CardSortingSortCard,
	#superclass : #BlElement,
	#instVars : [
		'concept'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortingSortCard >> concept [
	^concept
]

{ #category : #accessing }
CardSortingSortCard >> concept: aConcept [
	concept := aConcept.
	self updateContents
]

{ #category : #accessing }
CardSortingSortCard >> initialize [
	super initialize.
	self size: 80@30;
		background: (Color lightGray muchLighter);
		border: (BlBorder paint: Color lightGray muchLighter width: 1);
		layout: (BlLinearLayout vertical);
		margin: (BlInsets all: 6);
		padding: (BlInsets top: 2 left: 2 bottom: 2 right: 2);
		addLook: BrShadowLook new;
	addChild: (BrLabel new
		look: BrGlamorousLabelLook;
		padding: (BlInsets left: 2);
		text: '');
	addEventHandler: BlPullHandler new 

]

{ #category : #accessing }
CardSortingSortCard >> updateContents [
	(self childAt:1) text: concept asRopedText
]
