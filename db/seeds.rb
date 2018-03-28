user = User.new
user.email = 'direccionhospitalzonaltrelew@gmail.com'
user.password = 'direccion_hospital'
user.dependence = Dependence.where(code:103).first
user.save!
user.add_role 'director'

user = User.new
user.email = 'direccionhospitalzonalmadryn@gmail.com'
user.password = 'direccion_hospital'
user.dependence = Dependence.where(code:104).first
user.save!
user.add_role 'director'

user = User.new
user.email = 'direccionhospitalcomodoro@gmail.com'
user.password = 'direccion_hospital'
user.dependence = Dependence.where(code:143).first
user.save!
user.add_role 'director'

user = User.new
user.email = 'direccionhospitalzonalesquel@gmail.com'
user.password = 'direccion_hospital'
user.dependence = Dependence.where(code:121).first
user.save!
user.add_role 'director'


user = User.new
user.email = 'direccionhospitalrawson@gmail.com'
user.password = 'direccion_hospital'
user.dependence = Dependence.where(code:106).first
Agent.all.each do |a|
	a.oficina = a.agent_of_services.first.service_of_dependence.dependence.code
	a.save
end