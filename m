Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC528E0027F; Mon,  1 Jun 2015 08:20:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA3D1E00945
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 08:20:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0237A529E0; Mon,  1 Jun 2015 15:20:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601152040.0237A529E0@arago-project.org>
Date: Mon,  1 Jun 2015 15:20:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Hao Zhang : linux-keystone: update to new kernel version 3.10.72
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
X-List-Received-Date: Mon, 01 Jun 2015 15:20:42 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: ff1e4a9de4e3f2cb66d42643989a8f111188c695
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ff1e4a9de4e3f2cb66d42643989a8f111188c695

Author: Hao Zhang <hzhang@ti.com>
Date:   Thu May 28 20:24:20 2015 +0000

linux-keystone: update to new kernel version 3.10.72

Branch name changed to release specific branch

Signed-off-by: Hao Zhang <hzhang@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-keystone-rt_3.10.bb |    8 ++++----
 recipes-kernel/linux/linux-keystone_3.10.bb    |    8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/linux-keystone-rt_3.10.bb b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
index 7ce45b5..51e18d3 100644
--- a/recipes-kernel/linux/linux-keystone-rt_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone-rt_3.10.bb
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_RT_LINUX_03.10.61_15.02"
-SRCREV = "e2e31a1d996d2ed8dd06dab1221e159033432b72"
-PV = "3.10.61+git${SRCPV}"
+#This commit corresponds to "K2_RT_LINUX_03.10.72_15.##"
+SRCREV = "d607d75a2de99b3723cf9a2ba56f839debbee3c8"
+PV = "3.10.72+git${SRCPV}"
 
-BRANCH = "v3.10.61/master-rt"
+BRANCH = "v3.10.72/master-rt"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
            "
diff --git a/recipes-kernel/linux/linux-keystone_3.10.bb b/recipes-kernel/linux/linux-keystone_3.10.bb
index 78d5a0e..01573ca 100644
--- a/recipes-kernel/linux/linux-keystone_3.10.bb
+++ b/recipes-kernel/linux/linux-keystone_3.10.bb
@@ -19,11 +19,11 @@ KERNEL_DEVICETREE_k2l-evm = "k2l-evm.dtb"
 
 KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
 
-#This commit corresponds to "K2_LINUX_03.10.61_15.02"
-SRCREV = "a17b4c3fd6c93f908daf032786f90c0321296957"
-PV = "3.10.61+git${SRCPV}"
+#This commit corresponds to "K2_LINUX_03.10.72_15.##"
+SRCREV = "b9bad8fccc5f9c6bcd78363982b3249a15f193fb"
+PV = "3.10.72+git${SRCPV}"
 
-BRANCH = "v3.10.61/master"
+BRANCH = "v3.10.72/master"
 SRC_URI = "git://git.ti.com/keystone-linux/linux.git;protocol=git;branch=${BRANCH}\
            file://defconfig\
            "


