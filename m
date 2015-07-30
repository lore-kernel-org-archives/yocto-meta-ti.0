Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60A1CE00A96; Wed, 29 Jul 2015 20:15:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 556A6E00A80
	for <meta-ti@yoctoproject.org>; Wed, 29 Jul 2015 20:15:45 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSA00JYY6E7RIG0@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 29 Jul 2015 22:15:44 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=wJwqYIZTTlMWy0gATgIA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6FF4C161B23;	Wed,
	29 Jul 2015 23:15:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 29 Jul 2015 23:15:42 -0400
Message-id: <1438226142-4379-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1438226142-4379-1-git-send-email-denis@denix.org>
References: <1438226142-4379-1-git-send-email-denis@denix.org>
Subject: [fido/master][PATCH 3/3] linux-ti-staging: update with recent merges, switch to new PM firmware
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
X-List-Received-Date: Thu, 30 Jul 2015 03:15:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.1.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 7b5fadd..cd4497a 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -18,8 +18,8 @@ RDEPENDS_kernel-base += "kernel-devicetree"
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_append_ti33x = " am33x-cm3"
-RDEPENDS_kernel-base_append_ti43x = " am33x-cm3"
+RDEPENDS_kernel-base_append_ti33x = " amx3-cm3"
+RDEPENDS_kernel-base_append_ti43x = " amx3-cm3"
 
 # Add a run-time dependency for the VPE VPDMA firmware to be installed
 # on the target file system.
@@ -47,11 +47,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.1.y"
 
-SRCREV = "c34fd7dc89f0f3690a84e6ec0d0d76ab86466366"
+SRCREV = "83b86ca5dacc381b5c21db27aba348f187890632"
 PV = "4.1.3+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


