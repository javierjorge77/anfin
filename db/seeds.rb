
Litigante.destroy_all
Demanda.destroy_all
Consultation.destroy_all
User.destroy_all

puts 'Creating Users...'
user1= User.create(id: 1, email: "javierjorge77@gmail.com", password: "123456", username: "JJPO", admin: true)
user2= User.create(id: 2, email: "jptoro@anfin.cl", password: "123456", username: "Juan pedro", admin: true)



puts 'Consulta'
consulta1 = Consultation.create(rut: "12470886-9", nombre: "MICHELE ANTOINE SAINT-JEAN BUSTOS", user_id: 1, created_at: Date.today, updated_at: Date.today )

puts 'Demandas'

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
  consultation_id: 1
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
  consultation_id: 1

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

puts 'Creating Suscriptions'

event= Suscription.create!( sku: "1", name: "Pago por Evento", price: 5)
monthly= Suscription.create!( sku: "2", name: "Pago Mensual", price: 20)
yearly= Suscription.create!( sku: "2", name: "Pago Anual", price: 200)

puts 'Finished!'
