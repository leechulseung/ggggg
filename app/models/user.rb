class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many  :cbbs
  has_many  :lcoms
  has_many  :qbbs
  
  #포멧터
  # validates_format_of	:email, :with => /^[a-zA-Z0-9_]{6,30}$/, :message => "이메일 영문과 숫자 4~20자만 가능합니다."
  
  #빈 공간에 값이 없을 때
  validates_presence_of :nickname, message: "닉네임을 입력하지 않았습니다."
  validates_presence_of :number, message: "학번을 입력하지 않았습니다."
  validates_presence_of :major, message: "학과를 입력하지 않았습니다."
  validates_presence_of :job, message: "직업을 선택하지 않았습니다."
  
  #값이 하나만 존재해야 한다. 중복가입을 할 수 없게 도와준다. 
  validates_uniqueness_of :nickname, message: "같은 닉네임 존재합니다."
  validates_uniqueness_of :number, message: "같은 학번이 존재합니다."
end
