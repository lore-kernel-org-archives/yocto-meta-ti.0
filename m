Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F05D3E00B01; Wed,  4 Apr 2018 06:50:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64F35E00A44
	for <meta-ti@yoctoproject.org>; Wed,  4 Apr 2018 06:50:39 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w34Doc2L017277
	for <meta-ti@yoctoproject.org>; Wed, 4 Apr 2018 08:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522849838;
	bh=O7JDpgsB0xyU57gJ0/oYjW3mBHoVT2pakY9nw1oSY5U=;
	h=From:To:Subject:Date;
	b=piJKUQS0P7hzAZiry3zs2utF5CwqKjyAeBatTfR3+dtiFnm7k9V4lRcFcQ1T3/JNC
	OIP9+OAY8Vm+Sq+/3K4Kc98hoyBp6FnVHvNzQ3SvG1FkpZVUBTQd/yM9ElI1xPtQxJ
	qgD+87vpRHHvjQdSutU+S6ntmtZlGs/oh6FkYlhs=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w34DocQJ031051
	for <meta-ti@yoctoproject.org>; Wed, 4 Apr 2018 08:50:38 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 4 Apr 2018 08:50:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 4 Apr 2018 08:50:38 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w34Doc62004158
	for <meta-ti@yoctoproject.org>; Wed, 4 Apr 2018 08:50:38 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 4 Apr 2018 09:50:34 -0400
Message-ID: <1522849834-26783-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] ti-sgx-ddk-km: bump SRCREV to pick up two local patches
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
X-List-Received-Date: Wed, 04 Apr 2018 13:50:41 -0000
Content-Type: text/plain

- pickup the latest release which includes two local patches
- remove those two local patches

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...ix-undeclared-identifier-error-for-AM3-4-.patch | 37 ----------------------
 ...n-devicemem.c-suppress-implicit-fallthrou.patch | 26 ---------------
 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |  7 ++--
 3 files changed, 2 insertions(+), 68 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch
 delete mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch
deleted file mode 100644
index cde6b3d..0000000
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1ee059ed47b379c1cd9494c507a4a1e67dc90cf2 Mon Sep 17 00:00:00 2001
-From: Eric Ruei <e-ruei1@ti.com>
-Date: Mon, 12 Mar 2018 17:56:50 -0400
-Subject: [PATCH 1/2] pvr_drm.c: fix undeclared identifier error for AM3/4
- builds
-
-The undeclared identifier error was introduced during the k4.14 migration
-and therefore was not applicable to the k4.4 and k4.9 branches.
-
-Signed-off-by: Eric Ruei <e-ruei1@ti.com>
----
- eurasia_km/services4/srvkm/env/linux/pvr_drm.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/eurasia_km/services4/srvkm/env/linux/pvr_drm.c b/eurasia_km/services4/srvkm/env/linux/pvr_drm.c
-index 39ee832..33f6c3d 100644
---- a/eurasia_km/services4/srvkm/env/linux/pvr_drm.c
-+++ b/eurasia_km/services4/srvkm/env/linux/pvr_drm.c
-@@ -655,12 +655,12 @@ static struct platform_driver sPVRPlatDriver =
- static int
- PVRSRVDrmProbe(struct platform_device *pDevice)
- {
--#if (AM_VERSION != 5)
--	struct gfx_sgx_platform_data *pdata = dev->platform_data;
--#endif
- 	int ret;
- 	struct device *dev = &pDevice->dev;
- 	struct drm_device *drm_dev;
-+#if (AM_VERSION != 5)
-+	struct gfx_sgx_platform_data *pdata = dev->platform_data;
-+#endif
- 
- 	PVR_TRACE(("PVRSRVDrmProbe"));
- 
--- 
-1.9.1
-
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch
deleted file mode 100644
index f2affec..0000000
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 621e02869be9958400fd045e1bb0f4f1d81a6918 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Fri, 10 Nov 2017 18:55:26 -0500
-Subject: [PATCH] srvkm/common/devicemem.c: suppress implicit fallthrough error
- in gcc7
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- eurasia_km/services4/srvkm/common/devicemem.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/eurasia_km/services4/srvkm/common/devicemem.c b/eurasia_km/services4/srvkm/common/devicemem.c
-index baf7c41..c083c63 100644
---- a/eurasia_km/services4/srvkm/common/devicemem.c
-+++ b/eurasia_km/services4/srvkm/common/devicemem.c
-@@ -1071,6 +1071,7 @@ PVRSRV_ERROR FreeMemCallBackCommon(PVRSRV_KERNEL_MEM_INFO *psMemInfo,
- 			case PVRSRV_MEMTYPE_ION:
- 			case PVRSRV_MEMTYPE_DMABUF:
- 				freeExternal(psMemInfo);
-+				/* FALLTHRU */
- 			case PVRSRV_MEMTYPE_DEVICE:
- 			case PVRSRV_MEMTYPE_DEVICECLASS:
- #if defined(SUPPORT_ION)
--- 
-2.7.4
-
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 0927177..a4eb82a 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -22,14 +22,11 @@ RCONFLICTS_${PN} = "omapdrm-pvr"
 
 BRANCH = "ti-img-sgx/${PV}/k4.14"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
-file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch \
-file://0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch \
-"
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "855889f437250b6572c75d12696ec4a998b9aef9"
+SRCREV = "d2b3959738cfcc6209e8e882d1989de790866c8f"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
-- 
1.9.1


