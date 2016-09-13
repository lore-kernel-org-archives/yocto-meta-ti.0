Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D914E00C0B; Mon, 12 Sep 2016 19:27:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D95CE00C46
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 19:27:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CB73B52AC4; Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160913022704.CB73B52AC4@arago-project.org>
Date: Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : machines: add OPTEE config for dra7 and am57 machines
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
X-List-Received-Date: Tue, 13 Sep 2016 02:27:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 71db7c89152732847992b417b5fa8aff30f47c1e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=71db7c89152732847992b417b5fa8aff30f47c1e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep 13 04:40:57 2016 +0000

machines: add OPTEE config for dra7 and am57 machines

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-hs-evm.conf |    4 ++++
 conf/machine/dra7xx-hs-evm.conf |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

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


