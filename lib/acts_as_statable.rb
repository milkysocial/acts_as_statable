require "chartkick"
require "acts_as_statable/version"
require "acts_as_statable/class_methods_mongoid"
require "acts_as_statable/engine"
require "acts_as_statable/helper"

module ActsAsStatable
  module Mongoid
    def self.included(base)
      base.extend(ClassMethodsMongoid)
    end
  end
end
