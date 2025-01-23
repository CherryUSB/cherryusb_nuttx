#include "usbh_core.h"
#include "board.h"
#include "chip.h"

static int hpm_ehci_interrupt(int irq, void *context, void *arg)
{
    extern void USBH_IRQHandler(uint8_t busid);
    USBH_IRQHandler(0);
    return 0;
}

int main(int argc, FAR char *argv[])
{
  printf("Hello, cherryusb!!!!!\n");

  board_init_usb_pins();

  irq_attach(HPM_IRQn_USB0, hpm_ehci_interrupt, NULL);
  up_enable_irq(HPM_IRQn_USB0);

  usbh_initialize(0, CONFIG_HPM_USBH_BASE);
  return 0;
}

int lsusb_main(int argc, FAR char *argv[])
{
  extern int lsusb_main(int argc, FAR char *argv[]);
  lsusb(argc, argv);
  return 0;
}