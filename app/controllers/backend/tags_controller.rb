# frozen_string_literal: true

module Backend
  class TagsController < BackendController
    before_action :set_tag, only: %i[
      edit
      update
      destroy
    ]
    authorize_resource
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
        flash.now[:notice] = '#Usar i18n'
      else
        flash.now[:alert] = '#Usar i18n'
        render :modal
      end
    end

    def update
      if @tag.update(tag_params)
        flash.now[:notice] = '#Usar i18n'
      else
        flash.now[:alert] = '#Usar i18n'
        render :modal
      end
    end

    def destroy
      @tag.destroy
      flash.now[:notice] = '#Usar i18n'
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
