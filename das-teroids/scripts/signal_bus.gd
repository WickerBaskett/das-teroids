# This file contains declarations of global signals
# Ideally we would use @warning_ignore_start("unused_signal")
# instead of having multiple single line warning ignore statements
# unfortuantley gdformat currently has a bug which formats the code
# into invalid gdscript when we use that tag so we are stuck with this
extends Node

@warning_ignore("unused_signal")
signal player_death
@warning_ignore("unused_signal")
signal lawlor_lag_activate
@warning_ignore("unused_signal")
signal stop_moving
