# Login Page Elements
xmc_login_username_text="name:j_username"
xmc_login_password_text="name:j_password"
xmc_login_login_btn="xpath://button[text()='Login']"
xmc_login_logo_image = "xpath://img[@class='extrLogoImage']"

# Main Page Elements
xmc_main_context_icon = "xpath://span[contains(@class,'x-btn-icon-el x-btn-icon-el-extr-nav-action-embedded-toolbar-selectionless-button-small fa fa-bg fa-bars')]"
xmc_main_context_icon_logout_menu = "xpath://span[text()='Logout']"

# Navigation Bar Elements
xmc_nav_side_bar = "id:main-nav-bar"
xmc_nav_logo_image = "xpath://img[@title='extremenetworks.com']"
xmc_nav_network_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Network']"
xmc_nav_alarmsevents_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Alarms & Events']"
xmc_nav_control_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Control']"
xmc_nav_analytics_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Analytics']"
xmc_nav_wireless_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Wireless']"
xmc_nav_compliance_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Compliance']"
xmc_nav_reports_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Reports']"
xmc_nav_tasks_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Tasks']"
xmc_nav_admin_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Administration']"
xmc_nav_connect_button = "xpath://span[@class='x-btn-inner x-btn-inner-extr-nav-toolbar-button-small'][text()='Connect']"

# Network Page
xmc_network_url_suffix = "/OneView/view/devices"
xmc_network_dashboard_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Dashboard']"
xmc_network_devices_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Devices']"
xmc_network_discovered_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Discovered']"
xmc_network_firmware_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Firmware']"
xmc_network_archives_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Archives']"
xmc_network_reports_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Reports']"
xmc_network_devices_view = "xpath://div[@id='networkDeviceView']"

# Network> Devices Page
xmc_devices_devices_tab = "xpath://span[contains(@class,'x-tab-inner x-tab-inner-extr-sec-tab-panel')][text()='Devices']"
xmc_devices_tree_context_icon = "xpath://div[contains(@class,'x-panel x-border-item x-box-item x-panel-default x-tree-panel x-tree-arrows x-grid')]//span[contains(@class,'x-btn-icon-el x-btn-icon-el-default-toolbar-small fa fa-bars')]"
xmc_devices_tree_node = "xpath://span[contains(text(),'${SITENAME}')]"
xmc_devices_tree_context_icon_maps_sites_menu="xpath://span[text()='Maps/Sites']"
xmc_devices_tree_context_icon_create_site_menu="xpath://span[text()='Create Site...']"
xmc_devices_tree_context_icon_delete_site_menu="xpath://span[text()='Delete Site']"
xmc_devices_table = "xpath://div[contains(@id, 'deviceGrid')][contains(@id, 'bodyWrap')]"

# Administration Page
xmc_admin_profiles_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Profiles']"
xmc_admin_users_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Users']"
xmc_admin_options_tab = "xpath://span[@class='x-tab-inner x-tab-inner-extr-main-tab-panel'][text()='Options']"

# Administration> Options Page
xmc_options_tree_title = "xpath://span[@class='x-column-header-text-inner'][text() = 'Options']"
xmc_options_restore_defaults_btn = "xpath://span[text()='Restore Defaults']"
xmc_options_reset_btn = "xpath://span[text()='Reset']"
xmc_options_save_btn = "xpath://span[text()='Save']"
xmc_options_restore_defaults_btn_disabled = "xpath://span[text()='Restore Defaults']//ancestor::a[contains(@class, 'x-btn-disabled')]"
xmc_options_restore_defaults_btn_enabled = "xpath://span[text()='Restore Defaults']//ancestor::a[not(contains(@class, 'x-btn-disabled'))]"
xmc_options_reset_btn_disabled = "xpath://span[text()='Reset']//ancestor::a[contains(@class, 'x-btn-disabled')]"
xmc_options_reset_btn_enabled = "xpath://span[text()='Reset']//ancestor::a[not(contains(@class, 'x-btn-disabled'))]"
xmc_options_save_btn_disabled = "xpath://span[text()='Save']//ancestor::a[contains(@class, 'x-btn-disabled')]"
xmc_options_save_btn_enabled = "xpath://span[text()='Save']//ancestor::a[not(contains(@class, 'x-btn-disabled'))]"

# XMC Data Pump Options
xmc_options_xmcdatapump_momenabled = "xpath://input[@name='momEnabled']"
xmc_options_xmcdatapump_domainnodetype = "xpath://input[@name='domainNodeType']"
xmc_options_xmcdatapump_host = "xpath://input[@name='rabbitmqHost']"
xmc_options_xmcdatapump_port = "xpath://input[@name='rabbitmqPort']"
xmc_options_xmcdatapump_user = "xpath://input[@name='rabbitmqUserName']"
xmc_options_xmcdatapump_password = "xpath://input[@name='rabbitmqPassword']"
xmc_options_xmcdatapump_password_eye_show = "//div[@title='Click to show in clear text']"
xmc_options_xmcdatapump_password_eye_hide = "//div[@title='Click to hide text']"
xmc_options_xmcdatapump_action_queue_add_delay = "//input[@name='obActionQueueAddDelay']"
# xmc_options_xmcdatapump_action_queue_add_delay_units = "//input[@name='obActionQueueAddDelay']"
xmc_options_xmcdatapump_action_queue_service_period = "//input[@name='obActionQueueServicePeriod']"
# xmc_options_xmcdatapump_action_queue_service_period_units = "//input[@name='obActionQueueServicePeriod']"
xmc_options_xmcdatapump_max_action_queue_size = "//input[@name='obMaxActionQueueSize']"
xmc_options_xmcdatapump_max_actions_queueable = "//input[@name='obMaxActionsQueueableServicePeriod']"
xmc_options_xmcdatapump_max_actions_serviced = "//input[@name='obMaxActionsServicedPerPeriod']"

## Toolbar Buttons
xmc_devices_toolbar_add_device = "xpath://span[@class='x-btn-inner x-btn-inner-default-toolbar-small'][text()='Add Device...']"

## Menus
xmc_devices_context_more_actions_menu = "xpath://span[text()='More Actions']"
xmc_devices_context_delete_device_menu = "xpath://span[text()='Delete Device']"
xmc_devices_context_collect_device_statistics_menu = "xpath://span[text()='Collect Device Statistics...']"

## Create Site Dialog
xmc_create_site_dialog = "xpath://div[text()='Create Site']"
xmc_create_site_dialog_name_text = "xpath://input[contains(@id, 'textfield')][contains(@id, 'inputEl')][@aria-hidden='false']"
xmc_create_site_dialog_ok_btn = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-blue-small')][text()='OK']"
xmc_create_site_dialog_cancel_btn = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-default-small')][text()='Cancel']"

## Delete Site Confirmation Dialog
xmc_delete_site_dialog = "xpath://div[text()='Delete Site']"
xmc_delete_site_dialog_message = "xpath://div[contains(@class,'x-component x-window-text x-box-item x-component-default')]"
xmc_delete_site_dialog_yes_btn = "xpath://span[text()='Yes']"
xmc_delete_site_dialog_no_btn = "xpath://span[text()='No']"

## Create Device Dialog
xmc_create_device_dialog = "xpath://div[text()='Add Device']"
xmc_create_device_dialog_ip_text = "xpath://input[@name='ip']"
xmc_create_device_dialog_profile_list = "xpath://input[@name='profile_id']"
xmc_create_device_dialog_nickname_text = "xpath://input[@name='nickname']"
xmc_create_device_dialog_ok_btn_enabled = "xpath://a[not(contains(@class, 'disabled'))]//*[text()='OK']"
xmc_create_device_dialog_ok_btn_disabled = "xpath://a[contains(@class, 'disabled')]//*[text()='OK']"
xmc_create_device_dialog_ok_btn = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-blue-small')][text()='OK']"
xmc_create_device_dialog_apply_btn = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-default-small')][text()='Apply']"
xmc_create_device_dialog_close_btn = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-default-small')][text()='Close']"

## Delete Device Dialog
xmc_delete_device_dialog = "xpath://div[text()='Confirm Delete']"
xmc_delete_device_dialog_delete_data_check_btn = "xpath://label[text()='Delete Extreme Management Center Data']"
xmc_delete_device_dialog_yes_btn = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-blue-small')][contains(text(),'Yes')]"
xmc_delete_device_dialog_no_btn = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-default-small')][contains(text(),'No')]"

## Collect Device Statistics Dialog
xmc_collect_device_statistics_dialog = "xpath://div[text()='Collect Device Statistics']"
xmc_collect_device_statistics_dialog_historical = "xpath://label[contains(text(),'Historical')]"
xmc_collect_device_statistics_dialog_monitor = "xpath://label[contains(text(),'Monitor')]"
xmc_collect_device_statistics_dialog_disable = "xpath://label[contains(text(),'Disable')]"
xmc_collect_device_statistics_dialog_ok = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-blue-small')][text()='OK']"
xmc_collect_device_statistics_dialog_cancel = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-default-small')][text()='Cancel']"

## Collect Controller Statistics Dialog
xmc_collect_controller_statistics_dialog = "xpath://div[text()='Collect Controller Statistics']"
xmc_collect_controller_statistics_dialog_checkbox = "xpath://label[contains(text(),'Wireless Controller, WLAN, Topology, AP Wired and')]/..//input[@type='checkbox']"
xmc_collect_controller_statistics_dialog_ok = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-blue-small')][text()='OK']"
xmc_collect_controller_statistics_dialog_cancel = "xpath://span[contains(@class,'x-btn-inner x-btn-inner-default-small')][text()='Cancel']"

## Table Icons
xmc_devices_table_refresh_icon = "xpath://*[@data-qtip='Refresh']"
