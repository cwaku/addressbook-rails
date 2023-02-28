# frozen_string_literal: true

class RolesController < ApplicationController
  before_action :set_role, only: %i[show edit update destroy]
  before_action :load_permissions
  load_and_authorize_resource
  before_action :super_admin?

  # GET /roles or /roles.json
  def index
    @roles = Role.order('id asc').all
  end

  # GET /roles/1 or /roles/1.json
  def show
    # @role = Role.find(params[:id])
  end

  # GET /roles/new
  def new
    # @entity_info_search = EntityInfo.where(active_status: true).order(entity_name: :asc)

    @role = Role.new
    @permissions = Permission.all.where("subject_class !='Role'").compact
    @role_permissions = @role.permissions.collect(&:id)
  end

  # GET /roles/1/edit
  def edit
    @permissions = Permission.where("id != '1'").where("subject_class !='Role'").compact
    @role_permissions = @role.permissions.collect(&:id)
  end

  # POST /roles or /roles.json
  def create
    # @role = Role.new(role_params)
    @role = Role.new(role_params)
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]

    respond_to do |format|
      if @role.save
        format.html { redirect_to role_url(@role), notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        @permissions = Permission.where("id != '1'").where("subject_class !='Role'").compact
        @role_permissions = @role.permissions.collect(&:id)
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1 or /roles/1.json
  def update
    @role.permissions = []
    @role.set_permissions(params[:permissions]) if params[:permissions]

    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to role_url(@role), notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        @permissions = Permission.where("id != '1'").where("subject_class !='Role'").compact
        @role_permissions = @role.permissions.collect(&:id)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1 or /roles/1.json
  def destroy
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'Role was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def role_params
    params.require(:role).permit(:name, :unique_code, :active_status, :del_status)
  end

  def super_admin?
    return true if current_user.role.name == 'Super Admin'

    redirect_to root_path, notice: 'You are not authorized to access this page.'
  end
end
