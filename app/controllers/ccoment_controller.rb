class CcomentController < ApplicationController
    def ccom_create
        @ccom = Ccomment.new
        @ccom.content = params[:ccom_content]
        @ccom.cbb_id = params[:board_id]
        @ccom.save
        redirect_to "/board/cshow/#{@ccom.cbb_id}"
    end
    
    def ccom_destroy
        @ccom = Ccomment.find(params[:ccom_id])
        @ccom.destroy
        redirect_to "/board/cshow/#{params[:board_id]}"
    end
end
