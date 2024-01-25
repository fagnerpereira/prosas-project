class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  # after_action { pagy_headers_merge(@pagy) if @pagy }

  # GET /projects or /projects.json
  def index
    @pagy, @projects = pagy(Project.ordered)
    binding.pry
    pagy_headers_merge(@pagy)
  end

  # GET /projects/1 or /projects/1.json
  def show; end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit; end

  # POST /projects or /projects.json
  def create
    @project = Project.find_by(id: project_params[:id])
    @project = Project.new(project_params) if @project.nil?

    respond_to do |format|
      if @project.new_record? && @project.save
        format.turbo_stream
        format.html { redirect_to project_url(@project), notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      elsif @project.persisted? && @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy!

    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_project
    @project = Project.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def project_params
    params.require(:project).permit(:id, :name, :total_average,
                                    evaluations_attributes: [:id, { grades_attributes: %i[id value criterion_id] }])
  end
end
