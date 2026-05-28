
class Profesional {

    const universidadDondeEstudio

    const honorariosPorHora

    const provinciasDondePuedeTrabajar

    method universidadDondeEstudio() = universidadDondeEstudio

    method honorariosPorHora() =  honorariosPorHora

    method provinciasDondePuedeTrabajar() = provinciasDondePuedeTrabajar

}

class Universidad {

    const provinciaDondeSeUbica

    const honorarioRecomendadoPorHora

    method honorarioRecomendadoPorHora() = honorarioRecomendadoPorHora

    method provinciaDondeSeUbica() = provinciaDondeSeUbica

}

object vinculado {

    method honorarios(unaUniversidad) = unaUniversidad.honorarioRecomendadoPorHora()

    method provincias(unaUniversidad) = [unaUniversidad.provinciaDondeSeUbica()]

}

object asociadosDelLitoral {

    method honorarios() = 3000

    method provincias() = ["Entre Ríos", "Santa Fe", "Corrientes"]

}

class EmpresaDeServicios {

    var honorarios = 0

    const profesionales = []

    method contratar(unaPersona) { profesionales.add(unaPersona) }

    method despedir(unaPersona) { profesionales.remove(unaPersona) }

    method profesionales() = profesionales

    method honorarioSugerido() = honorarios

    method honorarioReferencia(nuevoValor) { honorarios = nuevoValor }

    method profQueEstudiaronEn(unaUniversidad) = profesionales.count({ p => p.universidadDondeEstudio() == unaUniversidad })

    method profesionalesCaros() = profesionales.filter({ p => p.honorariosPorHora() > self.honorarioSugerido() })

    method universidadesFormadoras() = profesionales.map({ p => p.universidadDondeEstudio() }).asSet()

    method profesionalMasBarato() = profesionales.min({ p => p.honorariosPorHora() })

    method esDeGenteAcotada() = profesionales.all({ p => p.provinciasDondePuedeTrabajar().size() <= 3 })

}