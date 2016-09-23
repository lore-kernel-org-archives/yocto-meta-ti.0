Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 193EBE00C1E; Fri, 23 Sep 2016 10:53:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B8EF9E007E1
	for <meta-ti@yoctoproject.org>; Fri, 23 Sep 2016 10:53:46 -0700 (PDT)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODY002PUXPLHK60@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 23 Sep 2016 12:53:45 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=TasUA3LgOFeN_0rcuAUA:9
Received: by 100.15.110.130 with SMTP id 219391a3;
	Fri, 23 Sep 2016 17:53:45 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id D659716212C;	Fri, 23 Sep 2016 13:53:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 23 Sep 2016 13:53:44 -0400
Message-id: <1474653224-16231-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] conf/machine: update OPTEE OS flavor names slightly
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
X-List-Received-Date: Fri, 23 Sep 2016 17:53:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-hs-evm.conf | 2 +-
 conf/machine/dra7xx-hs-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index 24e9b2a..be67205 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "am572x_evm"
+OPTEEFLAVOR = "am57xx_evm"
 OPTEEOUTPUTMACHINE = "ti"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index a6a5e0f..3a8ada2 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "dra7xx_evm dra72x_evm_revc"
+OPTEEFLAVOR = "dra7_evm dra72_evm_revc"
 OPTEEOUTPUTMACHINE = "ti"
-- 
2.7.4


