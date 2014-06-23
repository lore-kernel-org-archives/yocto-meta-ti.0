Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84971E003D2; Mon, 23 Jun 2014 09:43:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.21 listed in list.dnswl.org]
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 584A2E00282
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 09:43:46 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7M00GP2RSH3IA0@vms173021.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 23 Jun 2014 11:43:30 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7E3C920368; Mon,
	23 Jun 2014 12:43:29 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Jun 2014 12:43:26 -0400
Message-id: <1403541806-12912-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403541806-12912-1-git-send-email-denis@denix.org>
References: <1403541806-12912-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] u-boot: remove bbappends for old u-boot recipes removed from meta-ti
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
 meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend | 5 -----
 meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend | 5 -----
 2 files changed, 10 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend
 delete mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend
deleted file mode 100644
index 06a69a0..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am180x_2010.12.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago0"
-
-# PSPREL and UVER are used by arago-source-ipk.conf
-UVER = "2010.12"
-PSPREL = "03.21.00.04.sdk"
diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend
deleted file mode 100644
index 9871300..0000000
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-am3517_2011.09.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-arago0"
-
-# PSPREL and UVER are used by arago-source-ipk.conf
-PSPREL = "04.06.00.08"
-UVER = "2011.09"
-- 
2.0.0


