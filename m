Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E3A10E00D5F; Thu, 10 Sep 2015 04:58:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9561E00B9A
	for <meta-ti@yoctoproject.org>; Thu, 10 Sep 2015 04:58:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8ABwlaV000758
	for <meta-ti@yoctoproject.org>; Thu, 10 Sep 2015 06:58:47 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8ABwlC6032631
	for <meta-ti@yoctoproject.org>; Thu, 10 Sep 2015 06:58:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 10 Sep 2015 06:58:37 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t8ABwjQY014157;	Thu, 10 Sep 2015 06:58:46 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 10 Sep 2015 07:58:41 -0400
Message-ID: <1441886321-28258-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1441886321-28258-1-git-send-email-j-stiffler@ti.com>
References: <1441886321-28258-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] gdbserverproxy-module-drv: Fix build issue with fido
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
X-List-Received-Date: Thu, 10 Sep 2015 11:58:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index 4dedb83..77a29ec 100644
--- a/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -3,7 +3,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=75859989545e37968a99b631ef42722e"
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 PV_append = "+git${SRCPV}"
 
@@ -15,7 +15,7 @@ PLATFORM = ""
 PLATFORM_dra7xx = "DRA7xx_PLATFORM"
 PLATFORM_keystone = "KEYSTONE_PLATFORM"
 
-EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
+EXTRA_OEMAKE = "PLATFORM=${PLATFORM} KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 # The following is to prevent an unused configure.ac from erroneously
 # triggering the QA check for gettext.
@@ -29,4 +29,4 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 include gdbc6x.inc
 
-module_autoload_gdbserverproxy = "gdbserverproxy"
+KERNEL_MODULE_AUTOLOAD += "gdbserverproxy"
-- 
1.9.1


