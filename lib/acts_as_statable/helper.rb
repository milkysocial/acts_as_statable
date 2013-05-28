module ActsAsStatable
  module Helper
    def line_chart_model(model, options = {})
      line_chart(model.group_by_date(:created_at))
    end
  end
end
