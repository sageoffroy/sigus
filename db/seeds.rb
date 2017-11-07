# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

services_list = [
	["Sin Servicio Asignado","SSA"],
	["Servicio Prueba 1", "SerPru1"],
	["Servicio Prueba 2", "SerPru2"],
	["Servicio Prueba 3", "SerPru3"],
	["Servicio Prueba 4", "SerPru4"],
	["Servicio Prueba 5", "SerPru5"],
	["Servicio Prueba 6", "SerPru6"],
	["Servicio Prueba 7", "SerPru7"],
	["Servicio Prueba 8", "SerPru8"],
	["Servicio Prueba 9", "SerPru9"],
	["Servicio Prueba 10", "SerPru10"],
	["Servicio Prueba 11", "SerPru11"]	
]

services_list.each do |nombre, abreviacion|
	Service.find_or_create_by(name:nombre, abbreviation: abreviacion)
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

ServiceOfDependence.find_or_create_by(service_id: 2, dependence_id:13, description: "Prueba")
ServiceOfDependence.find_or_create_by(service_id: 2, dependence_id:14, description: "Prueba")
ServiceOfDependence.find_or_create_by(service_id: 3, dependence_id:13, description: "Prueba")


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

