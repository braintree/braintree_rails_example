module ApplicationHelper
  def alert_string(alert)
    alert.is_a?(Array) ? safe_join(alert, "<br />".html_safe) : alert
  end
end
