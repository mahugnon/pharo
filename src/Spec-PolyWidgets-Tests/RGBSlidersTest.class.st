Class {
	#name : #RGBSlidersTest,
	#superclass : #SpecSmokeTestCase,
	#category : #'Spec-PolyWidgets-Tests'
}

{ #category : #running }
RGBSlidersTest >> classToTest [
	^ RGBSliders
]

{ #category : #tests }
RGBSlidersTest >> testColor [
	| random red green blue |
	random := Random new.
	red := random nextInt: 255.
	green := random nextInt: 255.
	blue := random nextInt: 255.
	
	presenter redSlider value: red.
	presenter greenSlider value: green.
	presenter blueSlider value: blue.
	self
		assert: presenter color
		equals:
			(Color
				r: red
				g: green
				b: blue
				range: 255)
]

{ #category : #tests }
RGBSlidersTest >> testwhenChangedDo [
	| numberOfChanges |
	numberOfChanges := 0.
	presenter whenChangedDo: [ numberOfChanges := numberOfChanges + 1 ].
	presenter redSlider value: 66.
	presenter greenSlider value: 17.
	presenter blueSlider value: 200.
	self assert: numberOfChanges equals: 3
]
