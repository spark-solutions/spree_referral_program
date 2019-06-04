Deface::Override.new(
  virtual_path: 'spree/layouts/admin',
  name: 'add_referral_program_menu',
  insert_bottom: "[data-hook='admin_tabs']",
  text: <<-HTML
    <ul class="nav nav-sidebar">
      <%= tab :referral_program,  url: spree.admin_referral_program_rewards_path, icon: "money" %>
    </ul>
  HTML
)
