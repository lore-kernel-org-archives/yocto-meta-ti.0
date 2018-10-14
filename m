Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1D4EE008D7; Sun, 14 Oct 2018 16:57:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9D3EE00826
	for <meta-ti@yoctoproject.org>; Sun, 14 Oct 2018 16:57:20 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AC7A320CE7;
	Sun, 14 Oct 2018 23:57:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oehVOOUORL6n; Sun, 14 Oct 2018 23:57:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 801C520CE5;
	Sun, 14 Oct 2018 23:57:18 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 08B8D164771;
	Sun, 14 Oct 2018 19:57:18 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Sun, 14 Oct 2018 19:57:17 -0400
Message-Id: <1539561437-12514-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ti-sgx-ddk-km: fix/workaround new gcc8 checks
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
X-List-Received-Date: Sun, 14 Oct 2018 23:57:22 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...-buildvars.mk-pass-Wno-cast-function-type.patch | 26 +++++++++++++++++
 ...inux-osfunc.c-fix-gcc8-stringop-truncatio.patch | 34 ++++++++++++++++++++++
 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |  4 ++-
 3 files changed, 63 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch
 create mode 100644 recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch
new file mode 100644
index 0000000..e1d2d10
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-buildvars.mk-pass-Wno-cast-function-type.patch
@@ -0,0 +1,26 @@
+From 287ca27cdf9004b4ba9bb0ce30d6139f707246f9 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 14 Oct 2018 19:53:14 -0400
+Subject: [PATCH] buildvars.mk: pass -Wno-cast-function-type
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ eurasia_km/eurasiacon/build/linux2/buildvars.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/eurasia_km/eurasiacon/build/linux2/buildvars.mk b/eurasia_km/eurasiacon/build/linux2/buildvars.mk
+index f30e467..f00f852 100644
+--- a/eurasia_km/eurasiacon/build/linux2/buildvars.mk
++++ b/eurasia_km/eurasiacon/build/linux2/buildvars.mk
+@@ -48,7 +48,7 @@
+ 
+ # These flags are used for kernel, User C and User C++
+ #
+-COMMON_FLAGS := -W -Wall
++COMMON_FLAGS := -W -Wall -Wno-cast-function-type
+ 
+ # Some GCC warnings are C only, so we must mask them from C++
+ #
+-- 
+2.7.4
+
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch
new file mode 100644
index 0000000..96e657d
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch
@@ -0,0 +1,34 @@
+From 353d8b9313abc492e5938171cea4ac697fd991f0 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sun, 14 Oct 2018 19:41:49 -0400
+Subject: [PATCH] srvkm/env/linux/osfunc.c: fix gcc8 stringop-truncation error
+
+gcc8 now checks for strncpy function that potentially truncate the terminating
+NUL charcter from the source string. Fails like this:
+
+.../services4/srvkm/env/linux/osfunc.c:3051:13: error: 'strncpy' specified bound 50 equals destination size [-Werror=stringop-truncation]
+|              strncpy(psEventObject->szName, pszName, EVENTOBJNAME_MAXLENGTH);
+|              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+| cc1: all warnings being treated as errors
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ eurasia_km/services4/srvkm/env/linux/osfunc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/eurasia_km/services4/srvkm/env/linux/osfunc.c b/eurasia_km/services4/srvkm/env/linux/osfunc.c
+index 02dfe9b..02c8e3b 100644
+--- a/eurasia_km/services4/srvkm/env/linux/osfunc.c
++++ b/eurasia_km/services4/srvkm/env/linux/osfunc.c
+@@ -3048,7 +3048,7 @@ PVRSRV_ERROR OSEventObjectCreateKM(const IMG_CHAR *pszName, PVRSRV_EVENTOBJECT *
+         if(pszName)
+         {
+             /* copy over the event object name */
+-            strncpy(psEventObject->szName, pszName, EVENTOBJNAME_MAXLENGTH);
++            strncpy(psEventObject->szName, pszName, EVENTOBJNAME_MAXLENGTH-1);
+         }
+         else
+         {
+-- 
+2.7.4
+
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index a4eb82a..e84c11b 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -22,7 +22,9 @@ RCONFLICTS_${PN} = "omapdrm-pvr"
 
 BRANCH = "ti-img-sgx/${PV}/k4.14"
 
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH} \
+	file://0001-srvkm-env-linux-osfunc.c-fix-gcc8-stringop-truncatio.patch \
+	file://0001-buildvars.mk-pass-Wno-cast-function-type.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


