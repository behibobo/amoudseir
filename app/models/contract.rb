class Contract < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :customer, class_name: 'User'
  belongs_to :standard
  belongs_to :insurance
  has_many :services

  enum elevator_type: ["hydraulic", "traction"]
  enum usage: ["person", "load", "vehicle", "bed"]
  enum towing_wire: ["2:1", "1:1"]
  enum engine_room: ["MR", "MRL", "MRD"]
  enum panel_type: ["VVVF", "double_speed"]
  enum feedback: ["open", "close"]
  enum engine_type: ["gearbox", "gearless"]
  enum car_communication: ["parallel", "coding"]

end
