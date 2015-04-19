class AuthorsController < ApplicationController

  before_action :load_post

  before_action :set_author, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # @authors = Author.all
    @authors = @post.authors

    #respond_with(@authors)
  end

  def show
    respond_with(@author)
  end

  def new
    # @author = @post.authors.build
    # @author = Author.new
    @author = @post.authors.build
    respond_with(@author)
  end

  def edit
  end

  

  def create
    @author  = @post.authors.build(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to [@post, @author], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end  

  def update
    respond_to do |format|
      if @author.update_attributes(author_params)
        format.html { redirect_to [@post, @author], notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @author.destroy
    #respond_with(@author)
  end
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to post_authors_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_author
      @author = @post.authors.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:title, :name)
    end
    def load_post
      @post = Post.find(params[:post_id])
    end
end
