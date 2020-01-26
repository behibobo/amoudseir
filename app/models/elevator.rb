class Elevator < ApplicationRecord
  belongs_to :contract
  belongs_to :standard, optional: true
  belongs_to :insurance, optional: true
  
  enum elevator_type: ["hydraulic", "traction"]
  enum usage: ["person", "load", "vehicle", "bed"]
  enum suspension_type: ["1:1", "2:1"]
  enum engine_room: ["MR", "MRL", "MRD"]
  enum panel_type: ["VVVF", "double_speed"]
  enum feedback: ["open", "close"]
  enum engine_type: ["gearbox", "gearless"]
  enum car_communication: ["parallel", "coding"]
  enum standard_type: ["initial", "periodic"]
  enum speed: ["1", "2"]

end
