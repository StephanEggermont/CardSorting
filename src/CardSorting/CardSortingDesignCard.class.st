Class {
	#name : #CardSortingDesignCard,
	#superclass : #BrButton,
	#instVars : [
		'design'
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
CardSortingDesignCard >> design: aDesign [
	design := aDesign
]

{ #category : #accessing }
CardSortingDesignCard >> initialize [
	super initialize.
	self size: 120@90;
	background: (Color lightGray muchLighter);
	border: (BlBorder paint: Color lightGray muchLighter width: 1);
	layout: (BlLinearLayout vertical);
	margin: (BlInsets all: 6);
	padding: (BlInsets top: 2 left: 2 bottom: 2 right: 2);
	addLook: BrShadowLook new;
	addChild: (BrLabel new
		look: BrGlamorousLabelLook;
		padding: (BlInsets left: 2);
		text: '')
]
