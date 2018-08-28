class AddressesController < ApplicationController
  def new
    @student = Student.find(params[:student_id])
    @address = Address.new
  end

  def create
    Address.create(address_params)
    redirect_to student_path(params[:student_id])
  end

  private
    def address_params
      params.require(:address).permit(:description, :street, :city, :state, :zip, :student_id)
    end
end
