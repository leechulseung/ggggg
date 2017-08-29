class LcommentController < ApplicationController
    def lcom_create
        @com = Lcom.new
        @com.content = params[:content]
        @com.lbbs1_id = params[:bbs_id]
        @com.user_id = current_user.id
        @com.save
        redirect_to "/board/lshow/#{params[:bbs]}/#{params[:bbs_id]}"
    end
    
    def lcom_destroy
        @com = Lcom.find(params[:com_id])
        @com.destroy
        redirect_to "/board/lshow/#{params[:bbs]}/#{params[:bbs_id]}"
    end
end
