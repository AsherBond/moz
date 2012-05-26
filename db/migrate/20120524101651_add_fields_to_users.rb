class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, :null => false
    add_column :users, :last_name, :string, :null => false
    add_column :users, :about, :text
    add_column :users, :website, :string

    add_column :users, :paid, :boolean, :default => false

    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :country, :string
    add_column :users, :zip, :string

    add_column :users, :artist_name, :string
    add_column :users, :username, :string, :null => false

    add_column :users, :public_email, :string

    add_column :users, :body_background_color, :string
    add_column :users, :body_background_repeat, :string
    add_column :users, :body_background_position, :string
    add_column :users, :body_background_attachment, :string

    add_column :users, :main_artist_name_color, :string
    add_column :users, :main_artist_info_color, :string
    add_column :users, :main_artist_location_color, :string
    add_column :users, :main_background_color, :string
    add_column :users, :main_background_repeat, :string
    add_column :users, :main_background_position, :string
    add_column :users, :main_background_attachment, :string

    add_column :users, :news_header_color, :string
    add_column :users, :news_text_color, :string
    add_column :users, :news_link_color, :string
    add_column :users, :news_link_hover_color, :string
    add_column :users, :news_background_color, :string
    add_column :users, :news_background_repeat, :string
    add_column :users, :news_background_position, :string
    add_column :users, :news_background_attachment, :string

    add_column :users, :about_header_color, :string
    add_column :users, :about_text_color, :string
    add_column :users, :about_link_color, :string
    add_column :users, :about_link_hover_color, :string
    add_column :users, :about_background_color, :string
    add_column :users, :about_background_repeat, :string
    add_column :users, :about_background_position, :string
    add_column :users, :about_background_attachment, :string

    add_column :users, :comments_header_color, :string
    add_column :users, :comments_text_color, :string
    add_column :users, :comments_link_color, :string
    add_column :users, :comments_link_hover_color, :string
    add_column :users, :comments_background_color, :string
    add_column :users, :comments_background_repeat, :string
    add_column :users, :comments_background_position, :string
    add_column :users, :comments_background_attachment, :string

    add_column :users, :thumbnails_background_color, :string
    add_column :users, :thumbnails_background_hover_color, :string
    add_column :users, :thumbnails_border_color, :string
    add_column :users, :thumbnails_border_hover_color, :string

    add_column :users, :tables_border_color, :string
    add_column :users, :tables_header_color, :string
    add_column :users, :tables_header_background_color, :string
    add_column :users, :tables_row_text_color, :string
    add_column :users, :tables_row_background_color, :string
    add_column :users, :tables_row_background_hover_color, :string

    add_column :users, :nav_current_text_color, :string
    add_column :users, :nav_current_background_color, :string
    add_column :users, :nav_text_color, :string
    add_column :users, :nav_text_hover_color, :string
    add_column :users, :nav_background_color, :string
    add_column :users, :nav_background_hover_color, :string

  end
end
