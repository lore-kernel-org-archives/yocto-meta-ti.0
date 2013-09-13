Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1918DE0158B
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2013 09:08:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 79ED952AA8; Fri, 13 Sep 2013 16:08:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130913160837.79ED952AA8@arago-project.org>
Date: Fri, 13 Sep 2013 16:08:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap3-sgx-modules: add automatic selection between softfp and hardfp binaries
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
X-List-Received-Date: Fri, 13 Sep 2013 16:08:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bb8ab63ea937951ef4e53b60237319df9bd7822b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb8ab63ea937951ef4e53b60237319df9bd7822b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Sep 12 21:23:01 2013 -0400

omap3-sgx-modules: add automatic selection between softfp and hardfp binaries

This is based on the work by Franklin Cooper, with following changes:
* Cleanup and simplify the logic
* Reduce the number of Python calls
* Expand support from Raw to X11 variant

The original description:
* The Graphics SDK includes some binaries that are prebuilt.
* These prebuilt binaries come in two versions of the Graphics SDK. By default
  the prebuilt binaries are built using a softfp toolchain. A separate hardfp
  Graphics SDK exist that contains binaries that are prebuilt with a hardfp
  toolchain.
* Add support for both by checking to see if the toolchain used in the OE build
  is using a hardfp or softfp toolchain.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Franklin S. Cooper Jr <fcooper@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 .../omap3-sgx-modules-x11_4.09.00.01.bb            |   18 ++++++++++++++----
 .../omap3-sgx-modules_4.09.00.01.bb                |   20 ++++++++++++++++----
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
index 9134e61..fd79818 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-unpack.inc
 
 SGXPV = "4_09_00_01"
 IMGPV = "1.9.2188537"
-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 DEFAULT_PREFERENCE = "-1"
 
+# Select the corresponding hardfp/softfp filename and checksums based on tune flags
+BINFILE_SOFTFP = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SHA256SUM_SOFTFP = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
+MD5SUM_HARDFP = "c9f656dce062d1ab10afffd4dfb71b67"
+SHA256SUM_HARDFP = "dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
+
+BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
+
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
-SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
-SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
 S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
index 399374d..1c8718c 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
@@ -7,19 +7,29 @@ require ../../recipes-ti/includes/ti-eula-unpack.inc
 
 SGXPV = "4_09_00_01"
 IMGPV = "1.9.2188537"
-BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 DEFAULT_PREFERENCE = "-1"
 
+# Select the corresponding hardfp/softfp filename and checksums based on tune flags
+BINFILE_SOFTFP = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
+MD5SUM_SOFTFP = "bd35e9d8843aff3a2aca9d41e7db1c7d"
+SHA256SUM_SOFTFP = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+
+BINFILE_HARDFP = "Graphics_SDK_setuplinux_${SGXPV}_hardfp_minimal_demos.bin"
+MD5SUM_HARDFP = "c9f656dce062d1ab10afffd4dfb71b67"
+SHA256SUM_HARDFP = "dbfeba8e1298f139495816334edec1455e6b49b1e11bd1b2aa0a888e5788bb6b"
+
+BINFILE = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${BINFILE_HARDFP}', '${BINFILE_SOFTFP}', d)}"
+
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/${BINFILE}"
 
-SRC_URI[md5sum] = "bd35e9d8843aff3a2aca9d41e7db1c7d"
-SRC_URI[sha256sum] = "eb37f75ddde4640b09e760fa86e689beb394330ecdf68786188c34f249247647"
+SRC_URI[md5sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${MD5SUM_HARDFP}', '${MD5SUM_SOFTFP}', d)}"
+SRC_URI[sha256sum] = "${@base_contains('TUNE_FEATURES', 'callconvention-hard', '${SHA256SUM_HARDFP}', '${SHA256SUM_SOFTFP}', d)}"
 
 TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
 S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
@@ -41,6 +51,8 @@ MODULESLOCATION_ti33x = "dc_ti335x_linux"
 
 MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=0"
 
+MAKE_TARGETS_append_ti33x = " PM_RUNTIME=1"
+
 do_install() {
     mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
     cp  ${S}/pvrsrvkm.ko \


