Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23640E01389
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  9 Feb 2012 11:21:44 -0800 (PST)
Received: by mail-wi0-f181.google.com with SMTP id hi8so1599928wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 09 Feb 2012 11:21:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.133.26 with SMTP id p26mr8873498wei.36.1328815304756;
	Thu, 09 Feb 2012 11:21:44 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm10581516wib.1.2012.02.09.11.21.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 09 Feb 2012 11:21:44 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  9 Feb 2012 20:21:23 +0100
Message-Id: <1328815284-26086-5-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
References: <1328815284-26086-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmGNddi0aBFPGvCxO363RC3YNGNJlOeXyIdLah43kKky98TOUDA6piu/qubcFcl+tAp0uyJ
Subject: [PATCH 5/6] linux-ti33x-psp 3.2: add support for Towertech TT3201 CAN cape
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
X-List-Received-Date: Thu, 09 Feb 2012 19:21:45 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |  312 ++++++++++++++++++++
 .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |   14 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    3 +-
 3 files changed, 321 insertions(+), 8 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
new file mode 100644
index 0000000..086ace9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
@@ -0,0 +1,312 @@
+From af31b4d5a2d52284b169633b9a601c39c7300300 Mon Sep 17 00:00:00 2001
+From: Alessandro Zummo <a.zummo@towertech.it>
+Date: Thu, 9 Feb 2012 12:46:52 +0100
+Subject: [PATCH 22/22] beaglebone: add support for Towertech TT3201 CAN cape
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   54 ++++++++++++++++++++++++++++++++-
+ arch/arm/mach-omap2/mux33xx.c         |    4 +-
+ drivers/net/can/dev.c                 |    8 ++--
+ drivers/net/can/mcp251x.c             |   47 ++++++++++++++++++++++------
+ 4 files changed, 96 insertions(+), 17 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 538466d..36efca1 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -38,6 +38,7 @@
+ #include <linux/pwm_backlight.h>
+ #include <linux/pwm/pwm.h>
+ #include <linux/w1-gpio.h>
++#include <linux/can/platform/mcp251x.h>
+ 
+ /* LCD controller is similar to DA850 */
+ #include <video/da8xx-fb.h>
+@@ -829,6 +830,15 @@ static struct pinmux_config d_can_ia_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++static struct pinmux_config tt3201_pin_mux[] = {
++	{"uart1_rxd.d_can1_tx", OMAP_MUX_MODE2 | AM33XX_PIN_OUTPUT },
++	{"uart1_txd.d_can1_rx", OMAP_MUX_MODE2 | AM33XX_PIN_INPUT_PULLUP },
++	{"mcasp0_fsr.gpio3_19", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP },
++	{"mcasp0_ahclkx.gpio3_21", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP },
++	{"ecap0_in_pwm0_out.spi1_cs1", OMAP_MUX_MODE2 | AM33XX_PIN_OUTPUT_PULLUP },
++	{NULL, 0},
++};
++
+ /* Module pin mux for uart2 */
+ static struct pinmux_config uart2_pin_mux[] = {
+ 	{"spi0_sclk.uart2_rxd", OMAP_MUX_MODE1 | AM33XX_SLEWCTRL_SLOW |
+@@ -1788,6 +1798,44 @@ static void i2c1_init(int evm_id, int profile)
+ 	return;
+ }
+ 
++static struct mcp251x_platform_data mcp251x_info = {
++	.oscillator_frequency = 16000000,
++};
++
++static struct spi_board_info tt3201_spi_info[] = {
++	{
++		.modalias	= "mcp2515",
++		.max_speed_hz	= 10000000,
++		.bus_num	= 2,
++		.chip_select	= 0,
++		.mode		= SPI_MODE_0,
++		.platform_data	= &mcp251x_info,
++	},
++	{
++		.modalias	= "mcp2515",
++		.max_speed_hz	= 10000000,
++		.bus_num	= 2,
++		.chip_select	= 1,
++		.mode		= SPI_MODE_0,
++		.platform_data	= &mcp251x_info,
++	},
++};
++
++static void tt3201_init(int evm_id, int profile)
++{
++	pr_info("TowerTech TT3201 CAN Cape\n");
++
++	setup_pin_mux(spi1_pin_mux);
++	setup_pin_mux(tt3201_pin_mux);
++
++	tt3201_spi_info[0].irq = gpio_to_irq(GPIO_TO_PIN(3, 19));
++	tt3201_spi_info[1].irq = gpio_to_irq(GPIO_TO_PIN(3, 21));
++
++	spi_register_board_info(tt3201_spi_info,
++		ARRAY_SIZE(tt3201_spi_info));
++
++	am33xx_d_can_init(1);
++}
+ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
+ {
+ 	capecount++;
+@@ -1835,7 +1883,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_tsadcpins_free = 0;
+ 	}
+ 	
+-	
++	if (!strncmp("TT3201-001", cape_config.partnumber, 10)) {
++		pr_info("BeagleBone cape: initializing CAN cape\n");
++		tt3201_init(0,0);
++	}
++
+ 	if ((capecount > 3) && (beaglebone_tsadcpins_free == 1)) {
+ 		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
+ 		bone_tsc_init(0,0);
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 0a06241..e4f3bd9 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -318,10 +318,10 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		"uart1_rtsn", NULL, "d_can0_rx", "i2c2_scl",
+ 		"spi1_cs1", NULL, NULL, "gpio0_13"),
+ 	_AM33XX_MUXENTRY(UART1_RXD, 0,
+-		"uart1_rxd", "mmc1_sdwp", NULL, NULL,
++		"uart1_rxd", "mmc1_sdwp", "d_can1_tx", NULL,
+ 		NULL, "pr1_uart0_rxd_mux1", NULL, "gpio0_14"),
+ 	_AM33XX_MUXENTRY(UART1_TXD, 0,
+-		"uart1_txd", "mmc2_sdwp", NULL, NULL,
++		"uart1_txd", "mmc2_sdwp", "d_can1_rx", NULL,
+ 		NULL, "pr1_uart0_txd_mux1", NULL, "gpio0_15"),
+ 	_AM33XX_MUXENTRY(I2C0_SDA, 0,
+ 		"i2c0_sda", NULL, NULL, NULL,
+diff --git a/drivers/net/can/dev.c b/drivers/net/can/dev.c
+index 25695bd..bc1e87e 100644
+--- a/drivers/net/can/dev.c
++++ b/drivers/net/can/dev.c
+@@ -392,7 +392,7 @@ void can_restart(unsigned long data)
+ 	stats->rx_bytes += cf->can_dlc;
+ 
+ restart:
+-	dev_dbg(dev->dev.parent, "restarted\n");
++	netdev_dbg(dev, "restarted\n");
+ 	priv->can_stats.restarts++;
+ 
+ 	/* Now restart the device */
+@@ -400,7 +400,7 @@ restart:
+ 
+ 	netif_carrier_on(dev);
+ 	if (err)
+-		dev_err(dev->dev.parent, "Error %d during restart", err);
++		netdev_err(dev, "error %d during restart", err);
+ }
+ 
+ int can_restart_now(struct net_device *dev)
+@@ -433,7 +433,7 @@ void can_bus_off(struct net_device *dev)
+ {
+ 	struct can_priv *priv = netdev_priv(dev);
+ 
+-	dev_dbg(dev->dev.parent, "bus-off\n");
++	netdev_dbg(dev, "bus-off\n");
+ 
+ 	netif_carrier_off(dev);
+ 	priv->can_stats.bus_off++;
+@@ -545,7 +545,7 @@ int open_candev(struct net_device *dev)
+ 	struct can_priv *priv = netdev_priv(dev);
+ 
+ 	if (!priv->bittiming.tq && !priv->bittiming.bitrate) {
+-		dev_err(dev->dev.parent, "bit-timing not yet defined\n");
++		netdev_err(dev, "bit-timing not yet defined\n");
+ 		return -EINVAL;
+ 	}
+ 
+diff --git a/drivers/net/can/mcp251x.c b/drivers/net/can/mcp251x.c
+index 330140e..b3e231c 100644
+--- a/drivers/net/can/mcp251x.c
++++ b/drivers/net/can/mcp251x.c
+@@ -93,8 +93,9 @@
+ #  define CANCTRL_REQOP_LOOPBACK    0x40
+ #  define CANCTRL_REQOP_SLEEP	    0x20
+ #  define CANCTRL_REQOP_NORMAL	    0x00
+-#  define CANCTRL_OSM		    0x08
+ #  define CANCTRL_ABAT		    0x10
++#  define CANCTRL_OSM		    0x08
++#  define CANCTRL_CLKEN		    0x04
+ #define TEC	      0x1c
+ #define REC	      0x1d
+ #define CNF1	      0x2a
+@@ -287,7 +288,7 @@ static void mcp251x_clean(struct net_device *net)
+ /*
+  * Note about handling of error return of mcp251x_spi_trans: accessing
+  * registers via SPI is not really different conceptually than using
+- * normal I/O assembler instructions, although it's much more
++ * normal I/O assembly instructions, although it's much more
+  * complicated from a practical POV. So it's not advisable to always
+  * check the return value of this function. Imagine that every
+  * read{b,l}, write{b,l} and friends would be bracketed in "if ( < 0)
+@@ -490,7 +491,7 @@ static void mcp251x_hw_rx(struct spi_device *spi, int buf_idx)
+ 
+ static void mcp251x_hw_sleep(struct spi_device *spi)
+ {
+-	mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_SLEEP);
++//	mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_SLEEP);
+ }
+ 
+ static netdev_tx_t mcp251x_hard_start_xmit(struct sk_buff *skb,
+@@ -547,13 +548,16 @@ static int mcp251x_set_normal_mode(struct spi_device *spi)
+ 
+ 	if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK) {
+ 		/* Put device into loopback mode */
+-		mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_LOOPBACK);
++		mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_LOOPBACK | CANCTRL_CLKEN);
+ 	} else if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY) {
+ 		/* Put device into listen-only mode */
+-		mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_LISTEN_ONLY);
++		mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_LISTEN_ONLY | CANCTRL_CLKEN);
+ 	} else {
+ 		/* Put device into normal mode */
+-		mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_NORMAL);
++		mcp251x_write_reg(spi, CANCTRL, CANCTRL_REQOP_NORMAL | CANCTRL_CLKEN);
++
++                netdev_info(priv->net, "CANCTRL: 0x%02x\n",
++                  mcp251x_read_reg(spi, CANCTRL));
+ 
+ 		/* Wait for the device to enter normal mode */
+ 		timeout = jiffies + HZ;
+@@ -585,11 +589,15 @@ static int mcp251x_do_set_bittiming(struct net_device *net)
+ 			  (bt->prop_seg - 1));
+ 	mcp251x_write_bits(spi, CNF3, CNF3_PHSEG2_MASK,
+ 			   (bt->phase_seg2 - 1));
+-	dev_info(&spi->dev, "CNF: 0x%02x 0x%02x 0x%02x\n",
++
++	netdev_info(net, "CNF: 0x%02x 0x%02x 0x%02x\n",
+ 		 mcp251x_read_reg(spi, CNF1),
+ 		 mcp251x_read_reg(spi, CNF2),
+ 		 mcp251x_read_reg(spi, CNF3));
+ 
++	netdev_info(net, "CANCTRL: 0x%02x\n",
++		 mcp251x_read_reg(spi, CANCTRL));
++
+ 	return 0;
+ }
+ 
+@@ -600,6 +608,7 @@ static int mcp251x_setup(struct net_device *net, struct mcp251x_priv *priv,
+ 
+ 	mcp251x_write_reg(spi, RXBCTRL(0),
+ 			  RXBCTRL_BUKT | RXBCTRL_RXM0 | RXBCTRL_RXM1);
++
+ 	mcp251x_write_reg(spi, RXBCTRL(1),
+ 			  RXBCTRL_RXM0 | RXBCTRL_RXM1);
+ 	return 0;
+@@ -728,7 +737,9 @@ static void mcp251x_tx_work_handler(struct work_struct *ws)
+ 	mutex_lock(&priv->mcp_lock);
+ 	if (priv->tx_skb) {
+ 		if (priv->can.state == CAN_STATE_BUS_OFF) {
++
+ 			mcp251x_clean(net);
++
+ 		} else {
+ 			frame = (struct can_frame *)priv->tx_skb->data;
+ 
+@@ -827,21 +838,37 @@ static irqreturn_t mcp251x_can_ist(int irq, void *dev_id)
+ 
+ 		/* Update can state */
+ 		if (eflag & EFLG_TXBO) {
++
++		        netdev_err(net, "err: bus off\n");
++
+ 			new_state = CAN_STATE_BUS_OFF;
+ 			can_id |= CAN_ERR_BUSOFF;
+ 		} else if (eflag & EFLG_TXEP) {
++
++		        netdev_err(net, "err: txep\n");
++
+ 			new_state = CAN_STATE_ERROR_PASSIVE;
+ 			can_id |= CAN_ERR_CRTL;
+ 			data1 |= CAN_ERR_CRTL_TX_PASSIVE;
++
+ 		} else if (eflag & EFLG_RXEP) {
++
++		        netdev_err(net, "err: rxep\n");
++
+ 			new_state = CAN_STATE_ERROR_PASSIVE;
+ 			can_id |= CAN_ERR_CRTL;
+ 			data1 |= CAN_ERR_CRTL_RX_PASSIVE;
+ 		} else if (eflag & EFLG_TXWAR) {
++
++		        netdev_err(net, "err: txwar\n");
++
+ 			new_state = CAN_STATE_ERROR_WARNING;
+ 			can_id |= CAN_ERR_CRTL;
+ 			data1 |= CAN_ERR_CRTL_TX_WARNING;
+ 		} else if (eflag & EFLG_RXWAR) {
++
++		        netdev_err(net, "err: rxwar\n");
++
+ 			new_state = CAN_STATE_ERROR_WARNING;
+ 			can_id |= CAN_ERR_CRTL;
+ 			data1 |= CAN_ERR_CRTL_RX_WARNING;
+@@ -918,7 +945,7 @@ static int mcp251x_open(struct net_device *net)
+ 
+ 	ret = open_candev(net);
+ 	if (ret) {
+-		dev_err(&spi->dev, "unable to set initial baudrate!\n");
++		netdev_err(net, "failed to open can device\n");
+ 		return ret;
+ 	}
+ 
+@@ -934,7 +961,7 @@ static int mcp251x_open(struct net_device *net)
+ 		  pdata->irq_flags ? pdata->irq_flags : IRQF_TRIGGER_FALLING,
+ 		  DEVICE_NAME, priv);
+ 	if (ret) {
+-		dev_err(&spi->dev, "failed to acquire irq %d\n", spi->irq);
++		netdev_err(net, "failed to acquire irq %d\n", spi->irq);
+ 		if (pdata->transceiver_enable)
+ 			pdata->transceiver_enable(0);
+ 		close_candev(net);
+@@ -1071,7 +1098,7 @@ static int __devinit mcp251x_can_probe(struct spi_device *spi)
+ 
+ 	ret = register_candev(net);
+ 	if (!ret) {
+-		dev_info(&spi->dev, "probed\n");
++		netdev_info(priv->net, "probed\n");
+ 		return ret;
+ 	}
+ error_probe:
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
index f2c8b44..07b9987 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
@@ -777,8 +777,8 @@ CONFIG_DNS_RESOLVER=y
 #
 # CONFIG_NET_PKTGEN is not set
 # CONFIG_HAMRADIO is not set
-CONFIG_CAN=m
-CONFIG_CAN_RAW=m
+CONFIG_CAN=y
+CONFIG_CAN_RAW=y
 CONFIG_CAN_BCM=m
 CONFIG_CAN_GW=m
 
@@ -787,14 +787,14 @@ CONFIG_CAN_GW=m
 #
 CONFIG_CAN_VCAN=m
 CONFIG_CAN_SLCAN=m
-CONFIG_CAN_DEV=m
+CONFIG_CAN_DEV=y
 CONFIG_CAN_CALC_BITTIMING=y
 CONFIG_CAN_TI_HECC=m
-# CONFIG_CAN_MCP251X is not set
+CONFIG_CAN_MCP251X=y
 # CONFIG_CAN_SJA1000 is not set
 # CONFIG_CAN_C_CAN is not set
-CONFIG_CAN_D_CAN=m
-CONFIG_CAN_D_CAN_PLATFORM=m
+CONFIG_CAN_D_CAN=y
+CONFIG_CAN_D_CAN_PLATFORM=y
 
 #
 # CAN USB interfaces
@@ -802,7 +802,7 @@ CONFIG_CAN_D_CAN_PLATFORM=m
 CONFIG_CAN_EMS_USB=m
 CONFIG_CAN_ESD_USB2=m
 # CONFIG_CAN_SOFTING is not set
-# CONFIG_CAN_DEBUG_DEVICES is not set
+CONFIG_CAN_DEBUG_DEVICES=y
 CONFIG_IRDA=m
 
 #
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 6c67129..682fa8c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "83d907e1b05dabc44f3bb64532d7b58d059a14c0"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -46,6 +46,7 @@ PATCHES_OVER_PSP = " \
 	file://0019-beaglebone-set-default-brightness-to-50-for-pwm-back.patch \
 	file://0020-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
 	file://0021-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch \
+	file://0022-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch \
 "
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-- 
1.7.2.5


