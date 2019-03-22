module TrackerNumbering
  module CustomFieldPatch
    extend ActiveSupport::Concern

    included do
      safe_attributes 'zero_padding_size'
    end
  end
end

unless CustomField.included_modules
                  .include?(TrackerNumbering::CustomFieldPatch)
  CustomField.send :include, TrackerNumbering::CustomFieldPatch
end