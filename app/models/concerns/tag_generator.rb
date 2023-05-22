module TagGenerator
  def self.included(klass)
    klass.before_create :fill_tag
  end

  def fill_tag
    self.tag = loop do
      tag = rand(1000..9999)
      break tag unless self.class.exists?(tag: tag)
    end
  end

end