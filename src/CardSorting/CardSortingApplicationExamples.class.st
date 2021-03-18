Class {
	#name : #CardSortingApplicationExamples,
	#superclass : #Object,
	#category : #CardSorting
}

{ #category : #accessing }
CardSortingApplicationExamples >> emptyApplication [
	<gtExample>
	| app |
	app := CardSortingApplication new.
	self assert: app designs size = 0.
	^app
]
