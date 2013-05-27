require "acts_as_statable/version"
require "chartkick/engine"
require "chartkick/helper"

module ActsAsStatable
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def group_by_minute(field)
      map = %Q{
        function() {
          var created_at = new Date(this.#{field}.getFullYear(),
                                            this.#{field}.getMonth(), 
                                            this.#{field}.getDate(), 
                                            this.#{field}.getHours(), 
                                            this.#{field}.getMinutes()
                                          );
          emit(created_at, {count: 1});
        }
      }

      self.group_by_time(map)
    end

    def group_by_hour(field)
      map = %Q{
        function() {
          var created_at = new Date(this.#{field}.getFullYear(),
                                            this.#{field}.getMonth(), 
                                            this.#{field}.getDate(), 
                                            this.#{field}.getHours()
                                          );
          emit(created_at, {count: 1});
        }
      }

      self.group_by_time(map)
    end

    def group_by_date(field)
      map = %Q{
        function() {
          var created_at = new Date(this.#{field}.getFullYear(),
                                            this.#{field}.getMonth(), 
                                            this.#{field}.getDate()
                                          );
          emit(created_at, {count: 1});
        }
      }

      self.group_by_time(map)
    end

    def group_by_month(field)
      map = %Q{
        function() {
          var created_at = new Date(this.#{field}.getFullYear(),
                                            this.#{field}.getMonth()
                                          );
          emit(created_at, {count: 1});
        }
      }

      self.group_by_time(map)
    end

    def group_by_time(map)

      reduce = %Q{
        function(key, values) { 
           var total = 0;
           for(var i = 0; i < values.length; i++) { total += values[i].count; }
           return {count: total};
        }
      }

      output = []

      self.all.map_reduce(map, reduce).out(inline: true).each do |item|
        output << [item["_id"], item["value"]["count"]]
      end

      output
    end
  end
end
