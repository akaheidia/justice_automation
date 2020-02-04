# Login Page Elements
login_page_url_suffix = "/#/auth"
home_page_url_suffix = "/#/monitoring"
login_logo_image = "xpath://img[@class='login-logo']"
login_username_text="xpath://input[@placeholder='Username']"
login_password_text="xpath://input[@placeholder='Password']"
login_login_btn="xpath://*[text()='Login']/.."
login_unauthorized_message="xpath://span[contains(text(),'Unauthorized')]"
login_failed_ok="xpath://span[contains(text(),'OK')]"

# Navigation Bar Elements
nav_side_bar = "xpath://div[@class='extr-compact-sidemenu extr-hide-scrollbars']"
nav_logo_image = "xpath://img[@class='extr-toolbar-logo']"
nav_monitor_icon = "xpath://mat-icon[contains(text(),'show_chart')]"
nav_reports_icon = "xpath://mat-icon[contains(text(),'bar_chart')]"
nav_settings_icon = "xpath://mat-icon[@class='extr-nav-item-icon mat-list-icon mat-icon notranslate ei ei-settings mat-icon-no-color ng-star-inserted']"
nav_user_icon = "xpath://mat-icon[@class='extr-nav-item-icon mat-list-icon mat-icon notranslate material-icons mat-icon-no-color']"
nav_user_signout_menu = "xpath://div[@class='account-footer-text']"
nav_close_btn = "xpath://mat-icon[@class='mat-icon notranslate material-icons mat-icon-no-color']"
nav_open_btn = "xpath://mat-icon[@class='mat-icon notranslate ei ei-apps mat-icon-no-color']"

# Monitor Page Elements
monitor_page_title = "xpath://h1[contains(text(),'Monitor')]"
selected_slider = "xpath://span[@class='list-switcher-selected-text']"
unselected_slider = "xpath://span[@class='list-switcher-unselected-text']"

# Reports Page Elements
reports_page_title = "xpath://h1[contains(text(),'Reports')]"

# Settings Page Elements
settings_page_title = "xpath://span[@class='settings-title']"
settings_usergroups_menu = "xpath://div[contains(text(),'User Groups')]"
settings_security_menu = "xpath://div[contains(text(),'Security')]"
