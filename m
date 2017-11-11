Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7187E00CF1; Fri, 10 Nov 2017 16:05:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1B4BBE00CEC
	for <meta-ti@yoctoproject.org>; Fri, 10 Nov 2017 16:05:24 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 56F2D20A40;
	Sat, 11 Nov 2017 00:05:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 1mdXvP0h4ue4; Sat, 11 Nov 2017 00:05:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37A98207BA;
	Sat, 11 Nov 2017 00:05:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B7126162717;
	Fri, 10 Nov 2017 19:05:17 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri, 10 Nov 2017 19:05:17 -0500
Message-Id: <1510358717-23048-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-sgx-ddk-km: suppress implicit fallthrough error in gcc7
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
X-List-Received-Date: Sat, 11 Nov 2017 00:05:25 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...n-devicemem.c-suppress-implicit-fallthrou.patch | 26 ++++++++++++++++++++++
 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |  7 ++++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch
new file mode 100644
index 0000000..f2affec
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch
@@ -0,0 +1,26 @@
+From 621e02869be9958400fd045e1bb0f4f1d81a6918 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Fri, 10 Nov 2017 18:55:26 -0500
+Subject: [PATCH] srvkm/common/devicemem.c: suppress implicit fallthrough error
+ in gcc7
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ eurasia_km/services4/srvkm/common/devicemem.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/eurasia_km/services4/srvkm/common/devicemem.c b/eurasia_km/services4/srvkm/common/devicemem.c
+index baf7c41..c083c63 100644
+--- a/eurasia_km/services4/srvkm/common/devicemem.c
++++ b/eurasia_km/services4/srvkm/common/devicemem.c
+@@ -1071,6 +1071,7 @@ PVRSRV_ERROR FreeMemCallBackCommon(PVRSRV_KERNEL_MEM_INFO *psMemInfo,
+ 			case PVRSRV_MEMTYPE_ION:
+ 			case PVRSRV_MEMTYPE_DMABUF:
+ 				freeExternal(psMemInfo);
++				/* FALLTHRU */
+ 			case PVRSRV_MEMTYPE_DEVICE:
+ 			case PVRSRV_MEMTYPE_DEVICECLASS:
+ #if defined(SUPPORT_ION)
+-- 
+2.7.4
+
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 0e5411f..0303797 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -7,7 +7,7 @@ inherit module
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
-MACHINE_KERNEL_PR_append = "m"
+MACHINE_KERNEL_PR_append = "o"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -22,7 +22,10 @@ RCONFLICTS_${PN} = "omapdrm-pvr"
 
 BRANCH = "ti-img-sgx/${PV}/k4.9"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
+file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch \
+"
+
 S = "${WORKDIR}/git"
 
 SRCREV = "0086977380d3320d70a3abc78b95fa0641427073"
-- 
2.7.4


