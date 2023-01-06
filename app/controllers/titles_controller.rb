class TitlesController < ApplicationController
    before_action :set_title, only: %i[ show edit update destroy ]

    def index
        render json:{title: Title.all,total: Title.all.count}
    end

    def filter
        @title = Title.limit(limit).offset(params[:offset])
        if(params[:filtername]) then
        @title = @title.where("name LIKE ?", "%" + params[:filtername] + "%")
        end
        render json: {
          title:   @title,
          total: @title.count
        },
        status: :ok       
    end

    def show 
        render json: @title
    end

    def create
        title = Faq.new (faq_params)
        # faq = Faq.create(faq_params)
            # render json: question.title, status: :created
        if question.save
        render json: title, status: :created
        else
        render json: title.errors, status: :unprocessable_entity #request xuat hien khi chua xu li
        end
    end

      def update
      if @title.update(faq_params) 
        render json: @title, status: :ok
      else
        render json: @faq.errors, status: :unprocessable_entity 
      end
    end

    def destroy
        @title.destroy
        head :ok
    end

    private
    def set_title
      @title = Title.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def title_params
      params.require(:title).permit(:name)
    end

    def limit
    [
      params.fetch(:limit,100).to_i,
      100
    ].min
    end
end
