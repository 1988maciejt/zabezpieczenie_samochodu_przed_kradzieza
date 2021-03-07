//#include "Arduino.h"

void(* resetFunc) (void) = 0;//declare reset function at address 0


class pump_relay {
protected:
    uint8_t pin;
    bool enabled = false;
    unsigned long enable_in_when = 0;
    bool enable_in = false;
public:
    pump_relay (uint8_t pin) {
        this->pin = pin;
        pinMode(pin, OUTPUT);
        enable();
    }
    void disable() {
        if (!enabled) return;
        digitalWrite(pin, 1);
        enabled = false;
        Serial.println("Pump OFF");
    }
    void enable() {
        if (enabled) return;
        digitalWrite(pin, 0);
        enabled = true;
        Serial.println("Pump ON");
    }
    void enableIn(unsigned long ms) {
        enable_in_when = millis() + ms;
        enable_in = true;
    }
    void poll() {
        if (enable_in && (millis() >= enable_in_when)) {
            enable();
            enable_in = false;
        }
    }
};

class memory_cap {
protected:
    uint8_t pin;
    int minp = 10;
public:
    memory_cap (uint8_t analogPin, int min_percent) {
        pin = analogPin;
        minp = min_percent;
    }
    unsigned int percentMeasure() {
        pinMode(pin, INPUT);
        delay(10);
        return ((unsigned int)analogRead(pin) * 100 / 1023);
    }
    void hold() {
        pinMode(pin, INPUT_PULLUP);
        delay(100);
        pinMode(pin, OUTPUT);
        digitalWrite(pin, 1);
        delay(50);
        pinMode(pin, INPUT_PULLUP);
        delay(100);
        pinMode(pin, OUTPUT);
        digitalWrite(pin, 1);
    }
    bool startupCheckAndHold() {
        unsigned int p = percentMeasure();
        hold();
        Serial.print("Cap: ");
        Serial.print(p);
        Serial.print("%, minimum: ");
        Serial.print(minp);
        Serial.println("%");
        return (p >= minp);
    }
};

class unlock_button {
protected:
    uint8_t pin;
    bool unl = false;
    bool just_flag = false;
public:
    unlock_button (uint8_t pin) {
        this->pin = pin;
        pinMode(pin, INPUT);
    }
    void poll() {
        if (unl) return;
        if (check()) {
            if (!unl) Serial.println("Unlocked by button");
            unl = true;
        }
    }
    bool check() {
        return (digitalRead(pin) == 1);
    }
    bool unlocked() {
        return unl;
    }
    void softUnlock() {
        unl = true;
        Serial.println("Soft unlocked");
    }
    bool justUnlocked() {
        if (!just_flag && unl) {
            just_flag = true;
            return true;
        }
        return false;
    }
};

class buzzer {
protected:
    uint8_t pin;
public:
    buzzer (uint8_t pin) {
        this->pin = pin;
        digitalWrite(pin, 0);
        pinMode(pin, OUTPUT);
    }
    void on() {
        digitalWrite(pin, 1);
    }
    void off() {
        digitalWrite(pin, 0);
    }
    void beep(byte how_many, unsigned int beep_time, unsigned int break_time) {
        for (byte i = 0; i < how_many; ++i) {
            on();
            delay(beep_time);
            off();
            if (i < (how_many-1)) delay(break_time);
        }
    }
    void unlocked () {
        Serial.println("Buzzer: unlocked");
        beep(2, 100, 100);
    }
    void warning () {
        Serial.println("Buzzer: warning");
        beep(3, 30, 100);
    }
    void error () {
        Serial.println("Buzzer: error");
        beep(8, 400, 200);
    }
};

class engine_status {
    protected:
        uint8_t pin;
        int volts_off = 0;
        bool was = false;
        bool is = false;
    public:
        engine_status (uint8_t analogPin) {
            pin = analogPin;
            pinMode(pin, INPUT);
            calibrateZero();
        }
        int measure () {
            int accumulate = 0;
            for (byte i = 0; i < 10; ++i) {
                accumulate += analogRead(pin);
            }
            return (accumulate / 10);
        }
        void calibrateZero () {
            volts_off = measure();
        }
        void poll () {
            was = is;
            int v = measure();
            int p = ((v - volts_off) * 100) / (volts_off);
            if (p > 5) is = true;
            if (p < 5) is = false;
        }
        bool running () {
            return is;
        }
        bool justStopped () {
            return (was && !is);
        }
        bool justStarted () {
            return (!was && is);
        }
        void displayCalibration () {
            Serial.print("Calibrated ADC zero: ");
            Serial.println(volts_off);
        }
};


void resetArduino() {
    uint8_t reset_pin = 12;
    Serial.print("Reset...");
    delay(100);
    resetFunc();
}

