class OfficesController < ApplicationController

  def index
    @offices = Office.all
  end

  def new
    @office = Office.new
  end

  def create
    @office = Office.new(office_params)

    if @office.save
      redirect_to @office
    else
      render 'new'
    end
  end

  def show
    @office = Office.find(params[:id])
  end

  def edit
    @office = Office.find(params[:id])
  end

  def update
    @office = Office.find(params[:id])

    if @office.update(office_params)
      redirect_to @office
    else
      render 'edit'
    end
  end

  def destroy
    @office = Office.find(params[:id])
    @office.destroy

    redirect_to offices_path
  end
=begin
  def archivate
    @office.archivate
  end
=end

  private
    def office_params
      params.require(:office).permit(:name)
    end

end
