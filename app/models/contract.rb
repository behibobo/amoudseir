class Contract < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :customer, class_name: 'User'
  belongs_to :standard, optional: true
  belongs_to :insurance, optional: true
  has_many :services

  enum elevator_type: ["hydraulic", "traction"]
  enum usage: ["person", "load", "vehicle", "bed"]
  enum towing_wire: ["1:1", "2:1"]
  enum engine_room: ["MR", "MRL", "MRD"]
  enum panel_type: ["VVVF", "double_speed"]
  enum feedback: ["open", "close"]
  enum engine_type: ["gearbox", "gearless"]
  enum car_communication: ["parallel", "coding"]
  enum insurance_type: ["initial", "periodic"]

end
