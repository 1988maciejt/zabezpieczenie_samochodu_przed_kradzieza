#include "mt_eeprom.h"

#define PUMP_PIN            4
#define CAP_PIN             A0
#define BUTTON_PIN          2
#define BUZZER_PIN          3
#define VOLTAGE_PIN         A1
#define CAP_MIN_PERC        7
#define ENGINE_TIMEOUT_MS   8000
#define WARNING_TIMEOUT_MS  2000

unsigned long  TIMEOUT = ENGINE_TIMEOUT_MS;
unsigned long  WARNING_TIMEOUT = WARNING_TIMEOUT_MS;
int            CAP_MIN = CAP_MIN_PERC;
setting<byte>  STATE;

#define STATE_NORMAL        0
#define STATE_UNLOCKED      1
#define STATE_LOCKED        2
#define STATE_FORCED_LOCK   3
#define STATE_FORCED_UNLOCK 4

#include "backend.h"

pump_relay      pump (PUMP_PIN); 
memory_cap      cap (CAP_PIN, CAP_MIN);
unlock_button   button (BUTTON_PIN);
engine_status   engine (VOLTAGE_PIN);
buzzer          beep (BUZZER_PIN);

unsigned long   pump_imeout_timestamp = 0;
bool            was_warning_beep = false;


void setup()
{
    Serial.begin(9600);

    Serial.println("POWER-ON");

    Serial.print("STATE at startup: ");
    Serial.println(STATE);
    if (STATE > 4) {
        Serial.println("Illegal STATE!");
        STATE = STATE_NORMAL;
    }
        
    // calibrate voltage when engine is stopped
    engine.calibrateZero();
    engine.displayCalibration();

    // pump must work by default
	if (STATE != STATE_FORCED_LOCK) pump.enable();  
    else pump.disable();              

    // if the cap is still charged it means, that
    // the ignition was OFF and ON a few seconds ago
    // and we can eventually soft-unloack the pump                   
    if (cap.startupCheckAndHold()) {
        if (STATE == STATE_UNLOCKED) {
            button.softUnlock();  
        }
    }    

    // check the button
    delay(1900);
    if (button.check()) {
        beep.on();
        Serial.println("Button pressed at power-on...");
        unsigned long ts = millis();
        while (button.check() && millis() - ts < 5000);
        beep.off();
        ts = millis();
        while (button.check() && millis() - ts < 2000);
        byte STATE_AUX = STATE;
        if (button.check()) {
            do {
                if (STATE_AUX == STATE_FORCED_UNLOCK) {
                    STATE_AUX = STATE_FORCED_LOCK;
                    Serial.println("State: forced_lock");
                    beep.beep(3, 500, 500);
                }
                else if (STATE_AUX == STATE_FORCED_LOCK) {
                    STATE_AUX = STATE_NORMAL;
                    Serial.println("State: normal");
                    beep.beep(1, 500, 500);
                }
                else {
                    STATE_AUX = STATE_FORCED_UNLOCK;
                    Serial.println("State: forced_unlock");
                    beep.beep(2, 500, 500);
                }
                ts = millis();
                while (button.check() && millis() - ts < 2500);
            } while (button.check());
            STATE = STATE_AUX;
        }
        delay(200);
    }

    // if the STATE remembers LOCKED, we need restore this state!
    if (STATE == STATE_LOCKED) {
        pump_imeout_timestamp = millis() - TIMEOUT;
        was_warning_beep = true;
        Serial.println("Lock holding!");
    } else if (STATE != STATE_FORCED_LOCK && STATE != STATE_FORCED_UNLOCK) {
        STATE = STATE_NORMAL;
        Serial.println("State back to normal");
    } else if (STATE == STATE_FORCED_UNLOCK) {
        beep.unlocked();
    }

    if (STATE == STATE_FORCED_LOCK) Serial.println("Forced lock");
    if (STATE == STATE_FORCED_UNLOCK) Serial.println("Forced unlock");

    if (WARNING_TIMEOUT == 0) was_warning_beep = true;
}

void loop()
{
    engine.poll();
    pump.poll();

    if (STATE == STATE_FORCED_LOCK) {
        pump.disable();
    } 
    
    else if (STATE == STATE_FORCED_UNLOCK) {
        pump.enable();
    } 
    
    else { // no force - normal mode

        // check the button
        button.poll();

        // the next actions are dependent on locking status
        if (button.unlocked()) {    // if unlocked...
            
            STATE = STATE_UNLOCKED;
            if (button.justUnlocked()) {
                beep.unlocked();
            }
            pump.enable();

        } else {                    // if locked...

            if (engine.justStarted()) {
                Serial.println("Engine START detected");
                STATE = STATE_LOCKED;
                if (pump_imeout_timestamp == 0) {
                    pump_imeout_timestamp = millis();
                }
            }

            if (engine.justStopped()) {
                Serial.println("Engine STOP detected");
                pump.enableIn(1000);
            }

            if (engine.running()) {
                if (millis() - pump_imeout_timestamp > TIMEOUT) {
                    pump.disable();
                }             
                if (millis() - pump_imeout_timestamp > WARNING_TIMEOUT) {
                    if (!was_warning_beep) {
                        beep.warning();
                        was_warning_beep = true;
                    }
                }
            }
        }
    }
}




