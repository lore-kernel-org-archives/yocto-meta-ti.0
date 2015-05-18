Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05D34E009EB; Mon, 18 May 2015 05:21:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21CA6E009D4
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 05:21:07 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4ICL5eW029756
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 07:21:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4ICL57N020965
	for <meta-ti@yoctoproject.org>; Mon, 18 May 2015 07:21:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 18 May 2015 07:21:05 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4ICL3MF026417;	Mon, 18 May 2015 07:21:05 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 May 2015 08:20:59 -0400
Message-ID: <1431951659-9935-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431951659-9935-1-git-send-email-j-stiffler@ti.com>
References: <1431951659-9935-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-ti-staging-3.14: Allow CMEM DT injection.
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
X-List-Received-Date: Mon, 18 May 2015 12:21:10 -0000
Content-Type: text/plain

* Disabled by default.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.14.bb |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index eb1ad27..7e67719 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -8,6 +8,7 @@ inherit kernel
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/multi-kernel.inc
+require recipes-kernel/linux/cmem.inc
 
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
@@ -49,7 +50,7 @@ SRCREV = "7763988e04f12b089283e385f3593e7f34a92068"
 PV = "3.14.42"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
1.7.9.5


