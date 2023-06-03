module Admin::SubscriptionsHelper
  def same_company_basic_subscriptions(subsc)
    AdminSubscription.where(company_id: subsc.company_id, is_basic: true).where.not(id: subsc.id)
  end
end
