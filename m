Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06CA5E00DF2; Wed, 29 Jun 2016 14:12:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2FF1E00DAB
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 14:11:58 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A197652AD0; Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160629211156.A197652AD0@arago-project.org>
Date: Wed, 29 Jun 2016 21:11:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Justin Sobota : common-csl-ip: Move to new make infrastructure & Bump version
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
X-List-Received-Date: Wed, 29 Jun 2016 21:12:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 85cce508817c9f3a56c5e10ed4993ae9d640fe5d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=85cce508817c9f3a56c5e10ed4993ae9d640fe5d

Author: Justin Sobota <jsobota@ti.com>
Date:   Thu Jun 30 00:57:18 2016 +0000

common-csl-ip: Move to new make infrastructure & Bump version

Signed-off-by: Justin Sobota <jsobota@ti.com>
Tested-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |   28 ++++++++-----------
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |    6 ++--
 2 files changed, 15 insertions(+), 19 deletions(-)

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
index 70d963b..77dfd1b 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 
-PV = "3.3.0.2C"
+PV = "3.3.0.3C"
 INC_PR = "r0"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
@@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
 CSL_GIT_DESTSUFFIX = "git"
 
-# commit ID corresponds to DEV.CSL_PROCESSOR-SDK.03.03.00.02C
-CSL_SRCREV = "dc8aac00e86cd434865d750666ac551f2e238263"
+# Below commit ID corresponds to "DEV.CSL_PROCESSOR-SDK.03.03.00.03C"
+CSL_SRCREV = "ccd8dc29a5edce1a4d6409cb06b460bec6d3ecac"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"


