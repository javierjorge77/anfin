# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1= User.create(id: 1, email: "javierjorge77@gmail.com", password: "123456", username: "JJPO")

consulta1 = Consultation.create(rut: "12470886-9", nombre: "Juan Camaney", user_id: 1, created_at: Date.today, updated_at: Date.today )

demanda1= Demanda.create!(tipo: "civil",
  estado: "Tramitación ",
  estadoCausa: "Sin archivar",
  etapa: "1 Verificación de créditos",
  fechaingreso: "2017-07-21T00:00:00.000Z",
  link: "https://civil.pjud.cl/CIVILPORWEB/ConsultaDetalleAtPublicoAccion.do?TIP_Consulta=1&TIP_Cuaderno=86&CRR_IdCuaderno=24183771&ROL_Causa=10745&TIP_Causa=C&ERA_Causa=2017&CRR_IdCausa=19299794&COD_Tribunal=390&TIP_Informe=1&",
  linkPdf: "",
  LinkEbook: nil,
  proc: "Concursal de Liquidación Voluntaria - Empresa Deudora",
  rol: "C-10745-2017",
  tribunal: "4º Juzgado Civil de San Miguel",
  consultation_id: 1,
)

demanda2= Demanda.create!(tipo: "laboral",
  estado: "Concluido ",
  estadoCausa: "Archivada",
  etapa: "15 Terminada ",
  fechaingreso: "2011-12-05T00:00:00.000Z",
  link: "https://civil.pjud.cl/CIVILPORWEB/ConsultaDetalleAtPublicoAccion.do?TIP_Consulta=1&TIP_Cuaderno=49&CRR_IdCuaderno=9810329&ROL_Causa=80932&TIP_Causa=C&ERA_Causa=2011&CRR_IdCausa=7972394&COD_Tribunal=390&TIP_Informe=1&",
  linkPdf: nil,
  LinkEbook: "",
  proc: "Gestión Preparatoria (Citac.Conf.Deuda)",
  rol: "C-80932-2011",
  tribunal: "4º Juzgado Civil de San Miguel",
  consultation_id: 1,

)


demanda3= Demanda.create!(tipo: "cobranza",
  estado: "Tramitación ",
  estadoCausa: "Archivada",
  etapa: "1 Terminada ",
  fechaingreso: "2019-05-30T00:00:00.000Z",
  link: "https://civil.pjud.cl/CIVILPORWEB/ConsultaDetalleAtPublicoAccion.do?TIP_Consulta=1&TIP_Cuaderno=49&CRR_IdCuaderno=29721142&ROL_Causa=17908&TIP_Causa=C&ERA_Causa=2019&CRR_IdCausa=23632078&COD_Tribunal=264&TIP_Informe=1&",
  linkPdf: nil,
  LinkEbook: nil,
  proc: "Gestión Preparatoria (Citac.Conf.Deuda)",
  rol: "C-17908-2019",
  tribunal: "6º Juzgado Civil de Santiago",
  consultation_id: 1,

)
