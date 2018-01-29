user = User.new
user.email = 'director_rawson@gmail.com'
user.password = 'directorrw'
user.dependence = Dependence.where(code:106).first
user.save!
user.add_role 'director'