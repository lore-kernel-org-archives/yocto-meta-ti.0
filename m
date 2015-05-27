Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4A3C4E009EB; Wed, 27 May 2015 09:20:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD723E009C5
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 09:20:25 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4RGKN42006297
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 11:20:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4RGKMOw024923
	for <meta-ti@yoctoproject.org>; Wed, 27 May 2015 11:20:23 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 27 May 2015 11:20:22 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4RGKKkC001523;	Wed, 27 May 2015 11:20:22 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 27 May 2015 12:20:15 -0400
Message-ID: <1432743617-24000-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
References: <1432743617-24000-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] edma3-lld: Seperate source and version into include file.
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
X-List-Received-Date: Wed, 27 May 2015 16:20:29 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld.inc    |   10 ++++++++++
 recipes-bsp/edma3-lld/edma3-lld_git.bb |   11 +----------
 2 files changed, 11 insertions(+), 10 deletions(-)
 create mode 100644 recipes-bsp/edma3-lld/edma3-lld.inc
 mode change 100755 => 100644 recipes-bsp/edma3-lld/edma3-lld_git.bb

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
new file mode 100644
index 0000000..e6dd92b
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "TI EDMA3 low level driver and test code"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
+# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
+SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
+
+PV = "2.11.13"
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
old mode 100755
new mode 100644
index 1ed4b93..913dd3e
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -1,13 +1,5 @@
-DESCRIPTION = "TI EDMA3 low level driver and test code"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+require edma3-lld.inc
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
-# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
-SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
-
-PV = "2.11.13"
 PR = "r0"
 
 COMPATIBLE_MACHINE = "keystone"
@@ -77,4 +69,3 @@ do_install () {
 	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
 		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
 }
-
-- 
1.7.9.5


