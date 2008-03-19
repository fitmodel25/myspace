require 'rubygems'
require 'hpricot'
require 'open-uri'

class MySpace
  attr_accessor :profile, :hmodel
  def initialize
  end

  def load
    @hmodel = Hpricot(open("http://www.myspace.com/#{@profile}"))
  end

  def name
    (@hmodel/".nametext").first.innerHTML
  end

  def url
    "http://www.myspace.com/#{@profile}"
  end

  def sex
    if (@hmodel/"//td[@class = 'text'][@width = '193']").first.innerHTML.match("Female").to_a.length != 0
      return 'Female'
    else
      return 'Male'
    end
  end
  
  def age
    /([0-9]+) years old/.match((@hmodel/"//td[@class = 'text'][@width = '193']").first.innerHTML)[1]
  end
  
  def location
    (@hmodel/"//td[@class = 'text'][@width = '193']").first.innerHTML.split("<br />")[5].strip
  end
  
  def lastlogin
    date = (@hmodel/"//td[@class = 'text'][@width = '193']").first.innerHTML.split("<br />")[9].strip[-10..-1]
    return date[-4..-1] + "-" + date[-7..-6] + "-" + date[-10..-9]
  end
  
  def friends
    (@hmodel/"span.redbtext").first.innerHTML
  end
  
  def status
    (@hmodel/"//td[@id = 'ProfileStatus:']").first.innerHTML
  end
  
  def religion
    (@hmodel/"//td[@id = 'ProfileReligion:']").first.innerHTML
  end
  
  def starsign
    (@hmodel/"//td[@id = 'ProfileZodiac Sign:']/a").first.innerHTML
  end
  
  def children
    (@hmodel/"//td[@id = 'ProfileChildren:']").first.innerHTML
  end

  def education
    (@hmodel/"//td[@id = 'ProfileEducation:']").first.innerHTML
  end
  
  def hometown
    (@hmodel/"//td[@id = 'ProfileHometown:']").first.innerHTML
  end
  
  def smoke
    case (@hmodel/"//td[@id = 'ProfileSmoke / Drink:']").first.innerHTML.split[0]
    when "Yes"
      return true
    when "No"
      return false
    end
  end
  
  def drink
    case (@hmodel/"//td[@id = 'ProfileSmoke / Drink:']").first.innerHTML.split[2]
    when "Yes"
      return true
    when "No"
      return false
    end
  end
end