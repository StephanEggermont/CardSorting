"
!Category
I am a group of concepts in a card sorting session. I have a label. 
"
Class {
	#name : #CardSortCategory,
	#superclass : #Object,
	#instVars : [
		'cards',
		'label'
	],
	#category : #'CardSorting-CardSorting'
}

{ #category : #accessing }
CardSortCategory >> cards [
	^cards ifNil: [cards := OrderedCollection new]
]

{ #category : #accessing }
CardSortCategory >> label [
	^label
]
