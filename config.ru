
require 'toto'

# Rack config
use Rack::Static, :urls => ['/css', '/js', '/images', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
  use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#
toto = Toto::Server.new do
  #
  # Add your settings here
  # set [:setting], [value]
  #
    set :author,    'Shameer C'                               # blog author
    set :title,     'Tech blog of Shameer'                   # site title
    set :prefix,    'blog' 
  # set :root,      "index"                                   # page to load on /
  # set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
  # set :markdown,  :smart                                    # use markdown + smart-mode
    set :disqus,    'nikhilben'                                     # disqus id, or false
  # set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
    set :ext,       '.html'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds
    set :to_html   do |path, page, ctx|                         # returns an html, from a path & context
      ERB.new(File.read("#{path}/#{page}.rhtml")).result(ctx)
    end

end

run toto

