Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D944BE00A27; Wed, 16 Mar 2016 12:09:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.9 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3247E0083D
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 12:09:36 -0700 (PDT)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4500GS7BVCWW90@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 16 Mar 2016 14:09:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=Z6pEUyKhh6cp7L26gWQA:9
Received: by 100.15.86.14 with SMTP id 6b6cd69b; Wed, 16 Mar 2016 19:09:23 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 949D8161EE8;	Wed,
	16 Mar 2016 15:09:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 16 Mar 2016 15:09:10 -0400
Message-id: <1458155351-3469-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] linux-ti-staging: update with latest A/D, platform and connectivity fixes
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
X-List-Received-Date: Wed, 16 Mar 2016 19:09:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.1.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
index 006ec9a..9686316 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
 
 BRANCH = "ti-rt-linux-4.1.y"
 
-SRCREV = "6d0ade6343f01482b46210e9e474f2cac32ff474"
+SRCREV = "a4248d096e1d94ca6e9223c77735ef7c6551ccff"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index d9ad58a..d041fd3 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -69,11 +69,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "d749a0d84da4d2e2e5a093e179e3a993f2848778"
+SRCREV = "32346b4d29d2405124e084c6a28f8ae0c0d4df6c"
 PV = "4.1.18+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "h"
+MACHINE_KERNEL_PR_append = "i"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


