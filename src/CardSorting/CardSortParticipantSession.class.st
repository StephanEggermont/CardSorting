"
!Card Sort Session
I am the card sort that one participant performs.
"
Class {
	#name : #CardSortParticipantSession,
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
CardSortParticipantSession >> categories [
	^categories ifNil: [categories := OrderedCollection new]
]

{ #category : #accessing }
CardSortParticipantSession >> design [
	^design
]

{ #category : #accessing }
CardSortParticipantSession >> end [
	^end
]

{ #category : #accessing }
CardSortParticipantSession >> participant [
	^participant
]

{ #category : #accessing }
CardSortParticipantSession >> start [
	^start
]

{ #category : #accessing }
CardSortParticipantSession >> toDo [
	^toDo ifNil: [toDo := OrderedCollection new]
]
