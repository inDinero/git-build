class CompaniesController < ApplicationController
  def index
    @companies = Company.all

    respond_to do |format|
      format.html { render :index }
      format.json { render json: @companies.map { |company| CompanyPresenter.new(company: company).to_h }, status: :ok }
    end
  end
end
