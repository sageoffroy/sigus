user = User.new
user.email = 'director_area_trelew@gmail.com'
user.password = 'directoratw'
user.dependence = Dependence.where(code:107).first
user.save!
user.add_role 'directora'