Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FBE8E00D56; Fri,  9 Dec 2016 14:27:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EC2BE00D63
	for <meta-ti@yoctoproject.org>; Fri,  9 Dec 2016 14:27:33 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B107852A0E; Fri,  9 Dec 2016 22:27:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161209222730.B107852A0E@arago-project.org>
Date: Fri,  9 Dec 2016 22:27:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am57xx-hs-evm, dra7xx-hs-evm: update OPTEEFLAVOR to match latest OPTEE code
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
X-List-Received-Date: Fri, 09 Dec 2016 22:27:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 243fc8275e58b720d27e24b10473b02f8a99e73f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=243fc8275e58b720d27e24b10473b02f8a99e73f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec 10 02:49:59 2016 +0000

am57xx-hs-evm, dra7xx-hs-evm: update OPTEEFLAVOR to match latest OPTEE code

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-hs-evm.conf |    2 +-
 conf/machine/dra7xx-hs-evm.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index 906e6b0..cd03126 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "am57xx_evm"
+OPTEEFLAVOR = "am57xx"
 OPTEEOUTPUTMACHINE = "ti"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index 8e8b566..b6d5528 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -14,5 +14,5 @@ UBOOT_RD_ENTRYPOINT = "0x84000000"
 TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
 
 OPTEEMACHINE = "ti"
-OPTEEFLAVOR = "dra7_evm dra72_evm_revc dra71_evm"
+OPTEEFLAVOR = "dra7xx"
 OPTEEOUTPUTMACHINE = "ti"


