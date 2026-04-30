std_msgs/Header header

uint8 OK=0
uint8 WARN=1
uint8 ERROR=2
uint8 STALE=3

uint8 depth_state
float64 depth
float64 depth_limit
float64 depth_remaining_to_warning
float64 depth_remaining_to_error

uint8 area_state
float64 area_distance
float64 area_limit
float64 area_remaining_to_warning
float64 area_remaining_to_error

uint8 frequency_state
float64 frequency_hz
float64 frequency_warn_limit
float64 frequency_error_limit
float64 frequency_remaining_to_warning
float64 frequency_remaining_to_error
