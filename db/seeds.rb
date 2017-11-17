# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

services_list = [
	"Sin Servicio Asignado",
	"Admisión CMI",
	"Alimentación y Nutrición",
	"Anatomía Patológica",
	"Anestesiología",
	"Arancelamiento",
	"Archivo Central",
	"Archivo CMI",
	"Bacteriología - Bioquimicos",
	"Bacteriología - Tecnicos",
	"Camilleros ",
	"Cardiología",
	"Cirugía",
	"Clínica médica",
	"Conmutador - CMI ",
	"Cuidados Paliativos",
	"Diagnóstico por Imágenes",
	"Electromedicina",
	"Enfermería - Caps Playa Unión",
	"Enfermería - Centro Obstetrico",
	"Enfermería - Clínica médica",
	"Enfermería - Clínica Quirúrgica",
	"Enfermería - Consultorios Externos",
	"Enfermería - Control De Infecciones",
	"Enfermería - Cuidados Paliativos",
	"Enfermería - Gastroenterología",
	"Enfermería - Jefatura Y Supervisión",
	"Enfermería - Neonatología",
	"Enfermería - Oncología",
	"Enfermería - Pediatría",
	"Enfermería - Prevalentes / Vacunación",
	"Enfermería - Quirófano",
	"Enfermería - Quirófano / CMI",
	"Enfermería - Salud Mental",
	"Enfermería - Tocoginecología",
	"Enfermería - Traumatología",
	"Enfermería - UCI",
	"Enfermería - UMU",
	"Enfermería - UTI",
	"Enfermería - UTIP",
	"Enfermería - Área Externa",
	"Enfermería - Área Externa  - Inmunizaciones",
	"Estadística y Arancelamiento CMI",
	"Estadísticas",
	"Estadísticas  CMI",
	"Esterilización",
	"Farmacia",
	"Gastroenterología",
	"Hemoterapia Y Banco De Sangre",
	"Hemoterapia Y Banco De Sangre - CMI ",
	"Instrumentación Quirúrgica - CMI",
	"Instrumentación Quirúrgica",
	"Kinesiología",
	"Laboratorio - Bioquímicos",
	"Laboratorio - Técnicos",
	"Mantenimiento",
	"Morgue",
	"Neonatología",
	"Neurocirugía",
	"Neurología",
	"Neurología Infantil",
	"Obstetricia",
	"Odontología",
	"Oftalmología",
	"Oncología",
	"Oxígeno",
	"Pediatría",
	"Radiología",
	"Radiología - Profesionales",
	"Radiología - Técnicos",
	"Referencia Y Contrarreferencia",
	"Rehabilitación",
	"Rehabilitación - Pichi Anai",
	"Salud Mental",
	"Salud Mental - Centro De Día Y Empresa Social",
	"Tocoginecología",
	"Tocoginecología  (C/Ecografía)",
	"Tomografía",
	"Transporte",
	"Traumatología",
	"UAU - Admisión ",
	"UAU - Internación",
	"UMU",
	"Urología",
	"UTI",
	"UTI - Uce",
	"UTIP",
	"Área Externa",
	"Área Externa - Caps 30 De Octubre",
	"Área Externa - Caps Laprida",
	"Área Externa - Caps Máximo Abasolo",
	"Área Externa - Caps Prospero Palazzo",
	"Área Externa - Caps Quirno Costa",
	"Área Externa - Caps San Cayetano",
	"Área Externa - Caps Standard Norte",
	"Área Externa - Transporte",
	"Área Externa - Vacunatorio"
]

services_list.each do |nombre|
	Service.find_or_create_by(name:nombre)
end

dependencia_list = [
	["100","Casa del Chubut",10,"CDC"],
	["101","Nivel Central", 10, "NC"],
	["102","Medio Ambiente", 10,"NCMD"],
	["120","D.P.A.P.E", 9,"DPAPE"],
	["105","D.P.A.P.N", 9],
	["154","D.P.A.P.C.R",9],
	["107","D.P.A.P.T",9],
	["143","Hospital Regional Comodoro Rivadavia", 8,"HRCR"],
	["103","Hospital Zonal Trelew", 6,"HZT"],
	["104","Hospital Zonal Puerto Madryn", 6,"HZPM"],
	["121","Hospital Zonal Esquel", 6,"HZE"],
	["456","Hospital Zonal Alvear", 6],
	["106","Hospital Subzonal Rawson",4,"HSR"],
	["222","Hospital Subzonal El Maiten",4,"HSEM"],

	#D.P.A.P.E
	["235","Hospital Rural Trevelin",3,"HRTvl"],
	["327","Hospital Rural Cholila",3,"HRCll"],
	["328","Hospital Rural Gobernador Costa",3,"HRCC"],
	["329","Hospital Rural Gualjaina",3,"HRGlj"],
	["330","Hospital Rural Jose de San Martin",3, "HRJS"],
	["331","Hospital Rural Lago Puelo",3, "HRLP"],
	["334","Hospital Rural Tecka",3,"HRTck"],
	["339","Hospital Rural Epuyen",3,"HREpy"],
	["340","Hospital Rural El Hoyo",3, "HREH"],
	["423","Hospital Rural Cushamen",3],
	["424","Hospital Rural Corcovado",3],
	["426","Hospital Rural Cerro Centinela",3],
	["432","Hospital Rural Rio Pico",3],
	["433","Hospital Rural Las Palmas",3],
	["436","Hospital Rural Los Cipreses",3],
	["437","Puesto Sanitario Los Alerces",0],
	["438","Puesto Sanitario Lago Rosario",0],
	["441","Puesto Sanitario Colan-Conhue",0],
	["442","Puesto Sanitario Paso del Sapo",0],
	#D.P.A.P.T
	["208","Hospital Rural Dolavon",3],
	["210","Hospital Rural 28 de Julio",3],
	["211","Hospital Rural Gaiman",3],
	["307","Hospital Rural Camarones",3],
	["309","Hospital Rural Dique Florentino Ameghino",3],
	["312","Hospital Rural Las Plumas",3],
	["314","Hospital Rural Paso de Indios",3],
	["315","Puesto Sanitario Los Altares",0],
	["413","Puesto Sanitario El Mirasol",0],
	#D.P.A.P.N
	
	["305","Hospital Rural Puerto Piramides",3],
	["316","Hospital Rural Telsen",3],	
	["418","Hospital Rural Gan Gan",3],
	["419","Hospital Rural Gastre",3],
	["420","Puesto Sanitario Lagunita Salada",0],
	["417","Puesto Sanitario Sepaucal",0],
	#D.P.A.P.C.R
	["153","Hospital Rural La Prida",3],
	["244","Hospital Rural Diadema Argentina",3],
	["245","Hospital Rural Sarmiento",3],
	["347","Hospital Rural Rio Mayo",3],
	["352","Hospital Rural Rio Senguer",3],
	["457","Hospital Rural Rada Tilly",3],
	["446","Puesto Sanitario Buen Pasto",0],
	["448","Puesto Sanitario Facundo",0],
	["449","Puesto Sanitario Ricardo Rojas",0],
	["450","Puesto Sanitario Lago Blanco",0],
	["451","Puesto Sanitario Aldea Beleiro",0],
	["453","Puesto Sanitario Aldea Apeleg",0]
]
dependencia_list.each do |codigo, nombre, complexity|
	dep = Dependence.find_or_create_by(code:codigo, name:nombre, complexity: complexity)
	ServiceOfDependence.find_or_create_by(service_id: 1, dependence_id:dep.id, description: "Carga Inicial")	

end


service_of_dependence_list = [

	[106,4,false,0.600,0.800,0.232],
	[106,5,false,0.600,0.800,0.232],
	[106,7,false,0.700,1.000,0.232],
	[106,14,true,0.600,0.800,0.232],
	[106,16,true,0.600,0.800,0.232],
	[106,21,false,0.600,0.800,0.232],
	[106,23,false,0.600,0.800,0.232],
	[106,29,false,0.600,0.800,0.232],
	[106,32,false,0.600,0.800,0.232],
	[106,34,false,0.600,0.800,0.232],
	[106,36,false,0.600,0.800,0.290],
	[106,37,false,0.600,0.800,0.232],
	[106,40,false,0.600,0.800,0.232],
	[106,46,false,0.700,1.000,0.232],
	[106,49,false,0.700,0.900,0.232],
	[106,51,false,0.700,0.900,0.232],
	[106,56,true,0.700,0.900,0.232],
	[106,57,false,0.700,0.900,0.232],
	[106,68,false,0.600,0.800,0.232],
	[106,71,true,0.600,0.800,0.232],
	[106,72,false,0.700,0.900,0.290],
	[106,76,false,0.700,0.900,0.290],
	[106,78,false,0.600,0.800,0.290],
	[106,80,true,0.600,0.800,0.232],
	[106,84,false,0.600,0.800,0.232],
	[456,14,true,0.600,0.800,0.232],
	[456,16,true,0.600,0.800,0.232],
	[456,19,false,0.700,0.900,0.232],
	[456,24,false,0.600,0.800,0.232],
	[456,25,false,0.600,0.800,0.232],
	[456,39,false,0.600,0.800,0.232],
	[456,40,false,0.600,0.800,0.232],
	[456,41,false,0.600,0.800,0.290],
	[456,46,false,0.700,1.000,0.232],
	[456,49,false,0.700,0.900,0.232],
	[456,50,false,0.600,0.800,0.232],
	[456,53,false,0.700,0.900,0.232],
	[456,55,false,0.700,0.900,0.232],
	[456,56,true,0.700,0.900,0.232],
	[456,57,false,0.700,0.900,0.232],
	[456,72,false,0.700,0.900,0.290],
	[456,88,true,0.600,0.800,0.232],
	[456,90,true,0.600,0.800,0.290],
	[143,3,false,0.700,0.900,0.232],
	[143,4,false,0.600,0.800,0.232],
	[143,5,false,0.600,0.800,0.232],
	[143,6,false,0.700,1.000,0.232],
	[143,6,false,0.700,1.000,0.232],
	[143,93,false,0.600,0.800,0.232],
	[143,94,false,0.600,0.800,0.232],
	[143,95,false,0.600,0.800,0.232],
	[143,96,false,0.600,0.800,0.232],
	[143,97,false,0.600,0.800,0.232],
	[143,98,false,0.600,0.800,0.232],
	[143,99,false,0.600,0.800,0.232],
	[143,100,false,0.600,0.800,0.232],
	[143,102,false,0.600,0.800,0.232],
	[143,14,true,0.600,0.800,0.232],
	[143,16,true,0.600,0.800,0.232],
	[143,20,false,0.700,0.900,0.232],
	[143,22,false,0.600,0.800,0.232],
	[143,23,false,0.600,0.800,0.232],
	[143,24,false,0.600,0.800,0.232],
	[143,25,false,0.600,0.800,0.232],
	[143,29,false,0.600,0.800,0.232],
	[143,30,false,0.600,0.800,0.290],
	[143,31,false,0.600,0.800,0.232],
	[143,32,false,0.600,0.800,0.232],
	[143,34,false,0.600,0.800,0.232],
	[143,34,false,0.600,0.800,0.232],
	[143,36,false,0.600,0.800,0.290],
	[143,37,false,0.600,0.800,0.232],
	[143,40,false,0.600,0.800,0.232],
	[143,41,false,0.600,0.800,0.290],
	[143,42,false,0.600,0.800,0.290],
	[143,42,false,0.600,0.800,0.290],
	[143,48,false,0.700,0.900,0.232],
	[143,48,false,0.700,0.900,0.232],
	[143,49,false,0.700,0.900,0.232],
	[143,51,false,0.700,0.900,0.232],
	[143,53,false,0.700,0.900,0.232],
	[143,55,false,0.700,0.900,0.232],
	[143,56,true,0.700,0.900,0.232],
	[143,57,false,0.700,0.900,0.232],
	[143,58,false,0.500,1.000,0.232],
	[143,60,true,0.600,0.800,0.290],
	[143,64,true,0.600,0.800,0.232],
	[143,67,false,0.600,0.800,0.232],
	[143,70,false,0.500,1.000,0.232],
	[143,71,true,0.600,0.800,0.232],
	[143,78,false,0.600,0.800,0.290],
	[143,80,true,0.600,0.800,0.232],
	[143,83,false,0.500,1.000,0.232],
	[143,84,false,0.600,0.800,0.232],
	[143,86,false,0.700,1.000,0.232],
	[143,88,true,0.600,0.800,0.232],
	[143,92,true,0.600,0.800,0.290],
	[121,4,false,0.600,0.800,0.232],
	[121,5,false,0.600,0.800,0.232],
	[121,6,false,0.700,1.000,0.232],
	[121,14,true,0.600,0.800,0.232],
	[121,16,true,0.600,0.800,0.232],
	[121,18,false,0.600,0.800,0.232],
	[121,19,false,0.700,0.900,0.232],
	[121,23,false,0.600,0.800,0.232],
	[121,24,false,0.600,0.800,0.232],
	[121,27,false,0.600,0.800,0.232],
	[121,28,false,0.600,0.800,0.232],
	[121,30,false,0.600,0.800,0.290],
	[121,31,false,0.600,0.800,0.232],
	[121,32,false,0.600,0.800,0.232],
	[121,34,false,0.600,0.800,0.232],
	[121,36,false,0.600,0.800,0.290],
	[121,37,false,0.600,0.800,0.232],
	[121,40,false,0.600,0.800,0.232],
	[121,41,false,0.600,0.800,0.290],
	[121,46,false,0.700,1.000,0.232],
	[121,48,false,0.700,0.900,0.232],
	[121,49,false,0.700,0.900,0.232],
	[121,50,false,0.600,0.800,0.232],
	[121,51,false,0.700,0.900,0.232],
	[121,53,false,0.700,0.900,0.232],
	[121,55,false,0.700,0.900,0.232],
	[121,56,true,0.700,0.900,0.232],
	[121,57,false,0.700,0.900,0.232],
	[121,58,false,0.500,1.000,0.232],
	[121,60,true,0.600,0.800,0.290],
	[121,61,false,0.600,0.800,0.232],
	[121,62,false,0.600,0.800,0.232],
	[121,64,true,0.600,0.800,0.232],
	[121,68,false,0.600,0.800,0.232],
	[121,71,true,0.600,0.800,0.232],
	[121,72,false,0.700,0.900,0.290],
	[121,78,false,0.600,0.800,0.290],
	[121,80,true,0.600,0.800,0.232],
	[121,82,false,0.700,0.900,0.232],
	[121,83,false,0.500,1.000,0.232],
	[121,84,false,0.600,0.800,0.232],
	[121,88,true,0.600,0.800,0.232],
	[121,89,false,0.600,0.800,0.232],
	[121,90,true,0.600,0.800,0.290],
	[104,3,false,0.700,0.900,0.232],
	[104,4,false,0.600,0.800,0.232],
	[104,5,false,0.600,0.800,0.232],
	[104,6,false,0.700,1.000,0.232],
	[104,7,false,0.700,1.000,0.232],
	[104,101,false,0.500,1.000,0.232],
	[104,12,false,0.500,1.000,0.232],
	[104,13,false,0.600,0.800,0.232],
	[104,14,true,0.600,0.800,0.232],
	[104,16,true,0.600,0.800,0.232],
	[104,19,false,0.700,0.900,0.232],
	[104,44,false,0.600,0.800,0.232],
	[104,23,false,0.600,0.800,0.232],
	[104,24,false,0.600,0.800,0.232],
	[104,25,false,0.600,0.800,0.232],
	[104,26,false,0.600,0.800,0.232],
	[104,29,false,0.600,0.800,0.232],
	[104,30,false,0.600,0.800,0.290],
	[104,32,false,0.600,0.800,0.232],
	[104,34,false,0.600,0.800,0.232],
	[104,36,false,0.600,0.800,0.290],
	[104,37,false,0.600,0.800,0.232],
	[104,40,false,0.600,0.800,0.232],
	[104,41,false,0.600,0.800,0.290],
	[104,42,false,0.600,0.800,0.290],
	[104,48,false,0.700,0.900,0.232],
	[104,49,false,0.700,0.900,0.232],
	[104,51,false,0.700,0.900,0.232],
	[104,53,false,0.700,0.900,0.232],
	[104,56,true,0.700,0.900,0.232],
	[104,57,false,0.700,0.900,0.232],
	[104,58,false,0.500,1.000,0.232],
	[104,60,true,0.600,0.800,0.290],
	[104,61,false,0.600,0.800,0.232],
	[104,62,false,0.600,0.800,0.232],
	[104,63,false,0.600,0.800,0.232],
	[104,66,true,0.600,0.800,0.232],
	[104,68,false,0.600,0.800,0.232],
	[104,69,false,0.600,0.800,0.232],
	[104,71,true,0.600,0.800,0.232],
	[104,75,false,0.700,0.900,0.232],
	[104,76,false,0.700,0.900,0.290],
	[104,78,false,0.600,0.800,0.290],
	[104,80,true,0.600,0.800,0.232],
	[104,83,false,0.500,1.000,0.232],
	[104,84,false,0.600,0.800,0.232],
	[104,85,false,0.700,1.000,0.232],
	[104,87,false,0.700,1.000,0.232],
	[104,88,true,0.600,0.800,0.232],
	[104,91,true,0.600,0.800,0.290],
	[104,92,true,0.600,0.800,0.290],
	[103,2,false,0.700,1.000,0.232],
	[103,4,false,0.600,0.800,0.232],
	[103,5,false,0.600,0.800,0.232],
	[103,6,false,0.700,1.000,0.232],
	[103,8,false,0.700,1.000,0.232],
	[103,9,true,0.700,0.900,0.232],
	[103,10,false,0.700,0.900,0.232],
	[103,11,false,0.500,1.000,0.232],
	[103,13,false,0.600,0.800,0.232],
	[103,15,true,0.600,0.800,0.232],
	[103,16,true,0.600,0.800,0.232],
	[103,17,false,0.700,1.000,0.232],
	[103,20,false,0.700,0.900,0.232],
	[103,43,false,0.600,0.800,0.232],
	[103,23,false,0.600,0.800,0.232],
	[103,24,false,0.600,0.800,0.232],
	[103,25,false,0.600,0.800,0.232],
	[103,29,false,0.600,0.800,0.232],
	[103,30,false,0.600,0.800,0.290],
	[103,32,false,0.600,0.800,0.232],
	[103,33,false,0.600,0.800,0.232],
	[103,34,false,0.600,0.800,0.232],
	[103,35,false,0.600,0.800,0.232],
	[103,36,false,0.600,0.800,0.290],
	[103,37,false,0.600,0.800,0.232],
	[103,38,false,0.600,0.800,0.232],
	[103,40,false,0.600,0.800,0.232],
	[103,41,false,0.600,0.800,0.290],
	[103,42,false,0.600,0.800,0.290],
	[103,45,false,0.700,1.000,0.232],
	[103,46,false,0.700,1.000,0.232],
	[103,47,false,0.700,1.000,0.232],
	[103,48,false,0.700,0.900,0.232],
	[103,49,false,0.700,0.900,0.232],
	[103,52,false,0.700,0.900,0.232],
	[103,53,false,0.700,0.900,0.232],
	[103,54,false,0.700,0.900,0.232],
	[103,55,false,0.700,0.900,0.232],
	[103,56,true,0.700,0.900,0.232],
	[103,57,false,0.700,0.900,0.232],
	[103,58,false,0.500,1.000,0.232],
	[103,59,false,0.700,0.900,0.232],
	[103,60,true,0.600,0.800,0.290],
	[103,65,true,0.600,0.800,0.232],
	[103,68,false,0.600,0.800,0.232],
	[103,71,true,0.600,0.800,0.232],
	[103,73,false,0.700,0.900,0.290],
	[103,74,false,0.700,0.900,0.290],
	[103,77,false,0.700,0.900,0.290],
	[103,78,false,0.600,0.800,0.290],
	[103,79,false,0.600,0.800,0.290],
	[103,81,true,0.600,0.800,0.232],
	[103,83,false,0.500,1.000,0.232],
	[103,84,false,0.600,0.800,0.232],
	[103,88,true,0.600,0.800,0.232],
	[103,90,true,0.600,0.800,0.290],
	[103,92,true,0.600,0.800,0.290]
]

service_of_dependence_list.each do |dep_code, service_id, con_guardia, jefatura, asistencial, ausentismo|
	ServiceOfDependence.find_or_create_by(dependence:Dependence.where(code:dep_code).first, service: Service.where(id: service_id).first, con_guardia: con_guardia, jefatura: jefatura, asistencial: asistencial, ausentismo: ausentismo, description: "Carga Inicial")
end

categoria_list = [
  	[1,"Programa Mejora"],
  	[2,"Hs Cátedra"],
  	[3,""],
  	[4,""],
  	[5,""],
  	[6,""],
  	[7,""],
  	[8,""],
  	[9,""],
  	[10,""],
  	[11,""],
  	[12,""],
  	[13,""],
  	[14,""],
  	[15,""],
  	[16,""],
  	[17,""],
  	[18,""],
  	[19,"Mensualizados P/G"],
]

categoria_list.each do |numero, descripcion|
	Category.find_or_create_by(code:numero, description: descripcion)
end

positions_list = [
	["1", "1", "1", "0", Category.where(code: 9).first],
	["1", "1", "2", "1", Category.where(code: 10).first],
	["1", "1", "3", "2", Category.where(code: 11).first],
	["1", "1", "4", "3", Category.where(code: 12).first],
	["1", "1", "5", "4", Category.where(code: 13).first],
	["1", "1", "6", "5", Category.where(code: 14).first],
	["1", "1", "7", "6", Category.where(code: 15).first],
	["1", "1", "8", "7", Category.where(code: 16).first],
	["1", "1", "9", "8", Category.where(code: 17).first],
	["1", "1", "10", "9", Category.where(code: 18).first],
	
	["1", "2", "1", "0", Category.where(code: 8).first],
	["1", "2", "2", "1", Category.where(code: 9).first],
	["1", "2", "3", "2", Category.where(code: 10).first],
	["1", "2", "4", "3", Category.where(code: 11).first],
	["1", "2", "5", "4", Category.where(code: 12).first],
	["1", "2", "6", "5", Category.where(code: 13).first],
	["1", "2", "7", "6", Category.where(code: 14).first],
	["1", "2", "8", "7", Category.where(code: 15).first],
	["1", "2", "9", "8", Category.where(code: 16).first],
	["1", "2", "10", "9", Category.where(code: 17).first],
	
	["1", "3", "1", "0", Category.where(code: 7).first],
	["1", "3", "2", "1", Category.where(code: 8).first],
	["1", "3", "3", "2", Category.where(code: 9).first],
	["1", "3", "4", "3", Category.where(code: 10).first],
	["1", "3", "5", "4", Category.where(code: 11).first],
	["1", "3", "6", "5", Category.where(code: 12).first],
	["1", "3", "7", "6", Category.where(code: 13).first],
	["1", "3", "8", "7", Category.where(code: 14).first],
	["1", "3", "9", "8", Category.where(code: 15).first],
	["1", "3", "10", "9", Category.where(code: 16).first],

	["2", "1", "1", "0", Category.where(code: 6).first],
	["2", "1", "2", "1", Category.where(code: 7).first],
	["2", "1", "3", "2", Category.where(code: 8).first],
	["2", "1", "4", "3", Category.where(code: 9).first],
	["2", "1", "5", "4", Category.where(code: 10).first],
	["2", "1", "6", "5", Category.where(code: 11).first],
	["2", "1", "7", "6", Category.where(code: 12).first],
	["2", "1", "8", "7", Category.where(code: 13).first],
	["2", "1", "9", "8", Category.where(code: 14).first],
	["2", "1", "10", "9", Category.where(code: 15).first],
	
	["2", "2", "1", "0", Category.where(code: 5).first],
	["2", "2", "2", "1", Category.where(code: 6).first],
	["2", "2", "3", "2", Category.where(code: 7).first],
	["2", "2", "4", "3", Category.where(code: 8).first],
	["2", "2", "5", "4", Category.where(code: 9).first],
	["2", "2", "6", "5", Category.where(code: 10).first],
	["2", "2", "7", "6", Category.where(code: 11).first],
	["2", "2", "8", "7", Category.where(code: 12).first],
	["2", "2", "9", "8", Category.where(code: 13).first],
	["2", "2", "10", "9", Category.where(code: 14).first],

	["3", "1", "1", "0", Category.where(code: 5).first],
	["3", "1", "2", "1", Category.where(code: 6).first],
	["3", "1", "3", "2", Category.where(code: 7).first],
	["3", "1", "4", "3", Category.where(code: 8).first],
	["3", "1", "5", "4", Category.where(code: 9).first],
	["3", "1", "6", "5", Category.where(code: 10).first],
	["3", "1", "7", "6", Category.where(code: 11).first],
	["3", "1", "8", "7", Category.where(code: 12).first],
	["3", "1", "9", "8", Category.where(code: 13).first],
	["3", "1", "10", "9", Category.where(code: 14).first],
	
	["3", "2", "1", "0", Category.where(code: 4).first],
	["3", "2", "2", "1", Category.where(code: 5).first],
	["3", "2", "3", "2", Category.where(code: 6).first],
	["3", "2", "4", "3", Category.where(code: 7).first],
	["3", "2", "5", "4", Category.where(code: 8).first],
	["3", "2", "6", "5", Category.where(code: 9).first],
	["3", "2", "7", "6", Category.where(code: 10).first],
	["3", "2", "8", "7", Category.where(code: 11).first],
	["3", "2", "9", "8", Category.where(code: 12).first],
	["3", "2", "10", "9", Category.where(code: 13).first],

	["4", "1", "1", "0", Category.where(code: 5).first],
	["4", "1", "2", "1", Category.where(code: 6).first],
	["4", "1", "3", "2", Category.where(code: 7).first],
	["4", "1", "4", "3", Category.where(code: 8).first],
	["4", "1", "5", "4", Category.where(code: 9).first],
	["4", "1", "6", "5", Category.where(code: 10).first],
	["4", "1", "7", "6", Category.where(code: 11).first],
	["4", "1", "8", "7", Category.where(code: 12).first],
	["4", "1", "9", "8", Category.where(code: 13).first],
	["4", "1", "10", "9", Category.where(code: 14).first],
	
	["4", "2", "1", "0", Category.where(code: 4).first],
	["4", "2", "2", "1", Category.where(code: 5).first],
	["4", "2", "3", "2", Category.where(code: 6).first],
	["4", "2", "4", "3", Category.where(code: 7).first],
	["4", "2", "5", "4", Category.where(code: 8).first],
	["4", "2", "6", "5", Category.where(code: 9).first],
	["4", "2", "7", "6", Category.where(code: 10).first],
	["4", "2", "8", "7", Category.where(code: 11).first],
	["4", "2", "9", "8", Category.where(code: 12).first],
	["4", "2", "10", "9", Category.where(code: 13).first],
	
	["4", "3", "1", "0", Category.where(code: 3).first],
	["4", "3", "2", "1", Category.where(code: 4).first],
	["4", "3", "3", "2", Category.where(code: 5).first],
	["4", "3", "4", "3", Category.where(code: 6).first],
	["4", "3", "5", "4", Category.where(code: 7).first],
	["4", "3", "6", "5", Category.where(code: 8).first],
	["4", "3", "7", "6", Category.where(code: 9).first],
	["4", "3", "8", "7", Category.where(code: 10).first],
	["4", "3", "9", "8", Category.where(code: 11).first],
	["4", "3", "10", "9", Category.where(code: 12).first],	

]
positions_list.each do |a, c, g, j, category|
	Position.find_or_create_by(grouping: a, clase: c, grade: g, hierarchy: j, category_id:category.id)
end






#agent_list = [
	#[31923381,"Silvio Geoffroy","masculino","30/11/1985"],
	#[35357251,"Bruno Mendoza","masculino","31/01/1991"],
	#[35171624,"Aldana Pires","femenino","07/06/1990"],
	#[26727277,"Claudia Urra","masculino","15/07/1978"]
#]
#
#
#agent_list.each do |dni, fullname, sex, birthdate|
	#Agent.find_or_create_by(dni:dni, fullname:fullname, sex:sex, birthdate:birthdate, marital_status:"Soltero",  nationality_id:nil, email:"prueba@salud.com", 
#cell_phone:"", position: nil, hour_regime_id:nil, study_id:nil, job_function_id:nil)
#end

carga_horaria_list = [
	["12hs",false],
	["20hs",false],
	["30hs",false],
	["32hs",true],
	["36hs",false],
	["36hs",true]
]

carga_horaria_list.each do |hours, with_guard|
	HourRegime.find_or_create_by(hours:hours, with_guard: with_guard)
end


observation_description_list = [
	[0,"Sin Obesrvaciones"],
	[1,"Lic. Gremial"],
	[2,"Lic. Largo Tratamiento"],
	[3,"Lic. Maternidad"],
	[4,"Lic. Política"],
	[5,"Lic. S/G de Haberes"],
	[6,"Tareas Pasivas"],
	[7,"Lactancia"]
]

observation_description_list.each do |num, desc|
	ObservationDescription.find_or_create_by(code:num, description: desc)
end


job_function_list = [
	['Abogado'],
	['Administrativo/a'],
	['Auxiliar de Enfermería'],
	['Bioquímico/a'],
	['Chofer'],
	['Contador'],
	['Dermatólogo'],
	['Desarrollador de Sistemas'],
	['Enfermero/a'],
	['Farmacéutico/a'],
	['Fonoaudiólogo/a'],
	['Kinesiólogo/a'],
	['Instrumentador/a Quirúrgica'],
	['Médico/a Clínico'],
	['Médico/a Generalista'],
	['Mucamo/a'],
	['Nutricionista'],
	['Lavandero/a'],
	['Odontólogo/a'],
	['Psicólogo'],
	['T.C.S.T.'],
	['Trabajador/a Social'],

]

job_function_list.each do |n|
	JobFunction.find_or_create_by(name:n)
end


agent_type_list = [
	[1,'Personal de Planta'],
	[2,'Mensualizado P/G'],
	[3,'Operador de Apoyo'],
	[4,'Médico Residente']
]

agent_type_list.each do |c,d|
	AgentType.find_or_create_by(code:c, description:d)
end








user = User.new
user.email = 'sageoffroy@gmail.com'
user.password = 'quitar'
user.dependence = Dependence.where(code:106).first
user.save!
user.add_role 'admin'


user = User.new
user.email = 'cris-victorero@hotmail.com'
user.password = 'hospitalrawson'
user.dependence = Dependence.where(code:106).first
user.save!
user.add_role 'hospital'

user = User.new
user.email = 'saludgestiontrabajo@gmail.com'
user.password = 'saludgt'
user.dependence = nil
user.save!
user.add_role 'planification'

