require 'active_record'
ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "library8")

ActiveRecord::Schema.define do
  create_table :library_users15 do |table|
    table.column :user_id, :integer
    table.column :name, :string
    table.column :age, :string
    table.column :books_borrowed, :integer
  end

  create_table :library_books15 do |table|
    table.column :books_id, :integer
    table.column :borrower_id, :integer
    table.column :title, :string
    table.column :borrowed, :string
    table.column :due_back, :string
  end
end

class LibraryUsers15 < ActiveRecord::Base
  self.table_name = 'library_users15'
  has_many :library_books15
end

class LibraryBooks15 < ActiveRecord::Base
  self.table_name = 'library_books15'
  belongs_to :library_users15
end

libraryusers15 = LibraryUsers15.create(:user_id => 1, :name => 'Tom', :age => 10, :books_borrowed => 3 )
librarybooks15 = LibraryBooks15.create(:books_id=> 1, :borrower_id => 1, :title => 'Who let the dogs out?', :borrowed => '13_November_2013', :due_back => '21_November_2013' )

p LibraryBooks15.find(1)
p LibraryUsers15.find(1)

