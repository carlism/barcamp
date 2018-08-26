use Mix.Releases.Config,
    # This sets the default release built by `mix release`
    default_release: :default,
    # This sets the default environment used by `mix release`
    default_environment: :dev

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html


# You may define one or more environments in this file,
# an environment's settings will override those of a release
# when building in that environment, this combination of release
# and environment configuration is called a profile

environment :dev do
  set dev_mode: true
  set include_erts: false
  set cookie: :"5NWCY.1`PxF|5Gg)6VFn4TP!QVk^0w.H&?Y_ku]<l}OPqD!Z>5kx~cuRQ@;Y6:(`"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"4j.@q`oEe*Uhb``l]01`|aVpV_s&5?MWV4A&0qqVE^^>eggbL:b)5{(rh|=YM!&b"
end

# You may define one or more releases in this file.
# If you have not set a default release, or selected one
# when running `mix release`, the first release in the file
# will be used by default

release :barcamp do
  set version: current_version(:barcamp)
end

