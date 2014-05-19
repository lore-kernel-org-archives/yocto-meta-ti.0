Return-Path: <hzhang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 468DAE00C0A; Mon, 19 May 2014 06:52:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from bear.ext.ti.com (unknown [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2E0D7E00C13
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 06:51:53 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JDprtG014901
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 08:51:53 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JDprht024678
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 08:51:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 08:51:53 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JDprGK001957;	Mon, 19 May 2014 08:51:53 -0500
Received: from a0868496 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <hzhang@ti.com>)	id 1WmNyq-0005oa-TM; Mon, 19 May 2014
	09:51:52 -0400
From: <hzhang@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 09:51:51 -0400
Message-ID: <1400507511-22322-1-git-send-email-hzhang@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [Re-submit: v2 3/3] keystone: k2e-evm config: add k2e-evm machine config
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
X-List-Received-Date: Mon, 19 May 2014 13:52:14 -0000
Content-Type: text/plain

From: Hao Zhang <hzhang@ti.com>

Add a new k2e-evm machine config for Keystone II SoC family.

Signed-off-by: Hao Zhang <hzhang@ti.com>
---
 conf/machine/{k2hk-evm.conf => k2e-evm.conf} |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 copy conf/machine/{k2hk-evm.conf => k2e-evm.conf} (79%)

diff --git a/conf/machine/k2hk-evm.conf b/conf/machine/k2e-evm.conf
similarity index 79%
copy from conf/machine/k2hk-evm.conf
copy to conf/machine/k2e-evm.conf
index 0ef6ad0..551587f 100644
--- a/conf/machine/k2hk-evm.conf
+++ b/conf/machine/k2e-evm.conf
@@ -1,12 +1,12 @@
 #@TYPE: Machine
-#@NAME: Keystone 2 K2HK machine
-#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2HK EVM
+#@NAME: Keystone 2 K2E machine
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E EVM
 
 require conf/machine/include/keystone.inc
 
-UBOOT_MACHINE = "k2hk_evm_config"
+UBOOT_MACHINE = "k2e_evm_config"
 
-BOOT_MONITOR_MAKE_TARGET = "k2hk"
+BOOT_MONITOR_MAKE_TARGET = "k2e"
 
 IMAGE_FSTYPES += "ubi tar.gz cpio"
 
-- 
1.7.9.5


