Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 063C5E009E7; Fri, 23 May 2014 20:36:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RCVD_IN_DNSWL_NONE,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from vms173019pub.verizon.net (unknown [206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F1EDE0073A
	for <meta-ti@yoctoproject.org>; Fri, 23 May 2014 20:36:23 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N62001U87BQND80@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 23 May 2014 22:36:05 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id EC9B820085; Fri,
	23 May 2014 23:35:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 23 May 2014 23:35:48 -0400
Message-id: <1400902548-2614-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH] linux-ti-staging: fix _append/_prepend logic in prev changes
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
X-List-Received-Date: Sat, 24 May 2014 03:36:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Add a missing space to KERNEL_CONFIG_FRAGMENTS_append
* Use FILESEXTRAPATHS_prepend instead of _append version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.12.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_3.15.bb |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.12.bb b/recipes-kernel/linux/linux-ti-staging_3.12.bb
index cb289c4..90dab23 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.12.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.12.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.12:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.12:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
diff --git a/recipes-kernel/linux/linux-ti-staging_3.15.bb b/recipes-kernel/linux/linux-ti-staging_3.15.bb
index 308a412..a55b581 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.15.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.15.bb
@@ -9,7 +9,7 @@ require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
 
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS_append := "${THISDIR}/${PN}-3.15:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.15:"
 
 # Pull in the devicetree files into the rootfs
 RDEPENDS_kernel-base += "kernel-devicetree"
@@ -48,8 +48,8 @@ PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "ti_config_fragments"
 KERNEL_CONFIG_FRAGMENTS = "${WORKDIR}/ipc.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = "${WORKDIR}/non-smp.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = "${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${WORKDIR}/non-smp.cfg"
+KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${WORKDIR}/non-smp.cfg"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.7.9.5


