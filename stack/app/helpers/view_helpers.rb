module ViewHelpers
  
  include NavHelper
  
  # basic texts
  
  def site_title
    "#{APP_NAME}"
  end
  
  def footer_text
    raw "&copy;2010 - footer text"
  end
  
  # SEO (and RDF)
  
  def analytics_tracker
    ""
  end
  
  def meta_keywords
    ""
  end
  
  def meta_description
    "meta_description"
  end
  
  def meta_author
    "Francesco 'makevoid' Canessa"
  end
  
end