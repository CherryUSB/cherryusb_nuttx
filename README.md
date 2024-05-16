# CherryUSB Nuttx

This a basic cherryusb demo in nuttx using HPM6750.



You should add some pathes for thread.

```
usbh_hubport_enumerate_thread(void *argument) -> usbh_hubport_enumerate_thread(int argc, FAR char *argv[])

usbh_hub_thread(void *argument) -> usbh_hub_thread(int argc, FAR char *argv[])

argument -> ((uintptr_t)strtoul(argv[1], NULL, 16));
```

