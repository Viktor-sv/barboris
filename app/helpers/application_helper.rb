module ApplicationHelper
  def form_field_text (form_build, field_name)
  "<div class='field form-group'> #{form_build.label(field_name)}
   <div class='col-sm-10'> #{form_build.text_field(field_name)} </div></div>".html_safe
  end


  def form_field_row_numeric (form_build, field_name)
    "#{form_build.label field_name, class: 'col-sm-2 control-label'}
     <div class='col-sm-2'> #{form_build.number_field(field_name)} </div>".html_safe
  end


  def form_field_row_collection_select (form_build, field_name, method, collection, value_method, text_method, options={}, html_options={})
    "#{form_build.label field_name, class: 'col-sm-2 control-label'}
     <div class='col-sm-2'> #{form_build.collection_select(method, collection, value_method, text_method,options, html_options )} </div>".html_safe
  end

  def form_field_row_select (form_build, field_name, method, choices=nil, options={}, html_options={}, &block )

    "#{form_build.label field_name, class: 'col-sm-2 control-label'}  <div class= 'col-sm-2'> #{form_build.select(method,choices ,options, html_options )} </div>".html_safe
  end

end
