#include "usbh_core.h"
#include "board.h"
#include "chip.h"

static int hpm_ehci_interrupt(int irq, void *context, void *arg)
{
    extern void isr_usbh0(void);
    isr_usbh0();
    return 0;
}

int main(int argc, FAR char *argv[])
{
  printf("Hello, cherryusb!!!!!\n");

  board_init_usb_pins();

  /* set irq priority */
  intc_set_irq_priority(CONFIG_HPM_USBH_IRQn, 1);
  irq_attach(HPM_IRQn_USB0, hpm_ehci_interrupt, NULL);

  usbh_initialize(0, CONFIG_HPM_USBH_BASE);
  return 0;
}

int lsusb_main(int argc, FAR char *argv[])
{
  printf("lsusb\r\n");
  return 0;
}