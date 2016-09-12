Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B96BDE00B7B; Mon, 12 Sep 2016 15:42:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4154E00B30
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 15:41:15 -0700 (PDT)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODE008ZNXOEJU30@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 12 Sep 2016 17:41:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=m5H8YYYV48BrEhOUqe8A:9
Received: by 100.15.86.14 with SMTP id 1024f3d5; Mon, 12 Sep 2016 22:41:03 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id A5E9B16212D;	Mon, 12 Sep 2016 18:41:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 12 Sep 2016 18:40:58 -0400
Message-id: <1473720059-26466-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1473720059-26466-1-git-send-email-denis@denix.org>
References: <1473720059-26466-1-git-send-email-denis@denix.org>
Subject: [PATCH 7/8] k2e-hs-evm: add K2E HS EVM config
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
X-List-Received-Date: Mon, 12 Sep 2016 22:42:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/k2e-hs-evm.conf | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 conf/machine/k2e-hs-evm.conf

diff --git a/conf/machine/k2e-hs-evm.conf b/conf/machine/k2e-hs-evm.conf
new file mode 100644
index 0000000..f2df52e
--- /dev/null
+++ b/conf/machine/k2e-hs-evm.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2E HS EVM
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E HS EVM
+
+require conf/machine/k2e-evm.conf
+
+UBOOT_MACHINE = "k2e_hs_evm_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AM4}"
-- 
2.7.4


