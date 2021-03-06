require "sequel"

class UserDataSource < ::Nanoc::DataSource
  identifier :user

  def up
    @db = Sequel.sqlite("db/development.sqlite3")
  end

  def down
    @db.disconnect
  end

  def items
    @db[:users].map do |user|
      new_item(
        "",
        user,
        "/data/users/#{user[:id]}.html"
      )
    end
  end
end
