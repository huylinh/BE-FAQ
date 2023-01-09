class Api::V1::FaqsController < ApplicationController
  before_action :set_faq, only: %i[ show edit update destroy ]
  # before_action :filter_params, only: %i[ filter]
  # GET /faqs or /faqs.json
  # def index
  #   @faqs = Faq.all
  #   render json: FaqsRepresenter.new(@faqs).as_json
  # end

  def index
      render json:{title: Faq.all,total: Faq.all.count}
  end

  # GET /faqs/1 or /faqs/1.json
  def show
    render json: @faq
  end

  def filterWithId
    # begin
    @limit = limit
    if(@limit == 0) then
      @limit = 100
    end

    if(!params[:offset]) then
      @offset = 0
    else
       @offset = params[:offset]
    end
    
   
   

    if(params[:title_id].to_i ==0 ) then
      render json: {error: "require title"}, status: :unprocessable_entity 
      return
    end
   
    if(params[:search]) then
      @faqs = Faq.where("(question LIKE ? or answer like ?) and title_id LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%","%#{params[:title_id]}%").order(updated_at: :desc)
    else
       @faqs = Faq.where("title_id LIKE ?","%#{params[:title_id]}%").order(updated_at: :desc)
    end    
    total = @faqs.count
    @faqs = @faqs.limit(@limit).offset(@offset)
    # if(limit == 0 || params[:offset].to_i ==0 )
    #     render json: {error: "limit or offser parameters isn't valid or empty"}, status: :unprocessable_entity
    # else
    #     render json: FaqsRepresenter.new(@faqs).as_json, status: :ok
    # end
     render json: FaqsRepresenter.new(@faqs,total).as_json, status: :ok
    # rescue => e
    #   render json: {error: e.message}
    # end
  end

  # GET /faqs/new
  # def new
  #   @faq = Faq.new
  # end

  # GET /faqs/1/edit
  # def edit
  # end

  # POST /faqs or /faqs.json
  def create
    question = Faq.new (faq_params)
    # faq = Faq.create(faq_params)
    # render json: question.title, status: :created
    if question.save
      render json: question, status: :created
    else
      render json: question.errors, status: :unprocessable_entity #request xuat hien khi chua xu li
    end
  end

  # PATCH/PUT /faqs/1 or /faqs/1.json
  def update
      if @faq.update(faq_params) 
        render json: Faq.find(params[:id]), status: :ok
      else
        render json: @faq.errors, status: :unprocessable_entity 
      end
  end

  # DELETE /faqs/1 or /faqs/1.json
  def destroy
    @faq.destroy
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_faq
      begin
        @faq = Faq.find(params[:id])      
      rescue => e
        render json: {error: e.message}
      end
    end
        
    # def filter_params
    #   begin
    #     params.permit(:title_id)
    #   rescue => e
    #     render json: {error: e.message}
    #   end
    # end

    # Only allow a list of trusted parameters through.
    def faq_params
      begin
        params.require(:faq).permit(:question, :answer, :title_id)   
      rescue => e
        render json: {error: e.message}
      end
    end

    def limit
        [
          params.fetch(:limit,100).to_i,
          100
        ].min
    end

end
