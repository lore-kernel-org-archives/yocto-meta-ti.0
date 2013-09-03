Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB195E013D1
	for <meta-ti@yoctoproject.org>; Tue,  3 Sep 2013 10:08:09 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A1D1529FE; Tue,  3 Sep 2013 17:08:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130903170809.3A1D1529FE@arago-project.org>
Date: Tue,  3 Sep 2013 17:08:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ompa3-sgx-modules-x11: fix some build failures with latest versions
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
X-List-Received-Date: Tue, 03 Sep 2013 17:08:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dc3f0f5c74ca11081a4267c14cbb3ba5b4b0f016
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dc3f0f5c74ca11081a4267c14cbb3ba5b4b0f016

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Aug 31 22:00:57 2013 -0400

ompa3-sgx-modules-x11: fix some build failures with latest versions

* Do not hardcode kernel source location and name.
* Fix some discrepancies between GFX SDK versions as related to DRM.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 .../omap3-sgx-modules-x11_4.09.00.01.bb            |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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


