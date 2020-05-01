*** Variables ***

${BROWSER}                       Chrome

# Site Names
${site_device_down}              Device Down Test Site
${site_empty}                    Empty Site
${site_level_1}                  Level 1 Site
${site_level_2}                  Level 2 Site
${site_level_3}                  Level 3 Site
${site_level_4}                  Level 4 Site
${site_level_5}                  Level 5 Site
${site_parent}                   Parent Site
${site_child_1}                  Child 1 Site
${site_child_2}                  Child 2 Site
${site_test}                     Test Site
${site_port}                     Port Test Site
${site_wireless}                 Wireless Site

# Devices
${device_site_world}             10.54.142.14
${device_up_site_device_down}    10.54.142.31
${device_down_site_device_down}  10.54.142.53
${device_site_level_5}           10.54.142.55
${device_site_parent}            10.54.142.10
${device_site_child_1}           10.54.142.18
${device_site_child_2}           10.54.142.17
${device_1_site_test}            10.54.142.11
${device_2_site_test}            10.4.142.54
${device_site_port}              10.54.142.32
${device_1_site_wireless}        10.54.142.50
${device_2_site_wireless}        10.54.142.60
${device_3_site_wireless}        10.54.142.70
${device_4_site_wireless}        10.54.147.111

# Profiles/Credentials
${bad_profile}                           Bad Profile
${wireless_profile}                      Wireless Profile
${wireless_cli}                          Wireless CLI
${device_site_world_profile}             public_v1_Profile
${device_up_site_device_down_profile}    public_v1_Profile
${device_down_site_device_down_profile}  public_v1_Profile
${device_site_level_5_profile}           public_v1_Profile
${device_site_parent_profile}            public_v1_Profile
${device_site_child_1_profile}           public_v1_Profile
${device_site_child_2_profile}           public_v1_Profile
${device_1_site_test_profile}            public_v1_Profile
${device_2_site_test_profile}            public_v1_Profile
${device_site_port_profile}              public_v1_Profile
${device_1_site_wireless_profile}        ${wireless_profile}
${device_2_site_wireless_profile}        ${wireless_profile}
${device_3_site_wireless_profile}        ${wireless_profile}
${device_4_site_wireless_profile}        ${wireless_profile}

# Device Nicknames
${device_site_world_nickname}             7100
${device_up_site_device_down_nickname}    B5
${device_down_site_device_down_nickname}  B5_2
${device_site_level_5_nickname}           SSA_2
${device_site_parent_nickname}            C5
${device_site_child_1_nickname}           X460_2
${device_site_child_2_nickname}           X460
${device_1_site_test_nickname}            C5_2
${device_2_site_test_nickname}            C5_3
${device_site_port_nickname}              public_v1_Profile
${device_1_site_wireless_nickname}        ${wireless_profile}
${device_2_site_wireless_nickname}        ${wireless_profile}
${device_3_site_wireless_nickname}        ${wireless_profile}
${device_4_site_wireless_nickname}        ${wireless_profile}

# Ports
${port_1}                        ge.1.1
${port_2}                        ge.1.8
${port_logical_1}                host.0.1

# Download CSV File Names
${csv_devices_all}               Devices - All Rows.csv
${csv_devices_visible}           Devices - Visible Rows.csv
${csv_devices_filtered}          Devices - All Filtered Rows.csv

${csv_alarms_all}                Alarms - All Rows.csv
${csv_alarms_visible}            Alarms - Visible Rows.csv
${csv_alarms_filtered}           Alarms - All Filtered Rows.csv

${csv_events_all}                Events - All Rows.csv
${csv_events_visible}            Events - Visible Rows.csv
${csv_events_filtered}           Events - All Filtered Rows.csv

${csv_endsystems_all}            End-Systems - All Rows.csv
${csv_endsystems_visible}        End-Systems - Visible Rows.csv
${csv_endsystems_filtered}       End-Systems - All Filtered Rows.csv

# Download PDF File Names
${pdf_devices_all}               Devices - All Rows.pdf
${pdf_devices_visible}           Devices - Visible Rows.pdf
${pdf_devices_filtered}          Devices - All Filtered Rows.pdf

${pdf_alarms_all}                Alarms - All Rows.pdf
${pdf_alarms_visible}            Alarms - Visible Rows.pdf
${pdf_alarms_filtered}           Alarms - All Filtered Rows.pdf

${pdf_events_all}                Events - All Rows.pdf
${pdf_events_visible}            Events - Visible Rows.pdf
${pdf_events_filtered}           Events - All Filtered Rows.pdf

${pdf_endsystems_all}            End-Systems - All Rows.pdf
${pdf_endsystems_visible}        End-Systems - Visible Rows.pdf
${pdf_endsystems_filtered}       End-Systems - All Filtered Rows.pdf

# XMC Data Pump Options Defaults
${option_enabled}                false
${option_secured}                true
${option_host}                   127.0.0.1
${option_port}                   5671
${option_user}                   guest
${option_pwd}                    extreme
${option_q_delay}                3
${option_q_service_period}       2
${option_max_action_q_size}      150000
${option_max_actions_qable}      60000
${option_max_actions_serviced}   500
