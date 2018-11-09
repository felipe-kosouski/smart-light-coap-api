class Lamp < ApplicationRecord
  def on
    update_attribute(:status, true)
  end

  def off
    update_attribute(:status, false)
  end

  def toggle
    if status == true
      update_attribute(:status, false)
    else
      update_attribute(:status, true)
    end
  end
end
