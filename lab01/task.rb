class Task
    def title
        raise NotImplementedError, "#{self.class} has not implemented #{__method__}"
    end

    def execute
        raise NotImplementedError, "#{self.class} has not implemented #{__method__}"
      end
end