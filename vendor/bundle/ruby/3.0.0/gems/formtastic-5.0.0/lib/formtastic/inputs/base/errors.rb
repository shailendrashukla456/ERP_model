# frozen_string_literal: true
module Formtastic
  module Inputs
    module Base
      module Errors
        
        def error_html
          errors? ? send(:"error_#{builder.inline_errors}_html") : +""
        end
        
        def error_sentence_html
          error_class = builder.default_inline_error_class
          template.content_tag(:p, errors.to_sentence, :class => error_class)
        end
                
        def error_list_html
          error_class = builder.default_error_list_class
          list_elements = []
          errors.each do |error|
            list_elements << template.content_tag(:li, error.html_safe)
          end
          template.content_tag(:ul, list_elements.join("\n").html_safe, :class => error_class)
        end
        
        def error_first_html
          error_class = builder.default_inline_error_class
          template.content_tag(:p, errors.first.untaint.html_safe, :class => error_class)
        end
        
        def error_none_html
          +""
        end
        
        def errors?
          !errors.blank?
        end
        
        def errors
          errors = []
          if object && object.respond_to?(:errors)
            error_keys.each do |key| 
              errors << object.errors[key] unless object.errors[key].blank?
            end
          end
          errors.flatten.compact.uniq
        end
        
        def error_keys
          keys = [method.to_sym]
          keys << builder.file_metadata_suffixes.map{|suffix| "#{method}_#{suffix}".to_sym} if file?
          keys << association_primary_key if belongs_to? || has_many?
          keys.flatten.compact.uniq
        end
        
      end
    end
  end
end
        
