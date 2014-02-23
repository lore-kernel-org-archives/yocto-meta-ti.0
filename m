Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5531EE00723
	for <meta-ti@yoctoproject.org>; Sat, 22 Feb 2014 20:31:04 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1N4V2r7007520
	for <meta-ti@yoctoproject.org>; Sat, 22 Feb 2014 22:31:02 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1N4V2c5001182
	for <meta-ti@yoctoproject.org>; Sat, 22 Feb 2014 22:31:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 22 Feb 2014 22:31:02 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1N4V2X3001302;	Sat, 22 Feb 2014 22:31:02 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 22 Feb 2014 23:30:56 -0500
Message-ID: <1393129856-9624-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] linux-keystone: Update latest tag
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
X-List-Received-Date: Sun, 23 Feb 2014 04:31:07 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Not sure whether need a PR bump
---
---
 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    4 ++--
 recipes-kernel/linux/linux-keystone_3.10.bb    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 9c2f904..3965dfa 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_RT_LINUX_03.10.10_13.12"
-SRCREV = "8fa9091d0f9c91a048a975ddebbf2f492e73bf61"
+#This commit corresponds to "K2_RT_LINUX_03.10.10_14.02"
+SRCREV = "c78aa253ac385faae8b6c845a388e215395a8010"
 PV = "3.10.10"
 
 BRANCH = "master-rt"
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 2384ede..f063c0c 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -17,8 +17,8 @@ KERNEL_DEVICETREE_keystone-evm = "k2hk-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_LINUX_03.10.10_13.12"
-SRCREV = "335d14b1c2ce23585835243126c6acba89067ecf"
+#This commit corresponds to "K2_LINUX_03.10.10_14.02"
+SRCREV = "93515476b357304e6fc075c004a1cfa91a0751d0"
 PV = "3.10.10"
 
 BRANCH = "master"
-- 
1.7.9.5


