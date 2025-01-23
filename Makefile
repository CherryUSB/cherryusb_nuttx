############################################################################
# apps/netutils/dhcp6c/Makefile
#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.  The
# ASF licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations
# under the License.
#
############################################################################

include $(APPDIR)/Make.defs

CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb/core
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb/common
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb/class/cdc
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb/class/msc
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb/class/hid
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb/class/hub
CFLAGS   += ${INCDIR_PREFIX}$(APPDIR)/cherryusb/cherryusb/class/wireless

CSRCS += cherryusb/core/usbh_core.c
CSRCS += cherryusb/class/hub/usbh_hub.c
CSRCS += cherryusb/class/cdc/usbh_cdc_acm.c
CSRCS += cherryusb/class/hid/usbh_hid.c
CSRCS += cherryusb/class/msc/usbh_msc.c
CSRCS += cherryusb/class/wireless/usbh_rndis.c
CSRCS += cherryusb/port/ehci/usb_hc_ehci.c
CSRCS += cherryusb/port/ehci/usb_glue_hpm.c
CSRCS += cherryusb/osal/usb_osal_nuttx.c
CSRCS += cherryusb/platform/nuttx/usbh_net.c
CSRCS += cherryusb/platform/nuttx/usbh_fs.c
CSRCS += cherryusb/platform/nuttx/usbh_serial.c

CSRCS += cherryusb/core/usbd_core.c
CSRCS += cherryusb/class/msc/usbd_msc.c
CSRCS += cherryusb/class/cdc/usbd_cdc_acm.c
CSRCS += cherryusb/port/hpm/usb_dc_hpm.c
CSRCS += cherryusb/platform/nuttx/usbd_fs.c
CSRCS += cherryusb/platform/nuttx/usbd_cdcacm.c

PROGNAME  = cherryusb_host cherryusb_device lsusb
PRIORITY  = $(CONFIG_EXAMPLES_CHERRYUSB_PRIORITY)
STACKSIZE = $(CONFIG_EXAMPLES_CHERRYUSB_STACKSIZE)
MODULE    = $(CONFIG_CHERRYUSB)

MAINSRC = cherryusb_host_main.c cherryusb_device_main.c

cherryusb:
	$(Q) echo "Downloading cherryusb from github"
	$(Q) git clone git@github.com:cherry-embedded/CherryUSB.git cherryusb

# Download and unpack tarball if no git repo found
ifeq ($(wildcard cherryusb/.git),)
context:: cherryusb

endif

include $(APPDIR)/Application.mk
