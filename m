Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 05109E00C0B; Mon, 12 Sep 2016 19:27:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA1E6E00C0E
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 19:27:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1305A52AAE; Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160913022704.1305A52AAE@arago-project.org>
Date: Tue, 13 Sep 2016 02:27:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : k2e-hs-evm: add K2E HS EVM config
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
Branch: krogoth
Commit: 8f9c005bfdeca3341b0c86c8f393b21312f159d7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8f9c005bfdeca3341b0c86c8f393b21312f159d7

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep 13 04:40:58 2016 +0000

k2e-hs-evm: add K2E HS EVM config

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/k2e-hs-evm.conf |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/conf/machine/k2e-hs-evm.conf b/conf/machine/k2e-hs-evm.conf
new file mode 100644
index 0000000..f2df52e
--- /dev/null
+++ b/conf/machine/k2e-hs-evm.conf
@@ -0,0 +1,14 @@
+#@TYPE: Machine
+#@NAME: Keystone 2 K2E HS EVM
+#@DESCRIPTION: Machine configuration for the TI Keystone 2 K2E HS EVM
+
+require conf/machine/k2e-evm.conf
+
+UBOOT_MACHINE = "k2e_hs_evm_config"
+
+UBOOT_ENTRYPOINT = "0x82000000"
+UBOOT_LOADADDRESS = "0x82000000"
+UBOOT_RD_LOADADDRESS = "0x84000000"
+UBOOT_RD_ENTRYPOINT = "0x84000000"
+
+TI_SECURE_DEV_PKG = "${TI_SECURE_DEV_PKG_AM4}"


