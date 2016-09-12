Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C249CE00A84; Mon, 12 Sep 2016 16:41:24 -0700 (PDT)
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
X-Greylist: delayed 3601 seconds by postgrey-1.32 at yocto-www;
	Mon, 12 Sep 2016 16:41:19 PDT
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4765E00A4B
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 16:41:19 -0700 (PDT)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODE00A5XXOEJV50@vms173013.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 12 Sep 2016 17:41:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=Vr53eHRINRMzGKLNOlAA:9
Received: by 100.15.86.14 with SMTP id 7cd7d596; Mon, 12 Sep 2016 22:41:03 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 9A34D16212C;	Mon, 12 Sep 2016 18:41:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 12 Sep 2016 18:40:57 -0400
Message-id: <1473720059-26466-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1473720059-26466-1-git-send-email-denis@denix.org>
References: <1473720059-26466-1-git-send-email-denis@denix.org>
Subject: [PATCH 6/8] machines: add OPTEE config for dra7 and am57 machines
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
X-List-Received-Date: Mon, 12 Sep 2016 23:41:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-hs-evm.conf | 4 ++++
 conf/machine/dra7xx-hs-evm.conf | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index bd5a145..e43a648 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -12,3 +12,7 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_DRA7}"
+
+OPTEEMACHINE = "ti"
+OPTEEFLAVOR = "am572x_evm"
+OPTEEOUTPUTMACHINE = "ti"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index 537152b..a82402d 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -12,3 +12,7 @@ UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_DRA7}"
+
+OPTEEMACHINE = "ti"
+OPTEEFLAVOR = "dra7xx_evm dra72x_evm_revc"
+OPTEEOUTPUTMACHINE = "ti"
-- 
2.7.4


