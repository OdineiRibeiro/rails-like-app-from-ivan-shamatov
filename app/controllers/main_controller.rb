class MainController < Controller
  def index
    @test = 'Some dump text here'
    @arr = %w[one chew free]
  end
end
