# Simple CRT
A simple CRT filter for the RetroArch SNES mini module. This is a modified version of one of the GLSL shaders dumped from the original SNESCE emulator.

# Installation
* Copy this on /etc/libretro/shaders using FTP, then open the Retro Arch menu by pressing START+SELECT.
* Navigate to Video, ensure Bilinear Filtering is OFF and Crop Overscan is ON.
* Go back, Quick Menu, Shaders. Set Shader Passes to 1, Shader \#0 to the name of the shader you just copied.
* You can customize the effect from Menu Shader Parameters.
   * Scan Line Scale makes for more or less scan lines. Default multiplier is 2.
   * Blend Exponent makes for a smoother or stronger difference. Default is 0.2.
