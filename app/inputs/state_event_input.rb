  class StateEventInput < SimpleForm::Inputs::CollectionSelectInput
  def input
    transition_list = object.send("#{state_machine}_transitions")
    current_value = object.send("human_#{state_machine}_name")

    label_method = :human_to_name
    value_method = :event
    input_options[:include_blank] = current_value

    @builder.collection_select(
      attribute_name, transition_list, value_method, label_method,
      input_options, input_html_options)
  end

  def state_machine
    @state_machine_name ||= attribute_name.to_s.gsub "_event", ""
  end
end
