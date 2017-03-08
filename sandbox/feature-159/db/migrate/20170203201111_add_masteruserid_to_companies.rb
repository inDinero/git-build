class AddMasteruseridToCompanies < ActiveRecord::Migration
  def change
    add_column(:companies, :masteruserid, :integer)
  end
end
