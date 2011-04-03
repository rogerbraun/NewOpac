class EntleihersController < ApplicationController
  # GET /entleihers
  # GET /entleihers.xml
  def index
    @entleihers = Entleiher.paginate :page => params[:page]
    
    authorize! :read, @entleihers

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entleihers }
    end
  end

  # GET /entleihers/1
  # GET /entleihers/1.xml
  def show
    @entleiher = Entleiher.find(params[:id])

    authorize! :read, @entleihers

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entleiher }
    end
  end

  # GET /entleihers/new
  # GET /entleihers/new.xml
  def new
    @entleiher = Entleiher.new

    authorize! :create, @entleihers

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entleiher }
    end
  end

  # GET /entleihers/1/edit
  def edit
    @entleiher = Entleiher.find(params[:id])
  end

  # POST /entleihers
  # POST /entleihers.xml
  def create
    @entleiher = Entleiher.new(params[:entleiher])

    respond_to do |format|
      if @entleiher.save
        format.html { redirect_to(@entleiher, :notice => 'Entleiher was successfully created.') }
        format.xml  { render :xml => @entleiher, :status => :created, :location => @entleiher }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entleiher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entleihers/1
  # PUT /entleihers/1.xml
  def update
    @entleiher = Entleiher.find(params[:id])

    respond_to do |format|
      if @entleiher.update_attributes(params[:entleiher])
        format.html { redirect_to(@entleiher, :notice => 'Entleiher was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entleiher.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entleihers/1
  # DELETE /entleihers/1.xml
  def destroy
    @entleiher = Entleiher.find(params[:id])
    @entleiher.destroy

    respond_to do |format|
      format.html { redirect_to(entleihers_url) }
      format.xml  { head :ok }
    end
  end
end
