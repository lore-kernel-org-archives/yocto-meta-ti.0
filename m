Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4AE6E01376
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 21:15:26 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9O4FPMq027262
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9O4FPbp028471
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9O4FP2P002929
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sun, 23 Oct 2011 23:15:25 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9O4FLiv023860;	Sun, 23 Oct 2011 23:15:25 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 23 Oct 2011 22:59:22 -0500
Message-ID: <1319428763-9677-3-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
References: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: [PATCH meta-ti 2/3] linux-ti33x-psp 3.1rc8: Update to latest SRCREV, add EEPROM patches
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
X-List-Received-Date: Mon, 24 Oct 2011 04:15:27 -0000
Content-Type: text/plain

* Updated to latest SRCREV and bump PR.

Added following patches being submitted to PSP currently:
* EEPROM patches required to get EEPROM working correctly on BBB without
  breaking support for EVM.
* omap_mux_init_signal patch to safe guard against incorrectly setting up pinmux.

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 ...heck-return-value-of-omap_mux_init_signal.patch |   34 ++++++++++
 ...ility-to-dynamically-reconfigure-chip-inf.patch |   57 +++++++++++++++++
 ...econfigure-EEPROM-with-new-eeprom_info-in.patch |   65 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    7 ++-
 4 files changed, 161 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Check-return-value-of-omap_mux_init_signal.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0002-at24-Add-ability-to-dynamically-reconfigure-chip-inf.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0003-am335x-evm-Reconfigure-EEPROM-with-new-eeprom_info-in.patch

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Check-return-value-of-omap_mux_init_signal.patch b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Check-return-value-of-omap_mux_init_signal.patch
new file mode 100644
index 0000000..3ce2df8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Check-return-value-of-omap_mux_init_signal.patch
@@ -0,0 +1,34 @@
+From b11df2bf8e19b8a4d4e4bb6eae59fde6a1498920 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Wed, 19 Oct 2011 20:11:00 -0500
+Subject: [PATCH 1/3] am335x: Check return value of omap_mux_init_signal
+
+This helps guard against setting up pin muxmode incorrectly
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    8 +++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 187f758..f959d95 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -590,9 +590,11 @@ static void setup_pin_mux(struct pinmux_config *pin_mux)
+ {
+ 	int i;
+ 
+-	for (i = 0; pin_mux->string_name != NULL; pin_mux++)
+-		omap_mux_init_signal(pin_mux->string_name, pin_mux->val);
+-
++	for (i = 0; pin_mux->string_name != NULL; pin_mux++) {
++		if(omap_mux_init_signal(pin_mux->string_name, pin_mux->val) < 0) {
++			printk(KERN_ERR "Failed to setup pinmux for %s\n", pin_mux->string_name);
++		}
++	}
+ }
+ 
+ /*
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0002-at24-Add-ability-to-dynamically-reconfigure-chip-inf.patch b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0002-at24-Add-ability-to-dynamically-reconfigure-chip-inf.patch
new file mode 100644
index 0000000..5d0d580
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0002-at24-Add-ability-to-dynamically-reconfigure-chip-inf.patch
@@ -0,0 +1,57 @@
+From 8d0697f8962ef52e06012101efdea7713e0e5055 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Sat, 22 Oct 2011 12:56:44 -0500
+Subject: [PATCH 2/3] at24: Add ability to dynamically reconfigure chip information
+
+As some EEPROMs are used for board name detection, it is not possible to detect
+in advance which EEPROM type is connected without detecting the board first.
+
+In board-a335xevm.c, we use a trial and error approach and this requires for us
+to reconfigure the driver with a new 'eeprom_info' structure different from any
+earlier ones that were passed.
+
+We add new accessor functions to the at24 driver to help with this.
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ drivers/misc/eeprom/at24.c |   11 +++++++++++
+ include/linux/i2c/at24.h   |    3 +++
+ 2 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
+index ab1ad41..41ebc1f 100644
+--- a/drivers/misc/eeprom/at24.c
++++ b/drivers/misc/eeprom/at24.c
+@@ -456,6 +456,17 @@ static ssize_t at24_macc_write(struct memory_accessor *macc, const char *buf,
+ 	return at24_write(at24, buf, offset, count);
+ }
+ 
++struct at24_platform_data *at24_macc_getpdata(struct memory_accessor *macc)
++{
++	struct at24_data *at24 = container_of(macc, struct at24_data, macc);
++	return &at24->chip;
++}
++
++void at24_macc_setpdata(struct memory_accessor *macc, struct at24_platform_data *chip)
++{
++	struct at24_data *at24 = container_of(macc, struct at24_data, macc);
++	at24->chip = *chip;
++}
+ /*-------------------------------------------------------------------------*/
+ 
+ #ifdef CONFIG_OF
+diff --git a/include/linux/i2c/at24.h b/include/linux/i2c/at24.h
+index 8ace930..7872912 100644
+--- a/include/linux/i2c/at24.h
++++ b/include/linux/i2c/at24.h
+@@ -29,4 +29,7 @@ struct at24_platform_data {
+ 	void		*context;
+ };
+ 
++struct at24_platform_data *at24_macc_getpdata(struct memory_accessor *macc);
++void at24_macc_setpdata(struct memory_accessor *macc, struct at24_platform_data *chip);
++
+ #endif /* _LINUX_AT24_H */
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0003-am335x-evm-Reconfigure-EEPROM-with-new-eeprom_info-in.patch b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0003-am335x-evm-Reconfigure-EEPROM-with-new-eeprom_info-in.patch
new file mode 100644
index 0000000..9d3bb6e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0003-am335x-evm-Reconfigure-EEPROM-with-new-eeprom_info-in.patch
@@ -0,0 +1,65 @@
+From 18a4a980113f7b290c5694239b0e9b21fb7fe132 Mon Sep 17 00:00:00 2001
+From: Joel A Fernandes <joelagnel@ti.com>
+Date: Sat, 22 Oct 2011 13:03:08 -0500
+Subject: [PATCH 3/3] am335x-evm: Reconfigure EEPROM with new eeprom_info incase of failure
+
+The earlier bone boards have an 8-bit address capable EEPROM with 2kbit size
+and 16 byte page size. This is very different from the EEPROM on the AM335x
+EVM and causes problem when reading for board detection and other purposes.
+
+We first attempt a read with the original EEPROM settings and incase of an
+invalid header, we reconfigure the EEPROM driver with bone_eeprom_info and
+perform a restart of the setup function to reread all EEPROM data again this
+time with the correct EEPROM configuration.
+
+This patch is required to get EEPROM reading working correctly on bone board
+without breaking support for EVM.
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   15 +++++++++++++++
+ 1 files changed, 15 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index f959d95..eb18fb9 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1387,6 +1387,8 @@ static void am335x_setup_daughter_board(struct memory_accessor *m, void *c)
+ 	}
+ }
+ 
++static struct at24_platform_data bone_eeprom_info;
++
+ static void am335x_evm_setup(struct memory_accessor *mem_acc, void *context)
+ {
+ 	int ret;
+@@ -1413,6 +1415,11 @@ static void am335x_evm_setup(struct memory_accessor *mem_acc, void *context)
+ 	}
+ 
+ 	if (config.header != AM335X_EEPROM_HEADER) {
++		if(memcmp(at24_macc_getpdata(mem_acc), &bone_eeprom_info,
++		  sizeof(struct at24_platform_data)) != 0) {
++			at24_macc_setpdata(mem_acc, &bone_eeprom_info);
++			return am335x_evm_setup(mem_acc, context);
++		}
+ 		pr_warning("AM335X: wrong header 0x%x, expected 0x%x\n",
+ 			config.header, AM335X_EEPROM_HEADER);
+ 		goto out;
+@@ -1485,6 +1492,14 @@ static struct at24_platform_data am335x_baseboard_eeprom_info = {
+ 	.context        = (void *)NULL,
+ };
+ 
++static struct at24_platform_data bone_eeprom_info = {
++	.byte_len       = (2*1024) / 8,
++	.page_size      = 16,
++	.flags          = 0x0,
++	.setup          = am335x_evm_setup,
++	.context        = (void *)NULL,
++};
++
+ /*
+ * Daughter board Detection.
+ * Every board has a ID memory (EEPROM) on board. We probe these devices at
+-- 
+1.7.4.1
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
index 1c4bee0..bffebea 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb
@@ -10,8 +10,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "master"
-SRCREV = "c7fc664a6a36a4721b43dc287e410a2453f0b782"
-MACHINE_KERNEL_PR_append = "j+gitr${SRCREV}"
+SRCREV = "1955a86594526e18f03c8d62db81119ffc4ccf0f"
+MACHINE_KERNEL_PR_append = "k+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -27,6 +27,9 @@ SRC_URI += "git://arago-project.org/git/projects/linux-am33x.git;protocol=git;br
 PATCHES_OVER_PSP = " \
 	file://0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://0001-am335x-Add-pin-mux-and-init-for-beaglebone-specific-.patch \
+	file://0001-am335x-Check-return-value-of-omap_mux_init_signal.patch \
+	file://0002-at24-Add-ability-to-dynamically-reconfigure-chip-inf.patch \
+	file://0003-am335x-evm-Reconfigure-EEPROM-with-new-eeprom_info-in.patch \
 	"
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-- 
1.7.0.4


