module TermSessionsHelper
  
  def session_calendar(term_sessions)
    return if term_sessions.empty?
      
    session_days = term_sessions.map{|i| i.day}
    uniq_months = session_days.map{|i| i.month}.uniq
    
    months = {}
    #for each month that has a term_session, need to make a list of all the dates in that month with the term_session date marked
    uniq_months.each do |month|
      day = session_days.find{|i| i.month == month}
      first_day = Date.new(day.year, month, 1)
      last_day = ((first_day >>1) - 1)
      
      months[month] = first_day..last_day
    end
      
    html = ""
    months.each do |month, days|
      html += "<h3>" + Date.new(2010, month, 1).strftime("%B") + "</h3>"
      html += "<table cellspacing='0' cellpadding='0' border='0' class='session_calendar'>"
      html += "<tr><th>Su</th><th>M</th><th>T</th><th>W</th><th>Th</th><th>F</th><th>S</th></tr>"
      day_count = 1      
              
      days.each do |day|
        html += "<tr>" if day_count == 1
      
        if day == days.first 
          (1..days.first.wday).each do |d|
            day_count += 1
            html += "<td>&nbsp;</td>"
          end
        end
        
        css_class = session_days.find{|i| i == day} ? "selected" : ""
        html += "<td class='#{css_class}'>" + day.strftime('%e') + "</td>"
        
        if day == days.last
          (days.last.wday..6).each do |d|
            day_count += 1
            html += "<td>&nbsp;</td>"
          end
        end
          
        html += "</tr>" if day_count == 7
        
        day_count >= 7 ? day_count = 1 : day_count += 1
      end      
      html += "</table>"

    end
    
    html
    
  end
end