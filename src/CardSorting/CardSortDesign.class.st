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
CardSortDesign >> categoriesFromString: aString [
	categories := OrderedCollection new.
	aString lines do: [:line |
		categories add: line]
]

{ #category : #accessing }
CardSortDesign >> categoriesText [
	^String streamContents: [:s |
		self categories do: [ :category | s nextPutAll: category] separatedBy: [s cr]].
]

{ #category : #accessing }
CardSortDesign >> concepts [
	^concepts ifNil: [concepts := OrderedCollection new]
]

{ #category : #accessing }
CardSortDesign >> conceptsFromString: aString [
	concepts := OrderedCollection new.
	aString lines do: [:line |
		concepts add: line]
]

{ #category : #accessing }
CardSortDesign >> conceptsText [
	^String streamContents: [:s |
		self concepts do: [ :concept | s nextPutAll: concept ] separatedBy: [s cr]].
]

{ #category : #accessing }
CardSortDesign >> label [
	^(self concepts size) asString, ' - ', (self participants size) asString 
]

{ #category : #accessing }
CardSortDesign >> participants [
	^participants ifNil: [participants := OrderedCollection new]
]

{ #category : #accessing }
CardSortDesign >> participantsFromString: aString [
	participants := OrderedCollection new.
	aString lines do: [:line |
		participants add: line]
]

{ #category : #accessing }
CardSortDesign >> participantsText [
	^String streamContents: [:s |
		self participants do: [ :participant | s nextPutAll: participant] separatedBy: [s cr]].
]
