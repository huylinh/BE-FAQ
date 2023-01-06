class FaqsController < ApplicationController
  before_action :set_faq, only: %i[ show edit update destroy ]

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

  def filter
    @faqs = Faq.limit(limit).offset(params[:offset])
    if(params[:search]) then
       @faqs = @faqs.where("question LIKE ?", "%" + params[:search] + "%")
    end
    render json: FaqsRepresenter.new(@faqs).as_json, status: :ok
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
      @faq = Faq.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def faq_params
      params.require(:faq).permit(:question, :answer, :title_id)
    end

    def limit
    [
      params.fetch(:limit,100).to_i,
      100
    ].min
    end
end
