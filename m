Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08978E00CA9; Fri,  1 Apr 2016 14:18:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.15 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 497D3E00CA0
	for <meta-ti@yoctoproject.org>; Fri,  1 Apr 2016 14:18:16 -0700 (PDT)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.152])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4Z00KHK4HED070@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 01 Apr 2016 16:17:39 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=SOWFt-9vw3htBttc60wA:9
Received: by 100.15.86.14 with SMTP id 4b7d66bb; Fri, 01 Apr 2016 21:17:39 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A6AF9161F56;	Fri,
	1 Apr 2016 17:17:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 01 Apr 2016 17:17:34 -0400
Message-id: <1459545455-7126-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [fido/master][PATCH] linux-ti-staging 4.1: add PRU Ethernet FW dependency for AM4
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
X-List-Received-Date: Fri, 01 Apr 2016 21:18:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index edc8e00..ea1ed62 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -41,6 +41,7 @@ RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 
 # Add run-time dependency for PRU Ethernet firmware to the rootfs
 RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
+RDEPENDS_kernel-base_append_am437x-evm = " prueth-fw"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
@@ -73,7 +74,7 @@ SRCREV = "6b41ca0b945d73ac8c8318083f79411639836643"
 PV = "4.1.18+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "k"
+MACHINE_KERNEL_PR_append = "l"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


