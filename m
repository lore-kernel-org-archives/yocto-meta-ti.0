Return-Path: <prabu@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73540E014DB
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 06:40:36 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42DeYHG027590
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:35 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42DeWr5028449
	for <meta-ti@yoctoproject.org>; Thu, 2 May 2013 08:40:33 -0500
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE73.ent.ti.com
	(172.24.171.98) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 2 May 2013 21:40:32 +0800
Received: from bangubntigfx.india.ti.com (smtpvbd.itg.ti.com [172.24.170.250])
	by dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id r42De1MG016387;
	Thu, 2 May 2013 19:10:32 +0530
From: Prabindh Sundareson <prabu@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 May 2013 19:09:16 +0530
Message-ID: <1367501964-6294-2-git-send-email-prabu@ti.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1367501964-6294-1-git-send-email-prabu@ti.com>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
MIME-Version: 1.0
Subject: [PATCH 02/10] omap3-sgx-modules: Remove X11 related build and packaging
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
X-List-Received-Date: Thu, 02 May 2013 13:40:36 -0000
Content-Type: text/plain

The SGX530 driver for X11 is only buildable and testable standalone
with the pre-built X11 package provided with the Graphics SDK.
This patch removes X11 build from the default kernel module recipe,
to enable moving X11 build to a separate recipe.

This is part of a clean up of the Graphics recipe starting from
4.09.00.01 version of the Graphics SDK.

Signed-off-by: Prabindh Sundareson <prabu@ti.com>
---
 .../omap3-sgx-modules_4.09.00.01.bb                |    8 +-------
 1 files changed, 1 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
index 55e427f..399374d 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.09.00.01.bb
@@ -39,9 +39,7 @@ MODULESLOCATION_ti814x = "dc_ti81xx_linux"
 MODULESLOCATION_ti816x = "dc_ti81xx_linux"
 MODULESLOCATION_ti33x = "dc_ti335x_linux"
 
-export SUPPORT_XORG ?= "${@base_contains('DISTRO_FEATURES', 'x11', '1', '0', d)}"
-
-MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=${SUPPORT_XORG}"
+MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM} SUPPORT_XORG=0"
 
 do_install() {
     mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
@@ -49,8 +47,4 @@ do_install() {
         ${S}/services4/3rdparty/${MODULESLOCATION}/omaplfb.ko  \
         ${S}/services4/3rdparty/bufferclass_ti/bufferclass_ti.ko \
         ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
-
-    if [ "${SUPPORT_XORG}" = "1" ]; then
-        cp ${S}/services4/3rdparty/linux_drm/drm.ko ${D}/lib/modules/${KERNEL_VERSION}/kernel/drivers/gpu/pvr
-    fi
 }
-- 
1.7.1


