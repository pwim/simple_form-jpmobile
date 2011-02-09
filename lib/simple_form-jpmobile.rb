module SimpleForm
  module KeitaiInput
    def mobile
      @builder.template.request.mobile
    end

    def input
      if mobile
        if mobile.docomo?
          input_html_options[:type] ||= "text"
          input_html_options[:style] = %Q{-wap-input-format:"*<ja:#{docomo_wap_input_format}>"}
        elsif mobile.au? || mobile.softbank?
          input_html_options[:type] ||= "text"
          input_html_options[:istyle] ||= istyle
          input_html_options[:mode] ||= mode
          input_html_options[:style] ||= %Q{-wap-input-format:*#{other_wap_input_format};}
        end
      end
      super
    end

  end

  class Inputs::HiraganaInput < Inputs::StringInput
    include KeitaiInput
    def docomo_wap_input_format; 'h'; end
    def other_wap_input_format; 'M'; end
    def mode; 'hiragana'; end
    def istyle; '1'; end
  end

  class Inputs::HankakuKanaInput < Inputs::StringInput
    include KeitaiInput
    def docomo_wap_input_format; 'hk'; end
    def other_wap_input_format; 'M'; end
    def mode; 'hankakukana'; end
    def istyle; '2'; end
  end

  class Inputs::AlphabetInput < Inputs::StringInput
    include KeitaiInput
    def docomo_wap_input_format; 'en'; end
    def other_wap_input_format; 'm'; end
    def mode; 'alphabet'; end
    def istyle; '3'; end
  end

  class Inputs::KeitaiNumericInput < Inputs::NumericInput
    include KeitaiInput
    def docomo_wap_input_format; 'n'; end
    def other_wap_input_format; 'N'; end
    def mode; 'numeric'; end
    def istyle; '4'; end
  end

  FormBuilder.class_eval do
    map_type :integer, :decimal, :float, :to => Inputs::KeitaiNumericInput
  end

  module Jpmobile
  end
end
