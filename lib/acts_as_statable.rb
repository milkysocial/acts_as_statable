require "acts_as_statable/version"
require "acts_as_statable/statable"
require "chartkick/engine"
require "chartkick/helper"

module ActsAsStatable
  def self.included(base)
    base.extend(ActsAsStatable::Mongoid)
  end
end
