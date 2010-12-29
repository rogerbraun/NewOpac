class BuchesController < ApplicationController

  # GET /buches
  # GET /buches.xml
  def index
    @buches = Buch.paginate :page => params[:page], :order => "id"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @buches }
    end
  end

  def search
    @search = Buch.search(params[:search])
    @buches = @search.paginate(:page => params[:page], :per_page => Buch.per_page)
    respond_to do |format|
      format.html
    end 
  end

  # GET /buchfs/1
  # GET /buches/1.xml
  def show
    @buch = Buch.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @buch }
    end
  end

  # GET /buches/new
  # GET /buches/new.xml
  def new
    @buch = Buch.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @buch }
    end
  end

  # GET /buches/1/edit
  def edit
    @buch = Buch.find(params[:id])
  end

  # POST /buches
  # POST /buches.xml
  def create
    @buch = Buch.new(params[:buch])

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
    @buch.destroy

    respond_to do |format|
      format.html { redirect_to(buches_url) }
      format.xml  { head :ok }
    end
  end
end
