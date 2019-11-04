module Backend
    class TagsController < BackendController
  
      before_action :set_tag, only: [
        :edit,
        :update,
        :destroy
      ]
      def index
        @tags = Tag.all
      end
  
      def new
        @tag = Tag.new
        render :modal
      end
  
      def edit
        render :modal
      end
  
      def create
        @tag = Tag.new(tag_params)
        if @tag.save
          flash.now[:notice] = 'Tag creado'
        else
          flash.now[:alert] = 'Error creando tag'
          render :modal
        end
      end

      def update
        if @tag.update(tag_params)
          flash.now[:notice] = 'Tag modificado'
        else
          flash.now[:alert] = 'Error modificando tag'
          render :modal
        end
      end

      def destroy
        @tag.destroy
        flash.now[:notice] = 'Tag eliminado'
      end

      private

      def set_tag
        @tag = Tag.find(params[:id])
      end
  
      def tag_params
        params.require(:tag).permit(:name)
      end
    end
  end
  