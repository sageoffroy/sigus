  class Observation < ApplicationRecord
	belongs_to :service_of_dependence
	
	has_many :observation_details, dependent: :destroy

  validates :service_of_dependence, presence: true
  validates :year, presence: true
  validates :month, presence: true
  
  validates_associated :observation_details
  accepts_nested_attributes_for :observation_details, :reject_if => :all_blank, allow_destroy: true

  after_save :calculate_proporcional



  def calculate_proporcional
  	o_d_s = ObservationDetail.where(observation:self)

  	o_d_s.each do |o_d|
      total = 0
      cant = 0
      o_d.proporcional = 0
  		if ([10,9,8,3].include?(o_d.observation_description.code))
  			if !o_d.date_from.nil?
  				month = o_d.date_from.month
  				year = o_d.date_from.year
          6.times do |i| 
            month -= 1
            if month < 1
    				  month = 12
              year-= 1
            end
            h_g_a = HistoricalGuardAgent.where(month: month, year: year, agent: o_d.agent).first
            if !h_g_a.nil?
              total = total + h_g_a.hs_total_1
              cant+= 1
            end
          end
          if cant != 0
            promedio_meses = total/6
            promedio_dias = promedio_meses/30
            if total_days.nil?
              o_d.proporcional = 0
            else
              o_d.proporcional = promedio_dias * total_days
            end
            o_d.save
          end
        end
  		end
  	end


  end

  
end
