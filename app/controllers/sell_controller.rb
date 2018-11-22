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

    w =  Sell.where("week = ?", 2).group(:weeks).sum(:price)

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


  def authorization
    unauthorized = Sell.where(authorized: false)
    render json: { "unauthorized": unauthorized }
  end

  def edit_sale
    sale = Sale.find(params[:id])
    sale.update!(sales_params)
    sale.save!

    render json: {"sale": sale}
  end

  private

  def sales_params
      params.require(:sell).permit( :user_id, :product_type, :price, :week, :finished, :client, :model, :authorized, :efficiency, :brand, :amount, :month )
  end


end
