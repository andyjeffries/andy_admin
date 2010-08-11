module AndyAdminHelper
  def date_breakout(value)
    @last_date ||= nil
  	date = value.strftime("%A, %e %B %Y")
  	if date != @last_date
  	  @last_date = date
  	  "<div class='date_breakout'>#{date}</div>"
  	end
  end
end