module ApplicationHelper
  include Pagy::Frontend

  def icon(icon_class)
    content_tag 'span', '', class: icon_class.to_s
  end
  def pagination(obj, link_extra: '')
    raw(pagy_bootstrap_nav(obj, link_extra:)) if obj.pages > 1
  end

  def errors_for(model, key)
    tag.div(class: 'mt-1 form-error') do
      model.errors.messages_for(key).join(', ').capitalize
    end
  end
end
