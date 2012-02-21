Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52BA5E00596
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:26:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1790852AAE; Tue, 21 Feb 2012 02:26:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221022619.1790852AAE@arago-project.org>
Date: Tue, 21 Feb 2012 02:26:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : various: fix installation directories for corrected ti-eula-unpack
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
X-List-Received-Date: Tue, 21 Feb 2012 02:26:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d56107533b9e63b31f479bfbbc880525f14fe1f3
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d56107533b9e63b31f479bfbbc880525f14fe1f3

Author: Peter A. Bigot <bigotp@acm.org>
Date:   Tue Jan 31 06:40:55 2012 -0600

various: fix installation directories for corrected ti-eula-unpack

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
Acked-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/bios/ti-dspbios.inc      |    3 ++-
 recipes-ti/devtools/ti-xdctools.inc |    3 ++-
 recipes-ti/edma3lld/ti-edma3lld.inc |    3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/bios/ti-dspbios.inc b/recipes-ti/bios/ti-dspbios.inc
index 8519039..0e3fa62 100644
--- a/recipes-ti/bios/ti-dspbios.inc
+++ b/recipes-ti/bios/ti-dspbios.inc
@@ -10,7 +10,8 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/bios_${PV}"
+TI_BIN_UNPK_WDEXT="/bios_${PV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/bios/dspbios/${PV}/exports/bios_setuplinux_${PV}.bin;name=biosbin"
 
diff --git a/recipes-ti/devtools/ti-xdctools.inc b/recipes-ti/devtools/ti-xdctools.inc
index c76ad80..547a555 100644
--- a/recipes-ti/devtools/ti-xdctools.inc
+++ b/recipes-ti/devtools/ti-xdctools.inc
@@ -12,7 +12,8 @@ S = "${WORKDIR}/xdctools_${PV}"
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/${PV}/exports/xdctools_setuplinux_${PV}.bin;name=xdcbin"
 
 BINFILE="xdctools_setuplinux_${PV}.bin"
-TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
+TI_BIN_UNPK_CMDS="Y:workdir:Y"
+TI_BIN_UNPK_WDEXT="/ti"
 
 do_install() {
     install -d ${D}${XDC_INSTALL_DIR_RECIPE}
diff --git a/recipes-ti/edma3lld/ti-edma3lld.inc b/recipes-ti/edma3lld/ti-edma3lld.inc
index d4e8557..fb131b6 100644
--- a/recipes-ti/edma3lld/ti-edma3lld.inc
+++ b/recipes-ti/edma3lld/ti-edma3lld.inc
@@ -8,7 +8,8 @@ require ../includes/ti-paths.inc
 require ../includes/ti-staging.inc
 require ../includes/ti-eula-unpack.inc
 
-S = "${WORKDIR}/edma3_lld_${PV}"
+TI_BIN_UNPK_WDEXT="/edma3_lld_${PV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/${SRC_URI_edma3lldsite}/edma3_lld/edma3-lld-bios5/${PV}/exports/EDMA3_LLD_setuplinux_${PV}.bin;name=edma3lldbin"
 


