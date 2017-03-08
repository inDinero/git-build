class CompanyPresenter
  def initialize(options = {})
    @company = options[:company]
  end

  def to_h
    @hash ||= @company.attributes.except(:created_at, :updated_at)
  end
end
