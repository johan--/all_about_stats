class PayloadSerializer < ActiveModel::Serializer
  def attributes
    data = super
    data[:id]          = object.id
    data[:url]         = object.url
    data[:referrer]    = object.referrer if object.referrer.present?
    data[:created_at]  = object.created_at
    data
  end
end
