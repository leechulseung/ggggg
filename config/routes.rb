Rails.application.routes.draw do

  devise_for :users
  get 'home/main'

  
  get 'home/index'

  get 'mypage/mp'

  get 'mypage/cpg'


  
  get '/board/qb' => 'board#qb'
  
  get '/board/cb' => 'board#cb'
  
  get '/home/index' => 'home#index'
  
  #자유게시판 글쓰기
  get '/board/newcb' => 'board#newcb'
  post '/board/create' => 'board#create'
  
  #Q&A 글쓰기
  get '/board/newqb' => 'board#newqb'
  post '/board/qcreate' => 'board#qcreate'
  #Q&A삭제 
  post '/board/qdestroy/:board_qid' => 'board#qdestroy'
  #Q&A show
  get '/board/qshow/:board_qid' => 'board#qshow'
  #Q&A 수정
  get '/board/qedit/:board_qid' => 'board#qedit'
  post '/board/qupdate/:board_qid' => 'board#qupdate'
  #Q&A 댓글
  post '/board/qshow/:board_id/qcoment/qcom_create' => 'qcoment#qcom_create'
  post '/board/qshow/:board_id/qcoment/qcom_destroy/:qcom_id' => 'qcoment#qcom_destroy'
  
  #자유게시판show
  get '/board/cshow/:board_id' => 'board#cshow'
  #Q&A show
  get '/board/qshow' => 'board#qshow'
  
  #자유게시판 삭제
  post '/board/cdestroy/:board_id' => 'board#cdestroy'
  
  #자유게시판 수정
  get '/board/cedit/:board_id' => 'board#cedit'
  post '/board/cupdate/:board_id' => 'board#cupdate'
  
  #자유게시판 댓글
  post '/board/cshow/:board_id/ccoment/ccom_create' => 'ccoment#ccom_create'
  post '/board/cshow/:board_id/ccoment/ccom_destroy/:ccom_id' => 'ccoment#ccom_destroy'
   #강의평가 게시판
  ## 게시판 URL
  get '/board/lb' #교양 게시판 
  get '/board/lbbs1' => 'board#lb' #크리에이트 리다이렉트를 위하여 만든 url
  
  #CRUD URL
  get '/board/lnew/:bbs' => 'board#lnew'
  get '/board/ledit/:bbs/:bbs_id' => 'board#ledit'
  get '/board/lcreate/:bbs' => 'board#lcreate'
  get '/board/lupdate/:bbs/:bbs_id' => 'board#lupdate'
  get '/board/ldestroy/:bbs/:bbs_id'=> 'board#ldestroy'
  get '/board/lshow/:bbs/:bbs_id'=> 'board#lshow'
  
  #COMMENT URL
  get '/board/lshow/:bbs/:bbs_id/lcomment/lcom_create' => 'lcomment#lcom_create'
  get '/board/lshow/:bbs/:bbs_id/lcomment/lcom_destroy/:com_id' => 'lcomment#lcom_destroy'

  # root 'home#index'
  root 'home#main'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
