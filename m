Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F327E006B4
	for <meta-ti@yoctoproject.org>; Wed,  2 Nov 2011 17:40:36 -0700 (PDT)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA30eY0a016523
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 19:40:34 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA30eXHG024339
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 19:40:33 -0500 (CDT)
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA30eXji026380
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 19:40:33 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle71.ent.ti.com
	(128.247.5.62) with Microsoft SMTP Server id 14.1.323.3; Wed, 2 Nov 2011
	19:40:33 -0500
Received: from localhost.localdomain (h114-89.vpn.ti.com [172.24.114.89])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA30eWHm030381;
	Wed, 2 Nov 2011 19:40:32 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Nov 2011 19:40:30 -0500
Message-ID: <1320280830-21712-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [RFC] linux-ti335x-psp 3.1: More modular and comprehensive defconfig for BeagleBone kernel
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Nov 2011 00:40:36 -0000
Content-Type: text/plain

Networking:
CONFIG_NETFILTER=*   - were enabled as modules in beagle xM
Enabled options for ARP and IP tables as modules for the bone kernel.
CONFIG_NET_SCH=      - networking schedulers, enabled as modules

IR:
Infrared and dongle support, enabled as modules.
Made RFSwitch subsystem as a module

USB:
Added support for usb-serial and miscellaneous devices as modules.

I also used the kernel .config we used for the -xM for comparison purposes.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 .../linux/linux-ti33x-psp-3.1/beaglebone/defconfig |  122 +++++++++++++++-----
 1 files changed, 94 insertions(+), 28 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
index 4508d22..2f2fb25 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.1/beaglebone/defconfig
@@ -617,16 +617,15 @@ CONFIG_BRIDGE_NETFILTER=y
 # CONFIG_NETFILTER_NETLINK_QUEUE is not set
 # CONFIG_NETFILTER_NETLINK_LOG is not set
 # CONFIG_NF_CONNTRACK is not set
-# CONFIG_NETFILTER_XTABLES is not set
-# CONFIG_IP_VS is not set
+CONFIG_NETFILTER_XTABLES=m
 
 #
 # IP: Netfilter Configuration
 #
 # CONFIG_NF_DEFRAG_IPV4 is not set
 # CONFIG_IP_NF_QUEUE is not set
-# CONFIG_IP_NF_IPTABLES is not set
-# CONFIG_IP_NF_ARPTABLES is not set
+CONFIG_IP_NF_IPTABLES=m
+CONFIG_IP_NF_ARPTABLES=m
 
 #
 # IPv6: Netfilter Configuration
@@ -664,12 +663,12 @@ CONFIG_NET_SCHED=y
 #
 # Queueing/Scheduling
 #
-# CONFIG_NET_SCH_CBQ is not set
-# CONFIG_NET_SCH_HTB is not set
-# CONFIG_NET_SCH_HFSC is not set
-# CONFIG_NET_SCH_PRIO is not set
-# CONFIG_NET_SCH_MULTIQ is not set
-# CONFIG_NET_SCH_RED is not set
+CONFIG_NET_SCH_CBQ=m
+CONFIG_NET_SCH_HTB=m
+CONFIG_NET_SCH_HFSC=m
+CONFIG_NET_SCH_PRIO=m
+CONFIG_NET_SCH_MULTIQ=m
+CONFIG_NET_SCH_RED=m
 # CONFIG_NET_SCH_SFB is not set
 # CONFIG_NET_SCH_SFQ is not set
 # CONFIG_NET_SCH_TEQL is not set
@@ -734,9 +733,9 @@ CONFIG_IRDA=m
 #
 # IrDA protocols
 #
-# CONFIG_IRLAN is not set
-# CONFIG_IRNET is not set
-# CONFIG_IRCOMM is not set
+CONFIG_IRLAN=m
+CONFIG_IRNET=m
+CONFIG_IRCOMM=m
 # CONFIG_IRDA_ULTRA is not set
 
 #
@@ -753,21 +752,22 @@ CONFIG_IRDA=m
 #
 # SIR device drivers
 #
-# CONFIG_IRTTY_SIR is not set
+CONFIG_IRTTY_SIR=m
 
 #
 # Dongle support
 #
-# CONFIG_KINGSUN_DONGLE is not set
-# CONFIG_KSDAZZLE_DONGLE is not set
-# CONFIG_KS959_DONGLE is not set
+# CONFIG_DONGLE is not set
+CONFIG_KINGSUN_DONGLE=m
+CONFIG_KSDAZZLE_DONGLE=m
+CONFIG_KS959_DONGLE=m
 
 #
 # FIR device drivers
 #
-# CONFIG_USB_IRDA is not set
-# CONFIG_SIGMATEL_FIR is not set
-# CONFIG_MCS_FIR is not set
+CONFIG_USB_IRDA=m
+CONFIG_SIGMATEL_FIR=m
+CONFIG_MCS_FIR=m
 CONFIG_BT=m
 CONFIG_BT_L2CAP=y
 CONFIG_BT_SCO=y
@@ -827,7 +827,7 @@ CONFIG_MAC80211_RC_DEFAULT="pid"
 # CONFIG_MAC80211_DEBUG_MENU is not set
 CONFIG_WIMAX=m
 CONFIG_WIMAX_DEBUG_LEVEL=8
-CONFIG_RFKILL=y
+CONFIG_RFKILL=m
 CONFIG_RFKILL_LEDS=y
 CONFIG_RFKILL_INPUT=y
 CONFIG_RFKILL_REGULATOR=m
@@ -2559,7 +2559,71 @@ CONFIG_USB_LIBUSUAL=y
 #
 # CONFIG_USB_USS720 is not set
 CONFIG_USB_SERIAL=m
+CONFIG_USB_EZUSB=y
+# CONFIG_USB_SERIAL_GENERIC is not set
+CONFIG_USB_SERIAL_AIRCABLE=m
+CONFIG_USB_SERIAL_ARK3116=m
+CONFIG_USB_SERIAL_BELKIN=m
+CONFIG_USB_SERIAL_CH341=m
+CONFIG_USB_SERIAL_WHITEHEAT=m
+CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m
+CONFIG_USB_SERIAL_CP210X=m
+CONFIG_USB_SERIAL_CYPRESS_M8=m
+CONFIG_USB_SERIAL_EMPEG=m
+CONFIG_USB_SERIAL_FTDI_SIO=m
+CONFIG_USB_SERIAL_FUNSOFT=m
+CONFIG_USB_SERIAL_VISOR=m
+CONFIG_USB_SERIAL_IPAQ=m
+CONFIG_USB_SERIAL_IR=m
+CONFIG_USB_SERIAL_EDGEPORT=m
+CONFIG_USB_SERIAL_EDGEPORT_TI=m
+CONFIG_USB_SERIAL_GARMIN=m
+CONFIG_USB_SERIAL_IPW=m
+CONFIG_USB_SERIAL_IUU=m
+CONFIG_USB_SERIAL_KEYSPAN_PDA=m
+CONFIG_USB_SERIAL_KEYSPAN=m
+# CONFIG_USB_SERIAL_KEYSPAN_MPR is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XA is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA28XB is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19 is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA18X is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QW is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA19QI is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49W is not set
+# CONFIG_USB_SERIAL_KEYSPAN_USA49WLC is not set
+CONFIG_USB_SERIAL_KLSI=m
+CONFIG_USB_SERIAL_KOBIL_SCT=m
+CONFIG_USB_SERIAL_MCT_U232=m
+CONFIG_USB_SERIAL_MOS7720=m
+# CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
+CONFIG_USB_SERIAL_MOS7840=m
+CONFIG_USB_SERIAL_MOTOROLA=m
+CONFIG_USB_SERIAL_NAVMAN=m
 CONFIG_USB_SERIAL_PL2303=m
+CONFIG_USB_SERIAL_OTI6858=m
+CONFIG_USB_SERIAL_QCAUX=m
+CONFIG_USB_SERIAL_QUALCOMM=m
+CONFIG_USB_SERIAL_SPCP8X5=m
+CONFIG_USB_SERIAL_HP4X=m
+CONFIG_USB_SERIAL_SAFE=m
+# CONFIG_USB_SERIAL_SAFE_PADDED is not set
+CONFIG_USB_SERIAL_SIEMENS_MPI=m
+CONFIG_USB_SERIAL_SIERRAWIRELESS=m
+# CONFIG_USB_SERIAL_SYMBOL is not set
+# CONFIG_USB_SERIAL_TI is not set
+# CONFIG_USB_SERIAL_CYBERJACK is not set
+# CONFIG_USB_SERIAL_XIRCOM is not set
+CONFIG_USB_SERIAL_WWAN=m
+# CONFIG_USB_SERIAL_OPTION is not set
+# CONFIG_USB_SERIAL_OMNINET is not set
+CONFIG_USB_SERIAL_OPTICON=m
+CONFIG_USB_SERIAL_VIVOPAY_SERIAL=m
+CONFIG_USB_SERIAL_ZIO=m
+CONFIG_USB_SERIAL_SSU100=m
+CONFIG_USB_SERIAL_DEBUG=m
 
 #
 # USB Miscellaneous drivers
@@ -2569,13 +2633,13 @@ CONFIG_USB_SERIAL_PL2303=m
 # CONFIG_USB_ADUTUX is not set
 # CONFIG_USB_SEVSEG is not set
 # CONFIG_USB_RIO500 is not set
-# CONFIG_USB_LEGOTOWER is not set
-# CONFIG_USB_LCD is not set
-# CONFIG_USB_LED is not set
-# CONFIG_USB_CYPRESS_CY7C63 is not set
-# CONFIG_USB_CYTHERM is not set
-# CONFIG_USB_IDMOUSE is not set
-# CONFIG_USB_FTDI_ELAN is not set
+CONFIG_USB_LEGOTOWER=m
+CONFIG_USB_LCD=m
+CONFIG_USB_LED=m
+CONFIG_USB_CYPRESS_CY7C63=m
+CONFIG_USB_CYTHERM=m
+CONFIG_USB_IDMOUSE=m
+CONFIG_USB_FTDI_ELAN=m
 CONFIG_USB_APPLEDISPLAY=m
 CONFIG_USB_SISUSBVGA=m
 CONFIG_USB_SISUSBVGA_CON=y
@@ -2790,6 +2854,8 @@ CONFIG_R8712_AP=y
 # CONFIG_TRANZPORT is not set
 # CONFIG_POHMELFS is not set
 # CONFIG_LINE6_USB is not set
+CONFIG_USB_SERIAL_QUATECH2=m
+CONFIG_USB_SERIAL_QUATECH_USB2=m
 # CONFIG_VT6656 is not set
 CONFIG_IIO=y
 CONFIG_IIO_RING_BUFFER=y
-- 
1.7.4.1


