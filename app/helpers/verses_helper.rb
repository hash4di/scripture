module VersesHelper
  def label_select(verse)
    select_tag(
      "label_select",
      options_for_select(current_user.verses.pluck(:label).uniq),
      :class => 'string required',
      :name => 'verse[label]',
      :id => "verse_label",
      :include_blank => false
    )
  end
end
