class Admin::CountriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @countries = policy_scope(
        Country,
        policy_scope_class: Admin::CountryPolicy::Scope
    ).page(params[:page]).per(10)
  end

  def new
    @country = Country.new
    authorize [:admin, country]
  end

  def create
    @country = Country.new(country_params)
    authorize [:admin, country]

    if @country.save
      redirect_to admin_countries_path
    else
      render :new
    end
  end

  def edit
    authorize [:admin, country]
  end

  def update
    authorize [:admin, country]

    if country.update(country_params)
      redirect_to admin_countries_path
    else
      render :edit
    end
  end

  def destroy
    authorize [:admin, country]

    country.delete
    redirect_to admin_countries_path
  end

  def update_all
    Country.load_from_api Countries::ListFetcher.fetch

    flash[:notice] = 'Countries have updated successfully'
    redirect_to admin_countries_path
  end

  private

  def country_params
    params.require(:country).permit(:name, :alpha_three_code)
  end

  def country
    @country ||= Country.find(params[:id])
  end

  helper_method :country
end
