module PropertiesHelper
	def convert_price_to_price_cents(q)
		return q if q.blank? || q[:price_lteq].blank? && q[:price_gteq].blank?

		if q[:price_lteq].present?
			price = q.delete(:price_lteq).to_i
      q[:price_cents_lteq] = price * 100
    end
    if q[:price_gteq].present?
			price = q.delete(:price_gteq).to_i
      q[:price_cents_gteq] = price * 100
    end
    q
	end
end
