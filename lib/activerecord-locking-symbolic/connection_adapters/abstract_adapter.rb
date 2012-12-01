require 'active_record/connection_adapters/abstract_adapter'
module ActiveRecord
  module Locking
    module Symbolic
      module ConnectionAdapters
        module AbstractAdapter
          def lock_list
            return {
              read: true,
              write: true,
            }
          end
        end
      end
    end
  end
end
