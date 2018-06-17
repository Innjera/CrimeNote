# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.crimenote.com/"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/crime-note/"
SitemapGenerator::Sitemap.public_path = 'tmp/'
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'

SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET_NAME'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_region: ENV['AWS_REGION'],
)

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
  # トップ画面
  add '/', changefreq: 'daily', priority: 1.0
  add '/about', changefreq: 'weekly', priority: 0.5
  add '/notes', changefreq: 'daily', priority: 1.0
  add '/notes/new', changefreq: 'weekly', priority: 0.3

  # ハラスメントレポート
  Note.find_each do |note|
    add "/notes/#{note.id}", :lastmod => note.updated_at, :changefreq => 'daily', :priority => 0.7
  end
end
