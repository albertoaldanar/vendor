class VariablesController < ApplicationController
  def update
    variable = Variable.last
    variable.update(var_params)
    variable.save!
  end

  def var
    data = Variable.last
    render json: {"data": data}
  end

  private

  def var_params
      params.require(:variable).permit(:month, :week)
  end
end
