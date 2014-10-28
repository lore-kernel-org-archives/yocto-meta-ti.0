Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCD92E008A1; Mon, 27 Oct 2014 19:04:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1BBEE008B3
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 19:04:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BDC69529DF; Tue, 28 Oct 2014 02:04:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141028020412.BDC69529DF@arago-project.org>
Date: Tue, 28 Oct 2014 02:04:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : linux-keystone: update to the latest tag 03.10.10_14.09_01
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
X-List-Received-Date: Tue, 28 Oct 2014 02:04:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 3fd55cb7ea4cb8a3b8678f1035bd96264a4b88a7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3fd55cb7ea4cb8a3b8678f1035bd96264a4b88a7

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Oct 27 22:59:30 2014 +0000

linux-keystone: update to the latest tag 03.10.10_14.09_01

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    4 ++--
 recipes-kernel/linux/linux-keystone_3.10.bb    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 70073f9..860d421 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -19,8 +19,8 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-# This commit corresponds to "K2_RT_LINUX_03.10.10_14.03_03"
-SRCREV = "6b482abe6a18d004230ca54da866f4627f02125b"
+#This commit corresponds to "K2_RT_LINUX_03.10.10_14.09_01"
+SRCREV = "2b53a7b58e95c2cf3426fe95203e7fc082bc56e9"
 PV = "3.10.10"
 
 BRANCH = "master-rt"
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index e90c9fc..4475632 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -19,8 +19,8 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-# This commit corresponds to "K2_LINUX_03.10.10_14.03_03"
-SRCREV = "07176920ed86dfdae97d272f574c3e2760d687ef"
+#This commit corresponds to "K2_LINUX_03.10.10_14.09_01"
+SRCREV = "a59abdfadb821f27cc43b16d3f641960ba143746"
 PV = "3.10.10"
 
 BRANCH = "master"


