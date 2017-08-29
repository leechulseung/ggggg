# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'uri'
require 'open-uri'
require 'mechanize'

@agent = Mechanize.new
@page = @agent.get('http://sangji.ac.kr/user/sangji/sangji.jsp')
@my_page = @page.form_with(:action => 'https://www.sangji.ac.kr/user/login.action') do |f|
  f.field_with(:name => 'userId').value = '201279065'
  f.field_with(:name => 'userPw').value = 'dhwpdnd2'
end.submit

@page = @page.link_with(:href => 'http://hakjuk.sangji.ac.kr/').click
@page = @page.frame_with(src: './ss00/ss00_ss00050.jsp?hakyy=2017&hakgi=1').click
@page = @page.link_with(:href => '../ss008/ss008_ss00800.jsp').click
@page = @page.frame_with(src: './ss008_ss00802.jsp?hakyy=2017&hakgi=1').click
@select_page = @page.form_with(:action => '../ss008/ss008_ss00803.jsp') do |f|
  f.field_with(:name => 'hakcode').value = "ZZ14E"
  f.field_with(:name => 'juncode').value = "---"
end.submit

@pow = Nokogiri::HTML(@select_page.content.force_encoding("euc-kr"), nil, 'euc-kr')
@notices_class = @pow.css('td a font').text

name = []
gp = []
class_code = []
for num in 2..25
  name << @pow.css("tr:nth-child(#{num}) td:nth-child(7) font").text
  gp << @pow.css("tr:nth-child(#{num}) td:nth-child(5) font").text.to_i
  class_code << @pow.css("tr:nth-child(#{num}) td:nth-child(4) font").text
end

@notices_gp = gp
@notices_class_code = class_code
@notices_name = name
@notices_class = @notices_class.split(" ")

23.times do |index|
   Lbbs1.create(title: @notices_class[index], name: @notices_name[index], class_code: @notices_class_code[index], gp: @notices_gp[index])
end