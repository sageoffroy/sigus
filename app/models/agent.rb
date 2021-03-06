class Agent < ApplicationRecord
  belongs_to :nationality, optional:true
  belongs_to :position, optional:true
  belongs_to :category, optional:true
  belongs_to :hour_regime, optional:true
  belongs_to :study, optional:true
  belongs_to :job_function, optional:true
  belongs_to :agent_type, optional:true
  has_many :agent_of_services
  validates :dni, presence: true
  validates :dni, uniqueness: true
  



  def sex_english
    if sex == 'Femenino'
      'female'
    else
      'male'
    end
  end 

  def birthdate_es
  	if birthdate != nil
  		birthdate.strftime("%d/%m/%Y")  
  	else
  		"Cargar Fecha"
  	end
  end

  
  def to_s
  	"("+dni.to_s+")"+" "+fullname
  end
end
