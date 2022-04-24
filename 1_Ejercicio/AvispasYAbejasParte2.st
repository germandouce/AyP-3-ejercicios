!classDefinition: #ElHabitatDeJuan category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitatDeJuan
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitatDeJuan class' category: 'AvispasYAbejasParte2'!
ElHabitatDeJuan class
	instanceVariableNames: 'orugas polillas dictHuevos'!

!ElHabitatDeJuan class methodsFor: 'MetodosOriana' stamp: 'GD 4/24/2022 15:59:07'!
cantidadHuevosFirmaGeneticaOriana
	^dictHuevos at: 'huevosFirmaGeneticaOriana'. ! !

!ElHabitatDeJuan class methodsFor: 'MetodosOriana' stamp: 'GD 4/24/2022 15:52:40'!
ponerUnHuevoFirmaGeneticaOriana
	|cantHuevos|
	cantHuevos := dictHuevos at: 'huevosFirmaGeneticaOriana'.
	
	dictHuevos at: 'huevosFirmaGeneticaOriana'  put: cantHuevos + 1.! !


!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:24:24'!
agregarOrugas: unaCantidad
	orugas := orugas + unaCantidad.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:37:45'!
agregarPolillas: UnaCantidad
	polillas := polillas + UnaCantidad.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/24/2022 15:55:48'!
cantidadDeHuevosDeAvispas
	^ (dictHuevos at: 'huevosFirmaGeneticaOriana') + (dictHuevos at:'huevosFirmaGeneticaPolly') + (dictHuevos at: 'huevosFirmaGeneticaLara').
	! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 12:30:10'!
cantidadDeOrugas
	^orugas.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:39:15'!
cantidadDePolillas
	^polillas.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:06:55'!
hayOrugas
	^orugas > 0.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 14:04:25'!
hayPolillas
	^polillas>0.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:04:30'!
quitarUnaOruga
	orugas := orugas - 1 ! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:44:23'!
quitarUnaPolilla
	polillas := polillas - 1.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/24/2022 15:29:13'!
reiniciarHuevos
	
	dictHuevos := Dictionary new.
	
	dictHuevos at: 'huevosFirmaGeneticaOriana' put: 0.
	dictHuevos at: 'huevosFirmaGeneticaPolly' put: 0.
	dictHuevos at: 'huevosFirmaGeneticaLara' put: 0.! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:03:14'!
reiniciarOrugas
	orugas := 0! !

!ElHabitatDeJuan class methodsFor: 'Habitat' stamp: 'GD 4/22/2022 13:40:45'!
reiniciarPolillas
	polillas := 0.! !


!ElHabitatDeJuan class methodsFor: 'MetodosPolly' stamp: 'GD 4/24/2022 15:59:43'!
cantidadHuevosFirmaGeneticaPolly
	^dictHuevos at: 'huevosFirmaGeneticaPolly'.! !

!ElHabitatDeJuan class methodsFor: 'MetodosPolly' stamp: 'GD 4/24/2022 16:05:45'!
ponerUnHuevoFirmaGeneticaPolly
	|cantHuevos| 		
	cantHuevos := dictHuevos at: 'huevosFirmaGeneticaPolly'.
	
	dictHuevos at: 'huevosFirmaGeneticaPolly' put: cantHuevos + 1.! !


!ElHabitatDeJuan class methodsFor: 'MetodosLara' stamp: 'GD 4/24/2022 15:58:11'!
cantidadHuevosFirmaGeneticaLara
	^ dictHuevos at: 'huevosFirmaGeneticaLara'.
	! !

!ElHabitatDeJuan class methodsFor: 'MetodosLara' stamp: 'GD 4/24/2022 16:03:16'!
hayHuevosFirmaGeneticaOrianaOPolly
	^(dictHuevos at: 'huevosFirmaGeneticaOriana') + (dictHuevos at: 'huevosFirmaGeneticaPolly') > 0! !

!ElHabitatDeJuan class methodsFor: 'MetodosLara' stamp: 'GD 4/24/2022 16:06:22'!
ponerUnHuevoFirmaGeneticaLara
	|cantHuevos| 		
	cantHuevos := dictHuevos at: 'huevosFirmaGeneticaLara'.
	
	dictHuevos at: 'huevosFirmaGeneticaLara' put: cantHuevos + 1.! !

!ElHabitatDeJuan class methodsFor: 'MetodosLara' stamp: 'GD 4/24/2022 16:17:58'!
quitarUnHuevoFirmaGeneticaOrianaOPolly
	
	|cantHuevosOriana cantHuevosPolly |
	cantHuevosOriana  := dictHuevos at: 'huevosFirmaGeneticaOriana'.
	cantHuevosPolly  := dictHuevos at: 'huevosFirmaGeneticaPolly'.	
	
	cantHuevosOriana > 0 ifTrue:
	[dictHuevos at: 'huevosFirmaGeneticaOriana' put: cantHuevosOriana -1]
	
	ifFalse:
	[dictHuevos at: 'huevosFirmaGeneticaPolly' put: cantHuevosPolly -1]! !


!ElHabitatDeJuan class methodsFor: '--** private fileout/in **--' stamp: 'GD 4/24/2022 16:20:54'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugas := 0.
	polillas := 0.
	dictHuevos := ((Dictionary new) add: ('huevosFirmaGeneticaLara'->0); add: ('huevosFirmaGeneticaOriana'->0); add: ('huevosFirmaGeneticaPolly'->0); yourself).! !


!classDefinition: #Lara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Lara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Lara class' category: 'AvispasYAbejasParte2'!
Lara class
	instanceVariableNames: ''!

!Lara class methodsFor: 'reproduccion' stamp: 'GD 4/22/2022 15:36:09'!
intentarReproducirse
	ElHabitatDeJuan hayHuevosFirmaGeneticaOrianaOPolly ifTrue:
		[ElHabitatDeJuan ponerUnHuevoFirmaGeneticaLara.
		ElHabitatDeJuan quitarUnHuevoFirmaGeneticaOrianaOPolly].! !


!classDefinition: #Oriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Oriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oriana class' category: 'AvispasYAbejasParte2'!
Oriana class
	instanceVariableNames: ''!

!Oriana class methodsFor: 'reproduccion' stamp: 'GD 4/22/2022 14:58:06'!
intentarReproducirse
	ElHabitatDeJuan hayOrugas ifTrue:
		[ElHabitatDeJuan ponerUnHuevoFirmaGeneticaOriana.
		ElHabitatDeJuan quitarUnaOruga].! !


!classDefinition: #Ornella category: 'AvispasYAbejasParte2'!
Oriana subclass: #Ornella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!


!classDefinition: #Polly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Polly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polly class' category: 'AvispasYAbejasParte2'!
Polly class
	instanceVariableNames: ''!

!Polly class methodsFor: 'reproduccion' stamp: 'GD 4/22/2022 14:58:47'!
intentarReproducirse
	ElHabitatDeJuan hayPolillas ifTrue:
		[ElHabitatDeJuan ponerUnHuevoFirmaGeneticaPolly.
		ElHabitatDeJuan quitarUnaPolilla].! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test01EnElInicioDeLosTiemposNoHayHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeOrugas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeOrugas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeOrugas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDePolillas
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDePolillas
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self habitat cantidadDeHuevosDeAvispas
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaOriana intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDePolly
		isEqualTo: 1.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella
		isEqualTo: 1.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'GD 4/22/2022 15:23:57'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeLara
		isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'GD 4/22/2022 15:39:35'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos.
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDePolly
		isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos.
	self laAvispaLara intentarReproducirse.
	Assert
		that: self cantidadDeHuevosConLaFirmaGeneticaDeLara
		isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 15:12:47'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ElHabitatDeJuan cantidadHuevosFirmaGeneticaLara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 15:00:48'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ElHabitatDeJuan cantidadHuevosFirmaGeneticaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 15:00:08'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ElHabitatDeJuan cantidadHuevosFirmaGeneticaOriana.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 15:01:40'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ElHabitatDeJuan cantidadHuevosFirmaGeneticaPolly.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/21/2022 20:05:46'!
habitat
	^ElHabitatDeJuan! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 14:06:31'!
hacerQueElHabitatTengaLosRecursosSuficientes
	ElHabitatDeJuan agregarOrugas: 2.
	ElHabitatDeJuan agregarPolillas: 2.	! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 15:12:12'!
laAvispaLara
	^Lara.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 14:02:06'!
laAvispaOriana
	^Oriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 14:41:20'!
laAvispaOrnella
	^Ornella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 14:02:21'!
laAvispaPolly
	^Polly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 13:24:54'!
queElHabitatTengaDosOrugasMas
	ElHabitatDeJuan agregarOrugas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 14:01:25'!
queElHabitatTengaDosPolillasMas
	ElHabitatDeJuan agregarPolillas: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 13:25:17'!
queElHabitatTengaUnaOrugaMas
	ElHabitatDeJuan agregarOrugas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 13:37:23'!
queElHabitatTengaUnaPolillaMas
	ElHabitatDeJuan agregarPolillas: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'GD 4/22/2022 13:40:53'!
retrocederElHabitatAlInicioDeLosTiempos
	ElHabitatDeJuan reiniciarHuevos.
	ElHabitatDeJuan reiniciarOrugas.
	ElHabitatDeJuan reiniciarPolillas.! !

ElHabitatDeJuan initializeAfterFileIn!