module ApplicationHelper

  def flash_class name
    case name.to_sym
    when :notice
      :success
    when :alert
      :danger
    else
      name
    end
  end
  
end
