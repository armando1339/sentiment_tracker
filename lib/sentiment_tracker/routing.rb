module ActionDispatch::Routing
  class Mapper

    # => Inserting routes
    #
    # Example: 
    #
    # sentiment_tracker do
    #   resources :texts
    # end
    #
    def sentiment_tracker
      scope :rails, defaults: { format: :json } do
        scope :sentiment_tracker do
          scope(:operations){ resources :texts }
        end
      end
    end
  end
end