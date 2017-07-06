class PostsController < ApplicationController
    #GET /posts
    def index
        @posts = Post.all
    end
    
    #GET /posts/:id
    def show
        @post = Post.find(params[:id])
    end
   
    #GET /post/new
    def new
        @post = Post.new
    end
    
    #POST /posts
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end

    #GET post/:id/edit
    def edit
        @post = Post.find(params[:id])
    end
    
    #PATCH /posts/:id
    #PUT /posts/:id
    
    def update
      @post = Post.find(params[:id])
    
      if @post.update(post_params)
        redirect_to @post
      else
        render 'edit'
      end
    end
    
    #DELETE /posts/:id
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :text)
        end
    

end
