Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1097BE00503; Mon, 19 Sep 2016 10:00:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: *  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP,
	but had no rDNS
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA1CFE00777
	for <meta-ti@yoctoproject.org>; Mon, 19 Sep 2016 10:00:05 -0700 (PDT)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0ODR003ASGJAJP20@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 19 Sep 2016 11:59:49 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=GW1xBdLrtEIA:10 a=sozttTNsAAAA:8	a=SUn-jrWY8JI9hO41UjoA:9
Received: by 100.15.110.130 with SMTP id 27a2bd70;
	Mon, 19 Sep 2016 16:59:49 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 0FBC316213A;	Mon, 19 Sep 2016 12:59:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 19 Sep 2016 12:59:27 -0400
Message-id: <1474304370-18201-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-reply-to: <1474304370-18201-1-git-send-email-denis@denix.org>
References: <1474304370-18201-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/6] conf/machine: rename SECDEV variables for additional platforms
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
X-List-Received-Date: Mon, 19 Sep 2016 17:00:35 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am437x-hs-evm.conf | 2 +-
 conf/machine/am57xx-hs-evm.conf | 2 +-
 conf/machine/dra7xx-hs-evm.conf | 2 +-
 conf/machine/k2e-hs-evm.conf    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
index 4fb277d..2f551b5 100644
--- a/conf/machine/am437x-hs-evm.conf
+++ b/conf/machine/am437x-hs-evm.conf
@@ -11,4 +11,4 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AM4}"
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/am4x"
diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index e43a648..24e9b2a 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -11,7 +11,7 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_DRA7}"
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
 
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "am572x_evm"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index a82402d..a6a5e0f 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -11,7 +11,7 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_DRA7}"
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
 
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "dra7xx_evm dra72x_evm_revc"
diff --git a/conf/machine/k2e-hs-evm.conf b/conf/machine/k2e-hs-evm.conf
index f2df52e..98d595d 100644
--- a/conf/machine/k2e-hs-evm.conf
+++ b/conf/machine/k2e-hs-evm.conf
@@ -11,4 +11,4 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AM4}"
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_CAT}/k2e"
-- 
2.7.4


