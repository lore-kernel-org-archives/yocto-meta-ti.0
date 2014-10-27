Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 994B4E007A0; Mon, 27 Oct 2014 10:06:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68B22E00744
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 10:06:17 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9RH6GIo002902
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 12:06:16 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9RH6GEe002193
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 12:06:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 27 Oct 2014 12:06:16 -0500
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s9RH6G1Q010590;	Mon, 27 Oct 2014 12:06:16 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Oct 2014 12:59:30 -0400
Message-ID: <1414429170-15735-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linux-keystone: update to the latest tag 03.10.10_14.09_01
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
X-List-Received-Date: Mon, 27 Oct 2014 17:06:22 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
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
-- 
1.7.9.5


