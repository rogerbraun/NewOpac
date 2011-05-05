#encoding: utf-8
class LendingsController < ApplicationController
  # GET /lendings
  # GET /lendings.xml
  def index
    @lendings = Lending.paginate :page => params[:page], :order => "id"
    authorize! :read, @lendings

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lendings }
    end
  end

  # GET /lendings/1
  # GET /lendings/1.xml
  def show
    @lending = Lending.find(params[:id])
    authorize! :read, @lending

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lending }
    end
  end

  # GET /lendings/new
  # GET /lendings/new.xml
  def new
    if params[:buch_id] then
      @lending = Lending.new(:buch_id => params[:buch_id])
    else
      @lending = Lending.new
    end
    
    @lending.entleiher_id = session[:last_lending_user] 

    @lending.leihende = DateTime.now + 4.weeks

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lending }
    end
  end

  # GET /lendings/1/edit
  def edit
    @lending = Lending.find(params[:id])
  end

  # POST /lendings
  # POST /lendings.xml
  def create
    @lending = Lending.new(params[:lending])
    session[:last_lending_user] = @lending.entleiher.id

    respond_to do |format|
      if @lending.save
        format.html { redirect_to(search_buches_path, :notice => 'Lending was successfully created.') }
        format.xml  { render :xml => @lending, :status => :created, :location => @lending }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lending.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lendings/1
  # PUT /lendings/1.xml
  def update
    @lending = Lending.find(params[:id])
    authorize! :update, @lending

    respond_to do |format|
      if @lending.update_attributes(params[:lending])
        format.html { redirect_to(@lending, :notice => 'Lending was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lending.errors, :status => :unprocessable_entity }
      end
    end
  end

  def return
    @lending = Lending.find(params[:id])
    authorize! :update, @lending
    @lending.update_attributes(:returned => true)

    respond_to do |format|
      format.html { redirect_to(:back, :notice => "Buch zurückgegeben") }  
    end
  end

  # DELETE /lendings/1
  # DELETE /lendings/1.xml
  def destroy
    @lending = Lending.find(params[:id])
    @lending.destroy

    respond_to do |format|
      format.html { redirect_to(lendings_url) }
      format.xml  { head :ok }
    end
  end
end
