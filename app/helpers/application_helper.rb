module ApplicationHelper
  def avatar_url(email)
    gravatar_id = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def strip_tags(html)
    self.class.full_sanitizer.sanitize(html)
  end
end
