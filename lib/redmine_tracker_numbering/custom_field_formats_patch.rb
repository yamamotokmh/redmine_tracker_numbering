module TrackerNumbering
  class CustomFieldFormatsPatch < Redmine::FieldFormat::Base
    NAME = 'tracker_numbering'

    add NAME
    self.searchable_supported = true
    self.customized_class_names = %w(Issue)
    self.form_partial = 'custom_fields/formats/tracker_numbering.html'

  end
end