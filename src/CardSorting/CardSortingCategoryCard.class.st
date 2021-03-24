Class {
	#name : #CardSortingCategoryCard,
	#superclass : #BlElement,
	#instVars : [
		'concepts',
		'category'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortingCategoryCard >> category [
	^category
]

{ #category : #accessing }
CardSortingCategoryCard >> category: aCategory [
	category := aCategory.
	self updateContents
]

{ #category : #accessing }
CardSortingCategoryCard >> initialize [
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
CardSortingCategoryCard >> updateContents [
	(self childAt:1) text: category asRopedText
]
