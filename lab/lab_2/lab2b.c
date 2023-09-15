#include <xparameters.h>
#include <xgpio.h>
#include <xstatus.h>
#include <xil_printf.h>

#define GPIO_DEVICE_ID XPAR_YOUR_GPIO_DEVICE_ID // Replace with your actual GPIO device ID
#define WAIT_VAL 10000000 // Loop delay control
#define BTN_DELAY 1000000 // Delay for button debouncing
#define LED_MASK 0xF // Mask to control lower 4 LEDs

int delay(void);

int main() {
    int count = 0;
    int count_masked;
    int prev_btn_state = 0;
    int switches_state;
    XGpio gpio;
    int status;

    status = XGpio_Initialize(&gpio, GPIO_DEVICE_ID);
    XGpio_SetDataDirection(&gpio, 1, 0xFF); // Set GPIO as inputs

    if (status != XST_SUCCESS) {
        xil_printf("GPIO initialization failed\n\r");
        return XST_FAILURE;
    }

    while (1) {
        // Read the current state of buttons and switches
        int btn_state = XGpio_DiscreteRead(&gpio, 2); // Assuming buttons are connected to channel 2
        switches_state = XGpio_DiscreteRead(&gpio, 1); // Assuming switches are connected to channel 1

        if (btn_state != prev_btn_state) {
            delay(); // Debounce the button press
            prev_btn_state = btn_state;

            // Check which button is pressed
            if (btn_state & 0x01) {
                count++;
            } else if (btn_state & 0x02) {
                count--;
            } else if (btn_state & 0x04) {
                xil_printf("Switches: 0x%02X\n\r", switches_state);
            } else if (btn_state & 0x10) {
                count_masked = count & LED_MASK;
                XGpio_DiscreteWrite(&gpio, 1, count_masked);
                xil_printf("Value of LEDs = 0x%01X\n\r", count_masked);
            }
        }
    }

    return XST_SUCCESS;
}

int delay(void) {
    volatile int delay_count = 0;
    while (delay_count < WAIT_VAL)
        delay_count++;
    return 0;
}
