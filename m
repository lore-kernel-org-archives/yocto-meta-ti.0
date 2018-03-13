Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D97FE00EBA; Tue, 13 Mar 2018 13:33:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DB7FE0097D
	for <meta-ti@yoctoproject.org>; Tue, 13 Mar 2018 13:33:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2DKXeLc013816
	for <meta-ti@yoctoproject.org>; Tue, 13 Mar 2018 15:33:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520973220;
	bh=CfhAqm7xcgjOB50NbaV5SV95ALa7+b75aP05QkHg7Lw=;
	h=From:To:Subject:Date;
	b=vIM3BWf0050e1B7jrfL+LHLs6qYzt1HfgF+SRuep7Bg/GjtidmHdI4zXa8IDYmSqY
	XESiDqhLVDws/3bN6a80evct4KBW7UJ+9HzlB8z6R752SKgDhaRdS2XhbpIvsIXr5+
	djxLRALJP95jQnCLlELvrN5p2yl0h5o+nlsFFwTY=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2DKXe36002208
	for <meta-ti@yoctoproject.org>; Tue, 13 Mar 2018 15:33:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 13 Mar 2018 15:33:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 13 Mar 2018 15:33:39 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2DKXdqt005347
	for <meta-ti@yoctoproject.org>; Tue, 13 Mar 2018 15:33:39 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Mar 2018 16:33:35 -0400
Message-ID: <1520973215-5628-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] ti-sgx-ddk-km: update SGX kernel driver for k4.14
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
X-List-Received-Date: Tue, 13 Mar 2018 20:33:42 -0000
Content-Type: text/plain

From: Anand Balagopalakrishnan <anandb@ti.com>

Note: This is a tentative patch to enable graphics support.
      We shall merge both local patches to the ti-sgx-km repo soon.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...ix-undeclared-identifier-error-for-AM3-4-.patch | 37 ++++++++++++++++++++++
 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |  5 +--
 2 files changed, 40 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch
new file mode 100644
index 0000000..cde6b3d
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch
@@ -0,0 +1,37 @@
+From 1ee059ed47b379c1cd9494c507a4a1e67dc90cf2 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Mon, 12 Mar 2018 17:56:50 -0400
+Subject: [PATCH 1/2] pvr_drm.c: fix undeclared identifier error for AM3/4
+ builds
+
+The undeclared identifier error was introduced during the k4.14 migration
+and therefore was not applicable to the k4.4 and k4.9 branches.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ eurasia_km/services4/srvkm/env/linux/pvr_drm.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/eurasia_km/services4/srvkm/env/linux/pvr_drm.c b/eurasia_km/services4/srvkm/env/linux/pvr_drm.c
+index 39ee832..33f6c3d 100644
+--- a/eurasia_km/services4/srvkm/env/linux/pvr_drm.c
++++ b/eurasia_km/services4/srvkm/env/linux/pvr_drm.c
+@@ -655,12 +655,12 @@ static struct platform_driver sPVRPlatDriver =
+ static int
+ PVRSRVDrmProbe(struct platform_device *pDevice)
+ {
+-#if (AM_VERSION != 5)
+-	struct gfx_sgx_platform_data *pdata = dev->platform_data;
+-#endif
+ 	int ret;
+ 	struct device *dev = &pDevice->dev;
+ 	struct drm_device *drm_dev;
++#if (AM_VERSION != 5)
++	struct gfx_sgx_platform_data *pdata = dev->platform_data;
++#endif
+ 
+ 	PVR_TRACE(("PVRSRVDrmProbe"));
+ 
+-- 
+1.9.1
+
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 0303797..0927177 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -20,15 +20,16 @@ RPROVIDES_${PN} = "omapdrm-pvr"
 RREPLACES_${PN} = "omapdrm-pvr"
 RCONFLICTS_${PN} = "omapdrm-pvr"
 
-BRANCH = "ti-img-sgx/${PV}/k4.9"
+BRANCH = "ti-img-sgx/${PV}/k4.14"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
 file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch \
+file://0001-pvr_drm.c-fix-undeclared-identifier-error-for-AM3-4-.patch \
 "
 
 S = "${WORKDIR}/git"
 
-SRCREV = "0086977380d3320d70a3abc78b95fa0641427073"
+SRCREV = "855889f437250b6572c75d12696ec4a998b9aef9"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
-- 
1.9.1


