class Lamp < ApplicationRecord
  def toggle
    if status == true
      update_attribute(:status, false)
    else
      update_attribute(:status, true)
    end
  end
end
