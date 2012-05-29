Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89DA9E006D9
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 13:58:25 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.48.117.33])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M4S00BP0Y8KMU84@vms173003.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 29 May 2012 15:57:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 807C120043; Tue,
	29 May 2012 16:57:56 -0400 (EDT)
Date: Tue, 29 May 2012 16:57:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120529205756.GA10106@denix.org>
References: <1337846249-26371-1-git-send-email-koen@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <1337846249-26371-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com
Subject: Re: [PATCH 1/2] linux-ti33x-psp 3.2: sgx fix from PSP + dvi cape audio fix
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
X-List-Received-Date: Tue, 29 May 2012 20:58:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Koen,

On Thu, May 24, 2012 at 09:57:28AM +0200, Koen Kooi wrote:
> Also move more things to modules to speed up boot.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...unding-FB-size-to-satisfy-SGX-buffer-requ.patch |   59 ++++++
>  .../0063-beaglebone-dvi-cape-audio-hacks.patch     |  217 ++++++++++++++++++++
>  .../linux/linux-ti33x-psp-3.2/beaglebone/defconfig |  124 +++++++----
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    4 +-
>  4 files changed, 360 insertions(+), 44 deletions(-)
>  create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch
>  create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch
> 
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch
> new file mode 100644
> index 0000000..f6860cb
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch
> @@ -0,0 +1,59 @@
> +From 02ad70ea366cb2946cc7d7c14ddcbd0dabf3d3ff Mon Sep 17 00:00:00 2001
> +From: Aditya Nellutla <aditya.n@ti.com>
> +Date: Thu, 29 Mar 2012 15:45:39 +0530
> +Subject: [PATCH 62/63] da8xx-fb: Rounding FB size to satisfy SGX buffer
> + requirements
> +
> +In the real time use-case when SGX is used for rendering to FB buffers it has been
> +observed that, the available memory from framebuffer driver is not sufficient for
> +SGX under certain cases (like 16-bit WVGA resolution). SGX requires 2 swap buffers
> +with each of the buffers aligned to lcm(line_length, PAGE_SIZE).
> +
> +Inorder to satisfy this requirement, we have two options,
> +
> +	- Increase number of FB buffers (LCD_NUM_BUFFERS) to 3. This is not
> +	  recommended as we end up wasting huge memory in most of the cases.
> +
> +	- Align FB buffers to lcm(line_length, PAGE_SIZE).This ensures framebuffer
> +	  size is increased to satisfy SGX requirements keeping alignment intact.
> +
> +This patch makes sure that FB allocates buffers aligned to above formula.
> +
> +Signed-off-by: Aditya Nellutla <aditya.n@ti.com>
> +---
> + drivers/video/da8xx-fb.c |    5 ++++-
> + 1 files changed, 4 insertions(+), 1 deletions(-)
> +
> +diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
> +index 86b19ac..9aaca5d 100644
> +--- a/drivers/video/da8xx-fb.c
> ++++ b/drivers/video/da8xx-fb.c
> +@@ -34,6 +34,7 @@
> + #include <linux/slab.h>
> + #include <linux/delay.h>
> + #include <linux/pm_runtime.h>
> ++#include <linux/lcm.h>
> + #include <video/da8xx-fb.h>
> + #include <asm/mach-types.h>
> + 
> +@@ -1263,6 +1264,7 @@ static int __devinit fb_probe(struct platform_device *device)
> + 	struct da8xx_fb_par *par;
> + 	resource_size_t len;
> + 	int ret, i;
> ++	unsigned long ulcm;
> + 
> + 	if (fb_pdata == NULL) {
> + 		dev_err(&device->dev, "Can not get platform data\n");
> +@@ -1362,7 +1364,8 @@ static int __devinit fb_probe(struct platform_device *device)
> + 
> + 	/* allocate frame buffer */
> + 	par->vram_size = lcdc_info->width * lcdc_info->height * lcd_cfg->bpp;
> +-	par->vram_size = PAGE_ALIGN(par->vram_size/8);
> ++	ulcm = lcm((lcdc_info->width * lcd_cfg->bpp)/8, PAGE_SIZE);
> ++	par->vram_size = roundup(par->vram_size/8, ulcm);
> + 	par->vram_size = par->vram_size * LCD_NUM_BUFFERS;
> + 
> + 	par->vram_virt = dma_alloc_coherent(NULL,
> +-- 
> +1.7.7.6
> +
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch
> new file mode 100644
> index 0000000..184d168
> --- /dev/null
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch
> @@ -0,0 +1,217 @@
> +From 4c0991689b1e22f28d4827b218e31131f9f56be7 Mon Sep 17 00:00:00 2001
> +From: Koen Kooi <koen@dominion.thruhere.net>
> +Date: Wed, 23 May 2012 15:51:12 +0200
> +Subject: [PATCH 63/63] beaglebone: dvi cape audio hacks
> +
> +---
> + arch/arm/mach-omap2/board-am335xevm.c |   72 ++++++++++++++++++++++++++------
> + arch/arm/mach-omap2/devices.c         |    2 +-
> + sound/soc/codecs/tlv320aic3x.c        |    2 +-
> + sound/soc/davinci/davinci-evm.c       |    7 ++-
> + 4 files changed, 64 insertions(+), 19 deletions(-)
> +
> +diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
> +index e8ce381..1f2d1fd 100644
> +--- a/arch/arm/mach-omap2/board-am335xevm.c
> ++++ b/arch/arm/mach-omap2/board-am335xevm.c
> +@@ -43,6 +43,8 @@
> + #include <linux/can/platform/mcp251x.h>
> + #include <linux/input/ti_tscadc.h>
> + 
> ++#include <sound/tlv320aic3x.h>
> ++
> + /* LCD controller is similar to DA850 */
> + #include <video/da8xx-fb.h>
> + 
> +@@ -315,7 +317,7 @@ static struct tsc_data bone_touchscreen_data  = {
> + };
> + 
> + static u8 am335x_iis_serializer_direction1[] = {
> +-	INACTIVE_MODE,	INACTIVE_MODE,	TX_MODE,	RX_MODE,
> ++	INACTIVE_MODE,	INACTIVE_MODE,	RX_MODE,	TX_MODE,
> + 	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,
> + 	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,
> + 	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,	INACTIVE_MODE,
> +@@ -334,6 +336,19 @@ static struct snd_platform_data am335x_evm_snd_data1 = {
> + 	.rxnumevt	= 1,
> + };
> + 
> ++static struct snd_platform_data bone_snd_data1 = {
> ++	.tx_dma_offset	= 0x46000000,	/* McASP0*/
> ++	.rx_dma_offset	= 0x46000000,
> ++	.op_mode	= DAVINCI_MCASP_IIS_MODE,
> ++	.num_serializer	= ARRAY_SIZE(am335x_iis_serializer_direction1),
> ++	.tdm_slots	= 2,
> ++	.serial_dir	= am335x_iis_serializer_direction1,
> ++	.asp_chan_q	= EVENTQ_2,
> ++	.version	= MCASP_VERSION_3,
> ++	.txnumevt	= 1,
> ++	.rxnumevt	= 1,
> ++};
> ++
> + static struct omap2_hsmmc_info am335x_mmc[] __initdata = {
> + 	{
> + 		.mmc            = 1,
> +@@ -796,11 +811,18 @@ static struct pinmux_config mcasp1_pin_mux[] = {
> + 	{"mii1_crs.mcasp1_aclkx", OMAP_MUX_MODE4 | AM33XX_PIN_INPUT_PULLDOWN},
> + 	{"mii1_rxerr.mcasp1_fsx", OMAP_MUX_MODE4 | AM33XX_PIN_INPUT_PULLDOWN},
> + 	{"mii1_col.mcasp1_axr2", OMAP_MUX_MODE4 | AM33XX_PIN_INPUT_PULLDOWN},
> +-	{"rmii1_refclk.mcasp1_axr3", OMAP_MUX_MODE4 |
> +-						AM33XX_PIN_INPUT_PULLDOWN},
> ++	{"rmii1_refclk.mcasp1_axr3", OMAP_MUX_MODE4 | AM33XX_PIN_INPUT_PULLDOWN},
> + 	{NULL, 0},
> + };
> + 
> ++/* Module pin mux for mcasp0 */
> ++static struct pinmux_config mcasp0_pin_mux[] = {
> ++	{"mcasp0_aclkx.mcasp0_aclkx", OMAP_MUX_MODE0 |AM33XX_PIN_INPUT_PULLDOWN},
> ++	{"mcasp0_fsx.mcasp0_fsx", OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLDOWN},
> ++	{"mcasp0_ahclkr.mcasp0_axr2", OMAP_MUX_MODE2 | AM33XX_PIN_INPUT_PULLDOWN},
> ++	{"mcasp0_ahclkx.mcasp0_axr3", OMAP_MUX_MODE2 | AM33XX_PIN_INPUT_PULLDOWN},
> ++	{NULL, 0},
> ++};
> + 
> + /* Module pin mux for mmc0 */
> + static struct pinmux_config mmc0_pin_mux[] = {
> +@@ -1956,6 +1978,15 @@ static void evm_nand_init(int evm_id, int profile)
> + 	omap_init_elm();
> + }
> + 
> ++static struct regulator_consumer_supply bone_audio_supplies[] = {
> ++        /* tlv320aic3x analog supplies */
> ++        REGULATOR_SUPPLY("AVDD", "3-001b"),
> ++        REGULATOR_SUPPLY("DRVDD", "3-001b"),
> ++        /* tlv320aic3x digital supplies */
> ++        REGULATOR_SUPPLY("IOVDD", "3-001b"),
> ++        REGULATOR_SUPPLY("DVDD", "3-001b"),
> ++};
> ++
> + /* TPS65217 voltage regulator support */
> + 
> + /* 1.8V */
> +@@ -2229,6 +2260,25 @@ static void tt3201_init(int evm_id, int profile)
> + 	am33xx_d_can_init(1);
> + }
> + 
> ++/* Setup McASP 1 */
> ++static void mcasp1_init(int evm_id, int profile)
> ++{
> ++	/* Configure McASP */
> ++	setup_pin_mux(mcasp1_pin_mux);
> ++	am335x_register_mcasp(&am335x_evm_snd_data1, 1);
> ++	return;
> ++}
> ++
> ++/* Setup McASP 0 */
> ++static void mcasp0_init(int evm_id, int profile)
> ++{
> ++	printk("Beaglebone cape: mcasp0 init\n");
> ++	/* Configure McASP */
> ++	setup_pin_mux(mcasp0_pin_mux);
> ++	am335x_register_mcasp(&bone_snd_data1, 0);
> ++	return;
> ++}
> ++
> + static const char* cape_pins[] = {
> + /*
> +   From SRM RevA5.0.1:
> +@@ -2567,7 +2617,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
> + 		
> + 		beaglebone_leds_free = 0;
> + 		dvileds_init(0,0);
> +-		
> ++		mcasp0_init(0,0);
> ++	
> + 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
> + 			pr_info("BeagleBone cape: DVI init for revision A1 or older\n");
> + 			setup_pin_mux(dvia1_pin_mux);
> +@@ -2715,6 +2766,9 @@ static struct at24_platform_data cape_eeprom_info = {
> + };
> + 
> + static struct i2c_board_info __initdata cape_i2c_boardinfo[] = {
> ++	{
> ++		I2C_BOARD_INFO("tlv320aic3x", 0x1b),
> ++	},
> +         {
> +                 I2C_BOARD_INFO("24c256", 0x54),
> +                 .platform_data  = &cape_eeprom_info,
> +@@ -2741,16 +2795,6 @@ static void i2c2_init(int evm_id, int profile)
> +         return;
> + }
> + 
> +-
> +-/* Setup McASP 1 */
> +-static void mcasp1_init(int evm_id, int profile)
> +-{
> +-	/* Configure McASP */
> +-	setup_pin_mux(mcasp1_pin_mux);
> +-	am335x_register_mcasp(&am335x_evm_snd_data1, 1);
> +-	return;
> +-}
> +-
> + static void mmc1_init(int evm_id, int profile)
> + {
> + 	setup_pin_mux(mmc1_pin_mux);
> +diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
> +index 9e029da..41c9b0f 100644
> +--- a/arch/arm/mach-omap2/devices.c
> ++++ b/arch/arm/mach-omap2/devices.c
> +@@ -218,7 +218,6 @@ int __init am335x_register_mcasp(struct snd_platform_data *pdata, int ctrl_nr)
> + 			dev_name, oh->name);
> + 	return IS_ERR(pdev) ? PTR_ERR(pdev) : 0;
> + }
> +-
> + #else
> + int __init am335x_register_mcasp(struct snd_platform_data *pdata, int ctrl_nr)
> + {
> +@@ -234,6 +233,7 @@ struct platform_device am33xx_pcm_device = {
> + 
> + static void am33xx_init_pcm(void)
> + {
> ++	printk("cape: pcm register");
> + 	platform_device_register(&am33xx_pcm_device);
> + }
> + 
> +diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
> +index d0dbac1..fc32b7f 100644
> +--- a/sound/soc/codecs/tlv320aic3x.c
> ++++ b/sound/soc/codecs/tlv320aic3x.c
> +@@ -52,7 +52,7 @@
> + 
> + #include "tlv320aic3x.h"
> + 
> +-#define AIC3X_NUM_SUPPLIES	4
> ++#define AIC3X_NUM_SUPPLIES	0
> + static const char *aic3x_supply_names[AIC3X_NUM_SUPPLIES] = {
> + 	"IOVDD",	/* I/O Voltage */
> + 	"DVDD",		/* Digital Core Voltage */
> +diff --git a/sound/soc/davinci/davinci-evm.c b/sound/soc/davinci/davinci-evm.c
> +index f6a62c3..7ad7b37 100644
> +--- a/sound/soc/davinci/davinci-evm.c
> ++++ b/sound/soc/davinci/davinci-evm.c
> +@@ -244,9 +244,9 @@ static struct snd_soc_dai_link da850_evm_dai = {
> + static struct snd_soc_dai_link am335x_evm_dai = {
> + 	.name = "TLV320AIC3X",
> + 	.stream_name = "AIC3X",
> +-	.cpu_dai_name = "davinci-mcasp.1",
> ++	.cpu_dai_name = "davinci-mcasp.0",
> + 	.codec_dai_name = "tlv320aic3x-hifi",
> +-	.codec_name = "tlv320aic3x-codec.2-001b",
> ++	.codec_name = "tlv320aic3x-codec.3-001b",
> + 	.platform_name = "davinci-pcm-audio",
> + 	.init = evm_aic3x_init,
> + 	.ops = &evm_ops,
> +@@ -331,8 +331,9 @@ static int __init evm_init(void)
> + 		return -EINVAL;
> + 
> + 	evm_snd_device = platform_device_alloc("soc-audio", index);
> +-	if (!evm_snd_device)
> ++	if (!evm_snd_device) {
> + 		return -ENOMEM;
> ++	}
> + 
> + 	platform_set_drvdata(evm_snd_device, evm_snd_dev_data);
> + 	ret = platform_device_add(evm_snd_device);
> +-- 
> +1.7.7.6
> +
> diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> index 315b658..c9316db 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> +++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> @@ -1,6 +1,6 @@
>  #
>  # Automatically generated file; DO NOT EDIT.
> -# Linux/arm 3.2.14 Kernel Configuration
> +# Linux/arm 3.2.18 Kernel Configuration
>  #
>  CONFIG_ARM=y
>  CONFIG_HAVE_PWM=y
> @@ -895,6 +895,9 @@ CONFIG_CFG80211_DEFAULT_PS=y
>  CONFIG_CFG80211_WEXT=y
>  CONFIG_WIRELESS_EXT_SYSFS=y
>  CONFIG_LIB80211=m
> +CONFIG_LIB80211_CRYPT_WEP=m
> +CONFIG_LIB80211_CRYPT_CCMP=m
> +CONFIG_LIB80211_CRYPT_TKIP=m
>  # CONFIG_LIB80211_DEBUG is not set
>  CONFIG_MAC80211=m
>  CONFIG_MAC80211_HAS_RC=y
> @@ -905,7 +908,7 @@ CONFIG_MAC80211_RC_DEFAULT_PID=y
>  # CONFIG_MAC80211_RC_DEFAULT_MINSTREL is not set
>  CONFIG_MAC80211_RC_DEFAULT="pid"
>  # CONFIG_MAC80211_MESH is not set
> -# CONFIG_MAC80211_LEDS is not set
> +CONFIG_MAC80211_LEDS=y
>  # CONFIG_MAC80211_DEBUGFS is not set
>  # CONFIG_MAC80211_DEBUG_MENU is not set
>  CONFIG_WIMAX=m
> @@ -1029,7 +1032,9 @@ CONFIG_EEPROM_AT24=y
>  # CONFIG_EEPROM_MAX6875 is not set
>  CONFIG_EEPROM_93CX6=m
>  # CONFIG_EEPROM_93XX46 is not set
> -# CONFIG_IWMC3200TOP is not set
> +CONFIG_IWMC3200TOP=m
> +# CONFIG_IWMC3200TOP_DEBUG is not set
> +# CONFIG_IWMC3200TOP_DEBUGFS is not set
>  
>  #
>  # Texas Instruments shared transport line discipline
> @@ -1204,16 +1209,16 @@ CONFIG_SLIP_SMART=y
>  #
>  # USB Network Adapters
>  #
> -CONFIG_USB_CATC=y
> -CONFIG_USB_KAWETH=y
> -CONFIG_USB_PEGASUS=y
> -CONFIG_USB_RTL8150=y
> -CONFIG_USB_USBNET=y
> -CONFIG_USB_NET_AX8817X=y
> -CONFIG_USB_NET_CDCETHER=y
> +CONFIG_USB_CATC=m
> +CONFIG_USB_KAWETH=m
> +CONFIG_USB_PEGASUS=m
> +CONFIG_USB_RTL8150=m
> +CONFIG_USB_USBNET=m
> +CONFIG_USB_NET_AX8817X=m
> +CONFIG_USB_NET_CDCETHER=m
>  # CONFIG_USB_NET_CDC_EEM is not set
> -CONFIG_USB_NET_CDC_NCM=y
> -CONFIG_USB_NET_DM9601=y
> +CONFIG_USB_NET_CDC_NCM=m
> +CONFIG_USB_NET_DM9601=m
>  CONFIG_USB_NET_SMSC75XX=m
>  CONFIG_USB_NET_SMSC95XX=m
>  CONFIG_USB_NET_GL620A=m
> @@ -1221,14 +1226,14 @@ CONFIG_USB_NET_NET1080=m
>  CONFIG_USB_NET_PLUSB=m
>  CONFIG_USB_NET_MCS7830=m
>  CONFIG_USB_NET_RNDIS_HOST=m
> -CONFIG_USB_NET_CDC_SUBSET=y
> +CONFIG_USB_NET_CDC_SUBSET=m
>  CONFIG_USB_ALI_M5632=y
>  CONFIG_USB_AN2720=y
>  CONFIG_USB_BELKIN=y
>  CONFIG_USB_ARMLINUX=y
>  CONFIG_USB_EPSON2888=y
>  CONFIG_USB_KC2190=y
> -CONFIG_USB_NET_ZAURUS=y
> +CONFIG_USB_NET_ZAURUS=m
>  CONFIG_USB_NET_CX82310_ETH=m
>  CONFIG_USB_NET_KALMIA=m
>  CONFIG_USB_HSO=m
> @@ -1242,14 +1247,35 @@ CONFIG_AT76C50X_USB=m
>  CONFIG_USB_ZD1201=m
>  CONFIG_USB_NET_RNDIS_WLAN=m
>  CONFIG_RTL8187=m
> +CONFIG_RTL8187_LEDS=y
>  # CONFIG_MAC80211_HWSIM is not set
> -# CONFIG_ATH_COMMON is not set
> -# CONFIG_B43 is not set
> +CONFIG_ATH_COMMON=m
> +# CONFIG_ATH_DEBUG is not set
> +# CONFIG_ATH9K is not set
> +# CONFIG_ATH9K_HTC is not set
> +CONFIG_CARL9170=m
> +CONFIG_CARL9170_LEDS=y
> +CONFIG_CARL9170_WPC=y
> +# CONFIG_CARL9170_HWRNG is not set
> +CONFIG_ATH6KL=m
> +# CONFIG_ATH6KL_DEBUG is not set
> +CONFIG_B43=m
> +CONFIG_B43_SSB=y
> +# CONFIG_B43_SDIO is not set
> +CONFIG_B43_PIO=y
> +CONFIG_B43_PHY_N=y
> +CONFIG_B43_PHY_LP=y
> +CONFIG_B43_PHY_HT=y
> +CONFIG_B43_LEDS=y
> +CONFIG_B43_HWRNG=y
> +# CONFIG_B43_DEBUG is not set
>  # CONFIG_B43LEGACY is not set
>  CONFIG_BRCMUTIL=m
>  CONFIG_BRCMFMAC=m
>  # CONFIG_BRCMDBG is not set
> -# CONFIG_HOSTAP is not set
> +CONFIG_HOSTAP=m
> +CONFIG_HOSTAP_FIRMWARE=y
> +# CONFIG_HOSTAP_FIRMWARE_NVRAM is not set
>  # CONFIG_IWM is not set
>  CONFIG_LIBERTAS=m
>  CONFIG_LIBERTAS_USB=m
> @@ -1259,7 +1285,9 @@ CONFIG_LIBERTAS_DEBUG=y
>  # CONFIG_LIBERTAS_MESH is not set
>  CONFIG_P54_COMMON=m
>  CONFIG_P54_USB=m
> -# CONFIG_P54_SPI is not set
> +CONFIG_P54_SPI=m
> +CONFIG_P54_SPI_DEFAULT_EEPROM=y
> +CONFIG_P54_LEDS=y
>  CONFIG_RT2X00=m
>  CONFIG_RT2500USB=m
>  CONFIG_RT73USB=m
> @@ -1294,7 +1322,8 @@ CONFIG_ZD1211RW=m
>  #
>  CONFIG_WIMAX_I2400M=m
>  CONFIG_WIMAX_I2400M_USB=m
> -# CONFIG_WIMAX_I2400M_SDIO is not set
> +CONFIG_WIMAX_I2400M_SDIO=m
> +CONFIG_WIMAX_IWMC3200_SDIO=y
>  CONFIG_WIMAX_I2400M_DEBUG_LEVEL=8
>  # CONFIG_WAN is not set
>  # CONFIG_ISDN is not set
> @@ -1800,7 +1829,12 @@ CONFIG_SSB_POSSIBLE=y
>  #
>  # Sonics Silicon Backplane
>  #
> -# CONFIG_SSB is not set
> +CONFIG_SSB=m
> +CONFIG_SSB_BLOCKIO=y
> +CONFIG_SSB_SDIOHOST_POSSIBLE=y
> +# CONFIG_SSB_SDIOHOST is not set
> +# CONFIG_SSB_SILENT is not set
> +# CONFIG_SSB_DEBUG is not set
>  CONFIG_BCMA_POSSIBLE=y
>  
>  #
> @@ -1891,23 +1925,23 @@ CONFIG_VIDEO_MEDIA=m
>  #
>  # Multimedia drivers
>  #
> -CONFIG_RC_CORE=y
> -CONFIG_LIRC=y
> -CONFIG_RC_MAP=y
> -CONFIG_IR_NEC_DECODER=y
> -CONFIG_IR_RC5_DECODER=y
> -CONFIG_IR_RC6_DECODER=y
> -CONFIG_IR_JVC_DECODER=y
> -CONFIG_IR_SONY_DECODER=y
> -CONFIG_IR_RC5_SZ_DECODER=y
> -CONFIG_IR_MCE_KBD_DECODER=y
> -CONFIG_IR_LIRC_CODEC=y
> +CONFIG_RC_CORE=m
> +CONFIG_LIRC=m
> +CONFIG_RC_MAP=m
> +CONFIG_IR_NEC_DECODER=m
> +CONFIG_IR_RC5_DECODER=m
> +CONFIG_IR_RC6_DECODER=m
> +CONFIG_IR_JVC_DECODER=m
> +CONFIG_IR_SONY_DECODER=m
> +CONFIG_IR_RC5_SZ_DECODER=m
> +CONFIG_IR_MCE_KBD_DECODER=m
> +CONFIG_IR_LIRC_CODEC=m
>  CONFIG_RC_ATI_REMOTE=m
> -# CONFIG_IR_IMON is not set
> -# CONFIG_IR_MCEUSB is not set
> -# CONFIG_IR_REDRAT3 is not set
> -# CONFIG_IR_STREAMZAP is not set
> -# CONFIG_RC_LOOPBACK is not set
> +CONFIG_IR_IMON=m
> +CONFIG_IR_MCEUSB=m
> +CONFIG_IR_REDRAT3=m
> +CONFIG_IR_STREAMZAP=m
> +CONFIG_RC_LOOPBACK=m
>  CONFIG_MEDIA_ATTACH=y
>  CONFIG_MEDIA_TUNER=m
>  CONFIG_MEDIA_TUNER_CUSTOMISE=y
> @@ -1949,7 +1983,7 @@ CONFIG_VIDEO_CAPTURE_DRIVERS=y
>  # CONFIG_VIDEO_ADV_DEBUG is not set
>  # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>  # CONFIG_VIDEO_HELPER_CHIPS_AUTO is not set
> -CONFIG_VIDEO_IR_I2C=y
> +CONFIG_VIDEO_IR_I2C=m
>  
>  #
>  # Encoders, decoders, sensors and other helper chips
> @@ -2047,7 +2081,7 @@ CONFIG_VIDEO_VIVI=m
>  # CONFIG_VIDEO_AU0828 is not set
>  # CONFIG_SOC_CAMERA is not set
>  CONFIG_V4L_USB_DRIVERS=y
> -CONFIG_USB_VIDEO_CLASS=y
> +CONFIG_USB_VIDEO_CLASS=m
>  CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
>  CONFIG_USB_GSPCA=m
>  CONFIG_USB_M5602=m
> @@ -2588,7 +2622,7 @@ CONFIG_MUSB_PIO_ONLY=y
>  CONFIG_USB_ACM=y
>  CONFIG_USB_PRINTER=y
>  CONFIG_USB_WDM=y
> -# CONFIG_USB_TMC is not set
> +CONFIG_USB_TMC=m
>  
>  #
>  # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> @@ -3054,9 +3088,9 @@ CONFIG_AD2S1200=m
>  #
>  # Triggers - standalone
>  #
> -# CONFIG_IIO_PERIODIC_RTC_TRIGGER is not set
> -# CONFIG_IIO_GPIO_TRIGGER is not set
> -# CONFIG_IIO_SYSFS_TRIGGER is not set
> +CONFIG_IIO_PERIODIC_RTC_TRIGGER=m
> +CONFIG_IIO_GPIO_TRIGGER=m
> +CONFIG_IIO_SYSFS_TRIGGER=m
>  CONFIG_IIO_DUMMY_EVGEN=m
>  CONFIG_IIO_SIMPLE_DUMMY=m
>  CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
> @@ -3075,7 +3109,11 @@ CONFIG_USB_ENESTORAGE=m
>  # CONFIG_SPEAKUP is not set
>  # CONFIG_TOUCHSCREEN_CLEARPAD_TM1217 is not set
>  # CONFIG_TOUCHSCREEN_SYNAPTICS_I2C_RMI4 is not set
> -# CONFIG_STAGING_MEDIA is not set
> +CONFIG_STAGING_MEDIA=y
> +CONFIG_DVB_AS102=m
> +CONFIG_EASYCAP=m
> +# CONFIG_EASYCAP_DEBUG is not set
> +# CONFIG_LIRC_STAGING is not set
>  CONFIG_CLKDEV_LOOKUP=y
>  
>  #
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> index 5ab1107..710308f 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -16,7 +16,7 @@ FILESPATH =. "${FILE_DIRNAME}/${PN}-3.2:${FILE_DIRNAME}/${PN}-3.2/${MACHINE}:"
>  
>  BRANCH = "v3.2-staging"
>  SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
> -MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
> +MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
>  
>  COMPATIBLE_MACHINE = "(ti33x)"
>  
> @@ -1222,4 +1222,6 @@ PATCHES_OVER_PSP = " \
>  	file://beaglebone/0059-beaglebone-fix-pin-free-thinko-this-method-doesn-t-g.patch \
>  	file://beaglebone/0060-beaglebone-switch-RS232-cape-to-ttyO2.patch \
>  	file://beaglebone/0061-beaglebone-make-uart2-pinmux-match-the-uart0-pinmux.patch \
> +	file://beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch \
> +	file://beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch \

This patch is again out of order, as I don't have any of the above (0059-0061) -
are those in your personal tree? Are you going to submit those? Or do you want 
me to massage this one out of order?

Also, the M_K_PR went back to "a" for some reason...

-- 
Denys

