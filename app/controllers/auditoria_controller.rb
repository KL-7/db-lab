class AuditoriaController < ApplicationController
  def index
    @auditoria = Auditorium.all
  end

  def show
    @auditorium = Auditorium.find(params[:id])
  end

  def new
    @auditorium = Auditorium.new
  end

  def create
    @auditorium = Auditorium.new(params[:auditorium])
    if @auditorium.save
      redirect_to @auditorium, :notice => "Successfully created auditorium."
    else
      render :new
    end
  end

  def edit
    @auditorium = Auditorium.find(params[:id])
  end

  def update
    @auditorium = Auditorium.find(params[:id])
    if @auditorium.update_attributes(params[:auditorium])
      redirect_to @auditorium, :notice  => "Successfully updated auditorium."
    else
      render :edit
    end
  end

  def destroy
    @auditorium = Auditorium.find(params[:id])
    @auditorium.destroy
    redirect_to auditoria_url, :notice => "Successfully destroyed auditorium."
  end
end
