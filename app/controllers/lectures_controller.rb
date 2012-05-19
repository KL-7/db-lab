class LecturesController < ApplicationController
  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def new
    @lecture = Lecture.new
  end

  def create
    @lecture = Lecture.new(params[:lecture])
    if @lecture.save
      redirect_to @lecture, :notice => "Successfully created lecture."
    else
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:id])
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update_attributes(params[:lecture])
      redirect_to @lecture, :notice  => "Successfully updated lecture."
    else
      render :edit
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to lectures_url, :notice => "Successfully destroyed lecture."
  end
end
