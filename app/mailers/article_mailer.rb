class ArticleMailer < ActionMailer::Base
  default from: "noreply@blogger.elphax.com"

  def article_submitted(article)
    admin_email = "mfarazid@gmail.com"
    @article = article
    mail to: admin_email, subject: "Article submitted to the elphax blogger"
  end  
end
