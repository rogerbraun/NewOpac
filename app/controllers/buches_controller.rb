class BuchesController < ApplicationController


  # GET /buches
  # GET /buches.xml
  def index
    @buches = Buch.paginate :page => params[:page], :order => "id"
    authorize! :read, @buches 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buches }
    end
  end

  def advanced_search
    @search = Buch.search(params[:search])
    respond_to do |format|
      format.html
    end 
  end

  def search
    @search = Buch.search(params[:search])
    @buches = @search.paginate(:page => params[:page], :per_page => Buch.per_page)
    authorize! :read, Buch 
    respond_to do |format|
      format.html
    end 
  end

  # GET /buchfs/1
  # GET /buches/1.xml
  def show
    @buch = Buch.find(params[:id])
    authorize! :read, @buch 
    if can? :create, Lending and not @buch.entliehen? then
      @lending = Lending.new
      @lending.leihende = Time.now + 4.weeks
      @lending.entleiher_id = session[:last_lending_user] 
      @lending.returned = false
      @lending.buch = @buch
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @buch }
    end
  end

  # GET /buches/new
  # GET /buches/new.xml
  def new
    @buch = Buch.new

    authorize! :create, @buch

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @buch }
    end
  end

  # GET /buches/1/edit
  def edit
    @buch = Buch.find(params[:id])
    
    authorize! :update, @buch
  end

  # POST /buches
  # POST /buches.xml
  def create
    @buch = Buch.new(params[:buch])
    
    authorize! :create, @buch

    respond_to do |format|
      if @buch.save
        format.html { redirect_to(@buch, :notice => 'Buch was successfully created.') }
        format.xml  { render :xml => @buch, :status => :created, :location => @buch }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @buch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /buches/1
  # PUT /buches/1.xml
  def update
    @buch = Buch.find(params[:id])

    authorize! :update, @buch
    
    respond_to do |format|
      if @buch.update_attributes(params[:buch])
        format.html { redirect_to(@buch, :notice => 'Buch was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @buch.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /buches/1
  # DELETE /buches/1.xml
  def destroy
    @buch = Buch.find(params[:id])

    authorize :destroy, @buch
    
    @buch.destroy

    respond_to do |format|
      format.html { redirect_to(buches_url) }
      format.xml  { head :ok }
    end
  end
end
