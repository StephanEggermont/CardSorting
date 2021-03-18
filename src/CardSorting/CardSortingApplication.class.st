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
		'space'
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
CardSortingApplication >> open [
	space := BlSpace new.
	space title: 'Card Sorting'.
	self openDesignsOverview.
	space show.
]

{ #category : #accessing }
CardSortingApplication >> openDesign: aDesign [
	space root removeChildren.
	space addChild: ((CardSortingDesignView onDesign: aDesign)
		backBlock: [self openDesignsOverview];
		yourself)
]

{ #category : #accessing }
CardSortingApplication >> openDesignsOverview [
	space root removeChildren.
	space addChild: (CardSortingDesignsView onApplication: self)
]
