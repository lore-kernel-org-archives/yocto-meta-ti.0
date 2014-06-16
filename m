Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D08F5E00BDE; Mon, 16 Jun 2014 11:56:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F766E00B71
	for <meta-ti@yoctoproject.org>; Mon, 16 Jun 2014 11:56:15 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5GIuEWv025231
	for <meta-ti@yoctoproject.org>; Mon, 16 Jun 2014 13:56:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5GIuEp8023937
	for <meta-ti@yoctoproject.org>; Mon, 16 Jun 2014 13:56:14 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 16 Jun 2014 13:56:13 -0500
Received: from ares-ubuntu (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5GIuETk007397;
	Mon, 16 Jun 2014 13:56:14 -0500
Received: from a0868496 by ares-ubuntu with local (Exim 4.76)	(envelope-from
	<hzhang@ti.com>)	id 1Wwc4j-0007Qg-Qc; Mon, 16 Jun 2014 14:56:13 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 16 Jun 2014 14:56:12 -0400
Message-ID: <1402944972-28528-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] keystone: config: fix K2L boot monitor build target name error
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
X-List-Received-Date: Mon, 16 Jun 2014 18:56:25 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 conf/machine/k2l-evm.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/k2l-evm.conf b/conf/machine/k2l-evm.conf
index 0824a09..76fb3f8 100644
--- a/conf/machine/k2l-evm.conf
+++ b/conf/machine/k2l-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/keystone.inc
 
 UBOOT_MACHINE = "k2l_evm_config"
 
-BOOT_MONITOR_MAKE_TARGET = "k2hk"
+BOOT_MONITOR_MAKE_TARGET = "k2l"
 
 IMAGE_FSTYPES += "ubi tar.gz cpio"
 
-- 
1.7.9.5


