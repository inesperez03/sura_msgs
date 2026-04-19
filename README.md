# sura_msgs

ROS 2 interface package for shared CIRTESUB messages.

This package defines the custom messages used by the navigation and control stack. It does not provide nodes or executables. Its purpose is to keep the project-specific interfaces in one place so other packages can depend on a stable message API.

## Provided Messages

This package currently generates two messages:

- `sura_msgs/msg/AuvControllerSetPoint`
- `sura_msgs/msg/Navigator`

Both messages depend on `geometry_msgs`.

## Message Details

### `AuvControllerSetPoint`

Used to represent a controller target with position and Euler orientation.

Fields:

- `geometry_msgs/Vector3 position`
- `geometry_msgs/Vector3 rpy`

Typical use:

- High-level controller setpoints
- Debugging or logging compact pose targets
- Passing desired position and attitude as numeric vectors

Notes:

- `position` stores Cartesian coordinates.
- `rpy` stores roll, pitch, and yaw in radians.
- This message is compact, but it does not include a header or quaternion orientation.

### `Navigator`

Used to represent the estimated vehicle navigation state.

Fields:

- `geometry_msgs/Pose position`
- `geometry_msgs/Vector3 rpy`
- `geometry_msgs/Twist body_velocity`
- `geometry_msgs/Accel body_acceleration`
- `geometry_msgs/Twist ned_velocity`
- `geometry_msgs/Accel ned_acceleration`

What it contains:

- Vehicle pose
- Euler orientation
- Linear and angular velocity in the body frame
- Linear and angular acceleration in the body frame
- Linear and angular velocity in the NED/world frame
- Linear and angular acceleration in the NED/world frame

Typical use:

- State feedback for controllers
- Navigation telemetry
- Logging and visualization in tools such as PlotJuggler

Important detail:

- The `position` field is a full `geometry_msgs/Pose`, so it includes both translation and quaternion orientation.
- The same orientation is also exposed as Euler angles in `rpy` for controllers that work directly with roll, pitch, and yaw.

## Build

Build this package from the workspace root:

```bash
cd /home/cirtesu/cirtesub_ws
colcon build --packages-select sura_msgs
```

After building, source the workspace:

```bash
source install/setup.bash
```

## Package Role In The Workspace

`sura_msgs` is a foundational package used by other CIRTESUB packages.

Examples:

- `cirtesub_navigator` publishes `sura_msgs/msg/Navigator`
- `cirtesub_controllers` consumes navigator state from `/cirtesub/navigator/navigation`

Because of that, changes to these message definitions can require rebuilding dependent packages.

## Notes

- Message generation is handled through `rosidl_default_generators`.
- The package is a member of the `rosidl_interface_packages` group.
- There is currently no README-driven API beyond the two messages above, so the `.msg` files are the source of truth.
