Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5338E00AC5; Mon, 12 Sep 2016 15:18:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93B27E00A4B
	for <meta-ti@yoctoproject.org>; Mon, 12 Sep 2016 15:18:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C4BF25299F; Mon, 12 Sep 2016 22:18:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160912221826.C4BF25299F@arago-project.org>
Date: Mon, 12 Sep 2016 22:18:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: add QMSS PDSP FW dependency for Keystone
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
X-List-Received-Date: Mon, 12 Sep 2016 22:18:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: e808240dcb517f98ef78989d288eaaf40f2b6771
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e808240dcb517f98ef78989d288eaaf40f2b6771

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Sep  9 23:44:27 2016 +0000

linux-ti-staging: add QMSS PDSP FW dependency for Keystone

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.4.bb |    5 ++++-
 1 files changed, 4 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 4c4a8e5..157bc6b 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -34,6 +34,9 @@ RDEPENDS_kernel-base_append_k2g-evm = " ti-sci-fw"
 # Add run-time dependency for SerDes firmware to the rootfs
 RDEPENDS_kernel-base_append_keystone = " serdes-fw"
 
+# Add run-time dependency for QMSS PDSP firmware to the rootfs
+RDEPENDS_kernel-base_append_keystone = " qmss-pdsp-fw"
+
 # Add run-time dependency for NETCP PA firmware to the rootfs
 RDEPENDS_kernel-base_append_k2hk-evm = " netcp-pa-fw"
 RDEPENDS_kernel-base_append_k2e-evm = " netcp-pa-fw"
@@ -77,7 +80,7 @@ SRCREV = "20272d4fd5fd81c551d8a31a3daddc18923b71bb"
 PV = "4.4.19+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"


