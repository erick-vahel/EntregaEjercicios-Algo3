!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/24/2022 20:02:05'!
actualTimeInMilliseconds

	^ Time millisecondClockValue * millisecond! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:10:47'!
assertCustomer: aCustomer inBook: aBook 

	^ self assert: (aBook includesCustomerNamed: aCustomer).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:38:45'!
assertErrorOn: actionWithCustomer ErrorType: errorType assertVerificationType: verificationType

	 [actionWithCustomer]
			on: errorType 
			do: verificationType.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:46:21'!
assertExistenceInCustomerBookFor: aCustomer in: aCustomerBook

	^ [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed: aCustomer) ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:46:51'!
assertExpectedAmountOfCustomersIn: aBook for: aCustomer active: expectedActiveCustomers suspended: expectedSuspendedCustomers total: expectedCustomers assertVerificationType: aVerificationType

	self assert: expectedActiveCustomers equals: aBook numberOfActiveCustomers.
	self assert: expectedSuspendedCustomers equals: aBook numberOfSuspendedCustomers.
	self assert: expectedCustomers equals: aBook numberOfCustomers.
	aVerificationType.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:26:38'!
assertExpectedExecutionTime: expectedTime forAction: anAction 

	|   millisecondsBeforeRunning millisecondsAfterRunning |
		
	millisecondsBeforeRunning := self actualTimeInMilliseconds.
	anAction.
	millisecondsAfterRunning := self actualTimeInMilliseconds.
	
	self assert: (millisecondsAfterRunning-millisecondsBeforeRunning) < (expectedTime ).
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:47:22'!
assertTest3VerificationTypeIn: aCustomerBook

	^ [ :anError | 
			self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
			self assert: aCustomerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:47:39'!
assertTest4VerificationTypeIn: aCustomerBook

	^ [ :anError | 
			self assert: aCustomerBook numberOfCustomers = 1.
			self assert: (aCustomerBook includesCustomerNamed:'John Lennon') ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'nt 9/25/2022 16:58:35'!
denyCustomer: aCustomer inBook: aBook 

	^ self deny : (aBook includesCustomerNamed: aCustomer)! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:26:38'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	
	self assertExpectedExecutionTime:  (50*millisecond) forAction: [customerBook addCustomerNamed: 'John Lennon'].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:26:38'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook |
	
	customerBook := CustomerBook new.
	customerBook addCustomerNamed: 'Paul McCartney'.
	
	self assertExpectedExecutionTime:  (100*millisecond) forAction: [customerBook removeCustomerNamed: 'Paul McCartney'].
	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:38:45'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self assertErrorOn: [customerBook addCustomerNamed: ''. self fail] ErrorType: Error assertVerificationType: [self assertTest3VerificationTypeIn: customerBook].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:38:45'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook  |
			
	customerBook := CustomerBook new.

	customerBook addCustomerNamed: 'John Lennon'.
		
	self assertErrorOn: [ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ] ErrorType: NotFound assertVerificationType: [self assertTest4VerificationTypeIn: customerBook].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:44:14'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertExpectedAmountOfCustomersIn: customerBook for: paulMcCartney active: 0 suspended: 1 total: 1 assertVerificationType: [self assertCustomer: paulMcCartney inBook: customerBook ].
	

	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:44:14'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook new.
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertExpectedAmountOfCustomersIn: customerBook for: paulMcCartney active: 0 suspended: 0 total: 0 assertVerificationType: [self denyCustomer: paulMcCartney inBook: customerBook].


	
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:46:21'!
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertErrorOn: [ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ] ErrorType: CantSuspend assertVerificationType: [self assertExistenceInCustomerBookFor: johnLennon in: customerBook].! !

!CustomerBookTest methodsFor: 'testing' stamp: 'enp 9/25/2022 17:46:21'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	
	self assertErrorOn: [ customerBook suspendCustomerNamed: johnLennon.
	self fail ] ErrorType: CantSuspend assertVerificationType: [self assertExistenceInCustomerBookFor: johnLennon in: customerBook].! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active millisecondsBeforeAction millisecondsAfterAction'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
includesCustomerNamed: aName

	^(active includes: aName) or: [ suspended includes: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'NR 4/3/2019 10:14:26'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'enp 9/24/2022 18:47:16'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(self includesCustomerNamed: aName ) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'enp 9/24/2022 18:21:03'!
numberOfCustomers
	
	^ self numberOfActiveCustomers  + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'enp 9/24/2022 18:41:29'!
removeCustomerNamed: aName 

	^active remove: aName ifAbsent: [
			^suspended remove: aName ifAbsent: [^ NotFound signal.].
		].
	
	
	
! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
suspendCustomerNamed: aName 
	
	(active includes: aName) ifFalse: [^CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName
! !


!CustomerBook methodsFor: 'as yet unclassified' stamp: 'enp 9/24/2022 18:05:46'!
millisecondsForActionWithCustomer
	^ millisecondsAfterAction - millisecondsBeforeAction.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:18'!
customerAlreadyExistsErrorMessage

	^'Customer Already Exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'NR 4/30/2020 09:05:25'!
customerCanNotBeEmptyErrorMessage

	^'Customer Name Cannot Be Empty'! !
