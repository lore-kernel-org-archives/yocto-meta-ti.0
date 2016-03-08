Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D59CE0090E; Tue,  8 Mar 2016 15:44:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10C86E00911
	for <meta-ti@yoctoproject.org>; Tue,  8 Mar 2016 15:44:29 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 52D2D52A98; Tue,  8 Mar 2016 23:44:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160308234429.52D2D52A98@arago-project.org>
Date: Tue,  8 Mar 2016 23:44:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : HACK: edma3-lld-rtos: Add dependency on all toolchains
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
X-List-Received-Date: Tue, 08 Mar 2016 23:44:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 3e9c30612f72d5b5c2a0cbfcd77a4f9bac9cac27
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3e9c30612f72d5b5c2a0cbfcd77a4f9bac9cac27

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Tue Mar  8 23:58:10 2016 +0000

HACK: edma3-lld-rtos: Add dependency on all toolchains

* Despite supporting building of individual targets, there is a
  dependency on all toolchains even if the coresponding core is not
  part of a specific platform.
* This fixes do_configure with ti-xdctools_3.32.00.06 and
  ti-sysbios_6.45.01.29

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index 0195173..b1cedd0 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -2,14 +2,9 @@ require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-DEPENDS = "ti-sysbios ti-xdctools"
-
-DEPENDS_append_keystone = " gcc-arm-none-eabi-native ti-cgt6x-native"
-DEPENDS_append_ti33x = " gcc-arm-none-eabi-native"
-DEPENDS_append_ti43x = " gcc-arm-none-eabi-native"
-DEPENDS_append_omap-a15 = " gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"
+DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-ccsv6-native ti-cgt6x-native"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"


