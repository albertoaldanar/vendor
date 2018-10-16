class SellController < ApplicationController

  def create
    sale = Sell.new(sales_params)

    if sale.save
      render json: sale, status: :created, location: sale
    else
      render json: sale.errors, status: :unprocessable_entity
    end
  end

  def index
    @sales = Sell.all
    render json: @sales
  end


  def projection
    #proyeccion semanal
    projection = []
    weeks = []
    my_team = Team.first
    users = User.where(team_id: my_team.id)

    team_goal = my_team.goal / 4
    num = 0

    4.times do
      projection << num += team_goal
    end

    users.each do |x|
       w =  Sell.where("user_id = ?", x.id).group(:weeks).sum(:price)
       weeks << w.values
    end

    y = 0
    t = weeks.flatten
    arr = [0]

    while y < t.length do
      y += 1
      arr[y] = t[y-1] + (arr[y-1] || 0)
    end
    arr.delete_at(0)

    render json: {"projection": projection, "my_team": arr}

  end

  private

  def sales_params
      params.require(:sell).permit(:user_id, :product_type, :price, :week, :finished, :client)
  end
end
