Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DC34E00596
	for <meta-ti@yoctoproject.org>; Sat, 31 Aug 2013 20:13:12 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MSF00K2GFLU2870@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 31 Aug 2013 22:13:07 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B74A820091; Sat,
	31 Aug 2013 23:13:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 31 Aug 2013 23:12:57 -0400
Message-id: <1378005180-30928-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1378005180-30928-1-git-send-email-denis@denix.org>
References: <1378005180-30928-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/5] ompa3-sgx-modules-x11: fix some build failures with latest versions
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
X-List-Received-Date: Sun, 01 Sep 2013 03:13:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Do not hardcode kernel source location and name.
* Fix some discrepancies between GFX SDK versions as related to DRM.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
index d439d83..9134e61 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules-x11_4.09.00.01.bb
@@ -11,7 +11,7 @@ BINFILE = "Graphics_SDK_setuplinux_${SGXPV}_minimal_demos.bin"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 DEFAULT_PREFERENCE = "-1"
@@ -48,16 +48,16 @@ do_compile() {
 	export PLAT_CC="${CC}"
 	export PLAT_CPP="${CXX}"
 	export PLAR_AR="${AR}"
-	for kernelver in ${WORKDIR}/../../linux-ti-staging/* ; do
+	for kernelver in ${WORKDIR}/../../${PREFERRED_PROVIDER_virtual/kernel}/* ; do
 		cp -f $kernelver/git/drivers/gpu/drm/*.c ${S}/services4/3rdparty/linux_drm/
 	done
 	if [ $(echo -e "${KERNEL_VERSION}\n3.3" | sort --version-sort | head -1) = "3.3" ] ; then
 		cp -f ${S}/services4/3rdparty/linux_drm/Kbuild_3.3 \
-			${S}/services4/3rdparty/linux_drm/Kbuild
+			${S}/services4/3rdparty/linux_drm/Kbuild || true
 	else 
 		if [ $(echo -e "${KERNEL_VERSION}\n3.2" | sort --version-sort | head -1) = "3.2" ] ; then
 			cp -f ${S}/services4/3rdparty/linux_drm/Kbuild_3.2 \
-				${S}/services4/3rdparty/linux_drm/Kbuild
+				${S}/services4/3rdparty/linux_drm/Kbuild || true
 		fi
 	fi
 	oe_runmake BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}
-- 
1.8.3.2


