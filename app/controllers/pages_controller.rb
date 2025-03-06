class PagesController < ApplicationController
  def home
    @products = [
      { "id": 1, "name": "กระบอกน้ำ Odds" },
      { "id": 2, "name": "เสื้อโปโล Versions 3" },
      { "id": 3, "name": "เสื้อยืด Odds Versions 2" },
      { "id": 4, "name": "แก้วน้ำ" },
      { "id": 5, "name": "กระเป๋าออกกำลังกาย" },
      { "id": 6, "name": "หมวก" },
      { "id": 7, "name": "เสื้อวิ่ง" },
      { "id": 8, "name": "พวงกุญแจ" },
      { "id": 9, "name": "ถุงผ้า" },
      { "id": 10, "name": "ถุงเท้า" },
      { "id": 11, "name": "ยาดม" },
      { "id": 12, "name": "สมุด" },
      { "id": 13, "name": "ปากกา" },
      { "id": 14, "name": "ดินสอ" },
      { "id": 15, "name": "ผ้าบัฟ" },
      { "id": 16, "name": "ขวดน้ำออกกำลังกาย" }
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