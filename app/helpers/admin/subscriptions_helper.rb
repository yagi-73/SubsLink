module Admin::SubscriptionsHelper
  def same_company_subscriptions(subsc)
    AdminSubscription.where(company_id: subsc.company_id)
  end
end
