require "fix_request_processing/version"
class ActionDispatch::Request
  def deep_munge(hash)
    hash.each do |k, v|
      case v
        when Array
          v.grep(Hash) { |x| deep_munge(x) }
          v.compact!
          #hash[k] = nil if v.empty?
        when Hash
          deep_munge(v)
      end
    end

    hash
  end
end
module FixRequestProcessing
  # Your code goes here...
end
