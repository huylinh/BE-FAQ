class FaqsRepresenter
    def initialize(faqs,total)
      @total = total
      @faqs = faqs
    end

    def as_json
        faqs.map do |faq|
            {
              id: faq.id,
              title: faq.title.name,
              question: faq.question,
              answer: faq.answer,
              update: faq.updated_at
            }
        end
        res = {
            faqs: faqs,
            total: @total.to_s
        }
    end

    private 
    attr_reader :faqs

end