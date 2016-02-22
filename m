Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9E99FE00C4F; Mon, 22 Feb 2016 14:25:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP,
	but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.9 listed in list.dnswl.org]
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EB99E00C4C
	for <meta-ti@yoctoproject.org>; Mon, 22 Feb 2016 14:25:53 -0800 (PST)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.148])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2Y00D4AZMMBF70@vms173009.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 22 Feb 2016 16:25:35 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=kOkXgNpPMkWqY6lXCHUA:9
Received: by 100.15.86.14 with SMTP id 3956f38b; Mon, 22 Feb 2016 22:25:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1F26D161EC1;	Mon,
	22 Feb 2016 17:25:34 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 22 Feb 2016 17:25:33 -0500
Message-id: <1456179933-13558-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1456179933-13558-1-git-send-email-denis@denix.org>
References: <1456179933-13558-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] linux-ti-staging: rdepends on prueth-fw
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
X-List-Received-Date: Mon, 22 Feb 2016 22:25:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_4.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 76838f2..8b1ee59 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -39,6 +39,9 @@ RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2e-evm = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2l-evm = " netcp-pa-fw"
 
+# Add run-time dependency for PRU Ethernet firmware to the rootfs
+RDEPENDS_kernel-base_append_am57xx-evm = " prueth-fw"
+
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
 KERNEL_DEVICETREE_ti33x = "am335x-evm.dtb am335x-evmsk.dtb am335x-bone.dtb am335x-boneblack.dtb"
@@ -69,7 +72,7 @@ SRCREV = "f5caecb092f6e8c642101f8c56c3fbb136de7052"
 PV = "4.1.18+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-- 
2.2.0


