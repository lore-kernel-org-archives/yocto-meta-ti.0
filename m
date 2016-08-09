Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9A72E00DF4; Mon,  8 Aug 2016 18:04:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.7 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0249E00DBD
	for <meta-ti@yoctoproject.org>; Mon,  8 Aug 2016 18:04:04 -0700 (PDT)
Received: from vz-proxy-m004.mx.aol.com ([64.236.83.8])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBM00FJWAYBFB10@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 08 Aug 2016 20:03:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=Bcm0RCOkHTZ4We9DUxtllQ==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=lms0-HeulKkJLeGHCUQA:9
Received: by 100.15.86.14 with SMTP id 62c0cad4; Tue, 09 Aug 2016 01:03:48 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 79EC71620E0;	Mon,  8 Aug 2016 21:03:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 08 Aug 2016 21:03:46 -0400
Message-id: <1470704626-15957-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] am57xx/dra7xx: disable UBI images by default
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
X-List-Received-Date: Tue, 09 Aug 2016 01:04:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am57xx-evm.conf | 2 +-
 conf/machine/dra7xx-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 7dbc088..16ce76a 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyO2"
diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 6c69683..a03a7fe 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/dra7xx.inc
 
 MACHINE_FEATURES += "touchscreen"
 
-IMAGE_FSTYPES += "ubifs ubi tar.gz tar.xz"
+IMAGE_FSTYPES += "tar.gz tar.xz"
 
 SERIAL_CONSOLE = ""
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyO0"
-- 
2.7.4


