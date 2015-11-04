Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02470E00B28; Wed,  4 Nov 2015 06:58:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22FE7E00B2E
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 06:58:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DE6FA52AB8; Wed,  4 Nov 2015 14:57:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104145759.DE6FA52AB8@arago-project.org>
Date: Wed,  4 Nov 2015 14:57:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : common-csl-ip: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 14:58:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6042df4426cd1aebe3462f34ed82185983ed0449
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6042df4426cd1aebe3462f34ed82185983ed0449

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:08 2015 +0000

common-csl-ip: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../common-csl-ip/common-csl-ip-rtos_git.bb        |    6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc        |   19 ++++++++++++++-----
 recipes-bsp/common-csl-ip/common-csl-ip_git.bb     |    4 +---
 3 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index c1fb566..f8dc1ba 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -1,13 +1,13 @@
 require common-csl-ip.inc
 
+PR = "${INC_PR}.0"
+
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r1"
-
 DEPENDS = "ti-xdctools ti-cgt6x-native ti-sysbios"
 
-S = "${WORKDIR}/ti/csl"
+CSL_GIT_DESTSUFFIX = "git/ti/csl"
 
 export C6X_GEN_INSTALL_PATH="${STAGING_DIR_NATIVE}/usr"
 export XDCCGROOT="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index 6355165..74abab0 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -5,13 +5,22 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 COMPATIBLE_MACHINE = "keystone|dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BRANCH="master"
-BRANCH_dra7xx = "releases/PROCESSOR-SDK.01.00.00"
+INC_PR = "r4"
 
-SRC_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git;protocol=git;branch=${BRANCH};destsuffix=${S}"
+CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
+CSL_GIT_PROTOCOL ="git"
+CSL_GIT_BRANCH = "master"
+CSL_GIT_BRANCH_dra7xx = "releases/PROCESSOR-SDK.01.00.00"
+CSL_GIT_DESTSUFFIX = "git"
 
 # commit ID corresponds to DEV.CSL_KEYSTONE2.02.01.01.00A
-SRCREV = "17bb083f0d5ed4ad6f38c991210a6a8e9aaf9c56"
+CSL_SRCREV = "17bb083f0d5ed4ad6f38c991210a6a8e9aaf9c56"
 
 # commit ID corresponds to PROCESSOR-SDK-ALPHA-1
-SRCREV_dra7xx = "37c5311ddf289f83b1432a9422816722d264bf55"
+CSL_SRCREV_dra7xx = "37c5311ddf289f83b1432a9422816722d264bf55"
+
+BRANCH="${CSL_GIT_BRANCH}"
+SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
+SRCREV = "${CSL_SRCREV}"
+
+S = "${WORKDIR}/${CSL_GIT_DESTSUFFIX}"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
index 8f622a5..77f7858 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bb
@@ -1,11 +1,9 @@
 require common-csl-ip.inc
 
-PR = "r3"
+PR = "${INC_PR}.0"
 
 ALLOW_EMPTY_${PN} = "1"
 
-S = "${WORKDIR}/git"
-
 do_install () {
     install -d ${D}${includedir}/ti/csl
     find . -name "*.h" -type f | xargs -I {} cp --parents {} ${D}${includedir}/ti/csl


