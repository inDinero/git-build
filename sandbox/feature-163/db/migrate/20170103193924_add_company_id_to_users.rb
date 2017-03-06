class AddCompanyIdToUsers < ActiveRecord::Migration
  def change
    add_column(:users, :company_id, :integer)
    add_column(:users, :company_name, :string)
    add_index(:users, :company_id, name: 'index_company_id_on_users')
  end
end
