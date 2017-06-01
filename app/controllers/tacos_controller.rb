class TacosController < ApplicationController

  def index
    @tacos = Taco.all
    render_json(@tacos)
  end

  def create
    @taco = Taco.create!(taco_params)
    render_json(@taco, :created)
  end

  def show
    @taco = Taco.find(params[:id])
    render_json(@taco)
  end

  def update
    @taco = Taco.find(params[:id])
    @taco.update(taco_params)
    head :no_content
  end

  def destroy
    @taco = Taco.find(params[:id])
    @taco.destroy
    head :no_content
  end

  private

  def taco_params
    params.require(:taco).permit(:meat, :rice, :salsa, :others, :note)
  end

end
