# General
disabled_xpath_value = "[@disabled='true']"
enabled_xpath_value = "[not(@disabled='true')]"

# Login Page Elements
login_page_url_suffix = "/#/auth"
home_page_url_suffix = "/#/monitoring"
login_logo_image = "xpath://img[@class='login-logo']"
login_username_text="xpath://input[@placeholder='Username']"
login_password_text="xpath://input[@placeholder='Password']"
login_login_btn="xpath://*[text()='Login']/.."
login_unauthorized_message="xpath://span[contains(text(),'Unauthorized')]"
login_failed_ok="xpath://span[text()='OK']"

# Navigation Bar Elements
nav_side_bar = "xpath://div[@class='extr-compact-sidemenu extr-hide-scrollbars']"
nav_logo_image = "xpath://img[@class='extr-toolbar-logo']"
nav_monitor_icon = "xpath://mat-icon[contains(text(),'show_chart')]"
nav_reports_icon = "xpath://mat-icon[contains(text(),'bar_chart')]"
nav_settings_icon = "xpath://mat-icon[@class='mat-icon notranslate mat-list-icon extr-nav-item-icon ei ei-settings mat-icon-no-color ng-star-inserted']"
nav_user_icon = "xpath://mat-icon[@class='mat-icon notranslate mat-list-icon extr-nav-item-icon material-icons mat-icon-no-color']"
nav_user_signout_menu = "xpath://div[@class='account-footer-text']"
nav_close_btn = "xpath://mat-icon[@class='mat-icon notranslate material-icons mat-icon-no-color']"
nav_open_btn = "xpath://mat-icon[@class='mat-icon notranslate ei ei-apps mat-icon-no-color']"

# Monitor Page Elements
monitor_page_title = "xpath://h1[text()='Monitor']"
monitor_map_slider = "xpath://span[text()='Map']"
monitor_list_slider = "xpath://span[text()='List']"
monitor_selected_slider_class = "list-switcher-selected-text"
monitor_unselected_slider_class = "list-switcher-unselected-text"
monitor_search_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-search mat-icon-no-color']"
monitor_help_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-help mat-icon-no-color']"
monitor_alarms_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-alarm_type mat-icon-no-color']"
monitor_tags_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-label_outline mat-icon-no-color']"
monitor_filter_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-filter mat-icon-no-color']"

# Filter Panel Elements
filter_panel_title = "xpath://div[@class='filters-header-text']"
filter_clear_all_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-clear_all mat-icon-no-color']"
filter_servers_and_sites_panel_title = "xpath://div[contains(text(),'Servers & Sites')]"
filter_servers_and_sites_panel_expand_icon = "xpath://div[contains(text(),'Servers & Sites')]/mat-icon[contains(@class, 'arrow_right')]"
filter_servers_and_sites_panel_collapse_icon = "xpath://div[contains(text(),'Servers & Sites')]/mat-icon[contains(@class, 'arrow_down')]"
filter_servers_and_sites_panel_refresh_icon = "xpath://div[contains(text(),'Servers & Sites')]/mat-icon[contains(@class, 'refresh-icon')]"
filter_alarm_severity_panel_title = "xpath://div[contains(text(),'Alarm Severity')]"
filter_alarm_severity_panel_expand_icon = "xpath://div[contains(text(),'Alarm Severity')]/mat-icon[contains(@class, 'arrow_right')]"
filter_alarm_severity_panel_collapse_icon = "xpath://div[contains(text(),'Alarm Severity')]/mat-icon[contains(@class, 'arrow_down')]"
filter_site_availability_panel_title = "xpath://div[contains(text(),'Site Availability')]"
filter_site_availability_panel_expand_icon = "xpath://div[contains(text(),'Site Availability')]/mat-icon[contains(@class, 'arrow_right')]"
filter_site_availability_panel_collapse_icon = "xpath://div[contains(text(),'Site Availability')]/mat-icon[contains(@class, 'arrow_down')]"

# Tags Panel Elements
tags_panel_title = "xpath://div[@class='tags-header-text']"

# Map Page Elements
map_zoom_in_enabled_button = "xpath://a[@class='leaflet-control-zoom-in']"
map_zoom_in_disabled_button = "xpath://a[@class='leaflet-control-zoom-in leaflet-disabled']"
map_zoom_out_enabled_button = "xpath://a[@class='leaflet-control-zoom-out']"
map_zoom_out_disabled_button = "xpath://a[@class='leaflet-control-zoom-out leaflet-disabled']"
map_refresh_button = "xpath://mat-icon[@class='mat-icon notranslate ei ei-refresh mat-icon-no-color']"

# List Page Elements
list_devices_tab = "xpath://a[@href='#/monitoring/lists/devices']"
list_endsystems_tab = "xpath://a[@href='#/monitoring/lists/endsystems']"
list_alarms_tab = "xpath://a[@href='#/monitoring/lists/alarms']"
list_events_tab = "xpath://a[@href='#/monitoring/lists/events']"
list_devices_page_url_suffix = "/#/monitoring/lists/devices"
list_endsystems_page_url_suffix = "/#/monitoring/lists/endsystems"
list_alarms_page_url_suffix = "/#/monitoring/lists/alarms"
list_events_page_url_suffix = "/#/monitoring/lists/events"
list_devices_table = "id:devicesGrid"
list_endsystems_table = "id:endSystemsGrid"
list_alarms_table = "id:alarmsGrid"
list_events_table = "id:eventsGrid"
list_refresh_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-refresh mat-icon-no-color']"
list_download_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-download mat-icon-no-color']"
list_download_selected_icon = "xpath://div[@class='cdk-overlay-backdrop app-overlays cdk-overlay-backdrop-showing']"
list_sort_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-sort_by_alpha mat-icon-no-color']"
list_sort_selected_icon = "xpath://div[@class='cdk-overlay-backdrop app-overlays cdk-overlay-backdrop-showing']"
list_columns_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-view_column mat-icon-no-color']"
list_count_label = "xpath://div[@class='end']"
list_last_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-last')]"
list_first_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-first')]"
list_next_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-next')]"
list_prev_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-prev')]"

## Download Menu Elements
download_csv_visible_rows_menu = "xpath://span[@class='option'][text()='CSV']/..//span[@class='text'][contains(text(), '(Visible Rows)')]"
download_csv_all_rows_menu = "xpath://span[@class='option'][text()='CSV']/..//span[@class='text'][contains(text(), '(All Rows)')]"
download_csv_all_filtered_rows_menu = "xpath://span[@class='option'][text()='CSV']/..//span[@class='text'][contains(text(), '(All Filtered Rows)')]"
download_pdf_visible_rows_menu = "xpath://span[@class='option'][text()='PDF']/..//span[@class='text'][contains(text(), '(Visible Rows)')]"
download_pdf_all_rows_menu = "xpath://span[@class='option'][text()='PDF']/..//span[@class='text'][contains(text(), '(All Rows)')]"
download_pdf_all_filtered_rows_menu = "xpath://span[@class='option'][text()='PDF']/..//span[@class='text'][contains(text(), '(All Filtered Rows)')]"

## Sort Menu Elements
sort_applied_indicator = "xpath://span[@class='active-sort']"
sort_menu_panel = "xpath://div[@class='tables-sorting-header-text']"
sort_add_menu_panel = "xpath://div[contains(text(),'Add a Sort')]"
sort_add_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-add_circle mat-icon-no-color']"
sort_add_icon_open = "xpath://body[@class='mat-typography']/div[@class='cdk-overlay-container extr-sidenav-theme']/div[3]"
sort_remove_icon_xpath_value = "//mat-icon[@fonticon='ei-remove_circle_outline']"
sort_ascending_menu_xpath_value = "//span[contains(text(),'Ascending')]"
sort_descending_menu_xpath_value = "//span[contains(text(),'Descending')]"


# End-Systems
endsystems_table = "xpath://table[@id='endSystemsGrid']"

# Reports Page Elements
reports_page_title = "xpath://h1[text()='Reports']"
reports_sidebar_menu_button = "id:actShowSidebar"
# reports_sidebar_menu_button = "xpath://a[@id='actShowSidebar']"
reports_add_button = "xpath://span[@class='btn btn-info ti-plus']"
reports_add_new_report_menu = "xpath://h4[contains(text(),'New Report')]"
reports_add_new_visual_menu = "xpath://h4[contains(text(),'New Visual')]"
reports_add_new_category_menu = "xpath://h4[contains(text(),'New Category')]"
reports_add_go_to_reports_button = "xpath://img[@id='imgLogo']"
reports_menu_table = "id:rdMenuTable"
reports_menu_tree = "id:menuTreeSide"
# reports_menu_tree = "xpath://span[@id='menuTreeSide']"

# Reports Filter Panel
reports_filter_icon = "xpath://span[@class='btn btn-filter ti-filter']"
reports_filter_panel_shown = "xpath://td[@class='master-report-filter'][not(contains(@style, 'display: none'))]"
reports_filter_panel_hidden = "xpath://td[@class='master-report-filter'][contains(@style, 'display: none')]"
reports_filter_panel_time_range_field = "id:period"
reports_filter_panel_apply_button = "xpath://a[@class='btn btn-primary'][text()='Apply']"

# Reports Page Tree Nodes
reports_tree_reports_node = "xpath://span[text()='Reports']"
reports_tree_site_node = "xpath://span[text()='Site']"
reports_tree_topn_node = "xpath://span[text()='Top N']"
reports_tree_analytics_node = "xpath://span[text()='Analytics']"

# Reports Page Tree Expand/Collapse Icons
reports_tree_expand_reports_icon = "xpath://span[text()='Reports']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowRight')]"
reports_tree_collapse_reports_icon = "xpath://span[text()='Reports']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowDown')]"

reports_tree_expand_site_icon = "xpath://span[text()='Site']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowRight')]"
reports_tree_collapse_site_icon = "xpath://span[text()='Site']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowDown')]"

reports_tree_expand_topn_icon = "xpath://span[text()='Top N']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowRight')]"
reports_tree_collapse_topn_icon = "xpath://span[text()='Top N']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowDown')]"

reports_tree_expand_analytics_icon = "xpath://span[text()='Analytics']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowRight')]"
reports_tree_collapse_analytics_icon = "xpath://span[text()='Analytics']/../../td[@id='rdImage']/img[contains(@src, 'rdArrowDown')]"

# Reports Page Tree Node Menus
reports_network_scorecard_menu = "xpath://table[@id='rdMenuTable']//span[text()='Scorecard']"
reports_network_summary_menu = "xpath://table[@id='rdMenuTable']//span[text()='Network Summary']"
reports_xmc_server_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='XMC Server Utilization']"

reports_site_availability_menu = "xpath://table[@id='rdMenuTable']//span[text()='Availability']"
reports_site_port_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site']//following::span[text()='Port Utilization']"
reports_site_port_error_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site']//following::span[text()='Port Error']"
reports_site_cpu_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site']//following::span[text()='CPU Utilization']"
reports_site_memory_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site']//following::span[text()='Memory Utilization']"

reports_topn_device_availability_menu = "xpath://table[@id='rdMenuTable']//span[text()='Device Availability']"
reports_topn_site_availability_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site Availability']"
reports_topn_cpu_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top N']//following::span[text()='CPU Utilization']"
reports_topn_memory_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top N']//following::span[text()='Memory Utilization']"
reports_topn_port_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top N']//following::span[text()='Port Utilization']"
reports_topn_port_error_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top N']//following::span[text()='Port Error']"
reports_topn_top_aps_by_clients_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top APs By Clients']"
reports_topn_top_aps_by_bandwidth_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top APs By Bandwidth']"

reports_analytics_analytics_summary_menu = "xpath://table[@id='rdMenuTable']//a/span[text()='Analytics Summary']"
reports_analytics_top_applications_by_clients_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Applications By Clients']"
reports_analytics_top_applications_by_volume_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Applications By Volume']"
reports_analytics_slowest_responding_applications_menu = "xpath://table[@id='rdMenuTable']//span[text()='Slowest Responding Applications']"
reports_analytics_daily_usage_menu = "xpath://table[@id='rdMenuTable']//span[text()='Daily Usage']"
reports_analytics_monthly_usage_menu = "xpath://table[@id='rdMenuTable']//span[text()='Monthly Usage']"
reports_analytics_quarterly_usage_menu = "xpath://table[@id='rdMenuTable']//span[text()='Quarterly Usage']"

# Reports Page Titles
reports_network_scorecard_page_title = "xpath://h2[text()='Network Scorecard']"
reports_network_summary_page_title = "xpath://h2[text()='Network Summary']"
reports_xmc_server_utilization_page_title = "xpath://h2[text()='XMC Server Utilization']"
reports_site_availability_page_title = "xpath://h2[text()='Site Availability']"
reports_site_cpu_utilization_page_title = "xpath://h2[text()='CPU Utilization']"
reports_site_memory_utilization_page_title = "xpath://h2[text()='Memory Utilization']"
reports_site_port_utilization_page_title = "xpath://h2[text()='Port Utilization']"
reports_site_port_error_page_title = "xpath://h2[text()='Port Error']"
reports_topn_device_availability_page_title = "xpath://h2[text()='Top Device Availability']"
reports_topn_site_availability_page_title = "xpath://h2[text()='Top Site Availability']"
reports_topn_cpu_utilization_page_title = "xpath://h2[text()='Top CPU Utilization']"
reports_topn_memory_utilization_page_title = "xpath://h2[text()='Top Memory Utilization']"
reports_topn_port_utilization_page_title = "xpath://h2[text()='Top Port Utilization']"
reports_topn_port_error_page_title = "xpath://h2[text()='Top Port Error']"
reports_topn_top_aps_by_clients_page_title = "xpath://h2[text()='Top APs By Clients']"
reports_topn_top_aps_by_bandwidth_page_title = "xpath://h2[text()='Top APs By Bandwidth']"
reports_analytics_analytics_summary_page_title = "//h2[text()='Analytics Summary']"
reports_analytics_top_applications_by_clients_page_title = "xpath://h2[text()='Top Applications By Clients']"
reports_analytics_top_applications_by_volume_page_title = "xpath://h2[text()='Top Applications By Volume']"
reports_analytics_slowest_responding_applications_page_title = "xpath://h2[text()='Slowest Responding Applications']"
reports_analytics_daily_usage_page_title = "xpath://h2[text()='Daily Analytics Usage']"
reports_analytics_monthly_usage_page_title = "xpath://h2[text()='Monthly Analytics Usage']"
reports_analytics_quarterly_usage_page_title = "xpath://h2[text()='Analytics Quarterly Summary']"

# Reports - Drilldown Elements
reports_device_availability_drilldown = "xpath://h4[text()='Device Availability']"
reports_site_availability_drilldown = "xpath://h4[text()='Site Availability']"
reports_top_aps_by_clients_drilldown = "xpath://h4[text()='Top APs By Clients']"
reports_top_aps_by_bandwidth_drilldown = "xpath://h4[text()='Top APs By Bandwidth']"
reports_port_utilization_drilldown = "xpath://h4[text()='Port Utilization']"
reports_port_error_drilldown = "xpath://h4[text()='Port Error']"
reports_cpu_utilization_drilldown = "xpath://h4[text()='CPU Utilization']"
reports_memory_utilization_drilldown = "xpath://h4[text()='Memory Utilization']"
reports_top_applications_by_clients_drilldown = "xpath://h4[text()='Top Applications By Clients']"
reports_top_applications_by_volume_drilldown = "xpath://h4[text()='Top Applications By Volume']"
reports_slowest_responding_applications_drilldown = "xpath://h4[text()='Slowest Responding Applications']"
reports_slowest_responding_network_services_drilldown = "xpath://h4[text()='Slowest Responding Network Services']"

# Reports - Network Scorecard Page Elements

# Reports - Network Summary Page Elements

# Reports - Site Availability Page Elements
site_availability_table = "xpath://table[@id='sites']"

# Reports - General Page Titles
reports_device_availability_page_title = "xpath://h2[text()='Device Availability']"
reports_top_device_availability_page_title = "xpath://h2[text()='Top Device Availability']"
reports_device_overview_page_title = "xpath://h2[text()='Device Overview']"
reports_port_utilization_page_title = "xpath://h2[text()='Port Utilization']"
reports_port_overview_page_title = "xpath://h2[text()='Port Overview']"
reports_rx_bandwidth_page_title = "xpath://h2[text()='Rx Bandwidth']"
reports_total_bandwidth_page_title = "xpath://h2[text()='Total Bandwidth']"
reports_tx_bandwidth_page_title = "xpath://h2[text()='Tx Bandwidth']"

# Reports - General Panel Titles
reports_top_sites_by_clients = "xpath://h4[contains(text(),'Top Sites By Clients')]"

# Settings Page Elements
settings_page_title = "xpath://span[@class='settings-title']"
settings_usergroups_menu = "xpath://div[text()='User Groups']"
settings_security_menu = "xpath://div[text()='Security']"

# Settings - User Groups Page Elements
usergroups_page_title = "xpath://span[@class='user-groups-title'][text()='User Groups']"

# Settings - Security Page Elements
security_page_title = "xpath://span[@class='security-title'][text()='Security']"
