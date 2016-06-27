Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1687E00CCD; Mon, 27 Jun 2016 11:35:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECED8E00CC9
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 11:35:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5RIVKZ9032074
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 13:31:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5RIVJ2S028227
	for <meta-ti@yoctoproject.org>; Mon, 27 Jun 2016 13:31:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Jun 2016 13:31:19 -0500
Received: from a0756824local.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5RIVICS031505;	Mon, 27 Jun 2016 13:31:19 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Jun 2016 14:31:04 -0400
Message-ID: <1467052268-22676-2-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1467052268-22676-1-git-send-email-jsobota@ti.com>
References: <1467052268-22676-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 2/6] common-csl-ip: Bump version common-csl-ip-rtos: Move to new makefile support provided in ti-pdk.bbclass
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
X-List-Received-Date: Mon, 27 Jun 2016 18:35:06 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 .../common-csl-ip/common-csl-ip-rtos_git.bb        |   28 +++++++++-----------
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |    8 +++---
 2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 43ea2ed..877b230 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,5 +1,5 @@
 require common-csl-ip.inc
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -7,20 +7,16 @@ inherit ti-pdk
 
 DEPENDS_remove = "${PN}"
 
-XDCARGS_ti33x = "am335x"
-XDCARGS_ti43x = "am437x"
-XDCARGS_omap-a15 = "am571x am572x"
-XDCARGS_k2hk-evm = "k2h k2k"
-XDCARGS_k2l-evm = "k2l"
-XDCARGS_k2e-evm = "k2e"
-XDCARGS_k2g-evm = "k2g"
+# Build with make instead of XDC
+XDCMAKE = "0"
 
-do_configure_append() {
-    # Create empty makefile
-    # If libraries are supported for this device, then this will be overwritten
-    cat > ${BUILD_DIR}/makefile << __EOF__
-# Nothing to do
-all:
+LIMSOCS_ti33x = "am335x"
+LIMSOCS_ti43x = "am437x"
+LIMSOCS_omap-a15 = "am571x am572x"
+LIMSOCS_k2hk-evm = "k2h k2k"
+LIMSOCS_k2l-evm = "k2l"
+LIMSOCS_k2e-evm = "k2e"
+LIMSOCS_k2g-evm = "k2g"
 
-__EOF__
-}
+export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 70d963b..eefa8c7 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,16 +4,16 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 
-PV = "3.3.0.2C"
-INC_PR = "r0"
+PV = "3.3.0.3B"
+INC_PR = "r1"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
 CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
 CSL_GIT_DESTSUFFIX = "git"
 
-# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.02C
-CSL_SRCREV = "dc8aac00e86cd434865d750666ac551f2e238263"
+# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.03B"
+CSL_SRCREV = "a4ac2bb969096458a4cd9d21ff37073b513ff3b8"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
1.7.10.4


