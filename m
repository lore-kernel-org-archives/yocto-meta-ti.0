Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 501F9E00784
	for <meta-ti@yoctoproject.org>; Wed,  4 Dec 2013 12:04:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3CF1652AB4; Wed,  4 Dec 2013 20:04:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131204200429.3CF1652AB4@arago-project.org>
Date: Wed,  4 Dec 2013 20:04:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgles-omap3, omap3-sgx-modules: swap around DEFAULT_PREFERENCE setting
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
X-List-Received-Date: Wed, 04 Dec 2013 20:04:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e95731b49d36bc055c141fde1f66c13c2938e23d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e95731b49d36bc055c141fde1f66c13c2938e23d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Dec  2 16:12:19 2013 -0500

libgles-omap3, omap3-sgx-modules: swap around DEFAULT_PREFERENCE setting

This way the default for am335x and am437x will be the new 5.00.00.01 Graphics
SDK release, that matches the default 3.12 kernel.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 .../omap3-sgx-modules-x11_4.09.00.01.bb            |    2 --
 .../omap3-sgx-modules_4.05.00.03.bb                |    2 ++
 .../omap3-sgx-modules_4.08.00.01.bb                |    2 --
 .../omap3-sgx-modules_4.08.00.02.bb                |    2 --
 .../omap3-sgx-modules_5.00.00.01.bb                |    2 --
 .../libgles/libgles-omap3_4.05.00.03.bb            |    2 ++
 .../libgles/libgles-omap3_4.08.00.01.bb            |    2 --
 .../libgles/libgles-omap3_4.08.00.02.bb            |    2 --
 .../libgles/libgles-omap3_4.09.00.01.bb            |    2 --
 .../libgles/libgles-omap3_5.00.00.01.bb            |    2 --
 10 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
index 14f1860..f033eff 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
@@ -13,8 +13,6 @@ inherit module
 MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
-DEFAULT_PREFERENCE = "-1"
-
 # Select the corresponding hardfp/softfp filename and checksums based on tune flags
 BINFILE_SOFTFP = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
 MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index 31c7d4e..bd476f0 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -13,6 +13,8 @@ inherit module
 MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
+DEFAULT_PREFERENCE_omap3 = "99"
+
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
           "
 SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
index 4885946..e9f7190 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.01.bb
@@ -14,8 +14,6 @@ inherit module
 MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
 SRC_URI[md5sum] = "dd0d994a48ecc4293f272a1fddddf159"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
index 793de14..d5737cd 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.08.00.02.bb
@@ -14,8 +14,6 @@ inherit module
 MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-DEFAULT_PREFERENCE = "-1"
-
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
 SRC_URI[md5sum] = "0efa3a38266e6f41f8cc4fad0187f0d6"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
index 4a5def2..e18ce0c 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_5.00.00.01.bb
@@ -13,8 +13,6 @@ inherit module
 MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-DEFAULT_PREFERENCE = "-1"
-
 BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_alpha_hardfp_minimal_demos.bin"
 MD5SUM_HARDFP = "ae6125d7f8a313ea5c02afded893052d"
 SHA256SUM_HARDFP = "c2782a2f85024741722b936ec9dca66b858ae8561aa71b693f11e12d8c0385e0"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
index 7795e2e..33836fb 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.05.00.03.bb
@@ -5,6 +5,8 @@ BINLOCATION_ti33x = "${S}/gfx_rel_es8.x"
 
 require libgles-omap3.inc
 
+DEFAULT_PREFERENCE_omap3 = "99"
+
 # download required binary distribution from:
 # http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/latest/index_FDS.html
 # see libgles-omap3.inc for detailed installation instructions
diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
index a24da0e..990b425 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
@@ -2,8 +2,6 @@ require libgles-omap3.inc
 
 LICENSE = "TSPA"
 
-DEFAULT_PREFERENCE = "-1"
-
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
index e57ba42..59ef358 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
@@ -2,8 +2,6 @@ require libgles-omap3.inc
 
 LICENSE = "TSPA"
 
-DEFAULT_PREFERENCE = "-1"
-
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
index d094b5c..fec84fd 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
@@ -4,8 +4,6 @@ LICENSE = "TSPA"
 
 PR = "${INC_PR}.2"
 
-DEFAULT_PREFERENCE = "-1"
-
 BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
index 7af67eb..e48ec63 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
@@ -4,8 +4,6 @@ LICENSE = "TSPA"
 
 PR = "${INC_PR}.1"
 
-DEFAULT_PREFERENCE = "-1"
-
 BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
 BINLOCATION_ti814x = "${S}/gfx_rel_es6.x"


