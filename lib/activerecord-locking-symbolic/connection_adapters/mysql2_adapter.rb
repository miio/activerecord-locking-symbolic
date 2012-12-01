module ActiveRecord
  module Locking
    module Symbolic
      module ConnectionAdapters
        module Mysql2Adapter
          LOCK_LIST = {
            read: "LOCK IN SHARE MODE",
            write: true
          }
          def lock_list
            return LOCK_LIST
          end
        end
      end
    end
  end
end
