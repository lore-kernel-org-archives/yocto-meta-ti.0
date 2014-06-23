Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9353CE003C1; Mon, 23 Jun 2014 09:43:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9041CE00283
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:43:47 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7M004QFRSH1D80@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Jun 2014 11:43:30 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 79D81200BD; Mon,
	23 Jun 2014 12:43:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Jun 2014 12:43:25 -0400
Message-id: <1403541806-12912-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [PATCH 1/2] linux: remove bbappends for old kernel recipes removed from meta-ti
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
X-List-Received-Date: Mon, 23 Jun 2014 16:43:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend          | 7 -------
 .../recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend      | 9 ---------
 2 files changed, 16 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
deleted file mode 100644
index 8948157..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-omap-psp_2.6.37.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-MACHINE_KERNEL_PR_append = "-arago1"
-
-# KVER is used by arago-source-ipk.conf
-KVER = "2.6.37"
-PSPREL = "04.02.00.07"
-
-require copy-defconfig.inc
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
deleted file mode 100644
index 5d3c3f7..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
+++ /dev/null
@@ -1,9 +0,0 @@
-MACHINE_KERNEL_PR_append = "-arago3"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
-
-# KVER is used by arago-source-ipk.conf
-KVER = "2.6.37"
-PSPREL = "03.21.00.04.sdk"
-
-require copy-defconfig.inc
-- 
2.0.0


