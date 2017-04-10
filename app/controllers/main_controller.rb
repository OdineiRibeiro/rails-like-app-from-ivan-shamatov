class MainController < Controller
  def index
    @test = 'Some cool text here'
    @array = %w[one two three]
  end
end
