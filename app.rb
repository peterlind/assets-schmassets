require 'bundler'
Bundler.require
require 'sinatra/base'
require 'sinatra/content_for'
require 'sinatra/asset_pipeline'
require 'json'



class App < Sinatra::Base
  register Sinatra::AssetPipeline
  helpers Sinatra::ContentFor

  set :assets_precompile, %w(app.js app.css analytics.js *.png *.jpg *.svg *.eot *.ttf *.woff)
  set :assets_css_compressor, :sass
  set :static_cache_control, [:public, :max_age => 300]


  get '/:id?' do
    cache_control :public, max_age: 300
    haml :show
  end

  not_found do
    haml :'404'
  end
end
