"
!Card Sorting
Card sorting is a UX research method in which study participants group concepts according to criteria that makes sense to them. This application uses a drag-and-drop approach to support this method.


"
Class {
	#name : #CardSortingApplication,
	#superclass : #Object,
	#instVars : [
		'cardSorts',
		'designs',
		'space',
		'session'
	],
	#category : #CardSorting
}

{ #category : #accessing }
CardSortingApplication >> addDesign [
	|newDesign|
	newDesign := CardSortDesign new.
	self designs add: newDesign
]

{ #category : #accessing }
CardSortingApplication >> designs [
	^designs ifNil: [designs := OrderedCollection new]
]

{ #category : #accessing }
CardSortingApplication >> initialize [
	session := CardSortingSession onApplication: self
]

{ #category : #accessing }
CardSortingApplication >> open [
	space := BlSpace new.
	space title: 'Card Sorting'.
	self openDesignsOverview.
	space show.
]

{ #category : #accessing }
CardSortingApplication >> openDesign: aDesign [
	space root removeChildren.
	space addChild: (CardSortingDesignView onSession: session design: aDesign)
]

{ #category : #accessing }
CardSortingApplication >> openDesignsOverview [
	space root removeChildren.
	space addChild: (CardSortingDesignsView onSession: session)
]

{ #category : #accessing }
CardSortingApplication >> startDesign: aDesign [
	space root removeChildren.
	space addChild: (CardSortingDesignView onSession: session design: aDesign)
]
