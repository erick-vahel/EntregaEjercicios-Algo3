!classDefinition: #TestMarsRoverController category: 'TDD-MarsRover'!
TestCase subclass: #TestMarsRoverController
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!TestMarsRoverController methodsFor: 'assertions' stamp: 'enp 11/3/2022 15:44:48'!
assertFacing: aStartingOrientation andReceivingCommand: anOrientationCommand changesOrientationTo: aFinalOrientation
	|marsRoverController|
	
	marsRoverController := (MarsRoverController starting: 1@2 facing: aStartingOrientation new ).
	
	marsRoverController receiveNewCommand: anOrientationCommand .
	
	self assert: (marsRoverController actualOrientation isKindOf: aFinalOrientation).! !

!TestMarsRoverController methodsFor: 'assertions' stamp: 'enp 11/3/2022 15:44:48'!
assertFacing: aStartingOrientation andReceivingCommand: aMovementCommand changesPositionTo: aFinalPosition
	|marsRoverController|
	
	marsRoverController := (MarsRoverController starting: 1@2 facing: aStartingOrientation new).
	
	marsRoverController receiveNewCommand: aMovementCommand .
	
	self assert: marsRoverController actualPosition = aFinalPosition.! !


!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test10MovingForwardFacingNorthIncreasesYAxis
	
	self assertFacing: North andReceivingCommand: 'F' changesPositionTo: 	(1@3).
! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test11MovingBackwardsFacingNorthDecreasesYAxis
	
	self assertFacing: North andReceivingCommand: 'B' changesPositionTo: 	(1@1).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test12MovingForwardFacingWestDecreasesXAxis
	
	self assertFacing: West andReceivingCommand: 'F' changesPositionTo: 	(0@2).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test13MovingBackwardsFacingWestIncreasesXAxis
	
	self assertFacing: West andReceivingCommand: 'B' changesPositionTo: 	(2@2).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test14MovingForwardFacingSouthDecreasesYAxis
	
	self assertFacing: South andReceivingCommand: 'F' changesPositionTo: 	(1@1).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test15MovingBackwardsFacingSouthIncreasesYAxis
	
	self assertFacing: South andReceivingCommand: 'B' changesPositionTo: 	(1@3).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test16MovingForwardFacingEastIncreasesXAxis
	
	self assertFacing: East andReceivingCommand: 'F' changesPositionTo: 	(2@2).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test17MovingBackwardsFacingEastDecreasesXAxis
	
	self assertFacing: East andReceivingCommand: 'B' changesPositionTo: 	(0@2).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test18MovingTwoTimesBackwardFacingEeastDecreasesXaxisTwice
	
	self assertFacing: East andReceivingCommand: 'BB' changesPositionTo: 	(-1@2).! !

!TestMarsRoverController methodsFor: 'test changing position' stamp: 'enp 11/3/2022 15:44:04'!
test19AnInvalidCommandRisesErrorAndCutsExcecution
	
	self
		should:[self assertFacing: East andReceivingCommand: 'BXB'  changesPositionTo: (0@2) ]
		raise: Error  
		withExceptionDo: [ :anError |
			self assert: anError messageText = (MarsRoverController errorCommandDescription) ].
		
! !


!TestMarsRoverController methodsFor: 'test empty command' stamp: 'enp 11/3/2022 15:44:48'!
test01ReceiveEmptyCommandDoesNothing
	
	|marsRoverController|
	
	marsRoverController := (MarsRoverController starting: 1@2 facing: (North new)).
	
	marsRoverController receiveNewCommand: ''.
	
	self assert: marsRoverController actualPosition = (1@2).
	self assert: (marsRoverController actualOrientation isKindOf: North).! !


!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test02ChangeNorthOrientation90DegreesCounterClockwise
	
	self assertFacing: North andReceivingCommand: 'L' changesOrientationTo: West.! !

!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test03ChangeNorthOrientation90DegreesClockwise
	
	self assertFacing: North andReceivingCommand: 'R' changesOrientationTo: East.! !

!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test04ChangeWestOrientation90DegreesCounterClockwise
	
	self assertFacing: West andReceivingCommand: 'L' changesOrientationTo: South.! !

!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test05ChangeWestOrientation90DegreesClockwise
	
	self assertFacing: West andReceivingCommand: 'R' changesOrientationTo: North.! !

!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test06ChangeSouthOrientation90DegreesCounterClockwise
	
	self assertFacing: South andReceivingCommand: 'L' changesOrientationTo: East.! !

!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test07ChangeSouthOrientation90DegreesClockwise
	
	self assertFacing: South andReceivingCommand: 'R' changesOrientationTo: West.! !

!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test08ChangeEastOrientation90DegreesCounterClockwise
	
	self assertFacing: East andReceivingCommand: 'L' changesOrientationTo: North.
! !

!TestMarsRoverController methodsFor: 'test changing orientation' stamp: 'enp 11/3/2022 15:43:53'!
test09ChangeEastOrientation90DegreesClockwise
	
	self assertFacing: East andReceivingCommand: 'R' changesOrientationTo: South.! !


!classDefinition: #Command category: 'TDD-MarsRover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Command methodsFor: 'operation' stamp: 'enp 11/3/2022 14:08:47'!
executeWithEastOrientation: aMarsRoverController
	self subclassResponsibility.! !

!Command methodsFor: 'operation' stamp: 'enp 11/3/2022 14:09:36'!
executeWithNorthOrientation: aMarsRoverController
	self subclassResponsibility.! !

!Command methodsFor: 'operation' stamp: 'enp 11/3/2022 14:09:45'!
executeWithSouthOrientation: aMarsRoverController
	self subclassResponsibility.! !

!Command methodsFor: 'operation' stamp: 'enp 11/3/2022 14:09:56'!
executeWithWestOrientation: aMarsRoverController
	self subclassResponsibility.! !


!classDefinition: #Backwards category: 'TDD-MarsRover'!
Command subclass: #Backwards
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Backwards methodsFor: 'operation' stamp: 'enp 11/3/2022 15:36:16'!
executeWithEastOrientation: aMarsRoverController
	aMarsRoverController updatePosition: (- 1@0).
	! !

!Backwards methodsFor: 'operation' stamp: 'enp 11/3/2022 14:20:10'!
executeWithNorthOrientation: aMarsRoverController
	aMarsRoverController updatePosition: ( 0@-1).
! !

!Backwards methodsFor: 'operation' stamp: 'enp 11/3/2022 14:21:06'!
executeWithSouthOrientation: aMarsRoverController
	aMarsRoverController updatePosition: (0@1).! !

!Backwards methodsFor: 'operation' stamp: 'enp 11/3/2022 14:21:26'!
executeWithWestOrientation: aMarsRoverController
	aMarsRoverController updatePosition: (1@0).! !


!classDefinition: #Forward category: 'TDD-MarsRover'!
Command subclass: #Forward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Forward methodsFor: 'operation' stamp: 'enp 11/3/2022 14:21:45'!
executeWithEastOrientation: aMarsRoverController
	aMarsRoverController updatePosition: (1@0).! !

!Forward methodsFor: 'operation' stamp: 'enp 11/3/2022 14:22:00'!
executeWithNorthOrientation: aMarsRoverController
	aMarsRoverController updatePosition: (0@1).! !

!Forward methodsFor: 'operation' stamp: 'enp 11/3/2022 14:22:13'!
executeWithSouthOrientation: aMarsRoverController
	aMarsRoverController updatePosition: (0@-1).! !

!Forward methodsFor: 'operation' stamp: 'enp 11/3/2022 14:22:20'!
executeWithWestOrientation: aMarsRoverController
	 aMarsRoverController updatePosition: (-1@0).! !


!classDefinition: #Left category: 'TDD-MarsRover'!
Command subclass: #Left
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Left methodsFor: 'operation' stamp: 'enp 11/3/2022 15:35:48'!
executeWithEastOrientation: aMarsRoverController
	aMarsRoverController updateOrientation: North new.
	! !

!Left methodsFor: 'operation' stamp: 'enp 11/3/2022 14:24:48'!
executeWithNorthOrientation: aMarsRoverController
	aMarsRoverController updateOrientation: West new.! !

!Left methodsFor: 'operation' stamp: 'enp 11/3/2022 14:24:53'!
executeWithSouthOrientation: aMarsRoverController
	aMarsRoverController updateOrientation: East new.! !

!Left methodsFor: 'operation' stamp: 'enp 11/3/2022 14:25:03'!
executeWithWestOrientation: aMarsRoverController
	aMarsRoverController updateOrientation: South new.! !


!classDefinition: #Right category: 'TDD-MarsRover'!
Command subclass: #Right
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Right methodsFor: 'operation' stamp: 'enp 11/3/2022 14:25:18'!
executeWithEastOrientation: aMarsRoverController
	aMarsRoverController updateOrientation: South new.! !

!Right methodsFor: 'operation' stamp: 'enp 11/3/2022 14:25:31'!
executeWithNorthOrientation: aMarsRoverController
	aMarsRoverController updateOrientation: East new.! !

!Right methodsFor: 'operation' stamp: 'enp 11/3/2022 14:25:41'!
executeWithSouthOrientation: aMarsRoverController
	 aMarsRoverController updateOrientation: West new.! !

!Right methodsFor: 'operation' stamp: 'enp 11/3/2022 14:25:47'!
executeWithWestOrientation: aMarsRoverController
	aMarsRoverController updateOrientation: North new.! !


!classDefinition: #MarsRoverController category: 'TDD-MarsRover'!
Object subclass: #MarsRoverController
	instanceVariableNames: 'position orientation command'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!MarsRoverController methodsFor: 'initialize' stamp: 'enp 11/1/2022 13:58:56'!
initializeStarting: aStartingPoint facing: aCardinalPoint.
	position := aStartingPoint.
	orientation := aCardinalPoint.
	! !


!MarsRoverController methodsFor: 'accessing' stamp: 'nt 11/2/2022 11:33:10'!
actualOrientation
	^ orientation actualOrientation.! !

!MarsRoverController methodsFor: 'accessing' stamp: 'enp 11/1/2022 14:01:58'!
actualPosition
	^ position.! !


!MarsRoverController methodsFor: 'operations' stamp: 'enp 11/3/2022 15:33:49'!
evaluateCommand: aCommand
	
	aCommand  = $L ifTrue:[ 
		^self executeCommand: Left.
		].
	aCommand  = $R ifTrue:[ 
		^self executeCommand: Right.
		].
	aCommand  = $F ifTrue:[ 
		^self executeCommand: Forward .
		].
	aCommand  = $B ifTrue:[ 
		^self executeCommand: Backwards .
		].
	
	self error: self class errorCommandDescription.! !

!MarsRoverController methodsFor: 'operations' stamp: 'enp 11/3/2022 15:20:48'!
executeCommand: anOrientation

	command := anOrientation new. 
	orientation execute: command in: self.! !

!MarsRoverController methodsFor: 'operations' stamp: 'enp 11/3/2022 15:44:48'!
receiveNewCommand: aString 
	|contador|
	contador := 0.
	[contador < (aString size) ] whileTrue: [
		contador := contador+1.
		self evaluateCommand: (aString at: contador ).
		].
! !

!MarsRoverController methodsFor: 'operations' stamp: 'enp 11/3/2022 14:24:13'!
updateOrientation: aChange

	orientation := aChange.! !

!MarsRoverController methodsFor: 'operations' stamp: 'enp 11/3/2022 14:20:34'!
updatePosition: aChange

	position := position + aChange.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRoverController class' category: 'TDD-MarsRover'!
MarsRoverController class
	instanceVariableNames: ''!

!MarsRoverController class methodsFor: 'as yet unclassified' stamp: 'enp 11/3/2022 15:01:16'!
errorCommandDescription

	^ 'Can not excecute this command'.! !

!MarsRoverController class methodsFor: 'as yet unclassified' stamp: 'enp 11/1/2022 13:59:15'!
starting: startingPoint facing: aCardinalPoint
	^MarsRoverController new initializeStarting: startingPoint facing: aCardinalPoint.
	! !


!classDefinition: #Orientation category: 'TDD-MarsRover'!
Object subclass: #Orientation
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!Orientation methodsFor: 'accessing' stamp: 'nt 11/2/2022 11:33:34'!
actualOrientation
	^self subclassResponsibility.! !


!Orientation methodsFor: 'operation' stamp: 'enp 11/3/2022 14:06:20'!
execute: aCommand in: aMarsRoverController   
	^self subclassResponsibility.! !


!classDefinition: #East category: 'TDD-MarsRover'!
Orientation subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!East methodsFor: 'operation' stamp: 'enp 11/3/2022 15:35:35'!
execute: aCommand in: aMarsRoverController   
	aCommand executeWithEastOrientation: aMarsRoverController.! !


!East methodsFor: 'accessing' stamp: 'nt 11/2/2022 11:34:26'!
actualOrientation
	^self! !


!classDefinition: #North category: 'TDD-MarsRover'!
Orientation subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!North methodsFor: 'operation' stamp: 'enp 11/3/2022 15:35:20'!
execute: aCommand in: aMarsRoverController   
	aCommand executeWithNorthOrientation: aMarsRoverController.! !


!North methodsFor: 'accessing' stamp: 'nt 11/2/2022 11:34:35'!
actualOrientation
	^self! !


!classDefinition: #South category: 'TDD-MarsRover'!
Orientation subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!South methodsFor: 'operation' stamp: 'enp 11/3/2022 15:35:28'!
execute: aCommand in: aMarsRoverController   
	aCommand executeWithSouthOrientation: aMarsRoverController.! !


!South methodsFor: 'accessing' stamp: 'nt 11/2/2022 11:34:41'!
actualOrientation
	^self! !


!classDefinition: #West category: 'TDD-MarsRover'!
Orientation subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD-MarsRover'!

!West methodsFor: 'accessing' stamp: 'nt 11/2/2022 11:42:44'!
actualOrientation
	^self! !


!West methodsFor: 'operation' stamp: 'enp 11/3/2022 15:35:32'!
execute: aCommand in: aMarsRoverController   
	aCommand executeWithWestOrientation: aMarsRoverController.! !
