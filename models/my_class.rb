class Pets
  attr_reader :description, :title, :url

  def initialize(description, title, url)
    @description = description
    @title = title
    @url = url
  end

end
