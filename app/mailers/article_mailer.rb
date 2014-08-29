class ArticleMailer < ActionMailer::Base
  default from: "noreply@blogger.elphax.com"

  def article_submitted(article)
    @article = article
    mail to: ENV['ADMIN_EMAIL'], subject: "Article submitted to the elphax blogger", content_type: "text/html"
  end  
end
