"
I provide the application session
"
Class {
	#name : #CardSortingSession,
	#superclass : #Object,
	#instVars : [
		'application'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortingSession class >> onApplication: anApplication [
	^self new
		application: anApplication;
		yourself
]

{ #category : #accessing }
CardSortingSession >> addDesign [
	application addDesign
]

{ #category : #accessing }
CardSortingSession >> application: anApplication [
	application := anApplication
]

{ #category : #accessing }
CardSortingSession >> designBack [
	application openDesignsOverview
]

{ #category : #accessing }
CardSortingSession >> designs [
	^application designs
]

{ #category : #accessing }
CardSortingSession >> edit: aDesign [
	application openDesign: aDesign
]

{ #category : #accessing }
CardSortingSession >> openDesign: aDesign [
	application openDesign: aDesign
]

{ #category : #accessing }
CardSortingSession >> start: aDesign [
	application startDesign: aDesign
]
