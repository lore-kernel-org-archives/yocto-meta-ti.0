Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2BE7EE013A5
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2012 11:35:15 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9218652985; Mon, 19 Mar 2012 18:35:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120319183514.9218652985@arago-project.org>
Date: Mon, 19 Mar 2012 18:35:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux 3.0: Fix sprz319 erratum 2.1
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
X-List-Received-Date: Mon, 19 Mar 2012 18:35:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8f1fc028be8567c57ed7d40b1800ece37128b9ac
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f1fc028be8567c57ed7d40b1800ece37128b9ac

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Mar 19 19:16:08 2012 +0100

linux 3.0: Fix sprz319 erratum 2.1

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-3.0/patch.sh            |    2 +-
 .../usb/0001-Fix-sprz319-erratum-2.1.patch         |  210 ++++++++++++++++++++
 recipes-kernel/linux/linux_3.0.bb                  |    4 +-
 3 files changed, 214 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-3.0/patch.sh b/recipes-kernel/linux/linux-3.0/patch.sh
index dc19a9e..31bdfe1 100755
--- a/recipes-kernel/linux/linux-3.0/patch.sh
+++ b/recipes-kernel/linux/linux-3.0/patch.sh
@@ -13,7 +13,7 @@ git reset --hard ${TAG}
 rm export -rf
 
 previous=${TAG}
-PATCHSET="pm-wip/voltdm pm-wip/cpufreq beagle madc sakoman sgx ulcd omap4 misc"
+PATCHSET="pm-wip/voltdm pm-wip/cpufreq beagle madc sakoman sgx ulcd omap4 misc usb"
 
 # apply patches
 for patchset in ${PATCHSET} ; do
diff --git a/recipes-kernel/linux/linux-3.0/usb/0001-Fix-sprz319-erratum-2.1.patch b/recipes-kernel/linux/linux-3.0/usb/0001-Fix-sprz319-erratum-2.1.patch
new file mode 100644
index 0000000..8d65b5f
--- /dev/null
+++ b/recipes-kernel/linux/linux-3.0/usb/0001-Fix-sprz319-erratum-2.1.patch
@@ -0,0 +1,210 @@
+From cf5db5477d8d43f02f4511f3835ab4bec0dcc27c Mon Sep 17 00:00:00 2001
+From: Richard Watts <rrw@kynesim.co.uk>
+Date: Mon, 20 Feb 2012 17:58:26 +0000
+Subject: [PATCH] Fix sprz319 erratum 2.1
+
+There is an erratum in DM3730 which results in the
+EHCI USB PLL (DPLL5) not updating sufficiently frequently; this
+leads to USB PHY clock drift and once the clock has drifted far
+enough, the PHY's ULPI interface stops responding and USB
+drops out. This is manifested on a Beagle xM by having the attached
+SMSC9514 report 'Cannot enable port 2. Maybe the USB cable is bad?'
+or similar.
+
+The fix is to carefully adjust your DPLL5 settings so as to
+keep the PHY clock as close as possible to 120MHz over the long
+term; TI SPRZ319e gives a table of such settings and this patch
+applies that table to systems with a 13MHz or a 26MHz clock,
+thus fixing the issue (inasfar as it can be fixed) on Beagle xM
+and Overo Firestorm.
+
+Signed-off-by: Richard Watts <rrw@kynesim.co.uk>
+---
+ arch/arm/mach-omap2/clkt_clksel.c    |   15 ++++++++
+ arch/arm/mach-omap2/clock.h          |    7 ++++
+ arch/arm/mach-omap2/clock3xxx.c      |   65 +++++++++++++++++++++++++++++----
+ arch/arm/mach-omap2/clock3xxx.h      |    1 +
+ arch/arm/mach-omap2/clock3xxx_data.c |    2 +-
+ arch/arm/mach-omap2/dpll3xxx.c       |    2 +-
+ 6 files changed, 82 insertions(+), 10 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/clkt_clksel.c b/arch/arm/mach-omap2/clkt_clksel.c
+index e25364d..e378fe7 100644
+--- a/arch/arm/mach-omap2/clkt_clksel.c
++++ b/arch/arm/mach-omap2/clkt_clksel.c
+@@ -460,6 +460,21 @@ int omap2_clksel_set_rate(struct clk *clk, unsigned long rate)
+ 	return 0;
+ }
+ 
++int omap2_clksel_force_divisor(struct clk *clk, int new_div)
++{
++	u32 field_val;
++
++	field_val = _divisor_to_clksel(clk, new_div);
++	if (field_val == ~0)
++		return -EINVAL;
++
++	_write_clksel_reg(clk, field_val);
++
++	clk->rate = clk->parent->rate / new_div;
++
++	return 0;
++}
++
+ /*
+  * Clksel parent setting function - not passed in struct clk function
+  * pointer - instead, the OMAP clock code currently assumes that any
+diff --git a/arch/arm/mach-omap2/clock.h b/arch/arm/mach-omap2/clock.h
+index 8bad1c6..ac3d367 100644
+--- a/arch/arm/mach-omap2/clock.h
++++ b/arch/arm/mach-omap2/clock.h
+@@ -61,6 +61,12 @@ void omap3_dpll_allow_idle(struct clk *clk);
+ void omap3_dpll_deny_idle(struct clk *clk);
+ u32 omap3_dpll_autoidle_read(struct clk *clk);
+ int omap3_noncore_dpll_set_rate(struct clk *clk, unsigned long rate);
++#if CONFIG_ARCH_OMAP3
++int omap3_noncore_dpll_program(struct clk *clk, u16 m, u8 n, u16 freqsel);
++/* If you are using this function and not on OMAP3, you are
++ * Doing It Wrong(tm), so there is no stub.
++ */
++#endif
+ int omap3_noncore_dpll_enable(struct clk *clk);
+ void omap3_noncore_dpll_disable(struct clk *clk);
+ int omap4_dpllmx_gatectrl_read(struct clk *clk);
+@@ -84,6 +90,7 @@ unsigned long omap2_clksel_recalc(struct clk *clk);
+ long omap2_clksel_round_rate(struct clk *clk, unsigned long target_rate);
+ int omap2_clksel_set_rate(struct clk *clk, unsigned long rate);
+ int omap2_clksel_set_parent(struct clk *clk, struct clk *new_parent);
++int omap2_clksel_force_divisor(struct clk *clk, int new_div);
+ 
+ /* clkt_iclk.c public functions */
+ extern void omap2_clkt_iclk_allow_idle(struct clk *clk);
+diff --git a/arch/arm/mach-omap2/clock3xxx.c b/arch/arm/mach-omap2/clock3xxx.c
+index 952c3e0..d5be086 100644
+--- a/arch/arm/mach-omap2/clock3xxx.c
++++ b/arch/arm/mach-omap2/clock3xxx.c
+@@ -40,6 +40,60 @@
+ /* needed by omap3_core_dpll_m2_set_rate() */
+ struct clk *sdrc_ick_p, *arm_fck_p;
+ 
++struct dpll_settings {
++	int rate, m, n, f;
++};
++
++
++static int omap3_dpll5_apply_erratum21(struct clk *clk, struct clk *dpll5_m2)
++{
++	struct clk *sys_clk;
++	int i, rv;
++	static const struct dpll_settings precomputed[] = {
++		/* From DM3730 errata (sprz319e), table 36
++		* +1 is because the values in the table are register values;
++		* dpll_program() will subtract one from what we give it,
++		* so ...
++		*/
++		{ 13000000, 443+1, 5+1, 8 },
++		{ 26000000, 443+1, 11+1, 8 }
++	};
++
++	sys_clk = clk_get(NULL, "sys_ck");
++
++	for (i = 0 ; i < (sizeof(precomputed)/sizeof(struct dpll_settings)) ;
++		++i) {
++		const struct dpll_settings *d = &precomputed[i];
++		if (sys_clk->rate == d->rate) {
++			rv =  omap3_noncore_dpll_program(clk, d->m , d->n, 0);
++			if (rv)
++				return 1;
++			rv =  omap2_clksel_force_divisor(dpll5_m2 , d->f);
++			return 1;
++		}
++	}
++	return 0;
++}
++
++int omap3_dpll5_set_rate(struct clk *clk, unsigned long rate)
++{
++	struct clk *dpll5_m2;
++	int rv;
++	dpll5_m2 = clk_get(NULL, "dpll5_m2_ck");
++
++	if (cpu_is_omap3630() && rate == DPLL5_FREQ_FOR_USBHOST &&
++		omap3_dpll5_apply_erratum21(clk, dpll5_m2)) {
++		return 1;
++	}
++	rv = omap3_noncore_dpll_set_rate(clk, rate);
++	if (rv)
++		goto out;
++	rv = clk_set_rate(dpll5_m2, rate);
++
++out:
++	return rv;
++}
++
+ int omap3_dpll4_set_rate(struct clk *clk, unsigned long rate)
+ {
+ 	/*
+@@ -59,19 +113,14 @@ int omap3_dpll4_set_rate(struct clk *clk, unsigned long rate)
+ void __init omap3_clk_lock_dpll5(void)
+ {
+ 	struct clk *dpll5_clk;
+-	struct clk *dpll5_m2_clk;
+ 
+ 	dpll5_clk = clk_get(NULL, "dpll5_ck");
+ 	clk_set_rate(dpll5_clk, DPLL5_FREQ_FOR_USBHOST);
+-	clk_enable(dpll5_clk);
+ 
+-	/* Program dpll5_m2_clk divider for no division */
+-	dpll5_m2_clk = clk_get(NULL, "dpll5_m2_ck");
+-	clk_enable(dpll5_m2_clk);
+-	clk_set_rate(dpll5_m2_clk, DPLL5_FREQ_FOR_USBHOST);
++	/* dpll5_m2_ck is now (grottily!) handled by dpll5_clk's set routine,
++	 * to cope with an erratum on DM3730
++	 */
+ 
+-	clk_disable(dpll5_m2_clk);
+-	clk_disable(dpll5_clk);
+ 	return;
+ }
+ 
+diff --git a/arch/arm/mach-omap2/clock3xxx.h b/arch/arm/mach-omap2/clock3xxx.h
+index 8bbeeaf..0ede513 100644
+--- a/arch/arm/mach-omap2/clock3xxx.h
++++ b/arch/arm/mach-omap2/clock3xxx.h
+@@ -10,6 +10,7 @@
+ 
+ int omap3xxx_clk_init(void);
+ int omap3_dpll4_set_rate(struct clk *clk, unsigned long rate);
++int omap3_dpll5_set_rate(struct clk *clk, unsigned long rate);
+ int omap3_core_dpll_m2_set_rate(struct clk *clk, unsigned long rate);
+ void omap3_clk_lock_dpll5(void);
+ 
+diff --git a/arch/arm/mach-omap2/clock3xxx_data.c b/arch/arm/mach-omap2/clock3xxx_data.c
+index ffd55b1..dcd7bdc 100644
+--- a/arch/arm/mach-omap2/clock3xxx_data.c
++++ b/arch/arm/mach-omap2/clock3xxx_data.c
+@@ -942,7 +942,7 @@ static struct clk dpll5_ck = {
+ 	.parent		= &sys_ck,
+ 	.dpll_data	= &dpll5_dd,
+ 	.round_rate	= &omap2_dpll_round_rate,
+-	.set_rate	= &omap3_noncore_dpll_set_rate,
++	.set_rate	= &omap3_dpll5_set_rate,
+ 	.clkdm_name	= "dpll5_clkdm",
+ 	.recalc		= &omap3_dpll_recalc,
+ };
+diff --git a/arch/arm/mach-omap2/dpll3xxx.c b/arch/arm/mach-omap2/dpll3xxx.c
+index f77022b..1909cd0 100644
+--- a/arch/arm/mach-omap2/dpll3xxx.c
++++ b/arch/arm/mach-omap2/dpll3xxx.c
+@@ -291,7 +291,7 @@ static void _lookup_sddiv(struct clk *clk, u8 *sd_div, u16 m, u8 n)
+  * Program the DPLL with the supplied M, N values, and wait for the DPLL to
+  * lock..  Returns -EINVAL upon error, or 0 upon success.
+  */
+-static int omap3_noncore_dpll_program(struct clk *clk, u16 m, u8 n, u16 freqsel)
++int omap3_noncore_dpll_program(struct clk *clk, u16 m, u8 n, u16 freqsel)
+ {
+ 	struct dpll_data *dd = clk->dpll_data;
+ 	u8 dco, sd_div;
+-- 
+1.7.2.5
+
diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/linux_3.0.bb
index 32ef963..c95542e 100644
--- a/recipes-kernel/linux/linux_3.0.bb
+++ b/recipes-kernel/linux/linux_3.0.bb
@@ -10,7 +10,7 @@ PV = "3.0.23"
 SRCREV_pn-${PN} = "bf6a68d2a214e07f7c0d6538e00e17b826714160"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-3.0:${FILE_DIRNAME}/linux-3.0/${MACHINE}:"
 
@@ -224,6 +224,8 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             \
             file://misc/0001-compiler.h-Undef-before-redefining-__attribute_const.patch \
             \
+            file://usb/0001-Fix-sprz319-erratum-2.1.patch \
+            \
             file://defconfig"
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \


