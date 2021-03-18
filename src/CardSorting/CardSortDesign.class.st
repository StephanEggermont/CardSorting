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
CardSortDesign >> categoriesText [
	^String streamContents: [:s |
		self categories do: [ :category | s nextPutAll: category label] separatedBy: [s cr]].
]

{ #category : #accessing }
CardSortDesign >> concepts [
	^concepts ifNil: [concepts := OrderedCollection new]
]

{ #category : #accessing }
CardSortDesign >> conceptsText [
	^String streamContents: [:s |
		self concepts do: [ :concept | s nextPutAll: concept label] separatedBy: [s cr]].
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
CardSortDesign >> participantsText [
	^String streamContents: [:s |
		self participants do: [ :participant | s nextPutAll: participant label] separatedBy: [s cr]].
]
