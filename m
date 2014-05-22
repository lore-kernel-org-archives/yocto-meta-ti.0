Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9FAEE00A44; Thu, 22 May 2014 09:16:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89F70E00A2F
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 09:16:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4MGGN4f011221
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 11:16:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4MGGNV5009469
	for <meta-ti@yoctoproject.org>; Thu, 22 May 2014 11:16:23 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 May 2014 11:16:23 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4MGGHaV013978;	Thu, 22 May 2014 11:16:21 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 May 2014 11:16:14 -0500
Message-ID: <1400775376-28129-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1400775376-28129-1-git-send-email-Chase.Maupin@ti.com>
References: <1400775376-28129-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] linux-ti-staging: Make files directory version specific
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
X-List-Received-Date: Thu, 22 May 2014 16:16:26 -0000
Content-Type: text/plain

* As we add the next version of the linux-ti-staging kernel there
  will be a different list of config fragments, removed patches,
  etc.  For this reason it makes sense to have the file directory
  be version specific

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 ...ge-ARM-config-omap-Disable-SMP-for-AM335x.patch |    0
 .../baseport.cfg                                   |    0
 .../connectivity.cfg                               |    0
 .../defconfig                                      |    0
 .../ipc.cfg                                        |    0
 .../systest.cfg                                    |    0
 recipes-kernel/linux/linux-ti-staging_3.12.bb      |    3 +++
 7 files changed, 3 insertions(+)
 rename recipes-kernel/linux/{linux-ti-staging => linux-ti-staging-3.12}/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch (100%)
 rename recipes-kernel/linux/{linux-ti-staging => linux-ti-staging-3.12}/baseport.cfg (100%)
 rename recipes-kernel/linux/{linux-ti-staging => linux-ti-staging-3.12}/connectivity.cfg (100%)
 rename recipes-kernel/linux/{linux-ti-staging => linux-ti-staging-3.12}/defconfig (100%)
 rename recipes-kernel/linux/{linux-ti-staging => linux-ti-staging-3.12}/ipc.cfg (100%)
 rename recipes-kernel/linux/{linux-ti-staging => linux-ti-staging-3.12}/systest.cfg (100%)

diff --git a/recipes-kernel/linux/linux-ti-staging/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch b/recipes-kernel/linux/linux-ti-staging-3.12/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
rename to recipes-kernel/linux/linux-ti-staging-3.12/0001-Not-for-merge-ARM-config-omap-Disable-SMP-for-AM335x.patch
diff --git a/recipes-kernel/linux/linux-ti-staging/baseport.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/baseport.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/baseport.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/baseport.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging/connectivity.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/connectivity.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/connectivity.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/connectivity.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging/defconfig b/recipes-kernel/linux/linux-ti-staging-3.12/defconfig
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/defconfig
rename to recipes-kernel/linux/linux-ti-staging-3.12/defconfig
diff --git a/recipes-kernel/linux/linux-ti-staging/ipc.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/ipc.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/ipc.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging/systest.cfg b/recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
similarity index 100%
rename from recipes-kernel/linux/linux-ti-staging/systest.cfg
rename to recipes-kernel/linux/linux-ti-staging-3.12/systest.cfg
diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index 154d2fc..d555b04 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -8,6 +8,9 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
+# Look in the generic major.minor directory for files
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.12:"
+
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
 
-- 
1.7.9.5


