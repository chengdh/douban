require 'rails/generators'

class DoubanGenerator < Rails::Generators::Base
  def install_douban
    copy_file('douban_controller.rb', 'app/controllers/douban_controller.rb')
    copy_file("douban_helper.rb", 'app/helpers/douban_helper.rb')
    copy_file("douban.yml", 'config/douban.yml')
    
    route %(# Routes for Douban OAuth
        map.with_options :controller => 'douban' do |douban|
          douban.new        '',  :action  => 'new'
          douban.callback   '',  :action  => 'callback',
          douban.logout     '',  :action  => 'logout'
        end)
  end
  
  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end
end
