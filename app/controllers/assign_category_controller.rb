class AssignCategoryController < ApplicationController
  def new
    @assign_category = AssignCategory.new
  end

  def create
    @assign_category = AssignCategory.new assign_category_params

    respond_to do |format|
      if assign_category_service.call(@assign_category)
        format.html { redirect_to '/assign_categories', notice: 'Category assigned successfully.' }
      else
        format.html { render '/assign_category/new' }
      end
    end
  end

  private

  def assign_category_params
    params.require(:assign_category).permit(:name, :question)
  end

  def assign_category_service
    @assign_category_service ||= AssignCategoryService.new
  end
end
