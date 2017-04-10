class MainController < Controller
  def index
    @test = 'Some cool text here'
    @arr = %w[one two three]
  end
end
