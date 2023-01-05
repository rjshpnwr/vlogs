class BlogsController < ApplicationController
    protect_from_forgery with: :null_session
    
    def blogsList
        data =Blog.all
        render json: data
    end
    def searchBlog
        data =Blog.where("blog_title LIKE?","%"+params[:blog_title]+"%")
        render json: data
    end
    def addBlog
        data=Blog.new({
            "blog_title"=>params[:blog_title],
            "blog_descp"=>params[:blog_descp],
            "users_id"=>params[:users_id]
        })

        data.save
        render json: params
    end
    def singleBlog
        id = params[:id].to_i
        single = Blog.find(id)
        render json: single
    end
    def deleteBlog
        id = params[:id].to_i
        single = Blog.find(id)
        single.destroy
        render json: {}
    end
    def editBlog
        data = Blog.find_by(id: params[:id])
        data.update(
            "blog_title"=>params[:blog_title],
            "blog_descp"=>params[:blog_descp],
            "image_url"=>params[:image_url],
            "users_id"=>params[:users_id]
        )
        render json: data
    end
end
