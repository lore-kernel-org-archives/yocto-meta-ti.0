Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4393CE00C02; Wed, 17 Feb 2016 20:31:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23C52E00C0F
	for <meta-ti@yoctoproject.org>; Wed, 17 Feb 2016 20:31:51 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5F3B652A97; Thu, 18 Feb 2016 04:31:51 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160218043151.5F3B652A97@arago-project.org>
Date: Thu, 18 Feb 2016 04:31:51 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : conf/machine: add initial configs for HS platforms
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
X-List-Received-Date: Thu, 18 Feb 2016 04:31:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 9c821e5b493236342a0bef371b56e5d388c59f2f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9c821e5b493236342a0bef371b56e5d388c59f2f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Feb 18 03:49:40 2016 +0000

conf/machine: add initial configs for HS platforms

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am437x-hs-evm.conf |    7 +++++++
 conf/machine/dra7xx-hs-evm.conf |    7 +++++++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/conf/machine/am437x-hs-evm.conf b/conf/machine/am437x-hs-evm.conf
new file mode 100644
index 0000000..e8d88a4
--- /dev/null
+++ b/conf/machine/am437x-hs-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: AM437x HS EVM
+#@DESCRIPTION: Machine configuration for the TI AM437x HS EVM
+
+require conf/machine/am437x-evm.conf
+
+UBOOT_MACHINE = "am43xx_hs_evm_config"
diff --git a/conf/machine/dra7xx-hs-evm.conf b/conf/machine/dra7xx-hs-evm.conf
new file mode 100644
index 0000000..a898716
--- /dev/null
+++ b/conf/machine/dra7xx-hs-evm.conf
@@ -0,0 +1,7 @@
+#@TYPE: Machine
+#@NAME: DRA7xx HS EVM
+#@DESCRIPTION: Machine configuration for the TI DRA7xx HS EVM
+
+require conf/machine/dra7xx-evm.conf
+
+UBOOT_MACHINE = "dra7xx_hs_evm_config"


