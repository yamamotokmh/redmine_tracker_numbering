module TrackerNumbering
  class Hooks < Redmine::Hook::ViewListener
    CFN_TRACKER_NUMBERING = "tracker_numbering"
    
    def controller_issues_new_after_save(context={ })
      for field in context[:issue].custom_field_values do
        if field.custom_field[:field_format] == CFN_TRACKER_NUMBERING then
          customFields = CustomField.where(field_format: CFN_TRACKER_NUMBERING)
          for customField in customFields do
            currentNumber = CurrentNumber.find_by(custom_field_id: customField.id, project_id: context[:issue].project_id, tracker_id: context[:issue].tracker_id)
            if currentNumber == nil then
              currentNumber = CurrentNumber.new(custom_field_id: customField.id, project_id: context[:issue].project_id, tracker_id: context[:issue].tracker_id, current_number: 0)
            end
            zero_padding_size = field.custom_field[:zero_padding_size]
            field.value = context[:issue].tracker.to_s + "-" + sprintf("%0#{zero_padding_size}d", currentNumber[:current_number] += 1)
            currentNumber.save
          end
        end
      end
    end
  end
end