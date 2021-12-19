class DashboardController < ApplicationController
  before_action :set_doubt
  def show
    @doubts = Doubt.all
    resolved = Doubt.where('status =': 1)
    escalated = Doubt.where('status =':3)

  end

  def set_doubt
    @doubt = Doubt.find(params[:id])
  end
end
