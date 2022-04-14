class Api::V1::TeaController < ApplicationController


  def create
    new_tea = Tea.find_by(title: params[:title])
    if new_tea.present?
      render json: {error: "Tea by this name already exists"}, status: 404
    else
      tea = Tea.create(tea_params)
      render json: TeaSerializer.new(tea), status: 201
    end
  end

  private

  def tea_params
    params.permit(:title, :description, :temp, :brew_time)

  end

end
