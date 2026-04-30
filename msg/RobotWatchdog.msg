std_msgs/Header header

uint8 OK=0
uint8 WARN=1
uint8 ERROR=2
uint8 state
string state_name

builtin_interfaces/Time architecture_start_time
float64 uptime_seconds

builtin_interfaces/Time last_reset_time
float64 elapsed_since_reset_seconds
float64 remaining_to_warning_seconds
float64 remaining_to_error_seconds

uint64 reset_count
string last_reset_reason

float64 warning_timeout
float64 error_timeout_after_warning
