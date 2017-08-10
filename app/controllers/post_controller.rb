require_relative '../../config/environment'
require 'pry'

class PostController < ApplicationController


  get '/' do

  end

#----------------------------------------------------------
  #Create
  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    @post = Post.new(params)
    @post.save
    # binding.pry
    erb :index
  end

#----------------------------------------------------------
  #Read
  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end
  #----------------------------------------------------------
  #Update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id].to_i)
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    redirect "/posts/#{@post.id}"
  end
  #----------------------------------------------------------
  #Delete


  delete '/posts/:id/delete' do
    # binding.pry
    @post = Post.find(params[:id].to_i)
    @post.delete
    erb :delete
  end

  get '/posts/:id/delete' do
    @post = Post.find(params[:id].to_i)
    erb :show
  end






end
