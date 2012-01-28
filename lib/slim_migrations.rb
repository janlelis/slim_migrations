require 'slim_migrations/version'

module SlimMigrations
end

module Kernel
  private

  # initialize migrations with <tt>migration do</tt> instead of <tt>class SomeMigration < ActiveRecord::Migration</tt>
  def migration(&block)
    if caller[0].rindex(/\/(?:[0-9]+)_([_a-z0-9]*).rb:\d+(?::in `.*')?$/)
      m = Object.const_set $1.camelize, Class.new(ActiveRecord::Migration)
      m.instance_eval(&block) # 3.0 / 2.3
    else
      raise ArgumentError, "Could not create migration at: #{caller[0]}"
    end
  end
end
