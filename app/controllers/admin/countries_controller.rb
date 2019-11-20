class Admin::CountriesController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    country = Country.new(country_params)

    if country.save
      redirect_to admin_countries_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if country.update(country_params)
      redirect_to admin_countries_path
    else
      render :edit
    end
  end

  def destroy
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
