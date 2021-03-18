Class {
	#name : #BaselineOfCardSorting,
	#superclass : #BaselineOf,
	#category : #BaselineOfCardSorting
}

{ #category : #accessing }
BaselineOfCardSorting >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec package: 'CardSorting']
]
