class AlbumsController < ApplicationController
  wechat_responder

  before_action :set_user, only: [:new, :create, :index]
  before_action :set_album, only: [:show, :edit, :update, :destroy]
  before_action :permit, only: [:index, :edit, :update, :destroy]

  # 覆盖 wechat-rails(wechat_responder引入) 中的检查签名逻辑, 不检查
  skip_before_action :verify_signature, only: [:show, :create]

  # GET /albums
  # GET /albums.json
  def index
    @albums = @user.albums.order("id desc")
    render layout: "album"
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    render layout: "album"
  end

  # GET /albums/new
  def new
    @album = Album.new
  end

  # GET /albums/1/edit
  def edit
    if @album.published?
      redirect_to @album
    else
      @appid = YAML.load_file("config/wechat.yml")[Rails.env].symbolize_keys[:appid]
      @cfg = AlbumsController.wechat.jsapi_ticket.signature(request.original_url)
      @songs = Song.all
      render layout: "album"
    end
  end

  # POST /albums
  # POST /albums.json
  def create
    @album = @user.albums.build(album_params)

    respond_to do |format|
      if @album.save
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    respond_to do |format|
      if @album.update(album_params)
        format.html { redirect_to @album, notice: 'Album was successfully updated.' }
        format.json { render :show, status: :ok, location: @album }
      else
        format.html { render :edit }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to user_albums_url(@album.user, params: {openid: @album.user.openid}), notice: '海报已经删除.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    def set_album
      @album = Album.find(params[:id])
    end

    def permit
      return true if user_signed_in?
      owner = @user || @album.user
      if owner.openid != params[:openid]
        flash[:notice] = "你无权访问上一个页面, 已跳转至主页.."
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name, :desc, :music, :template, :user_id, :song_id, :status)
    end
end
