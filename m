Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F7D6E006AD
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 15:25:25 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A7AA52AAE; Tue, 12 Feb 2013 23:25:25 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130212232525.3A7AA52AAE@arago-project.org>
Date: Tue, 12 Feb 2013 23:25:25 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-omapl138-psp_2.6.37: Add MACHINE_KERNEL_PR and fix white space issues.
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
X-List-Received-Date: Tue, 12 Feb 2013 23:25:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 4689b0e62cd644bb9d4e313b19fca2ace24f517a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4689b0e62cd644bb9d4e313b19fca2ace24f517a

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Feb 11 19:04:37 2013 -0600

linux-omapl138-psp_2.6.37: Add MACHINE_KERNEL_PR and fix white space issues.

* Add MACHINE_KERNEL_PR variable to enable future tweaks to this recipe.
* Convert tabs to whitespaces

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb |   20 +++++++++++---------
 1 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index 5441675..ec472d7 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -6,6 +6,8 @@ KERNEL_IMAGETYPE = "uImage"
 require multi-kernel.inc
 require tipspkernel.inc
 
+MACHINE_KERNEL_PR_append = "a"
+
 S = "${WORKDIR}/git"
 
 MULTI_CONFIG_BASE_SUFFIX = ""
@@ -16,14 +18,14 @@ SRCREV = "v2.6.37_DAVINCIPSP_03.21.00.04"
 COMPATIBLE_MACHINE = "(omapl138)"
 
 SRC_URI += "git://arago-project.org/git/projects/linux-davinci.git;protocol=git;branch=${BRANCH} \
-	file://defconfig"
+    file://defconfig"
 
 PATCHES_OVER_PSP = " \
-	file://0001-TI-WL12xx-MMC-patches-03.21.00.04.patch \
-	file://0002-da850-Set-maximum-OPP-frequency-to-456MHz.patch \
-	file://0003-AM18xx-WL1271-Enable-BT.patch \
-	file://0004-PSP03.21.00.04.sdk-activate-wireless-extensions.patch \
-	file://0005-Davinci-da850-Add-Mistral-WL12XX-config-support-to.patch \
-	file://0006-Add-wlan-and-BT-config-switches.patch \
-	file://uio_pruss.patch \
-	"
+    file://0001-TI-WL12xx-MMC-patches-03.21.00.04.patch \
+    file://0002-da850-Set-maximum-OPP-frequency-to-456MHz.patch \
+    file://0003-AM18xx-WL1271-Enable-BT.patch \
+    file://0004-PSP03.21.00.04.sdk-activate-wireless-extensions.patch \
+    file://0005-Davinci-da850-Add-Mistral-WL12XX-config-support-to.patch \
+    file://0006-Add-wlan-and-BT-config-switches.patch \
+    file://uio_pruss.patch \
+"


