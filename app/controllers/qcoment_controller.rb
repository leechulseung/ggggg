class QcomentController < ApplicationController
    def qcom_create
        @qcom = Qcom.new
        @qcom.content = params[:qcom_content]
        @qcom.qbb_id = params[:board_id]
        @qcom.save
        redirect_to "/board/qshow/#{@qcom.qbb_id}"
    end
    
    def qcom_destroy
        @qcom = Qcom.find(params[:qcom_id])
        @qcom.destroy
        redirect_to "/board/qshow/#{params[:board_id]}"
    end
end
