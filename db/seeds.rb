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
user.save!
user.add_role 'director'

user = User.new
user.email = 'direccionhospitalalvear@gmail.com'
user.password = 'direccion_hospital'
user.dependence = Dependence.where(code:456).first
user.save!
user.add_role 'director'

user = User.new
user.email = 'direccionapnorte@gmail.com'
user.password = 'areanorte'
user.dependence = Dependence.where(code:104).first
user.save!
user.add_role 'directora'

user = User.new
user.email = 'direccionareasur@gmail.com'
user.password = 'areapsur'
user.dependence = Dependence.where(code:143).first
user.save!
user.add_role 'directora'

user = User.new
user.email = 'direccionareatrelew@gmail.com'
user.password = 'areatrelew'
user.dependence = Dependence.where(code:103).first
user.save!
user.add_role 'directora'

user = User.new
user.email = 'direccionareaesquel@gmail.com'
user.password = 'areaesquel'
user.dependence = Dependence.where(code:121).first
user.save!
user.add_role 'directora'