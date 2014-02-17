Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE55AE007FD
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2014 07:43:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 004F252A8D; Mon, 17 Feb 2014 15:43:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140217154304.004F252A8D@arago-project.org>
Date: Mon, 17 Feb 2014 15:43:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: drop SMP-disabling patch that breaks suspend/resume
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2014 15:43:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7969c525c26dde8b601b7122b95182c9cce3f65c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7969c525c26dde8b601b7122b95182c9cce3f65c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb 17 10:26:36 2014 -0500

linux-ti-staging: drop SMP-disabling patch that breaks suspend/resume

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.12.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 220495a..2561e12 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -40,7 +40,7 @@ SRCREV = "9d5b470605a6e5df5c46444c2b2c108d21f9a24a"
 PV = "3.12.10"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "e+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "f+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
@@ -51,11 +51,7 @@ SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;bra
 SRC_URI += "file://0001-ARM-config-omap-Sync-up-omap2plus-defconfig-with-sav.patch \
             file://0002-ARM-config-omap-Make-advanced-networking-features-as.patch \
             file://0003-ARM-config-omap-Disable-extra-debug-options.patch \
-            file://0005-ARM-OMAP-Kill-warning-in-CPUIDLE-code-with-CONFIG_SM.patch \
             "
-SRC_URI_append_ti33x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-SRC_URI_append_ti43x = "file://0004-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch"
-
 # LCD resume fixes
 SRC_URI += "file://0001-ARM-OMAP2-am43xx-Use-omap4-prm-context-ops.patch \
             file://0002-ARM-OMAP2-omap_hwmod-Add-context-ops-to-am43xx-soc_ops.patch \


