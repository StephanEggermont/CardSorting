"
!Card Sort Design
I am the design for one card sort study. I know which concepts need sorting, the predefined categories, and the participants to the study
"
Class {
	#name : #CardSortDesign,
	#superclass : #Object,
	#instVars : [
		'concepts',
		'categories',
		'participants'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortDesign >> categories [
	^categories ifNil: [categories := OrderedCollection new]
]

{ #category : #accessing }
CardSortDesign >> concepts [
	^concepts ifNil: [concepts := OrderedCollection new]
]

{ #category : #accessing }
CardSortDesign >> participants [
	^participants ifNil: [participants := OrderedCollection new]
]
