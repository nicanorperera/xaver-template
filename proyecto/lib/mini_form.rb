module MiniForm
  def mini_form_for(object, *args, &block)
    args ||= []
    options = args.extract_options!.merge!({:wrapper => :mini})
    simple_form_for(object, *(args << options.merge(:builder => MiniFormBuilder)), &block)
  end
  
  class MiniFormBuilder < SimpleForm::FormBuilder
    def input(attribute_name, options = {}, &block)
      options[:input_html] = { :class => 'input-medium'}
      super
    end
  end
  
  # Wrapper para Mini Formularios 
  # TODO: encontrar la manera de cambiar la clase de todos los input por 'input-medium'
  SimpleForm.setup do |config|
    config.wrappers :mini, :tag => 'span' , :class => 'controls', :error_class => 'error' do |b|
      b.use :html5
      b.use :placeholder
      b.use :input
      b.use :error, :wrap_with => { :tag => 'span', :class => 'help-inline' }
    end
  end
end