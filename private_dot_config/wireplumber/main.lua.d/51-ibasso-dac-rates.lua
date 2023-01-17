table.insert(alsa_monitor.rules, {
  -- An array of matches/actions to evaluate.
  --
  -- If you want to disable some devices or nodes, you can apply properties per device as the following example.
  -- The name can be found by running pw-cli ls Device, or pw-cli dump Device
  --{
  --  matches = {
  --    {
  --      { "device.name", "matches", "name_of_some_disabled_card" },
  --    },
  --  },
  --  apply_properties = {
  --    ["device.disabled"] = true,
  --  },
  --}
  -- Rules for matching a device or node. It is an array of
  -- properties that all need to match the regexp. If any of the
  -- matches work, the actions are executed for the object.
  matches = {
    {
      -- Matches all sinks.
      { "device.name", "equals", "alsa_card.usb-iBasso_iBasso-DC-Series-01" },
    },
  },
  apply_properties = {
    --["node.nick"]              = "My Node",
    --["node.description"]       = "My Node Description",
    --["priority.driver"]        = 100,
    --["priority.session"]       = 100,
    --["node.pause-on-idle"]     = false,
    --["monitor.channel-volumes"] = false
    --["resample.quality"]       = 4,
    --["resample.disable"]       = false,
    --["channelmix.normalize"]   = false,
    --["channelmix.mix-lfe"]     = false,
    --["channelmix.upmix"]       = true,
    --["channelmix.upmix-method"] = "psd",  -- "none" or "simple"
    --["channelmix.lfe-cutoff"]  = 150,
    --["channelmix.fc-cutoff"]   = 12000,
    --["channelmix.rear-delay"]  = 12.0,
    --["channelmix.stereo-widen"] = 0.0,
    --["channelmix.hilbert-taps"] = 0,
    --["channelmix.disable"]     = false,
    --["dither.noise"]           = 0,
    --["dither.method"]          = "none",  -- "rectangular", "triangular" or "shaped5"
    --["audio.channels"]         = 2,
    ["audio.format"]           = "S32LE",
    ["audio.rate"]             = 384000,
    ["audio.allowed-rates"]    = "44100,48000,96000,192000,384000",
    --["audio.position"]         = "FL,FR",
    --["api.alsa.period-size"]   = 1024,
    --["api.alsa.period-num"]    = 2,
    --["api.alsa.headroom"]      = 0,
    --["api.alsa.start-delay"]   = 0,
    --["api.alsa.disable-mmap"]  = false,
    --["api.alsa.disable-batch"] = false,
    --["api.alsa.use-chmap"]     = false,
    --["api.alsa.multirate"]     = true,
    --["latency.internal.rate"]  = 0
    --["latency.internal.ns"]    = 0
    --["clock.name"]             = "api.alsa.0"
    --["session.suspend-timeout-seconds"] = 5,  -- 0 disables suspend
  },
})
