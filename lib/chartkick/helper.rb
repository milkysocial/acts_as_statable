module Chartkick
  module Helper

    def line_chart(data_source, options = {})
      chartkick_chart "LineChart", data_source, options
    end

    def pie_chart(data_source, options = {})
      chartkick_chart "PieChart", data_source, options
    end

    def column_chart(data_source, options = {})
      chartkick_chart "ColumnChart", data_source, options
    end
    
    def line_chart_model(model, options = {})
      line_chart(model.group_by_day(:created_at))
    end

    private

    def chartkick_chart(klass, data_source, options, &block)
      @chartkick_chart_id ||= 0
      options = options.dup
      element_id = options.delete(:id) || "chart-#{@chartkick_chart_id += 1}"
      height = options.delete(:height) || "300px"

      # don't quote font-family names due to rails escaping
      div_tag = content_tag :div, :id => element_id, :style => "height: #{height}; text-align: center; color: #999; line-height: #{height}; font-size: 14px; font-family: Lucida Grande, Lucida Sans Unicode, Verdana, Arial, Helvetica, sans-serif;" do
        concat "Loading..."
      end
      script_tag = javascript_tag do
        concat "new Chartkick.#{klass}(#{element_id.to_json}, #{data_source.to_json}, #{options.to_json});".html_safe
      end
      div_tag + script_tag
    end

  end
end
