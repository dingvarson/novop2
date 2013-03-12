class GerapdfsController < ApplicationController
  
  #forçando á ser carregado um outro layout para os relatórios
  layout 'layout_rpt'

  # GET /gerapdfs/1
  # GET /gerapdfs/1.json
  def show
    @cadcli = Cadcli.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cadcli }
    end
  end

end
