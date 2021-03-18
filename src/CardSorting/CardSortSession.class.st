"
!Card Sort Session
I am the card sort that one participant performs.
"
Class {
	#name : #CardSortSession,
	#superclass : #Object,
	#instVars : [
		'participant',
		'design',
		'start',
		'end',
		'toDo',
		'categories'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortSession >> categories [
	^categories ifNil: [categories := OrderedCollection new]
]

{ #category : #accessing }
CardSortSession >> design [
	^design
]

{ #category : #accessing }
CardSortSession >> end [
	^end
]

{ #category : #accessing }
CardSortSession >> participant [
	^participant
]

{ #category : #accessing }
CardSortSession >> start [
	^start
]

{ #category : #accessing }
CardSortSession >> toDo [
	^toDo ifNil: [toDo := OrderedCollection new]
]
