class JuniorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @juniors = policy_scope(Junior)
  end

  def show
    @junior = Junior.find(nom: params[:nom])
    authorize @junior
  end

  def new
    @junior = Junior.new
    authorize @junior
  end

  def create
    @junior = Junior.new(junior_params)
    new_junior_user
    if @junior.save
      new_acces_junior
      flash[:success] = "Junior successfully created"
      redirect_to @junior
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  private

  def junior_params
    params.require(:junior).permit(:name)
  end

  def new_junior_user
    @user = User.new(
      email: "#{@junior.name.delete(' ').downcase}@jestion.fr",
      first_name: 'admin',
      last_name: @junior.name,
      password: 'adminadmin'
    )
  end

  def new_acces_junior
    @user.save!
    @junior_acces = AccesJunior.new(user_id: @user.id, junior_id: @junior.id)
    @junior_acces.save
    raise
  end
end
