class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]

  def index
    @bills = Bill.all
  end

  def new
    @bill = Bill.new
  end

  def create
    @bill = Bill.new(bill_params)

    if @bill.save
      redirect_to @bill, notice: 'Factura Guardada'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @bill.update(bill_params)
      redirect_to @bill, notice: 'Factura Editada Correctamente'
    else
      render :edit
    end
  end

  def destroy
    @bill = Bill.find(params[:id])
    @bill.destroy
    redirect_to bills_path, notice: 'Factura Borrada'
  end

  private

  def bill_params
    params.require(:bill).permit(:client_names, :emitting_date,
                                 :expiration_date,
                                 items_attributes: [:id, :description, :amount,
                                                    :quantity, :_destroy])
  end

  def set_bill
    @bill = Bill.find(params[:id])
  end
end
