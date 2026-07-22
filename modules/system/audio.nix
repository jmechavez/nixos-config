# Audio stack: PipeWire replacing PulseAudio, with PulseAudio compatibility.
{ pkgs, ... }:

{
  services.pulseaudio.enable = false;

  security.rtkit.enable = true; # realtime scheduling priority for audio threads

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true; # needed for 32-bit games/apps (e.g. via Steam)
    pulse.enable = true;      # PulseAudio compatibility layer
  };
}

