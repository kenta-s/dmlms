class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy, :update_label]

  # GET /news
  # GET /news.json
  def index
    @news = News.page(params[:page])

    respond_to do |format|
      format.html { render :index }
      format.json { render :index }
      format.csv { send_data render_to_string, filename: News.generate_filename_as_csv, type: :csv }
    end
  end

  def quick_labelling
    @news = News.unlabelled.first
  end

  def update_label
    if @news.update(news_params)
        redirect_to quick_labelling_news_index_path(@news), notice: 'News was successfully updated.'
    else
        render :quick_labelling
    end
  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
  end

  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upload_file
    file = params[:file]
    extname = File.extname(file.original_filename)
    case extname
    when '.json'
      import_news_from_json
    else
      raise "Unsupported file type: #{file.original_filename}"
    end
    redirect_to news_index_path, notice: t('messages.created', item: 'news')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:key, :content, :label)
    end

    def import_news_from_json
      file = params[:file].read
      file = file.force_encoding('utf-8')
      json = JSON.parse(file)
      json.each do |row|
        key = row.first
        news = News.find_or_initialize_by(key: key)
        content_hash = row.second
        news.content = content_hash['content']
        news.label ||= content_hash['label']
        news.save
      end
    end
end
