Return-Path: <Yasir_Khan@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C621E007FE; Tue, 26 Aug 2014 07:28:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A951E007F1
	for <meta-ti@yoctoproject.org>; Tue, 26 Aug 2014 07:28:12 -0700 (PDT)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XMHjI-000676-FS from Yasir_Khan@mentor.com 
	for meta-ti@yoctoproject.org; Tue, 26 Aug 2014 07:28:12 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Aug 2014 07:28:12 -0700
From: Yasir-Khan <yasir_khan@mentor.com>
To: meta-ti@yoctoproject.org
Message-Id: <1409063264-47888-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 26 Aug 2014 14:28:12.0363 (UTC)
	FILETIME=[F75149B0:01CFC139]
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: [PATCH 4/5] linux-mainline_3.2: apply memset related fixes
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
Date: Tue, 26 Aug 2014 14:28:14 -0000
X-Original-Date: Tue, 26 Aug 2014 19:27:44 +0500
X-List-Received-Date: Tue, 26 Aug 2014 14:28:14 -0000

From meta-ti commit id 07809e70. Patches needed to
successfully boot the kernel.

Moved the relevant patches from "linux-omap4-3.4/pandaboard"
to "files" directory so that they are accessible to both
linux-mainline and linux-omap4 recipes.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 ...fix-memset-related-crashes-caused-by-rece.patch |    0
 .../0004-ARM-7670-1-fix-the-memset-fix.patch       |    0
 recipes-kernel/linux/linux-mainline_3.2.bb         |    5 ++++-
 3 files changed, 4 insertions(+), 1 deletion(-)
 rename recipes-kernel/linux/{linux-omap4-3.4/pandaboard => files}/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch (100%)
 rename recipes-kernel/linux/{linux-omap4-3.4/pandaboard => files}/0004-ARM-7670-1-fix-the-memset-fix.patch (100%)

diff --git a/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch b/recipes-kernel/linux/files/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch
similarity index 100%
rename from recipes-kernel/linux/linux-omap4-3.4/pandaboard/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch
rename to recipes-kernel/linux/files/0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch
diff --git a/recipes-kernel/linux/linux-omap4-3.4/pandaboard/0004-ARM-7670-1-fix-the-memset-fix.patch b/recipes-kernel/linux/files/0004-ARM-7670-1-fix-the-memset-fix.patch
similarity index 100%
rename from recipes-kernel/linux/linux-omap4-3.4/pandaboard/0004-ARM-7670-1-fix-the-memset-fix.patch
rename to recipes-kernel/linux/files/0004-ARM-7670-1-fix-the-memset-fix.patch
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 7398d9a..0d14ac8 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -91,7 +91,10 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://libertas/0016-libertas-add-missing-include.patch \
             file://libertas/0017-remove-debug-msgs-due-to-missing-in_interrupt.patch \
            \
-            file://defconfig"
+            file://defconfig \
+            file://0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch \
+            file://0004-ARM-7670-1-fix-the-memset-fix.patch \
+         "
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
 "
-- 
1.7.9.5


