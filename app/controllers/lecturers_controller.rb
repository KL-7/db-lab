class LecturersController < ApplicationController
  def index
    @lecturers = Lecturer.all
  end

  def show
    @lecturer = Lecturer.find(params[:id])
  end

  def new
    @lecturer = Lecturer.new
  end

  def create
    @lecturer = Lecturer.new(params[:lecturer])
    if @lecturer.save
      redirect_to @lecturer, :notice => "Successfully created lecturer."
    else
      render :new
    end
  end

  def edit
    @lecturer = Lecturer.find(params[:id])
  end

  def update
    @lecturer = Lecturer.find(params[:id])
    if @lecturer.update_attributes(params[:lecturer])
      redirect_to @lecturer, :notice  => "Successfully updated lecturer."
    else
      render :edit
    end
  end

  def destroy
    @lecturer = Lecturer.find(params[:id])
    @lecturer.destroy
    redirect_to lecturers_url, :notice => "Successfully destroyed lecturer."
  end
end
