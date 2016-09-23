Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18DCAE00D4E; Fri, 23 Sep 2016 15:47:18 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9796DE00CA1
	for <meta-ti@yoctoproject.org>; Fri, 23 Sep 2016 15:47:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 84D0E52A90; Fri, 23 Sep 2016 22:47:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160923224712.84D0E52A90@arago-project.org>
Date: Fri, 23 Sep 2016 22:47:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: update OPTEE OS flavor names slightly
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
X-List-Received-Date: Fri, 23 Sep 2016 22:47:18 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 018d6239ea8c541b0375f04ef3e47283275b2669
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=018d6239ea8c541b0375f04ef3e47283275b2669

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Sep 23 23:53:44 2016 +0000

conf/machine: update OPTEE OS flavor names slightly

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-hs-evm.conf |    2 +-
 conf/machine/dra7xx-hs-evm.conf |    2 +-
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


