Spree::Core::Engine.add_routes do
  # Add your extension routes here
  namespace :admin do
    resources :referral_program_rewards, only: [:index]
  end
end
