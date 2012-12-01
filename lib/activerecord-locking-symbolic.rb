require 'active_support'
require 'active_support/core_ext/hash'
require 'active_record'
require "activerecord-locking-symbolic/version"
require "activerecord-locking-symbolic/pessimistic"
require "activerecord-locking-symbolic/query_methods"
require "activerecord-locking-symbolic/connection_adapters/abstract_adapter"
require "activerecord-locking-symbolic/connection_adapters/mysql2_adapter"

module ActiveRecord
  module Locking
    module Symbolic

      if defined?( ::Rails )
        class Railtie < ::Rails::Railtie
          def self.apply_activerecord_patch
            ActiveSupport.on_load(:active_record) do
              ActiveRecord::Base.send(:include,  ActiveRecord::Locking::Symbolic::Pessimistic )
              ActiveRecord::SpawnMethods.send(:include,  ActiveRecord::Locking::Symbolic::QueryMethods )
              ActiveRecord::ConnectionAdapters::AbstractAdapter.send( :include, ActiveRecord::Locking::Symbolic::ConnectionAdapters::AbstractAdapter )
              if defined?( ActiveRecord::ConnectionAdapters::Mysql2Adapter )
                ActiveRecord::ConnectionAdapters::Mysql2Adapter.send( :include, ActiveRecord::Locking::Symbolic::ConnectionAdapters::Mysql2Adapter )
              end
            end
          end

          config.after_initialize do
            self.apply_activerecord_patch
          end
        end
      end

    end
  end
end

