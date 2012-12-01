module ActiveRecord
  module Locking
    module Symbolic
      module Pessimistic
        def lock!(lock = true)
          lock_list = connection.lock_list
          if lock_list.has_key? lock
            return super lock_list[lock]
          end
          return super lock
        end
      end
    end
  end
end
