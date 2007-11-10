require 'rubygems'
require 'hpricot'
require 'open-uri'

class MySpace
  attr_accessor :profile, :model
  def initialize
  end

  def load
    @model = Hpricot(open("http://www.myspace.com/#{@profile}"))
  end

  def name
    (@model/".nametext").first.innerHTML
  end

  def friends
    (@model/"span.redbtext").first.innerHTML
  end
end