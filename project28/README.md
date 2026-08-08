# Smart Helmet Using Verilog HDL

## Description

This project implements a Smart Helmet Safety Monitoring System using Verilog HDL.

The system monitors whether the helmet is worn, detects alcohol consumption, and detects an accident condition. Based on these inputs, it controls the vehicle engine and activates an alarm when an unsafe condition is detected.

## Features

- Helmet detection
- Alcohol detection
- Accident detection
- Automatic engine control
- Safety alarm
- Reset functionality
- Verilog testbench
- Waveform simulation

## Working Principle

```text
              SMART HELMET
                   |
        +----------+----------+
        |          |          |
        v          v          v
     Helmet     Alcohol    Accident
     Sensor      Sensor     Sensor
        |          |          |
        +----------+----------+
                   |
                   v
          +----------------+
          | Safety Control |
          |    Logic       |
          +-------+--------+
                  |
             +----+----+
             |         |
             v         v
          Engine      Alarm
          Control
```

## Safety Logic

### Helmet Not Worn

```text
Helmet = 0
     ↓
Engine OFF
```

### Helmet Worn

```text
Helmet = 1
Alcohol = 0
     ↓
Engine ON
```

### Alcohol Detected

```text
Alcohol = 1
     ↓
Engine OFF
Alarm ON
```

### Accident Detected

```text
Accident = 1
     ↓
Alarm ON
```

## Inputs

| Signal | Description |
|---|---|
| `clk` | System clock |
| `reset` | Reset signal |
| `helmet_worn` | Indicates whether helmet is worn |
| `alcohol_detected` | Indicates alcohol detection |
| `accident_detected` | Indicates accident detection |

## Outputs

| Signal | Description |
|---|---|
| `helmet_ok` | Helmet status |
| `engine_enable` | Vehicle engine control |
| `alarm` | Safety alarm |

## Truth Table

| Helmet | Alcohol | Accident | Engine | Alarm |
|---|---|---|---|---|
| 0 | 0 | 0 | 0 | 0 |
| 1 | 0 | 0 | 1 | 0 |
| 1 | 1 | 0 | 0 | 1 |
| 1 | 0 | 1 | 1 | 1 |

## Project Structure

```text
smart-helmet-verilog/
│
├── smart_helmet.v
├── smart_helmet_tb.v
├── README.md
├── waveform.vcd
└── simulation.png
```

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Visual Studio Code
- GitHub

## Simulation

### Compile

```bash
iverilog -o smart_helmet smart_helmet.v smart_helmet_tb.v
```

### Run

```bash
vvp smart_helmet
```

### View Waveform

```bash
gtkwave waveform.vcd
```

## Expected Output

```text
Helmet not worn  → Engine OFF

Helmet worn      → Engine ON

Alcohol detected → Engine OFF + Alarm ON

Accident detected → Alarm ON
```

## Applications

- Motorcycle safety systems
- Smart transportation
- Rider safety monitoring
- Vehicle access control
- IoT-based safety systems

## Future Enhancements

The system can be extended by adding:

- GPS location tracking
- GSM emergency notification
- Heart-rate monitoring
- Temperature monitoring
- Real alcohol sensor interface
- Real accident/impact sensor
- Emergency SMS notification
- IoT cloud monitoring

## Author

**Dasari Bhargavi**

B.Tech ECE