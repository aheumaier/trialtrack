module ApplicationHelper
  def setup_user(user)
    user.address ||= Address.new
    user
  end

  def save_or_update_button(entity)
    entity.id ? "Speichern" : "Hinzuf&uuml;gen".html_safe
  end

  def cancel_button( c_path = controller_path)
    c_path = 'users' if c_path =~/registration/
    button_tag("Abbrechen", :type => :button, :class => "button", :onclick => "document.location.href='/#{c_path}'")
  end

end
