class FaqsRepresenter
    def initialize(faqs)
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
            total: faqs.count
        }
    end

    private 
    attr_reader :faqs

end