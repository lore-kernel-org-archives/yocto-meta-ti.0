Return-Path: <koen@dominion.thruhere.net>
Received: from mail-fx0-f53.google.com (mail-fx0-f53.google.com
	[209.85.161.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96096E00309
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 29 Nov 2011 04:21:41 -0800 (PST)
Received: by faaq2 with SMTP id q2so2293265faa.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 29 Nov 2011 04:21:40 -0800 (PST)
Received: by 10.180.109.106 with SMTP id hr10mr61191450wib.9.1322569297838;
	Tue, 29 Nov 2011 04:21:37 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	ep16sm42594512wbb.21.2011.11.29.04.21.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 04:21:36 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 29 Nov 2011 13:21:32 +0100
In-Reply-To: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
References: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
Message-Id: <60FB59BB-95CE-4953-9800-2D8369FD8876@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/2] u-boot 2011.09: convert beagleboard to SPL build
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
X-List-Received-Date: Tue, 29 Nov 2011 12:21:43 -0000
X-Groupsio-MsgNum: 162
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A3883610-5028-4123-8F38-1E8418052FD2";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A3883610-5028-4123-8F38-1E8418052FD2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Any objections to this series?=20

Op 27 nov. 2011, om 16:03 heeft Koen Kooi het volgende geschreven:

> Runtime tested on an xM rev C
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> ...-probe-DDC-bus-for-expansionboard-EEPROMS.patch |  165 ----------
> ...p3-mem-Comment-enable_gpmc_cs_config-more.patch |   56 ++++
> ...e-SDRC-dram_init-to-always-call-make_cs1_.patch |   66 ++++
> ...-a-helper-function-to-set-timings-in-SDRC.patch |  172 +++++++++++
> ...e-mem_ok-to-clear-again-after-reading-bac.patch |   30 ++
> .../0005-OMAP3-Remove-get_mem_type-prototype.patch |   28 ++
> .../0006-omap3-mem-Add-MCFG-helper-macro.patch     |   97 ++++++
> ...d-optimal-SDRC-autorefresh-control-values.patch |   59 ++++
> ...x-all-Micron-memory-timing-parts-with-the.patch |   55 ++++
> ...ework-memory-initalization-and-devkit8000.patch |  174 +++++++++++
> ...OMAP3-SPL-Add-identify_nand_chip-function.patch |  142 +++++++++
> ...0011-OMAP3-Add-SPL-support-to-Beagleboard.patch |  315 =
+++++++++++++++++++
> .../0012-OMAP3-Add-SPL-support-to-omap3_evm.patch  |  319 =
++++++++++++++++++++
> .../2011.09/0013-AM3517-Add-SPL-support.patch      |  150 +++++++++
> .../0014-AM3517-CraneBoard-Add-SPL-support.patch   |  150 +++++++++
> ...beagleboard-config-disable-cache-for-USB.patch} |   12 +-
> ...6-beagleboard-config-enable-gpio-command.patch} |   10 +-
> ...-some-timeout-durations-for-MMC-and-EHCI.patch} |   14 +-
> ...rd-mount-rootfs-RO-instead-of-RW-at-boot.patch} |   16 +-
> ...eagleBoard-config-Really-switch-to-ttyO2.patch} |   18 +-
> ...leboard-add-support-for-TCT-Beacon-board.patch} |   20 +-
> ...add-support-for-scanning-loop-through-ex.patch} |   26 +-
> recipes-bsp/u-boot/u-boot_2011.09.bb               |   37 ++-
> 23 files changed, 1901 insertions(+), 230 deletions(-)
> delete mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-probe-DDC-bus-for-expan=
sionboard-EEPROMS.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_co=
nfig-more.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0002-OMAP3-Update-SDRC-dram_init-to-alwa=
ys-call-make_cs1_.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0003-OMAP3-Add-a-helper-function-to-set-=
timings-in-SDRC.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0004-OMAP3-Change-mem_ok-to-clear-again-=
after-reading-bac.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0005-OMAP3-Remove-get_mem_type-prototype=
.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0006-omap3-mem-Add-MCFG-helper-macro.pat=
ch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0007-OMAP3-Add-optimal-SDRC-autorefresh-=
control-values.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0008-OMAP3-Suffix-all-Micron-memory-timi=
ng-parts-with-the.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0009-OMAP3-SPL-Rework-memory-initalizati=
on-and-devkit8000.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0010-OMAP3-SPL-Add-identify_nand_chip-fu=
nction.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0011-OMAP3-Add-SPL-support-to-Beagleboar=
d.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0012-OMAP3-Add-SPL-support-to-omap3_evm.=
patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0013-AM3517-Add-SPL-support.patch
> create mode 100644 =
recipes-bsp/u-boot/u-boot/2011.09/0014-AM3517-CraneBoard-Add-SPL-support.p=
atch
> rename =
recipes-bsp/u-boot/u-boot/2011.09/{0001-HACK-beagleboard-config-disable-ca=
che-for-USB.patch =3D> =
0015-HACK-beagleboard-config-disable-cache-for-USB.patch} (75%)
> rename =
recipes-bsp/u-boot/u-boot/2011.09/{0002-beagleboard-config-enable-gpio-com=
mand.patch =3D> 0016-beagleboard-config-enable-gpio-command.patch} (77%)
> rename =
recipes-bsp/u-boot/u-boot/2011.09/{0003-Increased-some-timeout-durations-f=
or-MMC-and-EHCI.patch =3D> =
0017-Increased-some-timeout-durations-for-MMC-and-EHCI.patch} (72%)
> rename =
recipes-bsp/u-boot/u-boot/2011.09/{0003-beagleboard-mount-rootfs-RO-instea=
d-of-RW-at-boot.patch =3D> =
0018-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch} (64%)
> rename =
recipes-bsp/u-boot/u-boot/2011.09/{0002-beagleboard-switch-to-ttyO2.patch =
=3D> 0019-BeagleBoard-config-Really-switch-to-ttyO2.patch} (57%)
> rename =
recipes-bsp/u-boot/u-boot/2011.09/{0001-beagleboard-add-support-for-TCT-Be=
acon-board.patch =3D> =
0020-beagleboard-add-support-for-TCT-Beacon-board.patch} (81%)
> rename =
recipes-bsp/u-boot/u-boot/2011.09/{0001-beagleboard-add-support-for-scanni=
ng-loop-through-ex.patch =3D> =
0021-beagleboard-add-support-for-scanning-loop-through-ex.patch} (83%)
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-probe-DDC-bus-for-exp=
ansionboard-EEPROMS.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-probe-DDC-bus-for-exp=
ansionboard-EEPROMS.patch
> deleted file mode 100644
> index 4155d29..0000000
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-probe-DDC-bus-for-exp=
ansionboard-EEPROMS.patch
> +++ /dev/null
> @@ -1,165 +0,0 @@
> -=46rom 559eb0f547267df0706d283974916b88d6b9fb7d Mon Sep 17 00:00:00 =
2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Sun, 9 Oct 2011 15:55:05 +0200
> -Subject: [PATCH] beagleboard: probe DDC bus for expansionboard =
EEPROMS as well
> -
> -Add beacon support as well, needs to get split into a seperate patch
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> - board/ti/beagle/beagle.c       |   59 =
++++++++++++++++++++++++++++++++++++++++
> - board/ti/beagle/beagle.h       |    7 +++++
> - include/configs/omap3_beagle.h |    7 +++++
> - 3 files changed, 73 insertions(+), 0 deletions(-)
> -
> -diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
> -index 8cdceaf..f4e986c 100644
> ---- a/board/ti/beagle/beagle.c
> -+++ b/board/ti/beagle/beagle.c
> -@@ -57,11 +57,14 @@ extern volatile struct ehci_hcor *hcor;
> - #define TWL4030_I2C_BUS			0
> - #define EXPANSION_EEPROM_I2C_BUS	1
> - #define EXPANSION_EEPROM_I2C_ADDRESS	0x50
> -+#define DVI_EDID_I2C_BUS	2
> -+#define DVI_EDID_I2C_ADDRESS	0x50
> -=20
> - #define TINCANTOOLS_ZIPPY		0x01000100
> - #define TINCANTOOLS_ZIPPY2		0x02000100
> - #define TINCANTOOLS_TRAINER		0x04000100
> - #define TINCANTOOLS_SHOWDOG		0x03000100
> -+#define TINCANTOOLS_BEACON		0x05000100
> - #define KBADC_BEAGLEFPGA		0x01000600
> - #define LW_BEAGLETOUCH			0x01000700
> - #define BRAINMUX_LCDOG			0x01000800
> -@@ -69,6 +72,7 @@ extern volatile struct ehci_hcor *hcor;
> - #define BBTOYS_WIFI			0x01000B00
> - #define BBTOYS_VGA			0x02000B00
> - #define BBTOYS_LCD			0x03000B00
> -+#define BBTOYS_ULCD			0x04000B00
> - #define BEAGLE_NO_EEPROM		0xffffffff
> -=20
> - DECLARE_GLOBAL_DATA_PTR;
> -@@ -82,6 +86,16 @@ static struct {
> - 	char env_setting[64];
> - } expansion_config;
> -=20
> -+static struct {
> -+    unsigned int device_vendor;
> -+    unsigned char revision;
> -+    unsigned char content;
> -+    char fab_revision[8];
> -+    char env_var[16];
> -+    char env_setting[64];
> -+} edid_config;
> -+
> -+
> - /*
> -  * Routine: board_init
> -  * Description: Early hardware init.
> -@@ -165,6 +179,33 @@ unsigned int get_expansion_id(void)
> - }
> -=20
> - /*
> -+ * Routine: get_edid
> -+ * Description: This function checks for expansion board by checking =
I2C
> -+ *      bus 2 for the availability of an EEPROM
> -+ *      returns the device_vendor field from the EEPROM
> -+ *      The content can be either real EDID data or expansionboard =
data.
> -+ *      Only expansionboar data is currently supported
> -+ */
> -+unsigned int get_edid(void)
> -+{
> -+	i2c_set_bus_num(DVI_EDID_I2C_BUS);
> -+
> -+	/* return BEAGLE_NO_EEPROM if eeprom doesn't respond */
> -+	if (i2c_probe(DVI_EDID_I2C_ADDRESS) =3D=3D 1) {
> -+		i2c_set_bus_num(TWL4030_I2C_BUS);
> -+		return BEAGLE_NO_EEPROM;
> -+	}
> -+
> -+	/* read EEPROM data */
> -+	i2c_read(DVI_EDID_I2C_ADDRESS, 0, 1, (u8 *)&edid_config,
> -+		sizeof(edid_config));
> -+
> -+	i2c_set_bus_num(TWL4030_I2C_BUS);
> -+
> -+	return edid_config.device_vendor;
> -+}
> -+
> -+/*
> -  * Configure DSS to display background color on DVID
> -  * Configure VENC to display color bar on S-Video
> -  */
> -@@ -290,6 +331,13 @@ int misc_init_r(void)
> - 		setenv("defaultdisplay", "showdoglcd");
> - 		setenv("buddy", "showdog");
> - 		break;
> -+	case TINCANTOOLS_BEACON:
> -+		printf("Recognized Tincantools Beacon board (rev %d =
%s)\n",
> -+			expansion_config.revision,
> -+			expansion_config.fab_revision);
> -+		MUX_TINCANTOOLS_BEACON();
> -+		setenv("buddy", "beacon");
> -+		break;
> - 	case KBADC_BEAGLEFPGA:
> - 		printf("Recognized KBADC Beagle FPGA board\n");
> - 		MUX_KBADC_BEAGLEFPGA();
> -@@ -331,6 +379,17 @@ int misc_init_r(void)
> - 	if (expansion_config.content =3D=3D 1)
> - 		setenv(expansion_config.env_var, =
expansion_config.env_setting);
> -=20
> -+	switch(get_edid()) {
> -+	case BBTOYS_ULCD:
> -+		printf("Recognized BeagleBoardToys universal LCD board =
on DDC bus\n");
> -+		setenv("edid", "uLCD");
> -+		break;
> -+	default:
> -+		printf("Unrecognized EEPROM content on DDC bus: %x\n",
> -+			edid_config.device_vendor);
> -+		setenv("edid", "unknown");
> -+	}
> -+
> - 	twl4030_power_init();
> - 	switch (get_board_revision()) {
> - 	case REVISION_XM_A:
> -diff --git a/board/ti/beagle/beagle.h b/board/ti/beagle/beagle.h
> -index 18bfaa8..6a9ad73 100644
> ---- a/board/ti/beagle/beagle.h
> -+++ b/board/ti/beagle/beagle.h
> -@@ -456,6 +456,13 @@ const omap3_sysinfo sysinfo =3D {
> - 	MUX_VAL(CP(MCBSP3_CLKX),    (IEN  | PTU | EN  | M4)) =
/*GPIO_141*/\
> - 	MUX_VAL(CP(MCBSP1_CLKX),    (IEN  | PTU | EN  | M4)) =
/*GPIO_162*/
> -=20
> -+#define MUX_TINCANTOOLS_BEACON() \
> -+	MUX_VAL(CP(MMC2_DAT3),      (IEN  | PTU | EN  | M4)) =
/*GPIO_135*/\
> -+	MUX_VAL(CP(MMC2_DAT4),      (IEN  | PTU | EN  | M4)) =
/*GPIO_136*/\
> -+	MUX_VAL(CP(MMC2_DAT5),      (IEN  | PTU | EN  | M4)) =
/*GPIO_137*/\
> -+	MUX_VAL(CP(MMC2_DAT6),      (IEN  | PTU | EN  | M4)) =
/*GPIO_138*/\
> -+	MUX_VAL(CP(MMC2_DAT7),      (IEN  | PTU | EN  | M4)) =
/*GPIO_139*/\
> -+
> - #define MUX_KBADC_BEAGLEFPGA() \
> - 	MUX_VAL(CP(MCBSP1_CLKR),    (IEN  | PTU | DIS | M1)) =
/*MCSPI4_CLK*/\
> - 	MUX_VAL(CP(MCBSP1_DX),      (IDIS | PTU | DIS | M1)) =
/*MCSPI4_SIMO*/\
> -diff --git a/include/configs/omap3_beagle.h =
b/include/configs/omap3_beagle.h
> -index 1369c89..73df658 100644
> ---- a/include/configs/omap3_beagle.h
> -+++ b/include/configs/omap3_beagle.h
> -@@ -219,6 +224,7 @@
> - 	"console=3DttyS2,115200n8\0" \
> - 	"mpurate=3Dauto\0" \
> - 	"buddy=3Dnone "\
> -+	"edid=3Dnone "\
> - 	"optargs=3D\0" \
> - 	"camera=3Dnone\0" \
> - 	"vram=3D12M\0" \
> -@@ -235,6 +241,7 @@
> - 		"${optargs} " \
> - 		"mpurate=3D${mpurate} " \
> - 		"buddy=3D${buddy} "\
> -+		"edid=3D${edid} "\
> - 		"camera=3D${camera} "\
> - 		"vram=3D${vram} " \
> - 		"omapfb.mode=3Ddvi:${dvimode} " \
> ---=20
> -1.6.6.1
> -
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_=
config-more.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_=
config-more.patch
> new file mode 100644
> index 0000000..38da967
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_=
config-more.patch
> @@ -0,0 +1,56 @@
> +=46rom 81630b54970a9274140b1c14caa31da6331a62fa Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:47:58 +0000
> +Subject: [PATCH 01/21] omap3: mem: Comment enable_gpmc_cs_config more
> +
> +Expand the "enable the config" comment to explain what the bit shifts
> +are and define out two of the magic numbers.
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/cpu/armv7/omap3/mem.c        |   12 +++++++++---
> + arch/arm/include/asm/arch-omap3/mem.h |    4 ++++
> + 2 files changed, 13 insertions(+), 3 deletions(-)
> +
> +diff --git a/arch/arm/cpu/armv7/omap3/mem.c =
b/arch/arm/cpu/armv7/omap3/mem.c
> +index a01c303..2f1efea 100644
> +--- a/arch/arm/cpu/armv7/omap3/mem.c
> ++++ b/arch/arm/cpu/armv7/omap3/mem.c
> +@@ -105,9 +105,15 @@ void enable_gpmc_cs_config(const u32 =
*gpmc_config, struct gpmc_cs *cs, u32 base,
> + 	writel(gpmc_config[3], &cs->config4);
> + 	writel(gpmc_config[4], &cs->config5);
> + 	writel(gpmc_config[5], &cs->config6);
> +-	/* Enable the config */
> +-	writel((((size & 0xF) << 8) | ((base >> 24) & 0x3F) |
> +-		(1 << 6)), &cs->config7);
> ++
> ++	/*
> ++	 * Enable the config.  size is the CS size and goes in
> ++	 * bits 11:8.  We set bit 6 to enable this CS and the base
> ++	 * address goes into bits 5:0.
> ++	 */
> ++	 writel((size << 8) | (GPMC_CS_ENABLE << 6) |
> ++				 ((base >> 24) & GPMC_BASEADDR_MASK),
> ++				 &cs->config7);
> + 	sdelay(2000);
> + }
> +=20
> +diff --git a/arch/arm/include/asm/arch-omap3/mem.h =
b/arch/arm/include/asm/arch-omap3/mem.h
> +index db6a696..abf4e82 100644
> +--- a/arch/arm/include/asm/arch-omap3/mem.h
> ++++ b/arch/arm/include/asm/arch-omap3/mem.h
> +@@ -259,6 +259,10 @@ enum {
> + #define GPMC_SIZE_32M	0xE
> + #define GPMC_SIZE_16M	0xF
> +=20
> ++#define GPMC_BASEADDR_MASK	0x3F
> ++
> ++#define GPMC_CS_ENABLE		0x1
> ++
> + #define SMNAND_GPMC_CONFIG1	0x00000800
> + #define SMNAND_GPMC_CONFIG2	0x00141400
> + #define SMNAND_GPMC_CONFIG3	0x00141400
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0002-OMAP3-Update-SDRC-dram_init-to-al=
ways-call-make_cs1_.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0002-OMAP3-Update-SDRC-dram_init-to-al=
ways-call-make_cs1_.patch
> new file mode 100644
> index 0000000..cb12873
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0002-OMAP3-Update-SDRC-dram_init-to-al=
ways-call-make_cs1_.patch
> @@ -0,0 +1,66 @@
> +=46rom 42db3ebdd76628017e7ab83752e9b288ec4f26a0 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:47:59 +0000
> +Subject: [PATCH 02/21] OMAP3: Update SDRC dram_init to always call =
make_cs1_contiguous()
> +
> +We update the comment in make_cs1_contiguous() to be a little bit
> +more clear (it's been copy/pasted from other silicons) and then
> +explain in dram_init() why we need to always try this.
> +
> +Note that in the previous behavior we were always calling this on
> +boards that never had cs1 populated anyhow so making sure we do
> +this always is fine and will correct things like omap3evm detecting
> +an invalid amount of memory (384MB).
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/cpu/armv7/omap3/sdrc.c |   23 +++++++++++------------
> + 1 files changed, 11 insertions(+), 12 deletions(-)
> +
> +diff --git a/arch/arm/cpu/armv7/omap3/sdrc.c =
b/arch/arm/cpu/armv7/omap3/sdrc.c
> +index 0dd1955..66ce33f 100644
> +--- a/arch/arm/cpu/armv7/omap3/sdrc.c
> ++++ b/arch/arm/cpu/armv7/omap3/sdrc.c
> +@@ -58,10 +58,9 @@ u32 is_mem_sdr(void)
> +=20
> + /*
> +  * make_cs1_contiguous -
> +- *  - For es2 and above remap cs1 behind cs0 to allow command line
> +- *    mem=3Dxyz use all memory with out discontinuous support =
compiled in.
> +- *    Could do it at the ATAG, but there really is two banks...
> +- *  - Called as part of 2nd phase DDR init.
> ++ * - When we have CS1 populated we want to have it mapped after cs0 =
to allow
> ++ *   command line mem=3Dxyz use all memory with out discontinuous =
support
> ++ *   compiled in.  We could do it in the ATAG, but there really is =
two banks...
> +  */
> + void make_cs1_contiguous(void)
> + {
> +@@ -207,16 +206,16 @@ int dram_init(void)
> +=20
> + 	size0 =3D get_sdr_cs_size(CS0);
> + 	/*
> +-	 * If a second bank of DDR is attached to CS1 this is
> +-	 * where it can be started.  Early init code will init
> +-	 * memory on CS0.
> ++	 * We always need to have cs_cfg point at where the second
> ++	 * bank would be, if present.  Failure to do so can lead to
> ++	 * strange situations where memory isn't detected and
> ++	 * configured correctly.  CS0 will already have been setup
> ++	 * at this point.
> + 	 */
> +-	if ((sysinfo.mtype =3D=3D DDR_COMBO) || (sysinfo.mtype =3D=3D =
DDR_STACKED)) {
> +-		do_sdrc_init(CS1, NOT_EARLY);
> +-		make_cs1_contiguous();
> ++	make_cs1_contiguous();
> ++	do_sdrc_init(CS1, NOT_EARLY);
> ++	size1 =3D get_sdr_cs_size(CS1);
> +=20
> +-		size1 =3D get_sdr_cs_size(CS1);
> +-	}
> + 	gd->ram_size =3D size0 + size1;
> +=20
> + 	return 0;
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0003-OMAP3-Add-a-helper-function-to-se=
t-timings-in-SDRC.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0003-OMAP3-Add-a-helper-function-to-se=
t-timings-in-SDRC.patch
> new file mode 100644
> index 0000000..71e49af
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0003-OMAP3-Add-a-helper-function-to-se=
t-timings-in-SDRC.patch
> @@ -0,0 +1,172 @@
> +=46rom a186210c5003db4df2a4f97bd6d4cb2dc616a591 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:00 +0000
> +Subject: [PATCH 03/21] OMAP3: Add a helper function to set timings in =
SDRC
> +
> +Since we go through the sequence to setup the SDRC timings more than
> +once, break this logic out into its own function and have that =
function
> +call mem_ok() to make sure the memory is usable.
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/cpu/armv7/omap3/sdrc.c |  116 =
++++++++++++++++++++------------------
> + 1 files changed, 61 insertions(+), 55 deletions(-)
> +
> +diff --git a/arch/arm/cpu/armv7/omap3/sdrc.c =
b/arch/arm/cpu/armv7/omap3/sdrc.c
> +index 66ce33f..2756024 100644
> +--- a/arch/arm/cpu/armv7/omap3/sdrc.c
> ++++ b/arch/arm/cpu/armv7/omap3/sdrc.c
> +@@ -108,14 +108,45 @@ u32 get_sdr_cs_offset(u32 cs)
> + }
> +=20
> + /*
> ++ * write_sdrc_timings -
> ++ *  - Takes CS and associated timings and initalize SDRAM
> ++ *  - Test CS to make sure it's OK for use
> ++ */
> ++static void write_sdrc_timings(u32 cs, struct sdrc_actim =
*sdrc_actim_base,
> ++		u32 mcfg, u32 ctrla, u32 ctrlb, u32 rfr_ctrl, u32 mr)
> ++{
> ++	/* Setup timings we got from the board. */
> ++	writel(mcfg, &sdrc_base->cs[cs].mcfg);
> ++	writel(ctrla, &sdrc_actim_base->ctrla);
> ++	writel(ctrlb, &sdrc_actim_base->ctrlb);
> ++	writel(rfr_ctrl, &sdrc_base->cs[cs].rfr_ctrl);
> ++	writel(CMD_NOP, &sdrc_base->cs[cs].manual);
> ++	writel(CMD_PRECHARGE, &sdrc_base->cs[cs].manual);
> ++	writel(CMD_AUTOREFRESH, &sdrc_base->cs[cs].manual);
> ++	writel(CMD_AUTOREFRESH, &sdrc_base->cs[cs].manual);
> ++	writel(mr, &sdrc_base->cs[cs].mr);
> ++
> ++	/*
> ++	 * Test ram in this bank
> ++	 * Disable if bad or not present
> ++	 */
> ++	if (!mem_ok(cs))
> ++		writel(0, &sdrc_base->cs[cs].mcfg);
> ++}
> ++
> ++/*
> +  * do_sdrc_init -
> +- *  - Initialize the SDRAM for use.
> +- *  - code called once in C-Stack only context for CS0 and a =
possible 2nd
> +- *    time depending on memory configuration from stack+global =
context
> ++ *  - Code called once in C-Stack only context for CS0 and with =
early being
> ++ *    true and a possible 2nd time depending on memory configuration =
from
> ++ *    stack+global context.
> +  */
> + void do_sdrc_init(u32 cs, u32 early)
> + {
> + 	struct sdrc_actim *sdrc_actim_base0, *sdrc_actim_base1;
> ++	u32 mcfg, ctrla, ctrlb, rfr_ctrl, mr;
> ++
> ++	sdrc_actim_base0 =3D (struct sdrc_actim *)SDRC_ACTIM_CTRL0_BASE;
> ++	sdrc_actim_base1 =3D (struct sdrc_actim *)SDRC_ACTIM_CTRL1_BASE;
> +=20
> + 	if (early) {
> + 		/* reset sdrc controller */
> +@@ -127,73 +158,48 @@ void do_sdrc_init(u32 cs, u32 early)
> + 		/* setup sdrc to ball mux */
> + 		writel(SDRC_SHARING, &sdrc_base->sharing);
> +=20
> +-		/* Disable Power Down of CKE cuz of 1 CKE on combo part =
*/
> ++		/* Disable Power Down of CKE because of 1 CKE on combo =
part */
> + 		writel(WAKEUPPROC | SRFRONRESET | PAGEPOLICY_HIGH,
> + 				&sdrc_base->power);
> +=20
> + 		writel(ENADLL | DLLPHASE_90, &sdrc_base->dlla_ctrl);
> + 		sdelay(0x20000);
> +-	}
> +-
> + /* As long as V_MCFG and V_RFR_CTRL is not defined for all OMAP3 =
boards we need
> +  * to prevent this to be build in non-SPL build */
> + #ifdef CONFIG_SPL_BUILD
> +-	/* If we use a SPL there is no x-loader nor config header so we =
have
> +-	 * to do the job ourselfs
> +-	 */
> +-	if (cs =3D=3D CS0) {
> +-		sdrc_actim_base0 =3D (struct sdrc_actim =
*)SDRC_ACTIM_CTRL0_BASE;
> +-
> +-		/* General SDRC config */
> +-		writel(V_MCFG, &sdrc_base->cs[cs].mcfg);
> +-		writel(V_RFR_CTRL, &sdrc_base->cs[cs].rfr_ctrl);
> +-
> +-		/* AC timings */
> +-		writel(V_ACTIMA_165, &sdrc_actim_base0->ctrla);
> +-		writel(V_ACTIMB_165, &sdrc_actim_base0->ctrlb);
> +-
> +-		/* Initialize */
> +-		writel(CMD_NOP, &sdrc_base->cs[cs].manual);
> +-		writel(CMD_PRECHARGE, &sdrc_base->cs[cs].manual);
> +-		writel(CMD_AUTOREFRESH, &sdrc_base->cs[cs].manual);
> +-		writel(CMD_AUTOREFRESH, &sdrc_base->cs[cs].manual);
> ++		/*
> ++		 * If we use a SPL there is no x-loader nor config =
header so
> ++		 * we have to do the job ourselfs
> ++		 */
> ++
> ++		mcfg =3D V_MCFG;
> ++		ctrla =3D V_ACTIMA_165;
> ++		ctrlb =3D V_ACTIMB_165;
> ++		rfr_ctrl =3D V_RFR_CTRL;
> ++		mr =3D V_MR;
> ++
> ++		write_sdrc_timings(CS0, sdrc_actim_base0, mcfg, ctrla, =
ctrlb,
> ++				rfr_ctrl, mr);
> ++#endif
> +=20
> +-		writel(V_MR, &sdrc_base->cs[cs].mr);
> + 	}
> +-#endif
> +=20
> + 	/*
> +-	 * SDRC timings are set up by x-load or config header
> +-	 * We don't need to redo them here.
> +-	 * Older x-loads configure only CS0
> +-	 * configure CS1 to handle this ommission
> ++	 * If we aren't using SPL we have been loaded by some
> ++	 * other means which may not have correctly initialized
> ++	 * both CS0 and CS1 (such as some older versions of x-loader)
> ++	 * so we may be asked now to setup CS1.
> + 	 */
> + 	if (cs =3D=3D CS1) {
> +-		sdrc_actim_base0 =3D (struct sdrc_actim =
*)SDRC_ACTIM_CTRL0_BASE;
> +-		sdrc_actim_base1 =3D (struct sdrc_actim =
*)SDRC_ACTIM_CTRL1_BASE;
> +-		writel(readl(&sdrc_base->cs[CS0].mcfg),
> +-			&sdrc_base->cs[CS1].mcfg);
> +-		writel(readl(&sdrc_base->cs[CS0].rfr_ctrl),
> +-			&sdrc_base->cs[CS1].rfr_ctrl);
> +-		writel(readl(&sdrc_actim_base0->ctrla),
> +-			&sdrc_actim_base1->ctrla);
> +-		writel(readl(&sdrc_actim_base0->ctrlb),
> +-			&sdrc_actim_base1->ctrlb);
> +-
> +-		writel(CMD_NOP, &sdrc_base->cs[cs].manual);
> +-		writel(CMD_PRECHARGE, &sdrc_base->cs[cs].manual);
> +-		writel(CMD_AUTOREFRESH, &sdrc_base->cs[cs].manual);
> +-		writel(CMD_AUTOREFRESH, &sdrc_base->cs[cs].manual);
> +-		writel(readl(&sdrc_base->cs[CS0].mr),
> +-			&sdrc_base->cs[CS1].mr);
> +-	}
> ++		mcfg =3D readl(&sdrc_base->cs[CS0].mcfg),
> ++		rfr_ctrl =3D readl(&sdrc_base->cs[CS0].rfr_ctrl);
> ++		ctrla =3D readl(&sdrc_actim_base0->ctrla),
> ++		ctrlb =3D readl(&sdrc_actim_base0->ctrlb);
> ++		mr =3D readl(&sdrc_base->cs[CS0].mr);
> ++		write_sdrc_timings(cs, sdrc_actim_base1, mcfg, ctrla, =
ctrlb,
> ++				rfr_ctrl, mr);
> +=20
> +-	/*
> +-	 * Test ram in this bank
> +-	 * Disable if bad or not present
> +-	 */
> +-	if (!mem_ok(cs))
> +-		writel(0, &sdrc_base->cs[cs].mcfg);
> ++	}
> + }
> +=20
> + /*
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0004-OMAP3-Change-mem_ok-to-clear-agai=
n-after-reading-bac.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0004-OMAP3-Change-mem_ok-to-clear-agai=
n-after-reading-bac.patch
> new file mode 100644
> index 0000000..30d912c
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0004-OMAP3-Change-mem_ok-to-clear-agai=
n-after-reading-bac.patch
> @@ -0,0 +1,30 @@
> +=46rom 0cf0d611823f6e1f3b63f9233c145a3940a89694 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:01 +0000
> +Subject: [PATCH 04/21] OMAP3: Change mem_ok to clear again after =
reading back
> +
> +It's possible to need to call this function on the same banks =
multiple
> +times so we want to be sure that 'pos A' is cleared out again at the
> +end.
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/cpu/armv7/omap3/mem.c |    1 +
> + 1 files changed, 1 insertions(+), 0 deletions(-)
> +
> +diff --git a/arch/arm/cpu/armv7/omap3/mem.c =
b/arch/arm/cpu/armv7/omap3/mem.c
> +index 2f1efea..2fe5ac7 100644
> +--- a/arch/arm/cpu/armv7/omap3/mem.c
> ++++ b/arch/arm/cpu/armv7/omap3/mem.c
> +@@ -86,6 +86,7 @@ u32 mem_ok(u32 cs)
> + 	writel(0x0, addr + 4);		/* remove pattern off the bus */
> + 	val1 =3D readl(addr + 0x400);	/* get pos A value */
> + 	val2 =3D readl(addr);		/* get val2 */
> ++	writel(0x0, addr + 0x400);	/* clear pos A */
> +=20
> + 	if ((val1 !=3D 0) || (val2 !=3D pattern))	/* see if pos A =
val changed */
> + 		return 0;
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0005-OMAP3-Remove-get_mem_type-prototy=
pe.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0005-OMAP3-Remove-get_mem_type-prototy=
pe.patch
> new file mode 100644
> index 0000000..ec1b5f7
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0005-OMAP3-Remove-get_mem_type-prototy=
pe.patch
> @@ -0,0 +1,28 @@
> +=46rom 45ccdf2ba3aa6e5f258c463691c85ac4529246e6 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:02 +0000
> +Subject: [PATCH 05/21] OMAP3: Remove get_mem_type prototype
> +
> +This function doesn't exist for omap3
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/include/asm/arch-omap3/sys_proto.h |    1 -
> + 1 files changed, 0 insertions(+), 1 deletions(-)
> +
> +diff --git a/arch/arm/include/asm/arch-omap3/sys_proto.h =
b/arch/arm/include/asm/arch-omap3/sys_proto.h
> +index 995e7cb..9e64410 100644
> +--- a/arch/arm/include/asm/arch-omap3/sys_proto.h
> ++++ b/arch/arm/include/asm/arch-omap3/sys_proto.h
> +@@ -49,7 +49,6 @@ void set_muxconf_regs(void);
> + u32 get_cpu_family(void);
> + u32 get_cpu_rev(void);
> + u32 get_sku_id(void);
> +-u32 get_mem_type(void);
> + u32 get_sysboot_value(void);
> + u32 is_gpmc_muxed(void);
> + u32 get_gpmc0_type(void);
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0006-omap3-mem-Add-MCFG-helper-macro.p=
atch =
b/recipes-bsp/u-boot/u-boot/2011.09/0006-omap3-mem-Add-MCFG-helper-macro.p=
atch
> new file mode 100644
> index 0000000..475febf
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0006-omap3-mem-Add-MCFG-helper-macro.p=
atch
> @@ -0,0 +1,97 @@
> +=46rom bd50b147ff61a5203815296eac726b0a244c3cb2 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:03 +0000
> +Subject: [PATCH 06/21] omap3: mem: Add MCFG helper macro
> +
> +This adds an MCFG macro to calculate the correct value, similar to
> +the ACTIMA/ACTIMB macros and adds a comment that all of the potential
> +values here are documented in the TRM.  Then we convert the Micron
> +value to use this macro.
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/include/asm/arch-omap3/mem.h |   46 =
+++++++++++++++++++++-----------
> + 1 files changed, 30 insertions(+), 16 deletions(-)
> +
> +diff --git a/arch/arm/include/asm/arch-omap3/mem.h =
b/arch/arm/include/asm/arch-omap3/mem.h
> +index abf4e82..12ff3b0 100644
> +--- a/arch/arm/include/asm/arch-omap3/mem.h
> ++++ b/arch/arm/include/asm/arch-omap3/mem.h
> +@@ -39,6 +39,12 @@ enum {
> +=20
> + #define EARLY_INIT	1
> +=20
> ++/*
> ++ * For a full explanation of these registers and values please see
> ++ * the Technical Reference Manual (TRM) for any of the processors in
> ++ * this family.
> ++ */
> ++
> + /* Slower full frequency range default timings for x32 operation*/
> + #define SDRC_SHARING	0x00000100
> + #define SDRC_MR_0_SDR	0x00000031
> +@@ -86,6 +92,27 @@ enum {
> + 		ACTIM_CTRLB_TXP(b)	|	\
> + 		ACTIM_CTRLB_TXSR(d)
> +=20
> ++/*
> ++ * Values used in the MCFG register.  Only values we use today
> ++ * are defined and the rest can be found in the TRM.  Unless =
otherwise
> ++ * noted all fields are one bit.
> ++ */
> ++#define V_MCFG_RAMTYPE_DDR		(0x1)
> ++#define V_MCFG_DEEPPD_EN		(0x1 << 3)
> ++#define V_MCFG_B32NOT16_32		(0x1 << 4)
> ++#define V_MCFG_BANKALLOCATION_RBC	(0x2 << 6)	/* 6:7 */
> ++#define V_MCFG_RAMSIZE(a)		((((a)/(1024*1024))/2) << 8) /* =
8:17 */
> ++#define V_MCFG_ADDRMUXLEGACY_FLEX	(0x1 << 19)
> ++#define V_MCFG_CASWIDTH_10B		(0x5 << 20)	/* 20:22 */
> ++#define V_MCFG_RASWIDTH(a)		((a) << 24)	/* 24:26 */
> ++
> ++/* Macro to construct MCFG */
> ++#define MCFG(a, b)						\
> ++		V_MCFG_RASWIDTH(b) | V_MCFG_CASWIDTH_10B |	\
> ++		V_MCFG_ADDRMUXLEGACY_FLEX | V_MCFG_RAMSIZE(a) |	\
> ++		V_MCFG_BANKALLOCATION_RBC |			\
> ++		V_MCFG_B32NOT16_32 | V_MCFG_DEEPPD_EN | =
V_MCFG_RAMTYPE_DDR
> ++
> + /* Infineon part of 3430SDP (165MHz optimized) 6.06ns */
> + #define INFINEON_TDAL_165	6	/* Twr/Tck + Trp/tck		=
*/
> + 					/* 15/6 + 18/6 =3D 5.5 -> 6	=
*/
> +@@ -138,21 +165,8 @@ enum {
> + 		ACTIM_CTRLB(MICRON_TWTR_165, MICRON_TCKE_165,	\
> + 				MICRON_TXP_165,	MICRON_XSR_165)
> +=20
> +-#define MICRON_RAMTYPE			0x1
> +-#define MICRON_DDRTYPE			0x0
> +-#define MICRON_DEEPPD			0x1
> +-#define MICRON_B32NOT16			0x1
> +-#define MICRON_BANKALLOCATION	0x2
> +-#define MICRON_RAMSIZE			=
((PHYS_SDRAM_1_SIZE/(1024*1024))/2)
> +-#define MICRON_ADDRMUXLEGACY	0x1
> +-#define MICRON_CASWIDTH			0x5
> +-#define MICRON_RASWIDTH			0x2
> +-#define MICRON_LOCKSTATUS		0x0
> +-#define MICRON_V_MCFG ((MICRON_LOCKSTATUS << 30) | (MICRON_RASWIDTH =
<< 24) | \
> +-	(MICRON_CASWIDTH << 20) | (MICRON_ADDRMUXLEGACY << 19) | \
> +-	(MICRON_RAMSIZE << 8) | (MICRON_BANKALLOCATION << 6) | \
> +-	(MICRON_B32NOT16 << 4) | (MICRON_DEEPPD << 3) | \
> +-	(MICRON_DDRTYPE << 2) | (MICRON_RAMTYPE))
> ++#define MICRON_RASWIDTH		0x2
> ++#define MICRON_V_MCFG(size)	MCFG((size), MICRON_RASWIDTH)
> +=20
> + #define MICRON_ARCV				2030
> + #define MICRON_ARE				0x1
> +@@ -199,7 +213,7 @@ enum {
> + #ifdef CONFIG_OMAP3_MICRON_DDR
> + #define V_ACTIMA_165		MICRON_V_ACTIMA_165
> + #define V_ACTIMB_165		MICRON_V_ACTIMB_165
> +-#define V_MCFG			MICRON_V_MCFG
> ++#define V_MCFG			MICRON_V_MCFG(PHYS_SDRAM_1_SIZE)
> + #define V_RFR_CTRL		MICRON_V_RFR_CTRL
> + #define V_MR			MICRON_V_MR
> + #endif
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0007-OMAP3-Add-optimal-SDRC-autorefres=
h-control-values.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0007-OMAP3-Add-optimal-SDRC-autorefres=
h-control-values.patch
> new file mode 100644
> index 0000000..2024094
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0007-OMAP3-Add-optimal-SDRC-autorefres=
h-control-values.patch
> @@ -0,0 +1,59 @@
> +=46rom 67ea79f7a99d7168915a5db8a577814ec501774e Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:04 +0000
> +Subject: [PATCH 07/21] OMAP3: Add optimal SDRC autorefresh control =
values
> +
> +This adds the optimal SDRC autorefresh control register values for
> +100Mhz, 133MHz, 165MHz and 200MHz clocks.  We switch to using this
> +to provide the default 165MHz value.
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/include/asm/arch-omap3/mem.h |   16 +++++++++++-----
> + 1 files changed, 11 insertions(+), 5 deletions(-)
> +
> +diff --git a/arch/arm/include/asm/arch-omap3/mem.h =
b/arch/arm/include/asm/arch-omap3/mem.h
> +index 12ff3b0..912c737 100644
> +--- a/arch/arm/include/asm/arch-omap3/mem.h
> ++++ b/arch/arm/include/asm/arch-omap3/mem.h
> +@@ -49,6 +49,16 @@ enum {
> + #define SDRC_SHARING	0x00000100
> + #define SDRC_MR_0_SDR	0x00000031
> +=20
> ++/*
> ++ * SDRC autorefresh control values.  This register consists of =
autorefresh
> ++ * enable at bits 0:1 and an autorefresh counter value in bits 8:23. =
 The
> ++ * counter is a result of ( tREFI / tCK ) - 50.
> ++ */
> ++#define SDP_3430_SDRC_RFR_CTRL_100MHz	0x0002da01
> ++#define SDP_3430_SDRC_RFR_CTRL_133MHz	0x0003de01 /* =
7.8us/7.5ns - 50=3D0x3de */
> ++#define SDP_3430_SDRC_RFR_CTRL_165MHz	0x0004e201 /* 7.8us/6ns =
- 50=3D0x4e2 */
> ++#define SDP_3430_SDRC_RFR_CTRL_200MHz	0x0005e601 /* 7.8us/5ns =
- 50=3D0x5e6 */
> ++
> + #define DLL_OFFSET		0
> + #define DLL_WRITEDDRCLKX2DIS	1
> + #define DLL_ENADLL		1
> +@@ -168,10 +178,6 @@ enum {
> + #define MICRON_RASWIDTH		0x2
> + #define MICRON_V_MCFG(size)	MCFG((size), MICRON_RASWIDTH)
> +=20
> +-#define MICRON_ARCV				2030
> +-#define MICRON_ARE				0x1
> +-#define MICRON_V_RFR_CTRL ((MICRON_ARCV << 8) | (MICRON_ARE))
> +-
> + #define MICRON_BL				0x2
> + #define MICRON_SIL				0x0
> + #define MICRON_CASL				0x3
> +@@ -214,7 +220,7 @@ enum {
> + #define V_ACTIMA_165		MICRON_V_ACTIMA_165
> + #define V_ACTIMB_165		MICRON_V_ACTIMB_165
> + #define V_MCFG			MICRON_V_MCFG(PHYS_SDRAM_1_SIZE)
> +-#define V_RFR_CTRL		MICRON_V_RFR_CTRL
> ++#define V_RFR_CTRL		SDP_3430_SDRC_RFR_CTRL_165MHz
> + #define V_MR			MICRON_V_MR
> + #endif
> +=20
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0008-OMAP3-Suffix-all-Micron-memory-ti=
ming-parts-with-the.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0008-OMAP3-Suffix-all-Micron-memory-ti=
ming-parts-with-the.patch
> new file mode 100644
> index 0000000..79f4efb
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0008-OMAP3-Suffix-all-Micron-memory-ti=
ming-parts-with-the.patch
> @@ -0,0 +1,55 @@
> +=46rom 0e9f4ab3cafdc1de638ab7a603a750acd4688967 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:05 +0000
> +Subject: [PATCH 08/21] OMAP3: Suffix all Micron memory timing parts =
with their speed
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/include/asm/arch-omap3/mem.h |   21 +++++++++++----------
> + 1 files changed, 11 insertions(+), 10 deletions(-)
> +
> +diff --git a/arch/arm/include/asm/arch-omap3/mem.h =
b/arch/arm/include/asm/arch-omap3/mem.h
> +index 912c737..4f996d9 100644
> +--- a/arch/arm/include/asm/arch-omap3/mem.h
> ++++ b/arch/arm/include/asm/arch-omap3/mem.h
> +@@ -175,15 +175,16 @@ enum {
> + 		ACTIM_CTRLB(MICRON_TWTR_165, MICRON_TCKE_165,	\
> + 				MICRON_TXP_165,	MICRON_XSR_165)
> +=20
> +-#define MICRON_RASWIDTH		0x2
> +-#define MICRON_V_MCFG(size)	MCFG((size), MICRON_RASWIDTH)
> ++#define MICRON_RASWIDTH_165	0x2
> ++#define MICRON_V_MCFG_165(size)	MCFG((size), =
MICRON_RASWIDTH_165)
> +=20
> +-#define MICRON_BL				0x2
> +-#define MICRON_SIL				0x0
> +-#define MICRON_CASL				0x3
> +-#define MICRON_WBST				0x0
> +-#define MICRON_V_MR ((MICRON_WBST << 9) | (MICRON_CASL << 4) | \
> +-	(MICRON_SIL << 3) | (MICRON_BL))
> ++#define MICRON_BL_165			0x2
> ++#define MICRON_SIL_165			0x0
> ++#define MICRON_CASL_165			0x3
> ++#define MICRON_WBST_165			0x0
> ++#define MICRON_V_MR_165			((MICRON_WBST_165 << 9) =
| \
> ++		(MICRON_CASL_165 << 4) | (MICRON_SIL_165 << 3) | \
> ++		(MICRON_BL_165))
> +=20
> + /* NUMONYX part of IGEP v2 (165MHz optimized) 6.06ns */
> + #define NUMONYX_TDAL_165	6	/* Twr/Tck + Trp/tck		=
*/
> +@@ -219,9 +220,9 @@ enum {
> + #ifdef CONFIG_OMAP3_MICRON_DDR
> + #define V_ACTIMA_165		MICRON_V_ACTIMA_165
> + #define V_ACTIMB_165		MICRON_V_ACTIMB_165
> +-#define V_MCFG			MICRON_V_MCFG(PHYS_SDRAM_1_SIZE)
> ++#define V_MCFG			=
MICRON_V_MCFG_165(PHYS_SDRAM_1_SIZE)
> + #define V_RFR_CTRL		SDP_3430_SDRC_RFR_CTRL_165MHz
> +-#define V_MR			MICRON_V_MR
> ++#define V_MR			MICRON_V_MR_165
> + #endif
> +=20
> + #ifdef CONFIG_OMAP3_NUMONYX_DDR
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0009-OMAP3-SPL-Rework-memory-initaliza=
tion-and-devkit8000.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0009-OMAP3-SPL-Rework-memory-initaliza=
tion-and-devkit8000.patch
> new file mode 100644
> index 0000000..7c12e7a
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0009-OMAP3-SPL-Rework-memory-initaliza=
tion-and-devkit8000.patch
> @@ -0,0 +1,174 @@
> +=46rom bf66bbd9347874b6ad13f7747288327e968022d2 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:06 +0000
> +Subject: [PATCH 09/21] OMAP3 SPL: Rework memory initalization and =
devkit8000 support
> +
> +This changes to making the board be responsible for providing the
> +memory initialization timings in SPL and converts the devkit8000
> +to this framework.  In SPL we try and initialize both CS0 and CS1.
> +
> +Cc: Frederik Kriewitz <frederik@kriewitz.eu>
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/cpu/armv7/omap3/sdrc.c             |   28 =
++++++++++++++------------
> + arch/arm/include/asm/arch-omap3/mem.h       |   26 =
-------------------------
> + arch/arm/include/asm/arch-omap3/sys_proto.h |    2 +
> + board/timll/devkit8000/devkit8000.c         |   21 =
++++++++++++++++++++
> + include/configs/devkit8000.h                |    5 ----
> + 5 files changed, 38 insertions(+), 44 deletions(-)
> +
> +diff --git a/arch/arm/cpu/armv7/omap3/sdrc.c =
b/arch/arm/cpu/armv7/omap3/sdrc.c
> +index 2756024..a27b4b1 100644
> +--- a/arch/arm/cpu/armv7/omap3/sdrc.c
> ++++ b/arch/arm/cpu/armv7/omap3/sdrc.c
> +@@ -148,6 +148,18 @@ void do_sdrc_init(u32 cs, u32 early)
> + 	sdrc_actim_base0 =3D (struct sdrc_actim *)SDRC_ACTIM_CTRL0_BASE;
> + 	sdrc_actim_base1 =3D (struct sdrc_actim *)SDRC_ACTIM_CTRL1_BASE;
> +=20
> ++	/*
> ++	 * When called in the early context this may be SPL and we will
> ++	 * need to set all of the timings.  This ends up being board
> ++	 * specific so we call a helper function to take care of this
> ++	 * for us.  Otherwise, to be safe, we need to copy the settings
> ++	 * from the first bank to the second.  We will setup CS0,
> ++	 * then set cs_cfg to the appropriate value then try and
> ++	 * setup CS1.
> ++	 */
> ++#ifdef CONFIG_SPL_BUILD
> ++	get_board_mem_timings(&mcfg, &ctrla, &ctrlb, &rfr_ctrl, &mr);
> ++#endif
> + 	if (early) {
> + 		/* reset sdrc controller */
> + 		writel(SOFTRESET, &sdrc_base->sysconfig);
> +@@ -164,22 +176,12 @@ void do_sdrc_init(u32 cs, u32 early)
> +=20
> + 		writel(ENADLL | DLLPHASE_90, &sdrc_base->dlla_ctrl);
> + 		sdelay(0x20000);
> +-/* As long as V_MCFG and V_RFR_CTRL is not defined for all OMAP3 =
boards we need
> +- * to prevent this to be build in non-SPL build */
> + #ifdef CONFIG_SPL_BUILD
> +-		/*
> +-		 * If we use a SPL there is no x-loader nor config =
header so
> +-		 * we have to do the job ourselfs
> +-		 */
> +-
> +-		mcfg =3D V_MCFG;
> +-		ctrla =3D V_ACTIMA_165;
> +-		ctrlb =3D V_ACTIMB_165;
> +-		rfr_ctrl =3D V_RFR_CTRL;
> +-		mr =3D V_MR;
> +-
> + 		write_sdrc_timings(CS0, sdrc_actim_base0, mcfg, ctrla, =
ctrlb,
> + 				rfr_ctrl, mr);
> ++		make_cs1_contiguous();
> ++		write_sdrc_timings(CS0, sdrc_actim_base1, mcfg, ctrla, =
ctrlb,
> ++				rfr_ctrl, mr);
> + #endif
> +=20
> + 	}
> +diff --git a/arch/arm/include/asm/arch-omap3/mem.h =
b/arch/arm/include/asm/arch-omap3/mem.h
> +index 4f996d9..09f5872 100644
> +--- a/arch/arm/include/asm/arch-omap3/mem.h
> ++++ b/arch/arm/include/asm/arch-omap3/mem.h
> +@@ -212,32 +212,6 @@ enum {
> + 		ACTIM_CTRLB(NUMONYX_TWTR_165, NUMONYX_TCKE_165,	\
> + 				NUMONYX_TXP_165, NUMONYX_XSR_165)
> +=20
> +-#ifdef CONFIG_OMAP3_INFINEON_DDR
> +-#define V_ACTIMA_165		INFINEON_V_ACTIMA_165
> +-#define V_ACTIMB_165		INFINEON_V_ACTIMB_165
> +-#endif
> +-
> +-#ifdef CONFIG_OMAP3_MICRON_DDR
> +-#define V_ACTIMA_165		MICRON_V_ACTIMA_165
> +-#define V_ACTIMB_165		MICRON_V_ACTIMB_165
> +-#define V_MCFG			=
MICRON_V_MCFG_165(PHYS_SDRAM_1_SIZE)
> +-#define V_RFR_CTRL		SDP_3430_SDRC_RFR_CTRL_165MHz
> +-#define V_MR			MICRON_V_MR_165
> +-#endif
> +-
> +-#ifdef CONFIG_OMAP3_NUMONYX_DDR
> +-#define V_ACTIMA_165		NUMONYX_V_ACTIMA_165
> +-#define V_ACTIMB_165		NUMONYX_V_ACTIMB_165
> +-#endif
> +-
> +-#if !defined(V_ACTIMA_165) || !defined(V_ACTIMB_165)
> +-#error "Please choose the right DDR type in config header"
> +-#endif
> +-
> +-#if defined(CONFIG_SPL_BUILD) && (!defined(V_MCFG) || =
!defined(V_RFR_CTRL))
> +-#error "Please choose the right DDR type in config header"
> +-#endif
> +-
> + /*
> +  * GPMC settings -
> +  * Definitions is as per the following format
> +diff --git a/arch/arm/include/asm/arch-omap3/sys_proto.h =
b/arch/arm/include/asm/arch-omap3/sys_proto.h
> +index 9e64410..80e167b 100644
> +--- a/arch/arm/include/asm/arch-omap3/sys_proto.h
> ++++ b/arch/arm/include/asm/arch-omap3/sys_proto.h
> +@@ -38,6 +38,8 @@ void per_clocks_enable(void);
> + void memif_init(void);
> + void sdrc_init(void);
> + void do_sdrc_init(u32, u32);
> ++void get_board_mem_timings(u32 *mcfg, u32 *ctrla, u32 *ctrlb, u32 =
*rfr_ctrl,
> ++		u32 *mr);
> + void emif4_init(void);
> + void gpmc_init(void);
> + void enable_gpmc_cs_config(const u32 *gpmc_config, struct gpmc_cs =
*cs, u32 base,
> +diff --git a/board/timll/devkit8000/devkit8000.c =
b/board/timll/devkit8000/devkit8000.c
> +index fee0dff..b06aab6 100644
> +--- a/board/timll/devkit8000/devkit8000.c
> ++++ b/board/timll/devkit8000/devkit8000.c
> +@@ -138,3 +138,24 @@ int board_eth_init(bd_t *bis)
> + 	return dm9000_initialize(bis);
> + }
> + #endif
> ++
> ++/*
> ++ * Routine: get_board_mem_timings
> ++ * Description: If we use SPL then there is no x-loader nor config =
header
> ++ * so we have to setup the DDR timings ourself on the first bank.  =
This
> ++ * provides the timing values back to the function that configures
> ++ * the memory.  We have either one or two banks of 128MB DDR.
> ++ */
> ++void get_board_mem_timings(u32 *mcfg, u32 *ctrla, u32 *ctrlb, u32 =
*rfr_ctrl,
> ++		u32 *mr)
> ++{
> ++	/* General SDRC config */
> ++	*mcfg =3D MICRON_V_MCFG_165(128 << 20);
> ++	*rfr_ctrl =3D SDP_3430_SDRC_RFR_CTRL_165MHz;
> ++
> ++	/* AC timings */
> ++	*ctrla =3D MICRON_V_ACTIMA_165;
> ++	*ctrlb =3D MICRON_V_ACTIMB_165;
> ++
> ++	*mr =3D MICRON_V_MR_165;
> ++}
> +diff --git a/include/configs/devkit8000.h =
b/include/configs/devkit8000.h
> +index e1743dc..b3e60cd 100644
> +--- a/include/configs/devkit8000.h
> ++++ b/include/configs/devkit8000.h
> +@@ -68,10 +68,6 @@
> + #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + (128 =
<< 10))
> +=20
> + /* Hardware drivers */
> +-
> +-/* DDR - I use Micron DDR */
> +-#define CONFIG_OMAP3_MICRON_DDR		1
> +-
> + /* DM9000 */
> + #define CONFIG_NET_RETRY_COUNT		20
> + #define	CONFIG_DRIVER_DM9000		1
> +@@ -284,7 +280,6 @@
> + /*  Physical Memory Map  */
> + #define CONFIG_NR_DRAM_BANKS		2 /* CS1 may or may not =
be populated */
> + #define PHYS_SDRAM_1			OMAP34XX_SDRC_CS0
> +-#define PHYS_SDRAM_1_SIZE		(128 << 20)	/* at least 128 =
MiB */
> + #define PHYS_SDRAM_2			OMAP34XX_SDRC_CS1
> +=20
> + /* SDRAM Bank Allocation method */
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0010-OMAP3-SPL-Add-identify_nand_chip-=
function.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0010-OMAP3-SPL-Add-identify_nand_chip-=
function.patch
> new file mode 100644
> index 0000000..94ef0de
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0010-OMAP3-SPL-Add-identify_nand_chip-=
function.patch
> @@ -0,0 +1,142 @@
> +=46rom 290ebce5d39112ce80c6180206952aa5cc0ea871 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:07 +0000
> +Subject: [PATCH 10/21] OMAP3 SPL: Add identify_nand_chip function
> +
> +A number of boards are populated with a PoP chip for both DDR and =
NAND
> +memory.  Other boards may simply use this as an easy way to identify
> +board revs.  So we provide a function that can be called early to =
reset
> +the NAND chip and return the result of NAND_CMD_READID.  All of this
> +code is put into spl_id_nand.c and controlled via =
CONFIG_SPL_OMAP3_ID_NAND.
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/cpu/armv7/omap3/Makefile           |    3 +
> + arch/arm/cpu/armv7/omap3/spl_id_nand.c      |   87 =
+++++++++++++++++++++++++++
> + arch/arm/include/asm/arch-omap3/sys_proto.h |    1 +
> + 3 files changed, 91 insertions(+), 0 deletions(-)
> + create mode 100644 arch/arm/cpu/armv7/omap3/spl_id_nand.c
> +
> +diff --git a/arch/arm/cpu/armv7/omap3/Makefile =
b/arch/arm/cpu/armv7/omap3/Makefile
> +index 8e85891..4b38e45 100644
> +--- a/arch/arm/cpu/armv7/omap3/Makefile
> ++++ b/arch/arm/cpu/armv7/omap3/Makefile
> +@@ -31,6 +31,9 @@ COBJS	+=3D board.o
> + COBJS	+=3D clock.o
> + COBJS	+=3D mem.o
> + COBJS	+=3D sys_info.o
> ++ifdef CONFIG_SPL_BUILD
> ++COBJS-$(CONFIG_SPL_OMAP3_ID_NAND)	+=3D spl_id_nand.o
> ++endif
> +=20
> + COBJS-$(CONFIG_EMIF4)	+=3D emif4.o
> + COBJS-$(CONFIG_SDRC)	+=3D sdrc.o
> +diff --git a/arch/arm/cpu/armv7/omap3/spl_id_nand.c =
b/arch/arm/cpu/armv7/omap3/spl_id_nand.c
> +new file mode 100644
> +index 0000000..0871fc9
> +--- /dev/null
> ++++ b/arch/arm/cpu/armv7/omap3/spl_id_nand.c
> +@@ -0,0 +1,87 @@
> ++/*
> ++ * (C) Copyright 2011
> ++ * Texas Instruments, <www.ti.com>
> ++ *
> ++ * Author :
> ++ *     Tom Rini <trini@ti.com>
> ++ *
> ++ * Initial Code from:
> ++ *     Richard Woodruff <r-woodruff2@ti.com>
> ++ *     Jian Zhang <jzhang@ti.com>
> ++ *
> ++ * This program is free software; you can redistribute it and/or
> ++ * modify it under the terms of the GNU General Public License as
> ++ * published by the Free Software Foundation; either version 2 of
> ++ * the License, or (at your option) any later version.
> ++ *
> ++ * This program is distributed in the hope that it will be useful,
> ++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> ++ * GNU General Public License for more details.
> ++ *
> ++ * You should have received a copy of the GNU General Public License
> ++ * along with this program; if not, write to the Free Software
> ++ * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> ++ * MA 02111-1307 USA
> ++ */
> ++
> ++#include <common.h>
> ++#include <linux/mtd/nand.h>
> ++#include <asm/io.h>
> ++#include <asm/arch/sys_proto.h>
> ++#include <asm/arch/mem.h>
> ++
> ++static struct gpmc *gpmc_config =3D (struct gpmc *)GPMC_BASE;
> ++
> ++/* nand_command: Send a flash command to the flash chip */
> ++static void nand_command(u8 command)
> ++{
> ++	writeb(command, &gpmc_config->cs[0].nand_cmd);
> ++
> ++	if (command =3D=3D NAND_CMD_RESET) {
> ++		unsigned char ret_val;
> ++		writeb(NAND_CMD_STATUS, &gpmc_config->cs[0].nand_cmd);
> ++		do {
> ++			/* Wait until ready */
> ++			ret_val =3D readl(&gpmc_config->cs[0].nand_dat);
> ++		} while ((ret_val & NAND_STATUS_READY) !=3D =
NAND_STATUS_READY);
> ++	}
> ++}
> ++
> ++/*
> ++ * Many boards will want to know the results of the NAND_CMD_READID =
command
> ++ * in order to decide what to do about DDR initialization.  This =
function
> ++ * allows us to do that very early and to pass those results back to =
the
> ++ * board so it can make whatever decisions need to be made.
> ++ */
> ++void identify_nand_chip(int *mfr, int *id)
> ++{
> ++	/* Make sure that we have setup GPMC for NAND correctly. */
> ++	writel(M_NAND_GPMC_CONFIG1, &gpmc_config->cs[0].config1);
> ++	writel(M_NAND_GPMC_CONFIG2, &gpmc_config->cs[0].config2);
> ++	writel(M_NAND_GPMC_CONFIG3, &gpmc_config->cs[0].config3);
> ++	writel(M_NAND_GPMC_CONFIG4, &gpmc_config->cs[0].config4);
> ++	writel(M_NAND_GPMC_CONFIG5, &gpmc_config->cs[0].config5);
> ++	writel(M_NAND_GPMC_CONFIG6, &gpmc_config->cs[0].config6);
> ++
> ++	/*
> ++	 * Enable the config.  The CS size goes in bits 11:8.  We set
> ++	 * bit 6 to enable the CS and the base address goes into bits =
5:0.
> ++	 */
> ++	writel((GPMC_SIZE_128M << 8) | (GPMC_CS_ENABLE << 6) |
> ++				((NAND_BASE >> 24) & =
GPMC_BASEADDR_MASK),
> ++			&gpmc_config->cs[0].config7);
> ++
> ++	sdelay(2000);
> ++
> ++	/* Issue a RESET and then READID */
> ++	nand_command(NAND_CMD_RESET);
> ++	nand_command(NAND_CMD_READID);
> ++
> ++	/* Set the address to read to 0x0 */
> ++	writeb(0x0, &gpmc_config->cs[0].nand_adr);
> ++
> ++	/* Read off the manufacturer and device id. */
> ++	*mfr =3D readb(&gpmc_config->cs[0].nand_dat);
> ++	*id =3D readb(&gpmc_config->cs[0].nand_dat);
> ++}
> +diff --git a/arch/arm/include/asm/arch-omap3/sys_proto.h =
b/arch/arm/include/asm/arch-omap3/sys_proto.h
> +index 80e167b..e5031d5 100644
> +--- a/arch/arm/include/asm/arch-omap3/sys_proto.h
> ++++ b/arch/arm/include/asm/arch-omap3/sys_proto.h
> +@@ -40,6 +40,7 @@ void sdrc_init(void);
> + void do_sdrc_init(u32, u32);
> + void get_board_mem_timings(u32 *mcfg, u32 *ctrla, u32 *ctrlb, u32 =
*rfr_ctrl,
> + 		u32 *mr);
> ++void identify_nand_chip(int *mfr, int *id);
> + void emif4_init(void);
> + void gpmc_init(void);
> + void enable_gpmc_cs_config(const u32 *gpmc_config, struct gpmc_cs =
*cs, u32 base,
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0011-OMAP3-Add-SPL-support-to-Beaglebo=
ard.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0011-OMAP3-Add-SPL-support-to-Beaglebo=
ard.patch
> new file mode 100644
> index 0000000..a32c21d
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0011-OMAP3-Add-SPL-support-to-Beaglebo=
ard.patch
> @@ -0,0 +1,315 @@
> +=46rom 4ce72b52b5eeb172c1118fbd6e23d49eeec30ad2 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:08 +0000
> +Subject: [PATCH 11/21] OMAP3: Add SPL support to Beagleboard
> +
> +This introduces 200MHz Micron parts timing information based on =
x-loader
> +to <asm/arch-omap3/mem.h> and Numonyx MCFG calculation.  The memory =
init
> +logic is also based on what x-loader does in these cases.  Note that
> +while previously u-boot would be flashed in with SW ECC in this case =
it
> +now must be flashed with HW ECC.  We also change CONFIG_SYS_TEXT_BASE =
to
> +0x80100000.
> +
> +Cc: Dirk Behme <dirk.behme@gmail.com>
> +Beagleboard rev C5, xM rev A:
> +Tested-by: Tom Rini <trini@ti.com>
> +Beagleboard xM rev C:
> +Tested-by: Matt Ranostay <mranostay@gmail.com>
> +Beagleboard rev B7, C2, xM rev B:
> +Tested-by: Matt Porter <mporter@ti.com>
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/include/asm/arch-omap3/mem.h |   29 +++++++++++++
> + board/ti/beagle/beagle.c              |   71 =
++++++++++++++++++++++++++++++++-
> + board/ti/beagle/config.mk             |   33 ---------------
> + include/configs/omap3_beagle.h        |   59 =
+++++++++++++++++++++++++--
> + 4 files changed, 153 insertions(+), 39 deletions(-)
> + delete mode 100644 board/ti/beagle/config.mk
> +
> +diff --git a/arch/arm/include/asm/arch-omap3/mem.h =
b/arch/arm/include/asm/arch-omap3/mem.h
> +index 09f5872..4ea5f74 100644
> +--- a/arch/arm/include/asm/arch-omap3/mem.h
> ++++ b/arch/arm/include/asm/arch-omap3/mem.h
> +@@ -186,6 +186,32 @@ enum {
> + 		(MICRON_CASL_165 << 4) | (MICRON_SIL_165 << 3) | \
> + 		(MICRON_BL_165))
> +=20
> ++/* Micron part (200MHz optimized) 5 ns */
> ++#define MICRON_TDAL_200		6
> ++#define MICRON_TDPL_200		3
> ++#define MICRON_TRRD_200		2
> ++#define MICRON_TRCD_200		3
> ++#define MICRON_TRP_200		3
> ++#define MICRON_TRAS_200		8
> ++#define MICRON_TRC_200		11
> ++#define MICRON_TRFC_200		15
> ++#define MICRON_V_ACTIMA_200	\
> ++		ACTIM_CTRLA(MICRON_TRFC_200, MICRON_TRC_200,		=
\
> ++				MICRON_TRAS_200, MICRON_TRP_200,	=
\
> ++				MICRON_TRCD_200, MICRON_TRRD_200,	=
\
> ++				MICRON_TDPL_200, MICRON_TDAL_200)
> ++
> ++#define MICRON_TWTR_200		2
> ++#define MICRON_TCKE_200		4
> ++#define MICRON_TXP_200		2
> ++#define MICRON_XSR_200		23
> ++#define MICRON_V_ACTIMB_200	\
> ++		ACTIM_CTRLB(MICRON_TWTR_200, MICRON_TCKE_200,	\
> ++				MICRON_TXP_200,	MICRON_XSR_200)
> ++
> ++#define MICRON_RASWIDTH_200	0x3
> ++#define MICRON_V_MCFG_200(size)	MCFG((size), =
MICRON_RASWIDTH_200)
> ++
> + /* NUMONYX part of IGEP v2 (165MHz optimized) 6.06ns */
> + #define NUMONYX_TDAL_165	6	/* Twr/Tck + Trp/tck		=
*/
> + 					/* 15/6 + 18/6 =3D 5.5 -> 6	=
*/
> +@@ -212,6 +238,9 @@ enum {
> + 		ACTIM_CTRLB(NUMONYX_TWTR_165, NUMONYX_TCKE_165,	\
> + 				NUMONYX_TXP_165, NUMONYX_XSR_165)
> +=20
> ++#define NUMONYX_RASWIDTH_165		0x4
> ++#define NUMONYX_V_MCFG_165(size)	MCFG((size), =
NUMONYX_RASWIDTH_165)
> ++
> + /*
> +  * GPMC settings -
> +  * Definitions is as per the following format
> +diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
> +index 9482c5e..6a457cb 100644
> +--- a/board/ti/beagle/beagle.c
> ++++ b/board/ti/beagle/beagle.c
> +@@ -1,5 +1,5 @@
> + /*
> +- * (C) Copyright 2004-2008
> ++ * (C) Copyright 2004-2011
> +  * Texas Instruments, <www.ti.com>
> +  *
> +  * Author :
> +@@ -34,9 +34,11 @@
> + #include <status_led.h>
> + #endif
> + #include <twl4030.h>
> ++#include <linux/mtd/nand.h>
> + #include <asm/io.h>
> + #include <asm/arch/mmc_host_def.h>
> + #include <asm/arch/mux.h>
> ++#include <asm/arch/mem.h>
> + #include <asm/arch/sys_proto.h>
> + #include <asm/gpio.h>
> + #include <asm/mach-types.h>
> +@@ -135,6 +137,69 @@ int get_board_revision(void)
> + 	return revision;
> + }
> +=20
> ++#ifdef CONFIG_SPL_BUILD
> ++/*
> ++ * Routine: get_board_mem_timings
> ++ * Description: If we use SPL then there is no x-loader nor config =
header
> ++ * so we have to setup the DDR timings ourself on both banks.
> ++ */
> ++void get_board_mem_timings(u32 *mcfg, u32 *ctrla, u32 *ctrlb, u32 =
*rfr_ctrl,
> ++		u32 *mr)
> ++{
> ++	int pop_mfr, pop_id;
> ++
> ++	/*
> ++	 * We need to identify what PoP memory is on the board so that
> ++	 * we know what timings to use.  If we can't identify it then
> ++	 * we know it's an xM.  To map the ID values please see =
nand_ids.c
> ++	 */
> ++	identify_nand_chip(&pop_mfr, &pop_id);
> ++
> ++	*mr =3D MICRON_V_MR_165;
> ++	switch (get_board_revision()) {
> ++	case REVISION_C4:
> ++		if (pop_mfr =3D=3D NAND_MFR_STMICRO && pop_id =3D=3D =
0xba) {
> ++			/* 512MB DDR */
> ++			*mcfg =3D NUMONYX_V_MCFG_165(512 << 20);
> ++			*ctrla =3D NUMONYX_V_ACTIMA_165;
> ++			*ctrlb =3D NUMONYX_V_ACTIMB_165;
> ++			*rfr_ctrl =3D SDP_3430_SDRC_RFR_CTRL_165MHz;
> ++			break;
> ++		} else if (pop_mfr =3D=3D NAND_MFR_MICRON && pop_id =3D=3D=
 0xbc) {
> ++			/* Beagleboard Rev C5, 256MB DDR */
> ++			*mcfg =3D MICRON_V_MCFG_200(256 << 20);
> ++			*ctrla =3D MICRON_V_ACTIMA_200;
> ++			*ctrlb =3D MICRON_V_ACTIMB_200;
> ++			*rfr_ctrl =3D SDP_3430_SDRC_RFR_CTRL_200MHz;
> ++			break;
> ++		}
> ++	case REVISION_XM_A:
> ++	case REVISION_XM_B:
> ++	case REVISION_XM_C:
> ++		if (pop_mfr =3D=3D 0) {
> ++			/* 256MB DDR */
> ++			*mcfg =3D MICRON_V_MCFG_200(256 << 20);
> ++			*ctrla =3D MICRON_V_ACTIMA_200;
> ++			*ctrlb =3D MICRON_V_ACTIMB_200;
> ++			*rfr_ctrl =3D SDP_3430_SDRC_RFR_CTRL_200MHz;
> ++		} else {
> ++			/* 512MB DDR */
> ++			*mcfg =3D NUMONYX_V_MCFG_165(512 << 20);
> ++			*ctrla =3D NUMONYX_V_ACTIMA_165;
> ++			*ctrlb =3D NUMONYX_V_ACTIMB_165;
> ++			*rfr_ctrl =3D SDP_3430_SDRC_RFR_CTRL_165MHz;
> ++		}
> ++		break;
> ++	default:
> ++		/* Assume 128MB and Micron/165MHz timings to be safe */
> ++		*mcfg =3D MICRON_V_MCFG_165(128 << 20);
> ++		*ctrla =3D MICRON_V_ACTIMA_165;
> ++		*ctrlb =3D MICRON_V_ACTIMB_165;
> ++		*rfr_ctrl =3D SDP_3430_SDRC_RFR_CTRL_165MHz;
> ++	}
> ++}
> ++#endif
> ++
> + /*
> +  * Routine: get_expansion_id
> +  * Description: This function checks for expansion board by checking =
I2C
> +@@ -367,7 +432,7 @@ void set_muxconf_regs(void)
> + 	MUX_BEAGLE();
> + }
> +=20
> +-#ifdef CONFIG_GENERIC_MMC
> ++#if defined(CONFIG_GENERIC_MMC) && !defined(CONFIG_SPL_BUILD)
> + int board_mmc_init(bd_t *bis)
> + {
> + 	omap_mmc_init(0);
> +@@ -476,6 +541,7 @@ int ehci_hcd_init(void)
> +=20
> + #endif /* CONFIG_USB_EHCI */
> +=20
> ++#ifndef CONFIG_SPL_BUILD
> + /*
> +  * This command returns the status of the user button on beagle xM
> +  * Input - none
> +@@ -528,3 +594,4 @@ U_BOOT_CMD(
> + 	"Return the status of the BeagleBoard USER button",
> + 	""
> + );
> ++#endif
> +diff --git a/board/ti/beagle/config.mk b/board/ti/beagle/config.mk
> +deleted file mode 100644
> +index cf055db..0000000
> +--- a/board/ti/beagle/config.mk
> ++++ /dev/null
> +@@ -1,33 +0,0 @@
> +-#
> +-# (C) Copyright 2006
> +-# Texas Instruments, <www.ti.com>
> +-#
> +-# Beagle Board uses OMAP3 (ARM-CortexA8) cpu
> +-# see http://www.ti.com/ for more information on Texas Instruments
> +-#
> +-# See file CREDITS for list of people who contributed to this
> +-# project.
> +-#
> +-# This program is free software; you can redistribute it and/or
> +-# modify it under the terms of the GNU General Public License as
> +-# published by the Free Software Foundation; either version 2 of
> +-# the License, or (at your option) any later version.
> +-#
> +-# This program is distributed in the hope that it will be useful,
> +-# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-# GNU General Public License for more details.
> +-#
> +-# You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write to the Free Software
> +-# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> +-# MA 02111-1307 USA
> +-#
> +-# Physical Address:
> +-# 8000'0000 (bank0)
> +-# A000/0000 (bank1)
> +-# Linux-Kernel is expected to be at 8000'8000, entry 8000'8000
> +-# (mem base + reserved)
> +-
> +-# For use with external or internal boots.
> +-CONFIG_SYS_TEXT_BASE =3D 0x80008000
> +diff --git a/include/configs/omap3_beagle.h =
b/include/configs/omap3_beagle.h
> +index 15e40c5..941ec38 100644
> +--- a/include/configs/omap3_beagle.h
> ++++ b/include/configs/omap3_beagle.h
> +@@ -111,9 +111,6 @@
> + #define STATUS_LED_BOOT			STATUS_LED_BIT
> + #define STATUS_LED_GREEN		STATUS_LED_BIT1
> +=20
> +-/* DDR - I use Micron DDR */
> +-#define CONFIG_OMAP3_MICRON_DDR		1
> +-
> + /* Enable Multi Bus support for I2C */
> + #define CONFIG_I2C_MULTI_BUS		1
> +=20
> +@@ -347,7 +344,6 @@
> +  */
> + #define CONFIG_NR_DRAM_BANKS	2	/* CS1 may or may not be =
populated */
> + #define PHYS_SDRAM_1		OMAP34XX_SDRC_CS0
> +-#define PHYS_SDRAM_1_SIZE	(32 << 20)	/* at least 32 MiB */
> + #define PHYS_SDRAM_2		OMAP34XX_SDRC_CS1
> +=20
> + /* SDRAM Bank Allocation method */
> +@@ -390,4 +386,59 @@
> +=20
> + #define CONFIG_OMAP3_SPI
> +=20
> ++/* Defines for SPL */
> ++#define CONFIG_SPL
> ++#define CONFIG_SPL_NAND_SIMPLE
> ++#define CONFIG_SPL_TEXT_BASE		0x40200800
> ++#define CONFIG_SPL_MAX_SIZE		(45 * 1024)
> ++#define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
> ++
> ++#define CONFIG_SPL_BSS_START_ADDR	0x80000000
> ++#define CONFIG_SPL_BSS_MAX_SIZE		0x80000		/* 512 =
KB */
> ++
> ++#define CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR	0x300 /* address =
0x60000 */
> ++#define CONFIG_SYS_U_BOOT_MAX_SIZE_SECTORS	0x200 /* 256 KB */
> ++#define CONFIG_SYS_MMC_SD_FAT_BOOT_PARTITION	1
> ++#define CONFIG_SPL_FAT_LOAD_PAYLOAD_NAME	"u-boot.img"
> ++
> ++#define CONFIG_SPL_LIBCOMMON_SUPPORT
> ++#define CONFIG_SPL_LIBDISK_SUPPORT
> ++#define CONFIG_SPL_I2C_SUPPORT
> ++#define CONFIG_SPL_LIBGENERIC_SUPPORT
> ++#define CONFIG_SPL_MMC_SUPPORT
> ++#define CONFIG_SPL_FAT_SUPPORT
> ++#define CONFIG_SPL_SERIAL_SUPPORT
> ++#define CONFIG_SPL_NAND_SUPPORT
> ++#define CONFIG_SPL_POWER_SUPPORT
> ++#define CONFIG_SPL_OMAP3_ID_NAND
> ++#define CONFIG_SPL_LDSCRIPT		=
"$(CPUDIR)/omap-common/u-boot-spl.lds"
> ++
> ++/* NAND boot config */
> ++#define CONFIG_SYS_NAND_5_ADDR_CYCLE
> ++#define CONFIG_SYS_NAND_PAGE_COUNT	64
> ++#define CONFIG_SYS_NAND_PAGE_SIZE	2048
> ++#define CONFIG_SYS_NAND_OOBSIZE		64
> ++#define CONFIG_SYS_NAND_BLOCK_SIZE	(128*1024)
> ++#define CONFIG_SYS_NAND_BAD_BLOCK_POS	0
> ++#define CONFIG_SYS_NAND_ECCPOS		{2, 3, 4, 5, 6, 7, 8, =
9,\
> ++						10, 11, 12, 13}
> ++#define CONFIG_SYS_NAND_ECCSIZE		512
> ++#define CONFIG_SYS_NAND_ECCBYTES	3
> ++#define CONFIG_SYS_NAND_ECCSTEPS	(CONFIG_SYS_NAND_PAGE_SIZE / \
> ++						CONFIG_SYS_NAND_ECCSIZE)
> ++#define CONFIG_SYS_NAND_ECCTOTAL	(CONFIG_SYS_NAND_ECCBYTES * \
> ++						=
CONFIG_SYS_NAND_ECCSTEPS)
> ++#define CONFIG_SYS_NAND_U_BOOT_START	CONFIG_SYS_TEXT_BASE
> ++#define CONFIG_SYS_NAND_U_BOOT_OFFS	0x80000
> ++
> ++/*
> ++ * 1MB into the SDRAM to allow for SPL's bss at the beginning of =
SDRAM
> ++ * 64 bytes before this address should be set aside for u-boot.img's
> ++ * header. That is 0x800FFFC0--0x80100000 should not be used for any
> ++ * other needs.
> ++ */
> ++#define CONFIG_SYS_TEXT_BASE		0x80100000
> ++#define CONFIG_SYS_SPL_MALLOC_START	0x80208000
> ++#define CONFIG_SYS_SPL_MALLOC_SIZE	0x100000
> ++
> + #endif /* __CONFIG_H */
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0012-OMAP3-Add-SPL-support-to-omap3_ev=
m.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0012-OMAP3-Add-SPL-support-to-omap3_ev=
m.patch
> new file mode 100644
> index 0000000..7121ff7
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0012-OMAP3-Add-SPL-support-to-omap3_ev=
m.patch
> @@ -0,0 +1,319 @@
> +=46rom a2985d6ef29ee6eb09ad1b40cf09f955549e66e2 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:09 +0000
> +Subject: [PATCH 12/21] OMAP3: Add SPL support to omap3_evm
> +
> +Add Hynix 200MHz timing information to <asm/arch-omap3/mem.h>.
> +This also changes CONFIG_SYS_TEXT_BASE to 0x80100000.
> +
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + arch/arm/include/asm/arch-omap3/mem.h  |   26 ++++++++++++++++++++
> + board/ti/evm/config.mk                 |   33 =
-------------------------
> + board/ti/evm/evm.c                     |   41 =
++++++++++++++++++++++++++++++-
> + include/configs/omap3_evm.h            |   27 +++++++++++++++++++++
> + include/configs/omap3_evm_common.h     |   30 +++++++++++++++++++++-
> + include/configs/omap3_evm_quick_mmc.h  |   10 +++++++
> + include/configs/omap3_evm_quick_nand.h |   22 +++++++++++++++++
> + 7 files changed, 152 insertions(+), 37 deletions(-)
> + delete mode 100644 board/ti/evm/config.mk
> +
> +diff --git a/arch/arm/include/asm/arch-omap3/mem.h =
b/arch/arm/include/asm/arch-omap3/mem.h
> +index 4ea5f74..5fd02d4 100644
> +--- a/arch/arm/include/asm/arch-omap3/mem.h
> ++++ b/arch/arm/include/asm/arch-omap3/mem.h
> +@@ -123,6 +123,32 @@ enum {
> + 		V_MCFG_BANKALLOCATION_RBC |			\
> + 		V_MCFG_B32NOT16_32 | V_MCFG_DEEPPD_EN | =
V_MCFG_RAMTYPE_DDR
> +=20
> ++/* Hynix part of AM/DM37xEVM (200MHz optimized) */
> ++#define HYNIX_TDAL_200		6
> ++#define HYNIX_TDPL_200		3
> ++#define HYNIX_TRRD_200		2
> ++#define HYNIX_TRCD_200		4
> ++#define HYNIX_TRP_200		3
> ++#define HYNIX_TRAS_200		8
> ++#define HYNIX_TRC_200		11
> ++#define HYNIX_TRFC_200		18
> ++#define HYNIX_V_ACTIMA_200	\
> ++		ACTIM_CTRLA(HYNIX_TRFC_200, HYNIX_TRC_200,	\
> ++				HYNIX_TRAS_200, HYNIX_TRP_200,	\
> ++				HYNIX_TRCD_200, HYNIX_TRRD_200,	\
> ++				HYNIX_TDPL_200, HYNIX_TDAL_200)
> ++
> ++#define HYNIX_TWTR_200		2
> ++#define HYNIX_TCKE_200		1
> ++#define HYNIX_TXP_200		1
> ++#define HYNIX_XSR_200		28
> ++#define HYNIX_V_ACTIMB_200	\
> ++		ACTIM_CTRLB(HYNIX_TWTR_200, HYNIX_TCKE_200,	\
> ++				HYNIX_TXP_200, HYNIX_XSR_200)
> ++
> ++#define HYNIX_RASWIDTH_200	0x3
> ++#define HYNIX_V_MCFG_200(size)	MCFG((size), HYNIX_RASWIDTH_200)
> ++
> + /* Infineon part of 3430SDP (165MHz optimized) 6.06ns */
> + #define INFINEON_TDAL_165	6	/* Twr/Tck + Trp/tck		=
*/
> + 					/* 15/6 + 18/6 =3D 5.5 -> 6	=
*/
> +diff --git a/board/ti/evm/config.mk b/board/ti/evm/config.mk
> +deleted file mode 100644
> +index d173eef..0000000
> +--- a/board/ti/evm/config.mk
> ++++ /dev/null
> +@@ -1,33 +0,0 @@
> +-#
> +-# (C) Copyright 2006 - 2008
> +-# Texas Instruments, <www.ti.com>
> +-#
> +-# EVM uses OMAP3 (ARM-CortexA8) cpu
> +-# see http://www.ti.com/ for more information on Texas Instruments
> +-#
> +-# See file CREDITS for list of people who contributed to this
> +-# project.
> +-#
> +-# This program is free software; you can redistribute it and/or
> +-# modify it under the terms of the GNU General Public License as
> +-# published by the Free Software Foundation; either version 2 of
> +-# the License, or (at your option) any later version.
> +-#
> +-# This program is distributed in the hope that it will be useful,
> +-# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-# GNU General Public License for more details.
> +-#
> +-# You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write to the Free Software
> +-# Foundation, Inc., 59 Temple Place, Suite 330, Boston,
> +-# MA 02111-1307 USA
> +-#
> +-# Physical Address:
> +-# 8000'0000 (bank0)
> +-# A000/0000 (bank1)
> +-# Linux-Kernel is expected to be at 8000'8000, entry 8000'8000
> +-# (mem base + reserved)
> +-
> +-# For use with external or internal boots.
> +-CONFIG_SYS_TEXT_BASE =3D 0x80008000
> +diff --git a/board/ti/evm/evm.c b/board/ti/evm/evm.c
> +index 8c43463..8497aee 100644
> +--- a/board/ti/evm/evm.c
> ++++ b/board/ti/evm/evm.c
> +@@ -1,5 +1,5 @@
> + /*
> +- * (C) Copyright 2004-2008
> ++ * (C) Copyright 2004-2011
> +  * Texas Instruments, <www.ti.com>
> +  *
> +  * Author :
> +@@ -37,6 +37,7 @@
> + #include <asm/gpio.h>
> + #include <i2c.h>
> + #include <asm/mach-types.h>
> ++#include <linux/mtd/nand.h>
> + #include "evm.h"
> +=20
> + #define OMAP3EVM_GPIO_ETH_RST_GEN1		64
> +@@ -119,6 +120,42 @@ int board_init(void)
> + 	return 0;
> + }
> +=20
> ++#ifdef CONFIG_SPL_BUILD
> ++/*
> ++ * Routine: get_board_mem_timings
> ++ * Description: If we use SPL then there is no x-loader nor config =
header
> ++ * so we have to setup the DDR timings ourself on the first bank.  =
This
> ++ * provides the timing values back to the function that configures
> ++ * the memory.
> ++ */
> ++void get_board_mem_timings(u32 *mcfg, u32 *ctrla, u32 *ctrlb, u32 =
*rfr_ctrl,
> ++		u32 *mr)
> ++{
> ++	int pop_mfr, pop_id;
> ++
> ++	/*
> ++	 * We need to identify what PoP memory is on the board so that
> ++	 * we know what timings to use.  To map the ID values please see
> ++	 * nand_ids.c
> ++	 */
> ++	identify_nand_chip(&pop_mfr, &pop_id);
> ++
> ++	if (pop_mfr =3D=3D NAND_MFR_HYNIX && pop_id =3D=3D 0xbc) {
> ++		/* 256MB DDR */
> ++		*mcfg =3D HYNIX_V_MCFG_200(256 << 20);
> ++		*ctrla =3D HYNIX_V_ACTIMA_200;
> ++		*ctrlb =3D HYNIX_V_ACTIMB_200;
> ++	} else {
> ++		/* 128MB DDR */
> ++		*mcfg =3D MICRON_V_MCFG_165(128 << 20);
> ++		*ctrla =3D MICRON_V_ACTIMA_165;
> ++		*ctrlb =3D MICRON_V_ACTIMB_165;
> ++	}
> ++	*rfr_ctrl =3D SDP_3430_SDRC_RFR_CTRL_165MHz;
> ++	*mr =3D MICRON_V_MR_165;
> ++}
> ++#endif
> ++
> + /*
> +  * Routine: misc_init_r
> +  * Description: Init ethernet (done here so udelay works)
> +@@ -238,7 +275,7 @@ int board_eth_init(bd_t *bis)
> + }
> + #endif /* CONFIG_CMD_NET */
> +=20
> +-#ifdef CONFIG_GENERIC_MMC
> ++#if defined(CONFIG_GENERIC_MMC) && !defined(CONFIG_SPL_BUILD)
> + int board_mmc_init(bd_t *bis)
> + {
> + 	omap_mmc_init(0);
> +diff --git a/include/configs/omap3_evm.h =
b/include/configs/omap3_evm.h
> +index 47ec39f..dc611ca 100644
> +--- a/include/configs/omap3_evm.h
> ++++ b/include/configs/omap3_evm.h
> +@@ -84,6 +84,13 @@
> + #define CONFIG_GENERIC_MMC
> + #define CONFIG_OMAP_HSMMC
> + #define CONFIG_DOS_PARTITION
> ++/* SPL */
> ++#define CONFIG_SPL_MMC_SUPPORT
> ++#define CONFIG_SPL_FAT_SUPPORT
> ++#define CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR	0x300 /* address =
0x60000 */
> ++#define CONFIG_SYS_U_BOOT_MAX_SIZE_SECTORS	0x200 /* 256 KB */
> ++#define CONFIG_SYS_MMC_SD_FAT_BOOT_PARTITION	1
> ++#define CONFIG_SPL_FAT_LOAD_PAYLOAD_NAME	"u-boot.img"
> +=20
> + /* USB
> +  *
> +@@ -94,6 +101,26 @@
> + #define CONFIG_MUSB_HCD
> + /* #define CONFIG_MUSB_UDC */
> +=20
> ++/* NAND SPL */
> ++#define CONFIG_SPL_NAND_SIMPLE
> ++#define CONFIG_SPL_NAND_SUPPORT
> ++#define CONFIG_SYS_NAND_5_ADDR_CYCLE
> ++#define CONFIG_SYS_NAND_PAGE_COUNT	64
> ++#define CONFIG_SYS_NAND_PAGE_SIZE	2048
> ++#define CONFIG_SYS_NAND_OOBSIZE		64
> ++#define CONFIG_SYS_NAND_BLOCK_SIZE	(128*1024)
> ++#define CONFIG_SYS_NAND_BAD_BLOCK_POS	0
> ++#define CONFIG_SYS_NAND_ECCPOS		{2, 3, 4, 5, 6, 7, 8, =
9,\
> ++						10, 11, 12, 13}
> ++#define CONFIG_SYS_NAND_ECCSIZE		512
> ++#define CONFIG_SYS_NAND_ECCBYTES	3
> ++#define CONFIG_SYS_NAND_ECCSTEPS	(CONFIG_SYS_NAND_PAGE_SIZE / \
> ++						CONFIG_SYS_NAND_ECCSIZE)
> ++#define CONFIG_SYS_NAND_ECCTOTAL       (CONFIG_SYS_NAND_ECCBYTES * \
> ++						=
CONFIG_SYS_NAND_ECCSTEPS)
> ++#define CONFIG_SYS_NAND_U_BOOT_START   CONFIG_SYS_TEXT_BASE
> ++#define CONFIG_SYS_NAND_U_BOOT_OFFS	0x80000
> ++
> + /* =
--------------------------------------------------------------------------=
---
> +  * Include common board configuration
> +  * =
--------------------------------------------------------------------------=
---
> +diff --git a/include/configs/omap3_evm_common.h =
b/include/configs/omap3_evm_common.h
> +index 54aa7a7..a2aeb76 100644
> +--- a/include/configs/omap3_evm_common.h
> ++++ b/include/configs/omap3_evm_common.h
> +@@ -27,7 +27,6 @@
> + #define CONFIG_SDRC			/* The chip has SDRC controller =
*/
> +=20
> + #define CONFIG_OMAP3_EVM		/* This is a OMAP3 EVM */
> +-#define CONFIG_OMAP3_MICRON_DDR		/* with MICRON DDR part =
*/
> + #define CONFIG_TWL4030_POWER		/* with TWL4030 PMIC */
> +=20
> + #undef CONFIG_USE_IRQ			/* no support for IRQs =
*/
> +@@ -71,7 +70,6 @@
> +  */
> + #define CONFIG_NR_DRAM_BANKS		2
> + #define PHYS_SDRAM_1			OMAP34XX_SDRC_CS0
> +-#define PHYS_SDRAM_1_SIZE		(32 << 20)
> + #define PHYS_SDRAM_2			OMAP34XX_SDRC_CS1
> +=20
> + /* SDRAM Bank Allocation method */
> +@@ -289,4 +287,32 @@
> + /* Uncomment to define the board revision statically */
> + /* #define CONFIG_STATIC_BOARD_REV	OMAP3EVM_BOARD_GEN_2 */
> +=20
> ++/* Defines for SPL */
> ++#define CONFIG_SPL
> ++#define CONFIG_SPL_TEXT_BASE		0x40200800
> ++#define CONFIG_SPL_MAX_SIZE		(45 * 1024)	/* 45 KB */
> ++#define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
> ++
> ++#define CONFIG_SPL_BSS_START_ADDR	0x80000000
> ++#define CONFIG_SPL_BSS_MAX_SIZE		0x80000		/* 512 =
KB */
> ++
> ++#define CONFIG_SPL_LIBCOMMON_SUPPORT
> ++#define CONFIG_SPL_LIBDISK_SUPPORT
> ++#define CONFIG_SPL_I2C_SUPPORT
> ++#define CONFIG_SPL_LIBGENERIC_SUPPORT
> ++#define CONFIG_SPL_SERIAL_SUPPORT
> ++#define CONFIG_SPL_POWER_SUPPORT
> ++#define CONFIG_SPL_OMAP3_ID_NAND
> ++#define CONFIG_SPL_LDSCRIPT		=
"$(CPUDIR)/omap-common/u-boot-spl.lds"
> ++
> ++/*
> ++ * 1MB into the SDRAM to allow for SPL's bss at the beginning of =
SDRAM
> ++ * 64 bytes before this address should be set aside for u-boot.img's
> ++ * header. That is 0x800FFFC0--0x80100000 should not be used for any
> ++ * other needs.
> ++ */
> ++#define CONFIG_SYS_TEXT_BASE		0x80100000
> ++#define CONFIG_SYS_SPL_MALLOC_START	0x80208000
> ++#define CONFIG_SYS_SPL_MALLOC_SIZE	0x100000
> ++
> + #endif /* __OMAP3_EVM_COMMON_H */
> +diff --git a/include/configs/omap3_evm_quick_mmc.h =
b/include/configs/omap3_evm_quick_mmc.h
> +index 691e4c2..912da7d 100644
> +--- a/include/configs/omap3_evm_quick_mmc.h
> ++++ b/include/configs/omap3_evm_quick_mmc.h
> +@@ -88,4 +88,14 @@
> + 	"root=3D/dev/mmcblk0p2 rw "	\
> + 	"rootfstype=3Dext3 rootwait"
> +=20
> ++/*
> ++ * SPL
> ++ */
> ++#define CONFIG_SPL_MMC_SUPPORT
> ++#define CONFIG_SPL_FAT_SUPPORT
> ++#define CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR	0x300 /* address =
0x60000 */
> ++#define CONFIG_SYS_U_BOOT_MAX_SIZE_SECTORS	0x200 /* 256 KB */
> ++#define CONFIG_SYS_MMC_SD_FAT_BOOT_PARTITION	1
> ++#define CONFIG_SPL_FAT_LOAD_PAYLOAD_NAME	"u-boot.img"
> ++
> + #endif /* __OMAP3_EVM_QUICK_MMC_H */
> +diff --git a/include/configs/omap3_evm_quick_nand.h =
b/include/configs/omap3_evm_quick_nand.h
> +index 2d18314..2f879c0 100644
> +--- a/include/configs/omap3_evm_quick_nand.h
> ++++ b/include/configs/omap3_evm_quick_nand.h
> +@@ -76,4 +76,26 @@
> + 	"root=3D/dev/mtdblock4 rw "	\
> + 	"rootfstype=3Djffs2 "
> +=20
> ++/*
> ++ * SPL
> ++ */
> ++#define CONFIG_SPL_NAND_SIMPLE
> ++#define CONFIG_SPL_NAND_SUPPORT
> ++#define CONFIG_SYS_NAND_5_ADDR_CYCLE
> ++#define CONFIG_SYS_NAND_PAGE_COUNT	64
> ++#define CONFIG_SYS_NAND_PAGE_SIZE	2048
> ++#define CONFIG_SYS_NAND_OOBSIZE		64
> ++#define CONFIG_SYS_NAND_BLOCK_SIZE	(128*1024)
> ++#define CONFIG_SYS_NAND_BAD_BLOCK_POS	0
> ++#define CONFIG_SYS_NAND_ECCPOS		{2, 3, 4, 5, 6, 7, 8, =
9,\
> ++						10, 11, 12, 13}
> ++#define CONFIG_SYS_NAND_ECCSIZE		512
> ++#define CONFIG_SYS_NAND_ECCBYTES	3
> ++#define CONFIG_SYS_NAND_ECCSTEPS	(CONFIG_SYS_NAND_PAGE_SIZE / \
> ++						CONFIG_SYS_NAND_ECCSIZE)
> ++#define CONFIG_SYS_NAND_ECCTOTAL       (CONFIG_SYS_NAND_ECCBYTES * \
> ++						=
CONFIG_SYS_NAND_ECCSTEPS)
> ++#define CONFIG_SYS_NAND_U_BOOT_START   CONFIG_SYS_TEXT_BASE
> ++#define CONFIG_SYS_NAND_U_BOOT_OFFS	0x80000
> ++
> + #endif /* __OMAP3_EVM_QUICK_NAND_H */
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0013-AM3517-Add-SPL-support.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0013-AM3517-Add-SPL-support.patch
> new file mode 100644
> index 0000000..cb9c1b2
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0013-AM3517-Add-SPL-support.patch
> @@ -0,0 +1,150 @@
> +=46rom aff5a412e0353407420ed63246ea630988ebf469 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:10 +0000
> +Subject: [PATCH 13/21] AM3517: Add SPL support
> +
> +The only change of note is that we move from 0x80008000 to 0x80100000
> +for CONFIG_SYS_TEXT_BASE
> +
> +Cc: Vaibhav Hiremath <hvaibhav@ti.com>
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + board/logicpd/am3517evm/am3517evm.c |    2 +-
> + board/logicpd/am3517evm/config.mk   |   30 ------------------
> + include/configs/am3517_evm.h        |   57 =
+++++++++++++++++++++++++++++++++-
> + 3 files changed, 56 insertions(+), 33 deletions(-)
> + delete mode 100644 board/logicpd/am3517evm/config.mk
> +
> +diff --git a/board/logicpd/am3517evm/am3517evm.c =
b/board/logicpd/am3517evm/am3517evm.c
> +index c0a006a..0a105bf 100644
> +--- a/board/logicpd/am3517evm/am3517evm.c
> ++++ b/board/logicpd/am3517evm/am3517evm.c
> +@@ -76,7 +76,7 @@ void set_muxconf_regs(void)
> + 	MUX_AM3517EVM();
> + }
> +=20
> +-#ifdef CONFIG_GENERIC_MMC
> ++#if defined(CONFIG_GENERIC_MMC) && !defined(CONFIG_SPL_BUILD)
> + int board_mmc_init(bd_t *bis)
> + {
> +        omap_mmc_init(0);
> +diff --git a/board/logicpd/am3517evm/config.mk =
b/board/logicpd/am3517evm/config.mk
> +deleted file mode 100644
> +index 71ec5d0..0000000
> +--- a/board/logicpd/am3517evm/config.mk
> ++++ /dev/null
> +@@ -1,30 +0,0 @@
> +-#
> +-# Author: Vaibhav Hiremath <hvaibhav@ti.com>
> +-#
> +-# Based on ti/evm/config.mk
> +-#
> +-# Copyright (C) 2010
> +-# Texas Instruments Incorporated - http://www.ti.com/
> +-#
> +-# This program is free software; you can redistribute it and/or =
modify
> +-# it under the terms of the GNU General Public License as published =
by
> +-# the Free Software Foundation; either version 2 of the License, or
> +-# (at your option) any later version.
> +-#
> +-# This program is distributed in the hope that it will be useful,
> +-# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-# GNU General Public License for more details.
> +-#
> +-# You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write to the Free Software
> +-# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> +-#
> +-# Physical Address:
> +-# 8000'0000 (bank0)
> +-# A000/0000 (bank1)
> +-# Linux-Kernel is expected to be at 8000'8000, entry 8000'8000
> +-# (mem base + reserved)
> +-
> +-# For use with external or internal boots.
> +-CONFIG_SYS_TEXT_BASE =3D 0x80008000
> +diff --git a/include/configs/am3517_evm.h =
b/include/configs/am3517_evm.h
> +index 1c70b9d..4a1c72c 100644
> +--- a/include/configs/am3517_evm.h
> ++++ b/include/configs/am3517_evm.h
> +@@ -63,7 +63,6 @@
> + /*
> +  * DDR related
> +  */
> +-#define CONFIG_OMAP3_MICRON_DDR		1	/* Micron DDR */
> + #define CONFIG_SYS_CS0_SIZE		(256 * 1024 * 1024)
> +=20
> + /*
> +@@ -273,7 +272,6 @@
> +  */
> + #define CONFIG_NR_DRAM_BANKS	2	/* CS1 may or may not be =
populated */
> + #define PHYS_SDRAM_1		OMAP34XX_SDRC_CS0
> +-#define PHYS_SDRAM_1_SIZE	(32 << 20)	/* at least 32 MiB */
> + #define PHYS_SDRAM_2		OMAP34XX_SDRC_CS1
> +=20
> + /* SDRAM Bank Allocation method */
> +@@ -331,4 +329,59 @@
> + #define CONFIG_SYS_INIT_SP_ADDR		=
(CONFIG_SYS_INIT_RAM_ADDR + \
> + 					 CONFIG_SYS_INIT_RAM_SIZE - \
> + 					 GENERATED_GBL_DATA_SIZE)
> ++
> ++/* Defines for SPL */
> ++#define CONFIG_SPL
> ++#define CONFIG_SPL_NAND_SIMPLE
> ++#define CONFIG_SPL_TEXT_BASE		0x40200800
> ++#define CONFIG_SPL_MAX_SIZE		(45 * 1024)
> ++#define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
> ++
> ++#define CONFIG_SPL_BSS_START_ADDR	0x80000000
> ++#define CONFIG_SPL_BSS_MAX_SIZE		0x80000		/* 512 =
KB */
> ++
> ++#define CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR	0x300 /* address =
0x60000 */
> ++#define CONFIG_SYS_U_BOOT_MAX_SIZE_SECTORS	0x200 /* 256 KB */
> ++#define CONFIG_SYS_MMC_SD_FAT_BOOT_PARTITION	1
> ++#define CONFIG_SPL_FAT_LOAD_PAYLOAD_NAME	"u-boot.img"
> ++
> ++#define CONFIG_SPL_LIBCOMMON_SUPPORT
> ++#define CONFIG_SPL_LIBDISK_SUPPORT
> ++#define CONFIG_SPL_I2C_SUPPORT
> ++#define CONFIG_SPL_LIBGENERIC_SUPPORT
> ++#define CONFIG_SPL_MMC_SUPPORT
> ++#define CONFIG_SPL_FAT_SUPPORT
> ++#define CONFIG_SPL_SERIAL_SUPPORT
> ++#define CONFIG_SPL_NAND_SUPPORT
> ++#define CONFIG_SPL_POWER_SUPPORT
> ++#define CONFIG_SPL_LDSCRIPT		=
"$(CPUDIR)/omap-common/u-boot-spl.lds"
> ++
> ++/* NAND boot config */
> ++#define CONFIG_SYS_NAND_5_ADDR_CYCLE
> ++#define CONFIG_SYS_NAND_PAGE_COUNT	64
> ++#define CONFIG_SYS_NAND_PAGE_SIZE	2048
> ++#define CONFIG_SYS_NAND_OOBSIZE		64
> ++#define CONFIG_SYS_NAND_BLOCK_SIZE	(128*1024)
> ++#define CONFIG_SYS_NAND_BAD_BLOCK_POS	NAND_LARGE_BADBLOCK_POS
> ++#define CONFIG_SYS_NAND_ECCPOS		{2, 3, 4, 5, 6, 7, 8, =
9,\
> ++						10, 11, 12, 13}
> ++#define CONFIG_SYS_NAND_ECCSIZE		512
> ++#define CONFIG_SYS_NAND_ECCBYTES	3
> ++#define CONFIG_SYS_NAND_ECCSTEPS	(CONFIG_SYS_NAND_PAGE_SIZE / \
> ++						CONFIG_SYS_NAND_ECCSIZE)
> ++#define CONFIG_SYS_NAND_ECCTOTAL	(CONFIG_SYS_NAND_ECCBYTES * \
> ++						=
CONFIG_SYS_NAND_ECCSTEPS)
> ++#define CONFIG_SYS_NAND_U_BOOT_START	CONFIG_SYS_TEXT_BASE
> ++#define CONFIG_SYS_NAND_U_BOOT_OFFS	0x80000
> ++
> ++/*
> ++ * 1MB into the SDRAM to allow for SPL's bss at the beginning of =
SDRAM
> ++ * 64 bytes before this address should be set aside for u-boot.img's
> ++ * header. That is 0x800FFFC0--0x80100000 should not be used for any
> ++ * other needs.
> ++ */
> ++#define CONFIG_SYS_TEXT_BASE		0x80100000
> ++#define CONFIG_SYS_SPL_MALLOC_START	0x80208000
> ++#define CONFIG_SYS_SPL_MALLOC_SIZE	0x100000
> ++
> + #endif /* __CONFIG_H */
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0014-AM3517-CraneBoard-Add-SPL-support=
.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0014-AM3517-CraneBoard-Add-SPL-support=
.patch
> new file mode 100644
> index 0000000..22a3e71
> --- /dev/null
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0014-AM3517-CraneBoard-Add-SPL-support=
.patch
> @@ -0,0 +1,150 @@
> +=46rom 04567bb3a9e3b8aefe2a58c339c592c4b62b79d3 Mon Sep 17 00:00:00 =
2001
> +From: Tom Rini <trini@ti.com>
> +Date: Fri, 18 Nov 2011 12:48:11 +0000
> +Subject: [PATCH 14/21] AM3517 CraneBoard: Add SPL support
> +
> +The only change of note is that we move from 0x80008000 to 0x80100000
> +for CONFIG_SYS_TEXT_BASE
> +
> +Cc: Nagendra T S <nagendra@mistralsolutions.com>
> +Tested-by: Koen Kooi <k-kooi@ti.com>
> +Signed-off-by: Tom Rini <trini@ti.com>
> +Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> +---
> + board/ti/am3517crane/am3517crane.c |    2 +-
> + board/ti/am3517crane/config.mk     |   29 ------------------
> + include/configs/am3517_crane.h     |   57 =
++++++++++++++++++++++++++++++++++-
> + 3 files changed, 56 insertions(+), 32 deletions(-)
> + delete mode 100644 board/ti/am3517crane/config.mk
> +
> +diff --git a/board/ti/am3517crane/am3517crane.c =
b/board/ti/am3517crane/am3517crane.c
> +index cd5683d..436645a 100644
> +--- a/board/ti/am3517crane/am3517crane.c
> ++++ b/board/ti/am3517crane/am3517crane.c
> +@@ -75,7 +75,7 @@ void set_muxconf_regs(void)
> + 	MUX_AM3517CRANE();
> + }
> +=20
> +-#ifdef CONFIG_GENERIC_MMC
> ++#if defined(CONFIG_GENERIC_MMC) && !defined(CONFIG_SPL_BUILD)
> + int board_mmc_init(bd_t *bis)
> + {
> + 	omap_mmc_init(0);
> +diff --git a/board/ti/am3517crane/config.mk =
b/board/ti/am3517crane/config.mk
> +deleted file mode 100644
> +index c6a18b5..0000000
> +--- a/board/ti/am3517crane/config.mk
> ++++ /dev/null
> +@@ -1,29 +0,0 @@
> +-#
> +-# Author: Srinath R <srinath@mistralsolutions.com>
> +-#
> +-# Based on logicpd/am3517evm/config.mk
> +-#
> +-# Copyright (C) 2011 Mistral Solutions Pvt Ltd
> +-#
> +-# This program is free software; you can redistribute it and/or =
modify
> +-# it under the terms of the GNU General Public License as published =
by
> +-# the Free Software Foundation; either version 2 of the License, or
> +-# (at your option) any later version.
> +-#
> +-# This program is distributed in the hope that it will be useful,
> +-# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +-# GNU General Public License for more details.
> +-#
> +-# You should have received a copy of the GNU General Public License
> +-# along with this program; if not, write to the Free Software
> +-# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
> +-#
> +-# Physical Address:
> +-# 8000'0000 (bank0)
> +-# A000/0000 (bank1)
> +-# Linux-Kernel is expected to be at 8000'8000, entry 8000'8000
> +-# (mem base + reserved)
> +-
> +-# For use with external or internal boots.
> +-CONFIG_SYS_TEXT_BASE =3D 0x80008000
> +diff --git a/include/configs/am3517_crane.h =
b/include/configs/am3517_crane.h
> +index 8842a18..68cbf37 100644
> +--- a/include/configs/am3517_crane.h
> ++++ b/include/configs/am3517_crane.h
> +@@ -64,7 +64,6 @@
> + /*
> +  * DDR related
> +  */
> +-#define CONFIG_OMAP3_MICRON_DDR		1	/* Micron DDR */
> + #define CONFIG_SYS_CS0_SIZE		(256 * 1024 * 1024)
> +=20
> + /*
> +@@ -274,7 +273,6 @@
> +  */
> + #define CONFIG_NR_DRAM_BANKS	2	/* CS1 may or may not be =
populated */
> + #define PHYS_SDRAM_1		OMAP34XX_SDRC_CS0
> +-#define PHYS_SDRAM_1_SIZE	(32 << 20)	/* at least 32 MiB */
> + #define PHYS_SDRAM_2		OMAP34XX_SDRC_CS1
> +=20
> + /* SDRAM Bank Allocation method */
> +@@ -330,4 +328,59 @@
> + #define CONFIG_SYS_INIT_SP_ADDR		=
(CONFIG_SYS_INIT_RAM_ADDR + \
> + 					 CONFIG_SYS_INIT_RAM_SIZE - \
> + 					 GENERATED_GBL_DATA_SIZE)
> ++
> ++/* Defines for SPL */
> ++#define CONFIG_SPL
> ++#define CONFIG_SPL_NAND_SIMPLE
> ++#define CONFIG_SPL_TEXT_BASE		0x40200800
> ++#define CONFIG_SPL_MAX_SIZE		(45 * 1024)
> ++#define CONFIG_SPL_STACK		LOW_LEVEL_SRAM_STACK
> ++
> ++#define CONFIG_SPL_BSS_START_ADDR	0x80000000
> ++#define CONFIG_SPL_BSS_MAX_SIZE		0x80000		/* 512 =
KB */
> ++
> ++#define CONFIG_SYS_MMCSD_RAW_MODE_U_BOOT_SECTOR	0x300 /* address =
0x60000 */
> ++#define CONFIG_SYS_U_BOOT_MAX_SIZE_SECTORS	0x200 /* 256 KB */
> ++#define CONFIG_SYS_MMC_SD_FAT_BOOT_PARTITION	1
> ++#define CONFIG_SPL_FAT_LOAD_PAYLOAD_NAME	"u-boot.img"
> ++
> ++#define CONFIG_SPL_LIBCOMMON_SUPPORT
> ++#define CONFIG_SPL_LIBDISK_SUPPORT
> ++#define CONFIG_SPL_I2C_SUPPORT
> ++#define CONFIG_SPL_LIBGENERIC_SUPPORT
> ++#define CONFIG_SPL_MMC_SUPPORT
> ++#define CONFIG_SPL_FAT_SUPPORT
> ++#define CONFIG_SPL_SERIAL_SUPPORT
> ++#define CONFIG_SPL_NAND_SUPPORT
> ++#define CONFIG_SPL_POWER_SUPPORT
> ++#define CONFIG_SPL_LDSCRIPT		=
"$(CPUDIR)/omap-common/u-boot-spl.lds"
> ++
> ++/* NAND boot config */
> ++#define CONFIG_SYS_NAND_5_ADDR_CYCLE
> ++#define CONFIG_SYS_NAND_PAGE_COUNT	64
> ++#define CONFIG_SYS_NAND_PAGE_SIZE	2048
> ++#define CONFIG_SYS_NAND_OOBSIZE		64
> ++#define CONFIG_SYS_NAND_BLOCK_SIZE	(128*1024)
> ++#define CONFIG_SYS_NAND_BAD_BLOCK_POS	NAND_LARGE_BADBLOCK_POS
> ++#define CONFIG_SYS_NAND_ECCPOS		{2, 3, 4, 5, 6, 7, 8, =
9,\
> ++						10, 11, 12, 13}
> ++#define CONFIG_SYS_NAND_ECCSIZE		512
> ++#define CONFIG_SYS_NAND_ECCBYTES	3
> ++#define CONFIG_SYS_NAND_ECCSTEPS	(CONFIG_SYS_NAND_PAGE_SIZE / \
> ++						CONFIG_SYS_NAND_ECCSIZE)
> ++#define CONFIG_SYS_NAND_ECCTOTAL	(CONFIG_SYS_NAND_ECCBYTES * \
> ++						=
CONFIG_SYS_NAND_ECCSTEPS)
> ++#define CONFIG_SYS_NAND_U_BOOT_START	CONFIG_SYS_TEXT_BASE
> ++#define CONFIG_SYS_NAND_U_BOOT_OFFS	0x80000
> ++
> ++/*
> ++ * 1MB into the SDRAM to allow for SPL's bss at the beginning of =
SDRAM
> ++ * 64 bytes before this address should be set aside for u-boot.img's
> ++ * header. That is 0x800FFFC0--0x80100000 should not be used for any
> ++ * other needs.
> ++ */
> ++#define CONFIG_SYS_TEXT_BASE		0x80100000
> ++#define CONFIG_SYS_SPL_MALLOC_START	0x80208000
> ++#define CONFIG_SYS_SPL_MALLOC_SIZE	0x100000
> ++
> + #endif /* __CONFIG_H */
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-HACK-beagleboard-config-disable-c=
ache-for-USB.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0015-HACK-beagleboard-config-disable-c=
ache-for-USB.patch
> similarity index 75%
> rename from =
recipes-bsp/u-boot/u-boot/2011.09/0001-HACK-beagleboard-config-disable-cac=
he-for-USB.patch
> rename to =
recipes-bsp/u-boot/u-boot/2011.09/0015-HACK-beagleboard-config-disable-cac=
he-for-USB.patch
> index a2776e9..ec1ec26 100644
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-HACK-beagleboard-config-disable-c=
ache-for-USB.patch
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0015-HACK-beagleboard-config-disable-c=
ache-for-USB.patch
> @@ -1,7 +1,7 @@
> -=46rom 03b9bca863257cb24d8f11bb773ad2b8dff820c6 Mon Sep 17 00:00:00 =
2001
> +=46rom 3fe471d34ef6575bc49c9f85ed74368e3ac25ad6 Mon Sep 17 00:00:00 =
2001
> From: Jason Kridner <jdk@ti.com>
> Date: Sun, 18 Sep 2011 12:16:31 -0400
> -Subject: [PATCH 1/3] HACK: beagleboard: config: disable cache for USB
> +Subject: [PATCH 15/21] HACK: beagleboard: config: disable cache for =
USB
>=20
> There is currently a bug in the USB code for the BeagleBoard that is
> worked-around by disabling the cache.
> @@ -10,11 +10,11 @@ See =
http://comments.gmane.org/gmane.comp.boot-loaders.u-boot/108224
>=20
> Signed-off-by: Jason Kridner <jdk@ti.com>
> ---
> - include/configs/omap3_beagle.h |    5 +++++
> - 1 files changed, 5 insertions(+), 0 deletions(-)
> + include/configs/omap3_beagle.h |    4 ++++
> + 1 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/include/configs/omap3_beagle.h =
b/include/configs/omap3_beagle.h
> -index 1369c89..8a84d7a 100644
> +index 941ec38..569d747 100644
> --- a/include/configs/omap3_beagle.h
> +++ b/include/configs/omap3_beagle.h
> @@ -36,6 +36,10 @@
> @@ -29,5 +29,5 @@ index 1369c89..8a84d7a 100644
>=20
>  #include <asm/arch/cpu.h>		/* get chip and board defs */
> --=20
> -1.7.4.1
> +1.7.2.5
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0002-beagleboard-config-enable-gpio-co=
mmand.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0016-beagleboard-config-enable-gpio-co=
mmand.patch
> similarity index 77%
> rename from =
recipes-bsp/u-boot/u-boot/2011.09/0002-beagleboard-config-enable-gpio-comm=
and.patch
> rename to =
recipes-bsp/u-boot/u-boot/2011.09/0016-beagleboard-config-enable-gpio-comm=
and.patch
> index 096a1ce..268932b 100644
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0002-beagleboard-config-enable-gpio-co=
mmand.patch
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0016-beagleboard-config-enable-gpio-co=
mmand.patch
> @@ -1,7 +1,7 @@
> -=46rom 79e8280783d445f7630b8a9830f8db73f2e04828 Mon Sep 17 00:00:00 =
2001
> +=46rom e5bf80f2fb4af9a2627541cb8bc8686e8a9e8404 Mon Sep 17 00:00:00 =
2001
> From: Jason Kridner <jdk@ti.com>
> Date: Tue, 6 Sep 2011 18:56:11 -0400
> -Subject: [PATCH 2/3] beagleboard: config: enable gpio command
> +Subject: [PATCH 16/21] beagleboard: config: enable gpio command
>=20
> Now that we are using the generic GPIO framework, enable the command.
> ---
> @@ -9,10 +9,10 @@ Now that we are using the generic GPIO framework, =
enable the command.
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/include/configs/omap3_beagle.h =
b/include/configs/omap3_beagle.h
> -index 8a84d7a..43dc94a 100644
> +index 569d747..337ca29 100644
> --- a/include/configs/omap3_beagle.h
> +++ b/include/configs/omap3_beagle.h
> -@@ -169,6 +169,7 @@
> +@@ -164,6 +164,7 @@
>  #define CONFIG_CMD_PING
>  #define CONFIG_CMD_DHCP
>  #define CONFIG_CMD_SETEXPR	/* Evaluate expressions		*/
> @@ -21,5 +21,5 @@ index 8a84d7a..43dc94a 100644
>  #undef CONFIG_CMD_FLASH		/* flinfo, erase, protect	=
*/
>  #undef CONFIG_CMD_FPGA		/* FPGA configuration Support	=
*/
> --=20
> -1.7.4.1
> +1.7.2.5
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0003-Increased-some-timeout-durations-=
for-MMC-and-EHCI.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0017-Increased-some-timeout-durations-=
for-MMC-and-EHCI.patch
> similarity index 72%
> rename from =
recipes-bsp/u-boot/u-boot/2011.09/0003-Increased-some-timeout-durations-fo=
r-MMC-and-EHCI.patch
> rename to =
recipes-bsp/u-boot/u-boot/2011.09/0017-Increased-some-timeout-durations-fo=
r-MMC-and-EHCI.patch
> index c3ebf1b..9aeb548 100644
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0003-Increased-some-timeout-durations-=
for-MMC-and-EHCI.patch
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0017-Increased-some-timeout-durations-=
for-MMC-and-EHCI.patch
> @@ -1,7 +1,7 @@
> -=46rom 316e3a4573bdbbbc395baeca4f7b2208707e30fa Mon Sep 17 00:00:00 =
2001
> +=46rom 7ba57c9e6372c067609797cbac53f8a14691fc2d Mon Sep 17 00:00:00 =
2001
> From: Jason Kridner <jdk@ti.com>
> Date: Wed, 7 Sep 2011 08:56:48 -0400
> -Subject: [PATCH 3/3] Increased some timeout durations for MMC and =
EHCI
> +Subject: [PATCH 17/21] Increased some timeout durations for MMC and =
EHCI
>=20
> ---
>  drivers/mmc/omap_hsmmc.c |    2 +-
> @@ -9,18 +9,18 @@ Subject: [PATCH 3/3] Increased some timeout =
durations for MMC and EHCI
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mmc/omap_hsmmc.c b/drivers/mmc/omap_hsmmc.c
> -index ef12ecd..7e35372 100644
> +index c38b9e6..5054a21 100644
> --- a/drivers/mmc/omap_hsmmc.c
> +++ b/drivers/mmc/omap_hsmmc.c
> -@@ -33,7 +33,7 @@
> +@@ -34,7 +34,7 @@
>  #include <asm/arch/sys_proto.h>
>=20
>  /* If we fail after 1 second wait, something is really bad */
> -#define MAX_RETRY_MS	1000
> +#define MAX_RETRY_MS	5000
>=20
> - static int mmc_read_data(hsmmc_t *mmc_base, char *buf, unsigned int =
size);
> - static int mmc_write_data(hsmmc_t *mmc_base, const char *buf, =
unsigned int siz);
> + static int mmc_read_data(struct hsmmc *mmc_base, char *buf, unsigned =
int size);
> + static int mmc_write_data(struct hsmmc *mmc_base, const char *buf,
> diff --git a/include/usb.h b/include/usb.h
> index 06170cd..0d99b92 100644
> --- a/include/usb.h
> @@ -35,5 +35,5 @@ index 06170cd..0d99b92 100644
>  /* device request (setup) */
>  struct devrequest {
> --=20
> -1.7.4.1
> +1.7.2.5
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0003-beagleboard-mount-rootfs-RO-inste=
ad-of-RW-at-boot.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0018-beagleboard-mount-rootfs-RO-inste=
ad-of-RW-at-boot.patch
> similarity index 64%
> rename from =
recipes-bsp/u-boot/u-boot/2011.09/0003-beagleboard-mount-rootfs-RO-instead=
-of-RW-at-boot.patch
> rename to =
recipes-bsp/u-boot/u-boot/2011.09/0018-beagleboard-mount-rootfs-RO-instead=
-of-RW-at-boot.patch
> index 3c6743e..b571a4e 100644
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0003-beagleboard-mount-rootfs-RO-inste=
ad-of-RW-at-boot.patch
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0018-beagleboard-mount-rootfs-RO-inste=
ad-of-RW-at-boot.patch
> @@ -1,7 +1,7 @@
> -=46rom 78080b20d8daa8e80f962beeab898d171bcc8eac Mon Sep 17 00:00:00 =
2001
> +=46rom daa9fa5f66a1b370072f1e91fd51c6a5e3d81fd8 Mon Sep 17 00:00:00 =
2001
> From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Sun, 16 Oct 2011 09:37:38 +0200
> -Subject: [PATCH 3/3] beagleboard: mount rootfs RO instead of RW at =
boot
> +Date: Sun, 27 Nov 2011 14:43:58 +0100
> +Subject: [PATCH 18/21] beagleboard: mount rootfs RO instead of RW at =
boot
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> @@ -9,18 +9,18 @@ Signed-off-by: Koen Kooi =
<koen@dominion.thruhere.net>
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/include/configs/omap3_beagle.h =
b/include/configs/omap3_beagle.h
> -index a67e5a0..95a134b 100644
> +index 337ca29..186586f 100644
> --- a/include/configs/omap3_beagle.h
> +++ b/include/configs/omap3_beagle.h
> -@@ -231,7 +231,7 @@
> +@@ -226,7 +226,7 @@
>  	"dvimode=3D640x480MR-16@60\0" \
>  	"defaultdisplay=3Ddvi\0" \
>  	"mmcdev=3D0\0" \
> -	"mmcroot=3D/dev/mmcblk0p2 rw\0" \
> +	"mmcroot=3D/dev/mmcblk0p2 ro\0" \
>  	"mmcrootfstype=3Dext3 rootwait\0" \
> - 	"nandroot=3D/dev/mtdblock4 rw\0" \
> - 	"nandrootfstype=3Djffs2\0" \
> + 	"nandroot=3Dubi0:rootfs ubi.mtd=3D4\0" \
> + 	"nandrootfstype=3Dubifs\0" \
> --=20
> -1.6.6.1
> +1.7.2.5
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0002-beagleboard-switch-to-ttyO2.patch=
 =
b/recipes-bsp/u-boot/u-boot/2011.09/0019-BeagleBoard-config-Really-switch-=
to-ttyO2.patch
> similarity index 57%
> rename from =
recipes-bsp/u-boot/u-boot/2011.09/0002-beagleboard-switch-to-ttyO2.patch
> rename to =
recipes-bsp/u-boot/u-boot/2011.09/0019-BeagleBoard-config-Really-switch-to=
-ttyO2.patch
> index bc7cf06..1d21612 100644
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0002-beagleboard-switch-to-ttyO2.patch=

> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0019-BeagleBoard-config-Really-switch-=
to-ttyO2.patch
> @@ -1,7 +1,9 @@
> -=46rom d901c32c1bd9343a932f8bdd96f3ec539407b42b Mon Sep 17 00:00:00 =
2001
> +=46rom ceb3c55ff226f068edb369342e3bd2db70ca8827 Mon Sep 17 00:00:00 =
2001
> From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Tue, 11 Oct 2011 13:53:21 +0200
> -Subject: [PATCH 2/2] beagleboard: switch to ttyO2
> +Date: Sun, 27 Nov 2011 14:46:04 +0100
> +Subject: [PATCH 19/21] BeagleBoard: config: Really switch to ttyO2
> +
> +The previous commit changed it to "zero two" instead of the proper =
"Oh two". This was completely broken!
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> @@ -9,18 +11,18 @@ Signed-off-by: Koen Kooi =
<koen@dominion.thruhere.net>
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/include/configs/omap3_beagle.h =
b/include/configs/omap3_beagle.h
> -index 23f19f6..04c2188 100644
> +index 186586f..833f86a 100644
> --- a/include/configs/omap3_beagle.h
> +++ b/include/configs/omap3_beagle.h
> -@@ -220,7 +220,7 @@
> +@@ -217,7 +217,7 @@
>  	"rdaddr=3D0x81000000\0" \
>  	"usbtty=3Dcdc_acm\0" \
>  	"bootfile=3DuImage.beagle\0" \
> --	"console=3DttyS2,115200n8\0" \
> +-	"console=3Dtty02,115200n8\0" \
> +	"console=3DttyO2,115200n8\0" \
>  	"mpurate=3Dauto\0" \
>  	"buddy=3Dnone "\
> - 	"buddy2=3Dnone "\
> + 	"optargs=3D\0" \
> --=20
> -1.6.6.1
> +1.7.2.5
>=20
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-add-support-for-TCT-B=
eacon-board.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0020-beagleboard-add-support-for-TCT-B=
eacon-board.patch
> similarity index 81%
> rename from =
recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-add-support-for-TCT-Bea=
con-board.patch
> rename to =
recipes-bsp/u-boot/u-boot/2011.09/0020-beagleboard-add-support-for-TCT-Bea=
con-board.patch
> index 819c623..39c2a36 100644
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-add-support-for-TCT-B=
eacon-board.patch
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0020-beagleboard-add-support-for-TCT-B=
eacon-board.patch
> @@ -1,20 +1,19 @@
> -=46rom f6ce74793e6341895153e43643460b7fc812dc9d Mon Sep 17 00:00:00 =
2001
> +=46rom e368b3cc2b281146c7848a2044e8a7d457ea1e38 Mon Sep 17 00:00:00 =
2001
> From: Koen Kooi <koen@dominion.thruhere.net>
> Date: Sat, 8 Oct 2011 21:56:35 +0200
> -Subject: [PATCH] beagleboard: add support for TCT Beacon board
> +Subject: [PATCH 20/21] beagleboard: add support for TCT Beacon board
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> - board/ti/beagle/beagle.c       |   59 =
++++++++++++++++++++++++++++++++++++++++
> - board/ti/beagle/beagle.h       |    7 +++++
> - include/configs/omap3_beagle.h |    7 +++++
> - 3 files changed, 73 insertions(+), 0 deletions(-)
> + board/ti/beagle/beagle.c |   10 ++++++++++
> + board/ti/beagle/beagle.h |    7 +++++++
> + 2 files changed, 17 insertions(+), 0 deletions(-)
>=20
> diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
> -index 8cdceaf..f4e986c 100644
> +index 6a457cb..9c2e6d0 100644
> --- a/board/ti/beagle/beagle.c
> +++ b/board/ti/beagle/beagle.c
> -@@ -57,11 +57,14 @@ extern volatile struct ehci_hcor *hcor;
> +@@ -59,11 +59,14 @@ extern volatile struct ehci_hcor *hcor;
>  #define TWL4030_I2C_BUS			0
>  #define EXPANSION_EEPROM_I2C_BUS	1
>  #define EXPANSION_EEPROM_I2C_ADDRESS	0x50
> @@ -29,7 +28,7 @@ index 8cdceaf..f4e986c 100644
>  #define KBADC_BEAGLEFPGA		0x01000600
>  #define LW_BEAGLETOUCH			0x01000700
>  #define BRAINMUX_LCDOG			0x01000800
> -@@ -290,6 +331,13 @@ int misc_init_r(void)
> +@@ -351,6 +354,13 @@ int misc_init_r(void)
>  		setenv("defaultdisplay", "showdoglcd");
>  		setenv("buddy", "showdog");
>  		break;
> @@ -61,3 +60,6 @@ index 18bfaa8..6a9ad73 100644
>  #define MUX_KBADC_BEAGLEFPGA() \
>  	MUX_VAL(CP(MCBSP1_CLKR),    (IEN  | PTU | DIS | M1)) =
/*MCSPI4_CLK*/\
>  	MUX_VAL(CP(MCBSP1_DX),      (IDIS | PTU | DIS | M1)) =
/*MCSPI4_SIMO*/\
> +--=20
> +1.7.2.5
> +
> diff --git =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-add-support-for-scann=
ing-loop-through-ex.patch =
b/recipes-bsp/u-boot/u-boot/2011.09/0021-beagleboard-add-support-for-scann=
ing-loop-through-ex.patch
> similarity index 83%
> rename from =
recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-add-support-for-scannin=
g-loop-through-ex.patch
> rename to =
recipes-bsp/u-boot/u-boot/2011.09/0021-beagleboard-add-support-for-scannin=
g-loop-through-ex.patch
> index fdd6200..a2df7ca 100644
> --- =
a/recipes-bsp/u-boot/u-boot/2011.09/0001-beagleboard-add-support-for-scann=
ing-loop-through-ex.patch
> +++ =
b/recipes-bsp/u-boot/u-boot/2011.09/0021-beagleboard-add-support-for-scann=
ing-loop-through-ex.patch
> @@ -1,7 +1,7 @@
> -=46rom d6dd7efc7a74e6bdcbcbda204f66d4ad23fd0f53 Mon Sep 17 00:00:00 =
2001
> +=46rom 78fd05bd746f623de3150469a9f6f4e9531a17c4 Mon Sep 17 00:00:00 =
2001
> From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Tue, 11 Oct 2011 13:05:32 +0200
> -Subject: [PATCH 1/2] beagleboard: add support for scanning =
loop-through expansionboards like the uLCD-lite
> +Date: Sun, 27 Nov 2011 14:53:56 +0100
> +Subject: [PATCH 21/21] beagleboard: add support for scanning =
loop-through expansionboards like the uLCD-lite
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> @@ -10,10 +10,10 @@ Signed-off-by: Koen Kooi =
<koen@dominion.thruhere.net>
>  2 files changed, 28 insertions(+), 4 deletions(-)
>=20
> diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
> -index 96fac51..51a90a0 100644
> +index 9c2e6d0..5ea50d1 100644
> --- a/board/ti/beagle/beagle.c
> +++ b/board/ti/beagle/beagle.c
> -@@ -72,6 +72,7 @@ extern volatile struct ehci_hcor *hcor;
> +@@ -74,6 +74,7 @@ extern volatile struct ehci_hcor *hcor;
>  #define BBTOYS_WIFI			0x01000B00
>  #define BBTOYS_VGA			0x02000B00
>  #define BBTOYS_LCD			0x03000B00
> @@ -21,7 +21,7 @@ index 96fac51..51a90a0 100644
>  #define BEAGLE_NO_EEPROM		0xffffffff
>=20
>  DECLARE_GLOBAL_DATA_PTR;
> -@@ -148,18 +149,18 @@ int get_board_revision(void)
> +@@ -209,18 +210,18 @@ void get_board_mem_timings(u32 *mcfg, u32 =
*ctrla, u32 *ctrlb, u32 *rfr_ctrl,
>   *		bus 1 for the availability of an AT24C01B serial EEPROM.
>   *		returns the device_vendor field from the EEPROM
>   */
> @@ -43,7 +43,7 @@ index 96fac51..51a90a0 100644
>  		 sizeof(expansion_config));
>=20
>  	i2c_set_bus_num(TWL4030_I2C_BUS);
> -@@ -262,7 +263,7 @@ int misc_init_r(void)
> +@@ -323,7 +324,7 @@ int misc_init_r(void)
>  					TWL4030_PM_RECEIVER_DEV_GRP_P1);
>  	}
>=20
> @@ -52,7 +52,7 @@ index 96fac51..51a90a0 100644
>  	case TINCANTOOLS_ZIPPY:
>  		printf("Recognized Tincantools Zippy board (rev %d =
%s)\n",
>  			expansion_config.revision,
> -@@ -341,6 +342,27 @@ int misc_init_r(void)
> +@@ -402,6 +403,27 @@ int misc_init_r(void)
>  	if (expansion_config.content =3D=3D 1)
>  		setenv(expansion_config.env_var, =
expansion_config.env_setting);
>=20
> @@ -81,18 +81,18 @@ index 96fac51..51a90a0 100644
>  	switch (get_board_revision()) {
>  	case REVISION_XM_A:
> diff --git a/include/configs/omap3_beagle.h =
b/include/configs/omap3_beagle.h
> -index dbe682a..23f19f6 100644
> +index 833f86a..1cc46dc 100644
> --- a/include/configs/omap3_beagle.h
> +++ b/include/configs/omap3_beagle.h
> -@@ -223,6 +223,7 @@
> - 	"console=3DttyS2,115200n8\0" \
> +@@ -220,6 +220,7 @@
> + 	"console=3DttyO2,115200n8\0" \
>  	"mpurate=3Dauto\0" \
>  	"buddy=3Dnone "\
> +	"buddy2=3Dnone "\
>  	"optargs=3D\0" \
>  	"camera=3Dnone\0" \
>  	"vram=3D12M\0" \
> -@@ -239,6 +240,7 @@
> +@@ -236,6 +237,7 @@
>  		"${optargs} " \
>  		"mpurate=3D${mpurate} " \
>  		"buddy=3D${buddy} "\
> @@ -101,5 +101,5 @@ index dbe682a..23f19f6 100644
>  		"vram=3D${vram} " \
>  		"omapfb.mode=3Ddvi:${dvimode} " \
> --=20
> -1.6.6.1
> +1.7.2.5
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb =
b/recipes-bsp/u-boot/u-boot_2011.09.bb
> index 8eef7c7..74c8518 100644
> --- a/recipes-bsp/u-boot/u-boot_2011.09.bb
> +++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
> @@ -1,22 +1,41 @@
> require u-boot.inc
>=20
> -PR =3D "r4"
> +PR =3D "r5"
> +
> +# SPL build
> +UBOOT_BINARY =3D "u-boot.img"
> +UBOOT_IMAGE =3D "u-boot-${MACHINE}-${PV}-${PR}.img"
> +UBOOT_SYMLINK =3D "u-boot-${MACHINE}.img"
>=20
> # No patches for other machines yet
> COMPATIBLE_MACHINE =3D "(beagleboard)"
>=20
> SRC_URI =3D "git://www.denx.de/git/u-boot.git;protocol=3Dgit \
> -           =
file://2011.09/0001-HACK-beagleboard-config-disable-cache-for-USB.patch =
\
> -           =
file://2011.09/0002-beagleboard-config-enable-gpio-command.patch \
> -           =
file://2011.09/0003-Increased-some-timeout-durations-for-MMC-and-EHCI.patc=
h \
> -           =
file://2011.09/0001-beagleboard-add-support-for-TCT-Beacon-board.patch \
> -           =
file://2011.09/0001-beagleboard-add-support-for-scanning-loop-through-ex.p=
atch \
> -           file://2011.09/0002-beagleboard-switch-to-ttyO2.patch \
> -           =
file://2011.09/0003-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patc=
h \
> +           =
file://2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_config-more.patch \
> +           =
file://2011.09/0002-OMAP3-Update-SDRC-dram_init-to-always-call-make_cs1_.p=
atch \
> +           =
file://2011.09/0003-OMAP3-Add-a-helper-function-to-set-timings-in-SDRC.pat=
ch \
> +           =
file://2011.09/0004-OMAP3-Change-mem_ok-to-clear-again-after-reading-bac.p=
atch \
> +           =
file://2011.09/0005-OMAP3-Remove-get_mem_type-prototype.patch \
> +           file://2011.09/0006-omap3-mem-Add-MCFG-helper-macro.patch =
\
> +           =
file://2011.09/0007-OMAP3-Add-optimal-SDRC-autorefresh-control-values.patc=
h \
> +           =
file://2011.09/0008-OMAP3-Suffix-all-Micron-memory-timing-parts-with-the.p=
atch \
> +           =
file://2011.09/0009-OMAP3-SPL-Rework-memory-initalization-and-devkit8000.p=
atch \
> +           =
file://2011.09/0010-OMAP3-SPL-Add-identify_nand_chip-function.patch \
> +           =
file://2011.09/0011-OMAP3-Add-SPL-support-to-Beagleboard.patch \
> +           =
file://2011.09/0012-OMAP3-Add-SPL-support-to-omap3_evm.patch \
> +           file://2011.09/0013-AM3517-Add-SPL-support.patch \
> +           =
file://2011.09/0014-AM3517-CraneBoard-Add-SPL-support.patch \
> +           =
file://2011.09/0015-HACK-beagleboard-config-disable-cache-for-USB.patch =
\
> +           =
file://2011.09/0016-beagleboard-config-enable-gpio-command.patch \
> +           =
file://2011.09/0017-Increased-some-timeout-durations-for-MMC-and-EHCI.patc=
h \
> +           =
file://2011.09/0018-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patc=
h \
> +           =
file://2011.09/0019-BeagleBoard-config-Really-switch-to-ttyO2.patch \
> +           =
file://2011.09/0020-beagleboard-add-support-for-TCT-Beacon-board.patch \
> +           =
file://2011.09/0021-beagleboard-add-support-for-scanning-loop-through-ex.p=
atch \
>            file://fw_env.config \
>           "
>=20
> -SRCREV =3D "1d5e7fb403257d62f0f2419cb83fdf6b0f02f215"
> +SRCREV =3D "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
>=20
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D1707d6db1d42237583f50183a5651ecb"
>=20
> --=20
> 1.7.2.5
>=20


--Apple-Mail=_A3883610-5028-4123-8F38-1E8418052FD2
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7Uzk4ACgkQMkyGM64RGpH7RQCfSzbdUMy9XLUsKnwf8VLt8tfY
uNsAoLNxbFM0dTIpU2qTjk8qI4Sw2XDz
=viVK
-----END PGP SIGNATURE-----

--Apple-Mail=_A3883610-5028-4123-8F38-1E8418052FD2--
