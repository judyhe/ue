module TermSessionsHelper
  
  def session_calendar(term_sessions)
    return if term_sessions.empty?
      
    session_days = term_sessions.map{|i| i.day}
    uniq_months = session_days.map{|i| i.month}.uniq
    
    months = {}
    
    # get all the days in the month... 
    uniq_months.each do |month|
      day = session_days.find{|i| i.month == month}
      first_day = Date.new(day.year, month, 1)
      last_day = ((first_day >>1) - 1)
      
      months[month] = first_day..last_day
    end
    
    #for each month that has a term_session, need to make a list of all the dates in that month with the term_session date marked  
    html = ""
    months.sort.each do |month, days|
      html += "<div class='session_calendar'><h3>" + Date.new(days.first.year, month, 1).strftime("%B %Y") + "</h3>"
      html += "<table cellspacing='0' cellpadding='0' border='0'>"
      html += "<tr><th>Su</th><th>M</th><th>T</th><th>W</th><th>Th</th><th>F</th><th>S</th></tr>"
      day_count = 1      
              
      days.each do |day|
        html += "<tr>" if day_count == 1
      
        # fill in the week
        if day == days.first 
          (1..days.first.wday).each do |d|
            day_count += 1
            html += "<td>&nbsp;</td>"
          end
        end
        
        if session_days.include?(day)
          ts = term_sessions.detect{|x| x.day == day}
          html += "<td class='selected'>"
          html += "<div class='tooltip_set'>"
          html += link_to(day.strftime('%e'), edit_term_session_path(ts), :class => "tooltip_trigger")
          html += "<div class='tooltip_content'>" + ts.start.strftime("%H:%M") + " - " + ts.end.strftime("%H:%M") + "</div>"
          html += "</div></td>" 
        else
          html += "<td>" + day.strftime('%e') + "</td>"
        end
        
        # fill in the week 
        if day == days.last
          (days.last.wday..6).each do |d|
            day_count += 1
            html += "<td>&nbsp;</td>"
          end
        end
        
        # close the row at the end of the week
        html += "</tr>" if day_count == 7
        
        day_count >= 7 ? day_count = 1 : day_count += 1
      end      
      html += "</table></div>"

    end
    
    raw(html)
    
  end
end