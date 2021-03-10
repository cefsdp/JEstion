# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  def create
    super
    raise
    getting_registration_data if params[:registration_data]
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def getting_registration_data
    req = JSON.parse params.require(:registration_data).gsub('=>', ':')
    @junior = Junior.find(req["junior_id"])
    @type = req["type"]
    req["etude_id"] ? @etude = Etude.find(req["etude_id"]) : nil
    @type == 'membre' ? creating_membre : nil
    @type == 'adherent' ? creating_adherent : nil
    @type == 'client' ? creating_client : nil
  end

  def creating_acces_junior
    @acces_junior = AccesJunior.create(junior_id: @junior.id, user_id: @user.id)
  end

  def creating_membre
    creating_acces_junior
    @membre = Membre.create(acces_junior_id: @acces_junior.id, alumni: false)
  end
end
