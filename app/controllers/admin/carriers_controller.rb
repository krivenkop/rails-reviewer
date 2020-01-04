class Admin::CarriersController < ApplicationController
  before_action :authenticate_user!

  def index
    @carrier = Carrier.new
  end

  def create
    @carrier = Carrier.new(carrier_params)
    authorize [:admin, carrier]

    if @carrier.save
      redirect_to admin_carriers_path
    else
      render :index
    end
  end

  def destroy
    authorize [:admin, carrier]

    carrier.delete
    redirect_to admin_carriers_path
  end

  private

  def carrier_params
    params.require(:carrier).permit(:name)
  end

  def carrier
    @carrier ||= Carrier.find(params[:id])
  end

  def carriers
    @carriers ||= policy_scope(
        Carrier,
        policy_scope_class: Admin::CarrierPolicy::Scope
    ).page(params[:page]).per(10)
  end

  helper_method :carrier
  helper_method :carriers
end
