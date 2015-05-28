Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73739E009EF; Thu, 28 May 2015 07:24:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DFC5E009CC
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2015 07:24:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4SEOTug000799
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2015 09:24:29 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4SEOT0N023948
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2015 09:24:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 28 May 2015 09:24:29 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4SEOTo3010837;
	Thu, 28 May 2015 09:24:29 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1YxyjV-0001iz-4D; Thu, 28 May 2015 10:24:29 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 May 2015 10:24:20 -0400
Message-ID: <1432823060-6595-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linux-keystone: update to new kernel version 3.10.72
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
X-List-Received-Date: Thu, 28 May 2015 14:24:35 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Branch name changed to release specific branch

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    8 ++++----
 recipes-kernel/linux/linux-keystone_3.10.bb    |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 7ce45b5..51e18d3 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_RT_LINUX_03.10.61_15.02"
-SRCREV = "e2e31a1d996d2ed8dd06dab1221e159033432b72"
-PV = "3.10.61+git${SRCPV}"
+#This commit corresponds to "K2_RT_LINUX_03.10.72_15.##"
+SRCREV = "d607d75a2de99b3723cf9a2ba56f839debbee3c8"
+PV = "3.10.72+git${SRCPV}"
 
-BRANCH = "v3.10.61/master-rt"
+BRANCH = "v3.10.72/master-rt"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
            "
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 78d5a0e..01573ca 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_LINUX_03.10.61_15.02"
-SRCREV = "a17b4c3fd6c93f908daf032786f90c0321296957"
-PV = "3.10.61+git${SRCPV}"
+#This commit corresponds to "K2_LINUX_03.10.72_15.##"
+SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
+PV = "3.10.72+git${SRCPV}"
 
-BRANCH = "v3.10.61/master"
+BRANCH = "v3.10.72/master"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
            "
-- 
1.7.9.5


