Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 551A3E00749
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:26:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5E84B52AB7; Tue, 21 Feb 2012 02:26:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221022619.5E84B52AB7@arago-project.org>
Date: Tue, 21 Feb 2012 02:26:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : omap3-sgx-modules: fix for corrected ti-eula-unpack
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
Commit: 108e0894e8dd0124327c81d23e8491bedfb8c219
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=108e0894e8dd0124327c81d23e8491bedfb8c219

Author: Peter A. Bigot <bigotp@acm.org>
Date:   Wed Feb 15 09:30:58 2012 -0600

omap3-sgx-modules: fix for corrected ti-eula-unpack

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../omap3-sgx-modules_4.05.00.03.bb                |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index 6f8d680..42a2e9a 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -17,7 +17,8 @@ SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gf
           "
 SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
 SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
-S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
+TI_BIN_UNPK_WDEXT="/Graphics_SDK_${SGXPV}"
+S = "${WORKDIR}${TI_BIN_UNPK_WDEXT}/GFX_Linux_KM"
 
 PVRBUILD = "release"
 export KERNELDIR = "${STAGING_KERNEL_DIR}"


