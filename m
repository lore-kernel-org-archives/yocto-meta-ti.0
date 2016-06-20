Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9DB5E00984; Mon, 20 Jun 2016 14:39:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6BF9BE008BC
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 14:39:53 -0700 (PDT)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O9300GOGAUG2W10@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 20 Jun 2016 16:39:53 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=EzPskp8AYkMfyAuG0KIA:9
Received: by 100.15.86.14 with SMTP id 3a5a9ac2; Mon, 20 Jun 2016 21:39:52 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 57DC1162042;	Mon,
	20 Jun 2016 17:39:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 20 Jun 2016 17:39:51 -0400
Message-id: <20160620213951.21524-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] am57xx-hs-evm: add AM5 HS platform config
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
X-List-Received-Date: Mon, 20 Jun 2016 21:39:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-hs-evm.conf | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 conf/machine/am57xx-hs-evm.conf

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
new file mode 100644
index 0000000..a375017
--- /dev/null
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: AM57xx HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM57xx HS EVM
+
+require conf/machine/am57xx-evm.conf
+
+UBOOT_MACHINE = "am57xx_hs_evm_config"
-- 
2.9.0


