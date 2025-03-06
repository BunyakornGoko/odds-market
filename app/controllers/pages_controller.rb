class PagesController < ApplicationController
  def home
    @products = [
      { "id": 1, "name": "Product 1", "price": 100 },
      { "id": 2, "name": "Product 2", "price": 200 },
      { "id": 3, "name": "Product 3", "price": 300 },
      { "id": 4, "name": "Product 4", "price": 400 },
      { "id": 5, "name": "Product 5", "price": 500 },
      { "id": 6, "name": "Product 6", "price": 600 },
      { "id": 7, "name": "Product 7", "price": 700 },
      { "id": 8, "name": "Product 8", "price": 800 },
      { "id": 9, "name": "Product 9", "price": 900 },
      { "id": 10, "name": "Product 10", "price": 1000 },
      { "id": 11, "name": "Product 11", "price": 1100 },
      { "id": 12, "name": "Product 12", "price": 1200 },
      { "id": 13, "name": "Product 13", "price": 1300 },
      { "id": 14, "name": "Product 14", "price": 1400 },
      { "id": 15, "name": "Product 15", "price": 1500 },
      { "id": 16, "name": "Product 16", "price": 1600 }
    ]
  end

  def select_product
    selected_product_id = params[:product_id]
    if selected_product_id.present?
      session[:selected_product_id] = selected_product_id
      redirect_to confirm_path
    else
      flash[:alert] = "No product selected"
      redirect_to root_path
    end
  end

  def confirm
    @product_id = session[:selected_product_id]
    redirect_to root_path if @product_id.to_i < 0
  end

  def send_data
    name = params[:name]
    phone = params[:phone]
    if name.present? && phone.present?
      flash[:notice] = "Data sent successfully"
      session[:name] = name
      session[:phone] = phone
      redirect_to success_path
    else
      flash[:alert] = "Name and phone number are required"
      redirect_to confirm_path
    end
  end

  def success
    @name = session[:name]
    @phone = session[:phone]
  end
end 