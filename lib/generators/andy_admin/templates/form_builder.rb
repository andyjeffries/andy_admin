class AndyAdmin::FormBuilder < ActionView::Helpers::FormBuilder
  helpers = field_helpers +
            %w{date_select datetime_select time_select check_box} +
            %w{collection_select select country_select time_zone_select} -
            %w{hidden_field label fields_for} # Don't decorate these

  helpers.each do |name|
    define_method(name) do |field_name, *args|
      options = args.extract_options!
      options[:title] ||= field_name.to_s.humanize
      heading = "<h2>" + options[:title] + "</h2>"
      heading += error_message_on(field_name, args)
      description = if options[:description]
        @template.content_tag(:div, options[:description], :class => "description") 
      else
        ""
      end
      options.merge!({:class => name})
      if name == "check_box"
        label = label(field_name, options[:label])
        input = @template.content_tag(:div, super(field_name, options) + " " + label, :class => 'input')
      elsif name == "select"
        input = @template.content_tag(:div, super(field_name, args[0], options), :class => 'input')
      else
        input = @template.content_tag(:div, super(field_name, options), :class => 'input')
      end
      @template.content_tag(:div, heading + description + input)
    end
  end
  
  def actions
    @template.concat @template.content_tag(:div, yield, :class => "actions")
  end
  
  def submit(label, *args)
    options = args.extract_options!
    options[:colour] ||= "green"
    @template.content_tag(:button, label, :class => "awesome #{options[:colour]}", :type => "submit")
  end
  
  def cancel(label, link)
    @template.content_tag(:a, label, :href => link)
  end
end