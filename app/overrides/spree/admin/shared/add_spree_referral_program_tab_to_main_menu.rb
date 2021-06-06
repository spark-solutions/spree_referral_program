Deface::Override.new(
  virtual_path: 'spree/admin/shared/_main_menu',
  name: 'spree_referral_program_add_home_page_tab_to_main_menu',
  insert_bottom: 'nav',
  partial: 'spree/admin/shared/spree_referral_program_homepage_tabs'
)
