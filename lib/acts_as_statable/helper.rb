module ActsAsStatable
  module Helper
    def line_chart_model(model, options = {})
      line_chart(model.group_by_date(:created_at))
    end

    def chart_box(model, title)
      %Q{
        <div class="well">
          <h3>#{title} : #{model.all.count}</h3>
          #{line_chart_model model}
        </div>
      }.html_safe
    end
  end
end