Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88DCBE00BB0; Tue, 20 Sep 2016 09:25:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.13 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F299BE00B5F
	for <meta-ti@yoctoproject.org>; Tue, 20 Sep 2016 09:25:52 -0700 (PDT)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODT00HFO9N3Y230@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 20 Sep 2016 11:25:52 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=ACuu1BRyni_HeI9erTkA:9
Received: by 100.15.110.130 with SMTP id 2df9d9f5;
	Tue, 20 Sep 2016 16:25:51 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 365F2162137;	Tue, 20 Sep 2016 12:25:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 20 Sep 2016 12:25:49 -0400
Message-id: <1474388749-23021-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] linux-ti-staging: specify DTB for k2e HS platform
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
X-List-Received-Date: Tue, 20 Sep 2016 16:25:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 9b791ab..fb83f6a 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -67,6 +67,7 @@ KERNEL_DEVICETREE_beagleboard = "omap3-beagle.dtb omap3-beagle-xm.dtb omap3-beag
 KERNEL_DEVICETREE_pandaboard = "omap4-panda.dtb omap4-panda-a4.dtb omap4-panda-es.dtb"
 KERNEL_DEVICETREE_k2hk-evm = "keystone-k2hk-evm.dtb"
 KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
+KERNEL_DEVICETREE_k2e-hs-evm = "${KERNEL_DEVICETREE_k2e-evm}"
 KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
@@ -80,7 +81,7 @@ SRCREV = "4fb4591a4ab1b3ef317fa87af3cd3c06f1a7284b"
 PV = "4.4.21+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.7.4


