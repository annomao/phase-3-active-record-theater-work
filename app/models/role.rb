class Role < ActiveRecord::Base
  has_many :auditions

  def actors
    self.auditions.map {|audition| audition.actor}
  end

  def locations
    self.auditions.map {|audition| audition.location}
  end

  def lead
    @value = self.auditions.filter do |audition|
      audition.hired == true
    end
    
    if @value.length > 0 
      @value.first
    else
      "no actor has been hired for this role"
    end
  end

  def understudy
    if @value.length > 1 
      @value[1]
    else
      "no actor has been hired for this role"
    end
  end

end