Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 826E2E00994; Thu, 23 Apr 2015 04:42:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 47DE6E00994
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 04:42:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NBgKEP025852
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 06:42:20 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NBgJV0020453
	for <meta-ti@yoctoproject.org>; Thu, 23 Apr 2015 06:42:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 06:42:18 -0500
Received: from udb0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t3NBgFsm012904;	Thu, 23 Apr 2015 06:42:18 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 23 Apr 2015 07:42:11 -0400
Message-ID: <1429789331-18918-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
References: <1429789331-18918-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [RFC 2/2] linux-ti-staging_3.14: Add CMEM region for omap-a15.
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
X-List-Received-Date: Thu, 23 Apr 2015 11:42:23 -0000
Content-Type: text/plain

* This region can be used by applications to enable shared contiguous
  memory in user space for data transfer between the ARM and DSP.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.14.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 061faed..ee91fc1 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -8,6 +8,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/multi-kernel.inc
+require recipes-kernel/linux/cmem.inc
 
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
@@ -49,7 +50,7 @@ SRCREV = "5e342e186fcd9834fff09f6335b344599042be88"
 PV = "3.14.39"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -57,6 +58,9 @@ KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
 
+CMEM_BASE_omap-a15 = "a0000000"
+CMEM_SIZE_omap-a15 = "20000000"
+
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
1.7.9.5


