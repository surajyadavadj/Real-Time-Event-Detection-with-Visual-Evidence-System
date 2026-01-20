# Real-Time-Event-Detection-with-Visual-Evidence-System
This project implements a real-time embedded event detection system based on STM32F411, designed to detect critical motion or shock events and transmit geo-tagged event data over Ethernet.  The system is architected to be scalable, with planned integration of ESP32-CAM to capture and associate visual evidence with detected events.
# Current Features (Implemented)
ADXL345 accelerometer based event detection (>2G)
GPS based location and timestamp acquisition
TCP data transmission using W5500 Ethernet controller
OLED display for live system and event status
Bare-metal STM32F4 implementation (no RTOS / no STM32 HAL)
Clean layered architecture (CMSIS → Drivers → Application)

# Planned Feature (Upcoming)
ESP32-CAM Integration
The next phase of this project will integrate an ESP32-CAM module to provide visual confirmation of detected events.
Planned capabilities:
Event-triggered image capture
JPEG image generation on ESP32-CAM
Image association with sensor event (timestamp & location)
Transfer of visual evidence to host system
Modular design to keep camera subsystem independent
The architecture is intentionally designed to support this extension without impacting existing STM32 firmware.


# Planned Feature (Upcoming)
ESP32-CAM Integration
The next phase of this project will integrate an ESP32-CAM module to provide visual confirmation of detected events.
Planned capabilities:
Event-triggered image capture
JPEG image generation on ESP32-CAM
Image association with sensor event (timestamp & location)
Transfer of visual evidence to host system
Modular design to keep camera subsystem independent
The architecture is intentionally designed to support this extension without impacting existing STM32 firmware.

# Project Structure
ADXL_Oled_stm32/
├── linker.ld
├── cmsis/Include/
├── include/
├── src/
│   └── debug/
│       ├── Makefile
│       ├── main.c
│       ├── startup.s
│       ├── drivers (*.c)
│       └── firmware.elf / firmware.bin


# Event Message Format
EVENT:2G,LAT:xx.xxxx,LON:yy.yyyy,DATE:dd-mm-yyyy,TIME:hh:mm:ss

# Author
Suraj Kumar
ADJ Engineering Pvt. Ltd.
