Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57130E0086B; Mon, 19 Sep 2016 16:00:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35AD6E00756
	for <meta-ti@yoctoproject.org>; Mon, 19 Sep 2016 15:59:55 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8CE2A52AB2; Mon, 19 Sep 2016 22:59:54 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160919225954.8CE2A52AB2@arago-project.org>
Date: Mon, 19 Sep 2016 22:59:54 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: rename SECDEV variables for additional platforms
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
X-List-Received-Date: Mon, 19 Sep 2016 23:00:00 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 7f742986d5705250cb9082e105b3e4564bd85524
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7f742986d5705250cb9082e105b3e4564bd85524

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 19 22:59:27 2016 +0000

conf/machine: rename SECDEV variables for additional platforms

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am437x-hs-evm.conf |    2 +-
 conf/machine/am57xx-hs-evm.conf |    2 +-
 conf/machine/dra7xx-hs-evm.conf |    2 +-
 conf/machine/k2e-hs-evm.conf    |    2 +-
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


