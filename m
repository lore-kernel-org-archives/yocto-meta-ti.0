Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDFE7E00BB1; Thu,  8 Dec 2016 14:42:58 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40177E009FA
	for <meta-ti@yoctoproject.org>; Thu,  8 Dec 2016 14:42:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E863E52A8E; Thu,  8 Dec 2016 22:42:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161208224246.E863E52A8E@arago-project.org>
Date: Thu,  8 Dec 2016 22:42:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: split SECDEV use for am5x and dra7 machines
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
X-List-Received-Date: Thu, 08 Dec 2016 22:42:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 07b8724fbec124ee9c4608d7bf45e97c38ed5b1c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=07b8724fbec124ee9c4608d7bf45e97c38ed5b1c

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Dec  8 02:06:06 2016 +0000

conf/machine: split SECDEV use for am5x and dra7 machines

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am57xx-hs-evm.conf |    2 +-
 conf/machine/dra7xx-hs-evm.conf |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/am57xx-hs-evm.conf b/conf/machine/am57xx-hs-evm.conf
index be67205..906e6b0 100644
--- a/conf/machine/am57xx-hs-evm.conf
+++ b/conf/machine/am57xx-hs-evm.conf
@@ -11,7 +11,7 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/am5x"
 
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "am57xx_evm"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
index db20aa2..8e8b566 100644
--- a/conf/machine/dra7xx-hs-evm.conf
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -11,7 +11,7 @@ UBOOT_LOADADDRESS = "0x82000000"
 UBOOT_RD_LOADADDRESS = "0x84000000"
 UBOOT_RD_ENTRYPOINT = "0x84000000"
 
-TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}"
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AUTO}/dra7"
 
 OPTEEMACHINE = "ti"
 OPTEEFLAVOR = "dra7_evm dra72_evm_revc dra71_evm"


