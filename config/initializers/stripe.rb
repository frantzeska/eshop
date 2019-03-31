if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_NGQwq0cr1FTK4ZQqKcxF0L6q00H22HWVaF',
    secret_key: 'sk_test_59gViuVk8rFaNqoDP49ysEMA00jwZI8o7c'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
