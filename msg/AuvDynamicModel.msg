std_msgs/Header header

string mode
string body_frame_id
uint32 sample_count

# Axis order: surge, sway, heave, roll, pitch, yaw.
float64[6] rigid_body_inertia
float64[6] effective_inertia
float64[6] added_mass
float64[6] linear_damping
float64[6] quadratic_damping
float64[6] static_wrench

float64[6] effective_inertia_variance
float64[6] linear_damping_variance
float64[6] quadratic_damping_variance
float64[6] static_wrench_variance
float64[6] residual_rms
