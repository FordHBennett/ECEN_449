#include<xparameters.h>
#include<xgpio.h>
#include<xstatus.h>
#include<xilprintf.h>
//Definitions
#define GPIO_DEVICE_ID XPAR_LED_DEVICE_ID //GPIO device that LEDs are connected to
#define WAIT_VAL 10000000 //Loop delay control

int delay(void);

int main()
{
    int count = 0;
    int count_masked;
    XGpio leds;
    int status;
    status=XGpioInitialize(&leds,GPIO_DEVICE_ID);
    XGpio_SetDataDirection(&leds,1,0x00);
    if(status!=XST_SUCCESS)
    {
        xil_printf("Initialization failed");
    }

    while(1)
    {
        count_masked=count & 0xF;
        XGpio_DiscreteWrite(&leds,1,count_masked);
        xil_printf('''Value of LEDs = 0x%x\n\r''',count_masked);
        delay();
        count++;
    }

    return(0);
}
int delay(void)
{
    volatile int delay_count=0;
    
    while(delay_count<WAIT_VAL){
        delay_count++;
    }
    return(0);
}