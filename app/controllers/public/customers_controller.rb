class Public::CustomersController < ApplicationController

   # before_action :ensure_guest_user, only: [:edit]

   def show
     @customer = current_customer
     @customers = Customer.all.uniq
   end

   def edit
     @customer = current_customer
   end

   def update
     @customer = current_customer
     if @customer.update(customer_params)
        redirect_to customers_my_page_path
     else
        render :customers_information_edit_path
     end
   end

   def unsubscribe
     @customer = current_customer
   end

   def withdraw
     @customer = current_customer
     @customer.update(is_deleted: true)
     reset_session
     redirect_to root_path
   end

   private

   # ↓メンターに聞いてから
   # def ensure_guest_user
   #    @customer = Customer.find(params[:id])
   #    if @customer.last_name == "user"
   #       redirect_to root_path(current_user) , notice: 'ゲストユーザーは会員編集画面へは遷移できません。'
   #    end
   # end

   def customer_params
     params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :address, :telephone_number, :password, :image)
   end
end
