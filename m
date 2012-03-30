Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8E1B2E01206
	for <meta-ti@yoctoproject.org>; Fri, 30 Mar 2012 16:11:27 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 531A3529B7; Fri, 30 Mar 2012 23:11:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330231126.531A3529B7@arago-project.org>
Date: Fri, 30 Mar 2012 23:11:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: fix VGA cape partnumber
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
X-List-Received-Date: Fri, 30 Mar 2012 23:11:27 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: de3125ad1e262660f620b10cb0145cfdecb1dcf8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=de3125ad1e262660f620b10cb0145cfdecb1dcf8

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Mar 21 14:45:13 2012 +0100

linux-ti33x-psp 3.2: fix VGA cape partnumber

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...add-more-beagleboardtoys-cape-partnumbers.patch |    2 +-
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |    2 +-
 .../0026-beaglebone-add-gpio-keys-for-lcd.patch    |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
index 4c1fcfd..748386a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
@@ -24,7 +24,7 @@ index 36efca1..58a0e77 100644
 +		beaglebone_tsadcpins_free = 0;
 +	}
 +	
-+	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
++	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 +		pr_info("BeagleBone cape: initializing VGA cape\n");
 +		dvi_init(0,0);
 +	}
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
index f5da1ed..4d44ae0 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
@@ -105,7 +105,7 @@ index 58a0e77..7a2b851 100644
 +		// gpio1_28 -> button
  	}
  	
- 	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
+ 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 @@ -1898,11 +1971,17 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	
  	if (!strncmp("BB-BONE-BATT-01", cape_config.partnumber, 15)) {
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
index 2a36c19..2d8270e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-add-gpio-keys-for-lcd.patch
@@ -107,7 +107,7 @@ index ed2ff18..badee96 100644
 +		beaglebone_lcd3_keys_init(0,0);
  	}
  	
- 	if (!strncmp("BB-BONE-VGA0-01", cape_config.partnumber, 15)) {
+ 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 -- 
 1.7.2.5
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index e6277ce..16c0dd4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 


