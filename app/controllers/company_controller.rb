class CompanyController < ApplicationController
  before_action :set_vendors, only: [:get_team_info, :week_stats]

  def get_team_info

    top_low = @vendors.minmax_by { |x| x["sales"] }
    #Aqui tenemos que corrergir para que estas ventas sean solo de mi equipo
    product_count = Sell.all.group(:product_type).count

    @@total_sales = 0

    @my_vendors.each do |vend|
      vend.sells.each do |v|
        @@total_sales += v.price
      end
    end

    render json: { "goal": @team.goal, "sales": @@total_sales, "vendors": @vendors, "top_low": top_low, "products": @product_group, "count": product_count }
  end


  def week_stats
    data = {}
    final = []
    i = 0
    y = 0
    x = 0

    @my_vendors.each do |vend|
      weeks = Sell.where("finished = ? AND user_id = ?", false, vend.id).group(:week).sum(:price)
      data[vend.name] = weeks.values
    end

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    a = data.values[0]

      arrA = [0]

    while x < a.length do
      x += 1
      arrA[x] = a[x-1] + (arrA[x-1] || 0)
    end
    arrA.delete_at(0)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

    b = data.values[1]

      arrB = [0]

    while i < b.length do
      i += 1
      arrB[i] = b[i-1] + (arrB[i-1] || 0)
    end
    arrB.delete_at(0)

#:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

    c = data.values[2]

      arrC = [0]

    while y < c.length do
      y += 1
      arrC[y] = c[y-1] + (arrC[y-1] || 0)
    end
    arrC.delete_at(0)


    result = [arrA,arrB,arrC]
    render json: { "weeks" => data, "result": result, "goal": @team.goal}
  end

  private

  def set_vendors
    @team = Team.first
    @my_vendors = User.where(team_id: @team.id)
    @product_group = Sell.all.group(:product_type).sum(:price)
    @vendors = []

    all = Sell.all.group(:user_id).sum(:price)

    @my_vendors.each do |vend|
      all.each do |k,v|
        if vend.id == k
          @vendors << {"name" => vend.name, "sales" => v}
        end
      end
    end

  end



end
