class BoardController < ApplicationController
  before_action :authenticate_user!
  
  #강의평가 게시판
  def lb #강의평가 메인(교양)
    @post = Lbbs1.all
  end
  
  def ledit # 편집 뷰어 
    @post = @post = params[:bbs].capitalize.constantize.find(params[:bbs_id])
    @bbs = params[:bbs]
  end
  
  def lupdate
    @post = @post = params[:bbs].capitalize.constantize.find(params[:bbs_id])
    #constantize함수로 상수화를 통해 변수를 상수로만들고, 객체를 생성할 수 있게 된다.
    @post.title = params[:title]
    @post.name = params[:contents]
    @post.save
    
    redirect_to "/board/#{params[:bbs]}"
  end
  def lnew # 강평 개설 뷰
    @bbs = params[:bbs]
  end
  
  def lcreate # 강의 개설
    @post = params[:bbs].capitalize.constantize.new
    #constantize함수로 상수화를 통해 변수를 상수로만들고, 객체를 생성할 수 있게 된다.
    @post.class_code = params[:class_code]
    @post.title = params[:title]
    @post.name = params[:contents]
    @post.gp = params[:gp]
    @post.save
    
    redirect_to "/board/#{params[:bbs]}"
  end
  
  def lshow # 강의 댓글 페이지
    @pname = params[:bbs]
    @post = params[:bbs].capitalize.constantize.find(params[:bbs_id])
    @com = Lcom.where(lbbs1_id: params[:bbs_id])
  end
  
  def ldestroy #강의 폐강 메소드
    @post = params[:bbs].capitalize.constantize.find(params[:bbs_id])
    @post.destroy
    redirect_to "/board/#{params[:bbs]}"
  end

  
  ## 자유게시판 
  
  
  def cb #자유게시판
    @cbb = Cbb.all
  end
  
  def create  #자유게시판 db접근
      @cbbs = Cbb.new
      @cbbs.title = params[:title]
      @cbbs.content = params[:contents]
      #@cbbs.user_id = current_user.id
      @cbbs.save
      redirect_to '/board/cb'
  end
  
  def newcb #자유게시판 글쓰기
  end
  
  def cdestroy #자유게시판 삭제
    @cbbs = Cbb.find(params[:board_id])
    @cbbs.destroy
    redirect_to '/board/cb'
  end 
  
  def cupdate
    @cbbs = Cbb.find(params[:board_id])
    @cbbs.title = params[:input_title]
    @cbbs.content = params[:input_content]
    @cbbs.save
    
    redirect_to "/board/cshow/#{@cbbs.id}"
  end  
  def cedit
    @cbbs = Cbb.find(params[:board_id])
  end
  
  def cshow #자유게시판 각각의 show
    @cbbs = Cbb.find(params[:board_id])
    @ccom = Ccomment.where(cbb_id: params[:board_id])
  end 
  
  
  
  
  #질문게시판
  def qb #질문 게시판
    @qbb = Qbb.all
  end
  
  def qcreate #Q&A db접근
        @qbb = Qbb.new
        @qbb.title = params[:title]
        @qbb.content = params[:contents]
       # @qbb.user_id = current_user.id
        @qbb.save
        
        redirect_to '/board/qb'
  end

  def newqb #Q&A 글쓰기
  end
  
  
  def qshow #Q&A 각각의 show
    @qbbs = Qbb.find(params[:board_qid])
    @qcom = Qcom.where(qbb_id: params[:board_qid])
  end
  
  
  def qdestroy #Q&A 삭제
    @qbbs = Qbb.find(params[:board_qid])
    @qbbs.destroy
    redirect_to '/board/qb'
  end
  
  def qedit
    @qbbs = Qbb.find(params[:board_qid])
  end

  def qupdate
    @qbbs = Qbb.find(params[:board_qid])
    @qbbs.title = params[:input_title]
    @qbbs.content = params[:input_content]
    @qbbs.save
    redirect_to "/board/qshow/#{@qbbs.id}"
  end
  
end