module DataContainers
  class TestForm
    include ActiveModel::Validations

    attr_reader :params

    validates :selected_option, :filled_text, :picked_rb, :checked_box, presence: true

    def initialize(params)
      @params = params
    end

    def selected_option
      params[:example_select]
    end

    def filled_text
      params[:example_textfield]
    end

    def picked_rb
      params[:example_radiobutton]
    end

    def checked_box
      params[:example_checkbox]
    end
  end
end

