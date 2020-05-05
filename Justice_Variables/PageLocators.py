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
# login_unauthorized_message="xpath://span[contains(text(),'Unauthorized')]"
login_unauthorized_message="xpath://span[contains(text(),'Failed to authenticate')]"
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
monitor_search_icon = "xpath://mat-toolbar[contains(@class, 'extr-top-toolbar')]//button//mat-icon[@fonticon='ei-search']"
monitor_help_icon = "xpath://mat-icon[@fonticon='ei-help']"
monitor_alarms_icon = "xpath://mat-icon[@fonticon='ei-alarm_type']"
monitor_tags_icon = "xpath://mat-icon[@fonticon='ei-label_outline']"
monitor_filter_icon = "xpath://mat-icon[@fonticon='ei-filter']"

# Help Elements
help_contextual_help = "xpath://h3[contains(text(),'Contextual Help')]"

# Search Field Elements
search_field_text = "xpath://mat-toolbar[contains(@class, 'extr-top-toolbar')]//input[@placeholder='Search...']"

# Filter Panel Elements
filter_panel_title = "xpath://div[text()='Filters']"
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
filter_tag_panel = "xpath://div[@class='app-filter-card-tags']"

# Tags Panel Elements
tags_add_icon_xpath_value = "//mat-icon[@fonticon='ei-add_circle']"
tags_manage_icon_xpath_value = "//mat-icon[@fonticon='ei-settings']"
tags_refresh_icon_xpath_value = "//mat-icon[@fonticon='ei-refresh']"
tags_close_icon_xpath_value = "//mat-icon[@fonticon='ei-close']"
tags_panel = "xpath://app-tags"
tags_panel_title = "xpath://div[@class='tags-header-text']"
tags_panel_no_tags_msg = "xpath://div[text()='No Tags Found']"
tags_panel_add_btn = "xpath://app-tags//button[@aria-label='Add Tag']"
tags_panel_manage_btn = "xpath://app-tags//button[@aria-label='Manage Tags']"
tags_panel_refresh_btn = "xpath://app-tags//button[@aria-label='Refresh Tags']"
tags_panel_close_btn = "xpath://app-tags//button[@aria-label='Close Tags']"

# Edit Tag Dialog Elements
tags_panel_edit_tag_dialog = "xpath://app-manage-tag-dialog"
tags_panel_edit_tag_dialog_name = "xpath://app-manage-tag-dialog//input[@placeholder='Tag Name']"
tags_panel_edit_tag_dialog_star_unselected = "xpath://app-manage-tag-dialog//mat-icon[@fonticon='ei-star_border']//ancestor::button"
tags_panel_edit_tag_dialog_star_selected = "xpath://app-manage-tag-dialog//mat-icon[@fonticon='ei-star']//ancestor::button"
tags_panel_edit_tag_dialog_description = "xpath://app-manage-tag-dialog//textarea[@placeholder='Tag Description']"
tags_panel_edit_tag_dialog_delete = "xpath://app-manage-tag-dialog//span[contains(text(),'Delete')]"
tags_panel_edit_tag_dialog_cancel = "xpath://app-manage-tag-dialog//span[contains(text(),'Cancel')]"
tags_panel_edit_tag_dialog_save = "xpath://app-manage-tag-dialog//span[contains(text(),'Save')]"

# Confirm Delete Tag Dialog Elements
tags_confirm_delete_tag_dialog = "xpath://app-confirm-dialog//h1[text()='Delete Tag']"
tags_confirm_delete_tag_dialog_ok = "xpath://app-confirm-dialog//span[text()='OK']"
tags_confirm_delete_tag_dialog_cancel = "xpath://app-confirm-dialog//span[text()='Cancel']"

# Add Tag Dialog Elements
tags_add_tag_dialog = "xpath://app-add-tag-dialog"
tags_add_tag_dialog_title = "xpath://app-add-tag-dialog//h1[@class='mat-dialog-title dialog-header-text'][text()='Add Tag']"
tags_add_tag_dialog_name = "xpath://app-add-tag-dialog//input[@placeholder='Tag Name']"
tags_add_tag_dialog_star_unselected = "xpath://app-add-tag-dialog//mat-icon[@fonticon='ei-star_border']//ancestor::button"
tags_add_tag_dialog_star_selected = "xpath://app-add-tag-dialog//mat-icon[@fonticon='ei-star']//ancestor::button"
tags_add_tag_dialog_description = "xpath://app-add-tag-dialog//textarea[@placeholder='Tag Description']"
tags_add_tag_dialog_cancel = "xpath://app-add-tag-dialog//span[contains(text(),'Cancel')]"
tags_add_tag_dialog_save = "xpath://app-add-tag-dialog//span[contains(text(),'Save')]"
tags_add_tag_dialog_save_enabled = "xpath://app-add-tag-dialog//span[contains(text(),'Save')]//ancestor::button[not(@disabled='true')]"
tags_add_tag_dialog_save_disabled = "xpath://app-add-tag-dialog//span[contains(text(),'Save')]//ancestor::button[@disabled='true']"

# Manage Tags Dialog Elements
tags_manage_tags_panel = "xpath://app-manage-tags-dialog"
tags_manage_tags_panel_title = "xpath://app-manage-tags-dialog//span[text()='MANAGE TAGS']"
tags_manage_tags_panel_no_tags_msg = "xpath://app-manage-tags-dialog//div[text()='No Tags Found']"
tags_manage_tags_panel_add_btn = "xpath://app-manage-tags-dialog//button[@aria-label='Add Tag']"
tags_manage_tags_panel_delete_btn = "xpath://app-manage-tags-dialog//button[@aria-label='Delete Tags']"
tags_manage_tags_panel_refresh_btn = "xpath://app-manage-tags-dialog//button[@mattooltip='Refresh']"
tags_manage_tags_panel_close_btn = "xpath://app-manage-tags-dialog//mat-icon[contains(text(),'close')]"
tags_manage_tags_panel_collapsed_btn_xpath_value = "/ancestor::tr//mat-icon[contains(@class,'expansion-arrow')][text()='keyboard_arrow_right']"
tags_manage_tags_panel_expanded_btn_xpath_value = "/ancestor::tr//mat-icon[contains(@class,'expansion-arrow')][text()='keyboard_arrow_down']"
tags_manage_tags_panel_delete_device_icon_xpath_value = "/ancestor::a//mat-icon[@fonticon='ei-delete']"
tags_manage_tags_panel_device_details_clear_all = "xpath://app-manage-tags-dialog//mat-icon[@fonticon='ei-clear_all']"
tags_manage_tags_panel_device_details_save = "xpath://app-manage-tags-dialog//span[text()='Save']"
tags_manage_tags_panel_device_details_save_enabled = "xpath://app-manage-tags-dialog//span[text()='Save']//ancestor::button[not(@disabled='true')]"
tags_manage_tags_panel_device_details_save_disabled = "xpath://app-manage-tags-dialog//span[text()='Save']//ancestor::button[@disabled='true']"
tags_manage_tags_panel_device_details_cancel = "xpath://app-manage-tags-dialog//span[text()='Cancel']"
tags_manage_tags_panel_device_details_cancel_enabled = "xpath://app-manage-tags-dialog//span[text()='Cancel']//ancestor::button[not(@disabled='true')]"
tags_manage_tags_panel_device_details_cancel_disabled = "xpath://app-manage-tags-dialog//span[text()='Cancel']//ancestor::button[@disabled='true']"

# Confirm Delete Tags Dialog Elements
tags_confirm_delete_tags_dialog = "xpath://app-confirm-dialog//h1[text()='Delete Tags']"
tags_confirm_delete_tags_dialog_ok = "xpath://app-confirm-dialog//span[text()='OK']"
tags_confirm_delete_tags_dialog_cancel = "xpath://app-confirm-dialog//span[text()='Cancel']"

# Add Devices To Tag Elements
tags_add_devices_to_tag_button = "xpath://button[@aria-label='Add device to a Tag']"
tags_add_devices_to_tag_panel = "xpath://app-add-to-tag-dialog"
tags_add_devices_to_tag_panel_no_tags_msg = "xpath://app-add-to-tag-dialog//div[text()='No Tags Found']"
tags_add_devices_to_tag_panel_title = "xpath://app-add-to-tag-dialog//span[contains(text(),'ADD DEVICES TO TAGS')]"
tags_add_devices_to_tag_panel_close = "xpath://app-add-to-tag-dialog//mat-icon[contains(text(),'close')]"
tags_add_devices_to_tag_panel_add_tag = "xpath://app-add-to-tag-dialog//mat-icon[@fonticon='ei-add_circle']"
tags_add_devices_to_tag_panel_manage_tags = "xpath://app-add-to-tag-dialog//mat-icon[@fonticon='ei-settings']"
tags_add_devices_to_tag_panel_refresh = "xpath://app-add-to-tag-dialog//mat-icon[@fonticon='ei-refresh']"
tags_add_devices_to_tag_panel_save = "xpath://app-add-to-tag-dialog//span[text()='Save']"

# Add Ports To Tag Elements
tags_add_ports_to_tag_button = "xpath://button[@aria-label='Add port to a Tag']"

# Map Page Elements
map_background_image = "xpath://canvas[@class='leaflet-zoom-animated']"
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
list_refresh_icon = "xpath://mat-icon[contains(@class, 'ei-refresh')]"
list_download_icon = "xpath://mat-icon[contains(@class, 'ei-download')]"
list_sort_icon = "xpath://mat-icon[contains(@class, 'ei-sort_by_alpha')]"
list_columns_icon = "xpath://mat-icon[@class='mat-icon notranslate ei ei-view_column mat-icon-no-color']"
list_count_label = "xpath://div[@class='end']"
list_last_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-last')]"
list_first_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-first')]"
list_next_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-next')]"
list_prev_page_icon = "xpath://button[contains(@class,'mat-paginator-navigation-prev')]"
list_icon_selected = "xpath://div[@class='cdk-overlay-backdrop app-overlays cdk-overlay-backdrop-showing']"

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

# Device Details Page Elements
device_details_back_arrow = "xpath://mat-icon[contains(@class, 'ei-arrow_back')]"
device_details_ip_label = "xpath://div[@class='info-header'][contains(text(),'IP ADDRESS')]"
device_details_dashboard_link = "xpath://div[contains(text(),'Dashboard')]"
device_details_ports_link = "xpath://div[contains(text(),'Ports')]"
device_details_alarms_panel = "xpath://mat-card-title[contains(text(),'Alarms')]"
device_details_events_panel = "xpath://mat-card-title[contains(text(),'Events')]"
device_details_ports_list = "xpath://app-lists-ports"
device_details_ports_table = "id:portsGrid"
device_details_search_button = "xpath://app-lists-ports//button//mat-icon[contains(@class,'ei-search')]"
device_details_search_field = "xpath://app-lists-ports//input[@placeholder='Search...']"

# End-Systems
endsystems_table = "xpath://table[@id='endSystemsGrid']"

# Reports Page Elements
reports_loading_icon = "xpath://extr-loaders-spinner[@class='center-reports-spinner']"
reports_page_title = "xpath://h1[text()='Reports']"
reports_sidebar_menu_button = "xpath://img[@id='rightMenuBtn']"
reports_add_button = "xpath://span[@class='btn btn-info ti-plus']"
reports_add_new_report_menu = "xpath://h4[contains(text(),'New Report')]"
reports_add_new_visual_menu = "xpath://h4[contains(text(),'New Visual')]"
reports_add_new_category_menu = "xpath://h4[contains(text(),'New Category')]"
reports_add_go_to_reports_button = "xpath://img[@id='imgLogo']"
reports_menu_table = "id:rdMenuTable"
reports_menu_tree = "id:menuTreeSide"

# Reports Filter Panel
reports_filter_icon = "xpath://span[@id='filterbtn']"
reports_filter_panel_shown = "xpath://td[@class='master-report-filter'][not(contains(@style, 'display: none'))]"
reports_filter_panel_hidden = "xpath://td[@class='master-report-filter'][contains(@style, 'display: none')]"
reports_filter_panel_device_type_field = "xpath://button[@id='device_type_handler']"
reports_filter_panel_device_type_choice_list_open = "xpath://div[@id='device_type'][contains(@style, 'display: block')]"
reports_filter_panel_device_type_choice_list_closed = "xpath://div[@id='device_type'][contains(@style, 'display: none')]"
reports_filter_panel_device_type_check_all = "xpath://input[@id='device_type_check_all']"
reports_filter_panel_device_tags_field = "xpath://button[@id='device_tag_handler']"
reports_filter_panel_device_tags_choice_list_open = "xpath://div[@id='device_tag'][contains(@style, 'display: block')]"
reports_filter_panel_device_tags_choice_list_closed = "xpath://div[@id='device_tag'][contains(@style, 'display: none')]"
reports_filter_panel_time_range_field = "id:period"
reports_filter_panel_custom_start_date = "//input[@name='start_date']"
reports_filter_panel_custom_end_date = "//input[@name='stop_date']"
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
reports_network_scorecard_menu = "xpath://table[@id='rdMenuTable']//span[text()='Network Scorecard']"
reports_network_summary_menu = "xpath://table[@id='rdMenuTable']//span[text()='Network Summary']"
reports_xmc_server_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='XMC Server Utilization']"

reports_site_availability_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site Availability']"
reports_site_port_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site Port Utilization']"
reports_site_port_error_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site Port Error']"
reports_site_cpu_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site CPU Utilization']"
reports_site_memory_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Site Memory Utilization']"

reports_topn_top_device_availability_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Device Availability']"
reports_topn_top_site_availability_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Site Availability']"
reports_topn_top_cpu_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top CPU Utilization']"
reports_topn_top_memory_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Memory Utilization']"
reports_topn_top_port_utilization_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Port Utilization']"
reports_topn_top_port_error_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Port Error']"
reports_topn_top_aps_by_clients_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top APs by Clients']"
reports_topn_top_aps_by_bandwidth_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top APs by Bandwidth']"

reports_analytics_analytics_summary_menu = "xpath://table[@id='rdMenuTable']//a/span[text()='Analytics Summary']"
reports_analytics_top_applications_by_clients_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Applications by Clients']"
reports_analytics_top_applications_by_volume_menu = "xpath://table[@id='rdMenuTable']//span[text()='Top Applications by Volume']"
reports_analytics_slowest_responding_applications_menu = "xpath://table[@id='rdMenuTable']//span[text()='Slowest Responding Applications']"
reports_analytics_daily_usage_menu = "xpath://table[@id='rdMenuTable']//span[text()='Daily Analytics Usage']"
reports_analytics_monthly_usage_menu = "xpath://table[@id='rdMenuTable']//span[text()='Monthly Analytics Usage']"
reports_analytics_quarterly_summary_menu = "xpath://table[@id='rdMenuTable']//span[text()='Quarterly Analytics Summary']"

# Reports Page Titles
reports_network_scorecard_page_title = "xpath://h2[text()='Network Scorecard']"
reports_network_summary_page_title = "xpath://h2[text()='Network Summary']"
reports_xmc_server_utilization_page_title = "xpath://h2[text()='XMC Server Utilization']"
reports_site_availability_page_title = "xpath://h2[text()='Site Availability']"
reports_site_cpu_utilization_page_title = "xpath://h2[text()='Site CPU Utilization']"
reports_site_memory_utilization_page_title = "xpath://h2[text()='Site Memory Utilization']"
reports_site_port_utilization_page_title = "xpath://h2[text()='Site Port Utilization']"
reports_site_port_error_page_title = "xpath://h2[text()='Site Port Error']"
reports_site_wireless_volume_page_title = "xpath://h2[text()='Site Wireless Volume']"
reports_total_clients_page_title = "xpath://h2[text()='Total Clients']"
reports_tracked_app_resp_time_page_title = "xpath://h2[text()='Tracked Application Response Time']"
reports_topn_top_device_availability_page_title = "xpath://h2[text()='Top Device Availability']"
reports_topn_top_site_availability_page_title = "xpath://h2[text()='Top Site Availability']"
reports_topn_top_cpu_utilization_page_title = "xpath://h2[text()='Top CPU Utilization']"
reports_topn_top_memory_utilization_page_title = "xpath://h2[text()='Top Memory Utilization']"
reports_topn_top_port_utilization_page_title = "xpath://h2[text()='Top Port Utilization']"
reports_topn_top_port_error_page_title = "xpath://h2[text()='Top Port Error']"
reports_topn_top_aps_by_clients_page_title = "xpath://h2[text()='Top APs by Clients']"
reports_topn_top_aps_by_bandwidth_page_title = "xpath://h2[text()='Top APs by Bandwidth']"
reports_analytics_analytics_summary_page_title = "//h2[text()='Analytics Summary']"
reports_analytics_top_applications_by_clients_page_title = "xpath://h2[text()='Top Applications by Clients']"
reports_analytics_top_applications_by_volume_page_title = "xpath://h2[text()='Top Applications by Volume']"
reports_analytics_slowest_responding_applications_page_title = "xpath://h2[text()='Slowest Responding Applications']"
reports_analytics_daily_usage_page_title = "xpath://h2[text()='Daily Analytics Usage']"
reports_analytics_monthly_usage_page_title = "xpath://h2[text()='Monthly Analytics Usage']"
reports_analytics_quarterly_summary_page_title = "xpath://h2[text()='Quarterly Analytics Summary']"

# Reports - Drilldown Elements
reports_device_availability_drilldown = "xpath://h4[text()='Device Availability']"
reports_site_availability_drilldown = "xpath://h4[text()='Site Availability']"
reports_site_cpu_util_drilldown = "xpath://h4[text()='Site CPU Utilization']"
reports_site_memory_util_drilldown = "xpath://h4[text()='Site Memory Utilization']"
reports_total_clients_drilldown = "xpath://h4[text()='Total Clients']"
reports_site_port_util_drilldown = "xpath://h4[text()='Site Port Utilization']"
reports_site_port_error_drilldown = "xpath://h4[text()='Site Port Error']"
reports_site_wireless_volume_drilldown = "xpath://h4[text()='Site Wireless Volume']"
reports_tracked_app_resp_time_drilldown = "xpath://h4[contains(text(),'Tracked Application')]"
reports_top_aps_by_clients_drilldown = "xpath://h4[text()='Top APs by Clients']"
reports_top_aps_by_bandwidth_drilldown = "xpath://h4[text()='Top APs by Bandwidth']"
reports_port_utilization_drilldown = "xpath://h4[text()='Port Utilization']"
reports_port_error_drilldown = "xpath://h4[text()='Port Error']"
reports_endsystem_types_drilldown = "xpath://h4[text()='End System Types']"
reports_cpu_utilization_drilldown = "xpath://h4[text()='CPU Utilization']"
reports_memory_utilization_drilldown = "xpath://h4[text()='Memory Utilization']"
reports_top_applications_by_clients_drilldown = "xpath://h4[text()='Top Applications by Clients']"
reports_top_applications_by_volume_drilldown = "xpath://h4[text()='Top Applications by Volume']"
reports_slowest_responding_applications_drilldown = "xpath://h4[text()='Slowest Responding Applications']"
reports_slowest_responding_network_services_drilldown = "xpath://h4[text()='Slowest Responding Network Services']"

# Reports Donuts
reports_site_availability_donut = "xpath://*[contains(@class,'highcharts')]//*[name()='path' and contains(@fill,'rgba')]"
reports_site_cpu_util_donut = "xpath://h4[text()='Site CPU Utilization']"
reports_site_memory_util_donut = "xpath://h4[text()='Site Memory Utilization']"
reports_total_clients_donut = "xpath://h4[text()='Total Clients']"
reports_site_port_util_donut = "xpath://h4[text()='Site Port Utilization']"
reports_site_port_error_donut = "xpath://h4[text()='Site Port Error']"
reports_site_wireless_volume_donut = "xpath://h4[text()='Site Wireless Volume']"
reports_tracked_app_resp_time_donut = "xpath://h4[text()='Tracked Application Response Time']"

# Reports - Network Scorecard Page Elements
reports_donut_value = "xpath://div[@class='chart-percent']"

# Reports - Network Summary Page Elements
reports_chart_no_data = "xpath://*[@class='highcharts-no-data']"

# Reports - Site Availability Page Elements
site_availability_table = "xpath://table[@id='sites']"

# Reports - Quarterly Analytics Summary Page Elements
reports_analytics_quarterly_summary_1st_quarter = "xpath://h2[contains(text(),'1st Quarter')]"
reports_analytics_quarterly_summary_2nd_quarter = "xpath://h2[contains(text(),'2nd Quarter')]"
reports_analytics_quarterly_summary_3rd_quarter = "xpath://h2[contains(text(),'3rd Quarter')]"
reports_analytics_quarterly_summary_4th_quarter = "xpath://h2[contains(text(),'4th Quarter')]"

# Reports - General Page Titles
reports_device_availability_page_title = "xpath://h2[text()='Device Availability']"
reports_top_device_availability_page_title = "xpath://h2[text()='Top Device Availability']"
reports_device_overview_page_title = "xpath://h2[text()='Device Overview']"
reports_site_port_utilization_page_title = "xpath://h2[text()='Site Port Utilization']"
reports_port_utilization_page_title = "xpath://h2[text()='Port Utilization']"
reports_port_overview_page_title = "xpath://h2[text()='Port Overview']"
reports_rx_bandwidth_page_title = "xpath://h2[text()='Rx Bandwidth']"
reports_total_bandwidth_page_title = "xpath://h2[text()='Total Bandwidth']"
reports_tx_bandwidth_page_title = "xpath://h2[text()='Tx Bandwidth']"

# Reports - General Panel Titles
reports_top_sites_by_clients = "xpath://h4[contains(text(),'Top Sites by Clients')]"

# Settings Page Elements
settings_page_title = "xpath://span[@class='settings-title']"
settings_usergroups_menu = "xpath://div[text()='User Groups']"
settings_security_menu = "xpath://div[text()='Security']"

# Settings - User Groups Page Elements
usergroups_page_title = "xpath://span[@class='user-groups-title'][text()='User Groups']"
usergroups_edit_button = "xpath://p[text()='Edit']//ancestor::extr-custom-button"
usergroups_close_button = "xpath://p[text()='Close']//ancestor::extr-custom-button"
usergroups_cancel_button = "xpath://p[text()='Cancel']//ancestor::extr-custom-button"
usergroups_save_button = "xpath://p[text()='Save']//ancestor::extr-custom-button"
usergroups_details_server_label = "xpath://div[@class='user-group-server-info']//div[@class='section-description'][contains(text(),'Server')]"

# Settings - Security Page Elements
security_page_title = "xpath://span[@class='security-title'][text()='Security']"
