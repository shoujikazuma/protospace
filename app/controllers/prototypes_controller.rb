class PrototypesController < ApplicationController
   before_action :set_prototype, only: [:show, :edit, :update, :destroy]

    def index
     @prototypes = Prototype.all
    end

    def show
     @prototype= Prototype.where(:user_id => params[:user_id])
    end

    def new
     @prototype = Prototype.new
     @prototype.prototype_images.build
   end

   def edit
   end
 
   def create
     @prototype = Prototype.new(title: prototype_params[:title], catch_copy: prototype_params[:catch_copy], concept: prototype_params[:concept], user_id: current_user.id)
 
     respond_to do |format|
       if @prototype.save
         format.html { redirect_to root_path, notice: 'Prototype was successfully created.' }
         format.json { render :show, status: :created, location: @prototype }
       else
         format.html { render :new }
         format.json { render json: @prototype.errors, status: :unprocessable_entity }
       end
     end
    end

   def destroy
     @prototype.destroy
     respond_to do |format|
       format.html { redirect_to prototypes_url, notice: 'Prototype was successfully destroyed.' }
       format.json { head :no_content }
     end
   end
 
   private

     def set_prototype
       @prototype = Prototype.find(params[:id])
     end

     def prototype_params
      params.require(:prototype).permit(
         :title,
         :catch_copy,
         :concept,
         prototype_images_attributes:[:id, :image_url, :role]
       )
    end
  end