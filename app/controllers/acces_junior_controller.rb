class AccesJuniorController < ApplicationController
  def destroy
    @acces_junior = AccesJunior.find(params[:id])
    if @acces_junior.destroy
      flash[:success] = 'AccesJunior was successfully deleted.'
      redirect_to juniors_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to acces_juniors_url
    end
  end
end
