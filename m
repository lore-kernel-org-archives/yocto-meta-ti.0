Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C440E00BF4; Wed, 17 Feb 2016 13:50:40 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DEE1E00BEC
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 13:50:39 -0800 (PST)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.153])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2P002MZOMULX60@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 17 Feb 2016 15:49:42 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=TKlVhl4RnsQ02b2NNq8A:9
Received: by 100.15.86.14 with SMTP id 76b76647; Wed, 17 Feb 2016 21:49:42 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7B72C161EB4;	Wed,
	17 Feb 2016 16:49:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 17 Feb 2016 16:49:40 -0500
Message-id: <1455745780-11703-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1455745780-11703-1-git-send-email-denis@denix.org>
References: <1455745780-11703-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] conf/machine: add initial configs for HS platforms
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
X-List-Received-Date: Wed, 17 Feb 2016 21:50:40 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-hs-evm.conf | 7 +++++++
 conf/machine/dra7xx-hs-evm.conf | 7 +++++++
 2 files changed, 14 insertions(+)
 create mode 100644 conf/machine/am437x-hs-evm.conf
 create mode 100644 conf/machine/dra7xx-hs-evm.conf

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
new file mode 100644
index 0000000..e8d88a4
--- /dev/null
+++ b/conf/machine/am437x-hs-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: AM437x HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM437x HS EVM
+
+require conf/machine/am437x-evm.conf
+
+UBOOT_MACHINE = "am43xx_hs_evm_config"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
new file mode 100644
index 0000000..a898716
--- /dev/null
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: DRA7xx HS EVM
+#@DESCRIPTION: Machine configuration for the TI DRA7xx HS EVM
+
+require conf/machine/dra7xx-evm.conf
+
+UBOOT_MACHINE = "dra7xx_hs_evm_config"
-- 
2.2.0


