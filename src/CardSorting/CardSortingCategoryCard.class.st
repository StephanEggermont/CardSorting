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
	self 
		geometry: (BlRoundedRectangleGeometry cornerRadius: 6);
		background: (Color lightYellow muchLighter);
		border: (BlBorder paint: Color lightGray muchLighter width: 1);
		layout: (BlFlowLayout new);
		margin: (BlInsets all: 6);
		padding: (BlInsets top: 2 left: 2 bottom: 2 right: 2);
"		addLook: BrShadowLook new;
"	addChild: (BrLabel new
		aptitude: BrGlamorousLabelAptitude;
		padding: (BlInsets left: 2);
		text: '');
	addEventHandler: BlPullHandler new 

]

{ #category : #accessing }
CardSortingCategoryCard >> updateContents [
	(self childAt:1) text: category asRopedText
]
