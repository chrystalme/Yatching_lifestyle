module ArticlesHelper
  def show_articles
    output = ''
    @articles.each do |article|
      output << "<div class='row g-0'>
      <div class='col-3'>"
      if article.image.attached?
        output << "#{link_to(image_tag(article.image.variant(resize_to_limit: [300, 300])), article_path(article))}
      </div>
      <div class='col-3'>
        <div class='card-body'>
          <h5 class='card-title'> #{article.title}</h5>
          <p class='card-text text-black'>
             #{article.text.truncate_words(7)}
          </p>
          #{show_vote_btn(article)}<em class='badge bg-primary mx-3'>#{"#{article.votes.count} Vote(s)"} </em>
          <h6 class='card-text mt-2'><strong>Author: </strong>#{article.author.name} </h6>
        </div>
      </div>
      "
      end
      output << '</div>'
    end
    output.html_safe
  end
end
