class AuditoriumTypesController < ApplicationController
  def index
    @auditorium_types = AuditoriumType.all
  end

  def show
    @auditorium_type = AuditoriumType.find(params[:id])
  end

  def new
    @auditorium_type = AuditoriumType.new
  end

  def create
    @auditorium_type = AuditoriumType.new(params[:auditorium_type])
    if @auditorium_type.save
      redirect_to @auditorium_type, :notice => "Successfully created auditorium type."
    else
      render :new
    end
  end

  def edit
    @auditorium_type = AuditoriumType.find(params[:id])
  end

  def update
    @auditorium_type = AuditoriumType.find(params[:id])
    if @auditorium_type.update_attributes(params[:auditorium_type])
      redirect_to @auditorium_type, :notice  => "Successfully updated auditorium type."
    else
      render :edit
    end
  end

  def destroy
    @auditorium_type = AuditoriumType.find(params[:id])
    @auditorium_type.destroy
    redirect_to auditorium_types_url, :notice => "Successfully destroyed auditorium type."
  end
end
