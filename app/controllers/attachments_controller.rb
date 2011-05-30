#encoding: utf-8
class AttachmentsController < ApplicationController
  def new
  end

  def create
    @attachment = Attachment.new(params[:attachment])
    @attachment.filename = params[:attachment][:content].original_filename
    
    authorize! :create, Attachment

    respond_to do |format|
      if @attachment.save
        format.html { redirect_to(@attachment.buch, :notice => 'Datei erfolgreich hinzugefügt.') }
      else
        format.html { redirect_to :back, :notice => "Das hat nicht funktioniert..." }
      end
    end
    
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    authorize! :destroy, @attachment
    
    buch = @attachment.buch
    @attachment.destroy

    respond_to do |format|
      format.html { redirect_to buch, :notice => "Datei erfolgreich entfernt." }
      format.xml  { head :ok }
    end
  end

end
