Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C51F0E00E7D; Tue,  6 Mar 2018 13:14:41 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CF8D7E00823
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2018 13:14:40 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B03AE20AD5;
	Tue,  6 Mar 2018 21:14:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dtbxT3URXT8O; Tue,  6 Mar 2018 21:14:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 685DF20174;
	Tue,  6 Mar 2018 21:14:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D7EFF16331D;
	Tue,  6 Mar 2018 16:14:37 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue,  6 Mar 2018 16:14:37 -0500
Message-Id: <1520370877-26257-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] u-boot-ti-staging: update to ti2018.00-rc1
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
X-List-Received-Date: Tue, 06 Mar 2018 21:14:41 -0000

Also remove AM3 SPL hack

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...K-am335x-Work-around-file-expansion-macro.patch | 73 ----------------------
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb    |  6 +-
 2 files changed, 2 insertions(+), 77 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot-ti-staging/0001-HACK-am335x-Work-around-file-expansion-macro.patch

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging/0001-HACK-am335x-Work-around-file-expansion-macro.patch b/recipes-bsp/u-boot/u-boot-ti-staging/0001-HACK-am335x-Work-around-file-expansion-macro.patch
deleted file mode 100644
index a1502b2..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging/0001-HACK-am335x-Work-around-file-expansion-macro.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From 374035ab26df67968de5ecfc4983f68f9b0142e4 Mon Sep 17 00:00:00 2001
-From: Dan Murphy <dmurphy@ti.com>
-Date: Mon, 5 Mar 2018 14:37:24 -0600
-Subject: [PATCH] HACK: am335x: Work around file expansion macro
-
-When building with the O= directive for AM335 and
-an excessively long path name the build cannot fit into
-the SPL region of the AM335.
-
-The __FILE__ macro reports the full path of the file and
-stores it in the data section of the image.
-
-As a work around change the BUG() and WARN_ON macros for
-the AM335 to only report the function and line number that
-created the issue.  For all other devices report the filename
-as normal
-
-Signed-off-by: Dan Murphy <dmurphy@ti.com>
----
- include/linux/bug.h | 21 +++++++++++++++++++--
- 1 file changed, 19 insertions(+), 2 deletions(-)
-
-diff --git a/include/linux/bug.h b/include/linux/bug.h
-index f07bb716fc..cf3f735dd6 100644
---- a/include/linux/bug.h
-+++ b/include/linux/bug.h
-@@ -6,12 +6,26 @@
- #include <linux/compiler.h>
- #include <linux/printk.h>
- 
-+#ifdef CONFIG_AM33XX
-+
- #define BUG() do { \
--	printk("BUG at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
-+	printk("BUG in %s():%d!\n", __func__, __LINE__); \
- 	panic("BUG!"); \
- } while (0)
- 
--#define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
-+#define WARN_ON(condition) ({						\
-+	int __ret_warn_on = !!(condition);				\
-+	if (unlikely(__ret_warn_on))					\
-+		printk("WARNING in /%s():%d!\n", __func__, __LINE__); \
-+	unlikely(__ret_warn_on);					\
-+})
-+
-+#else
-+
-+#define BUG() do { \
-+	printk("BUG at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
-+	panic("BUG!"); \
-+} while (0)
- 
- #define WARN_ON(condition) ({						\
- 	int __ret_warn_on = !!(condition);				\
-@@ -19,6 +33,7 @@
- 		printk("WARNING at %s:%d/%s()!\n", __FILE__, __LINE__, __func__); \
- 	unlikely(__ret_warn_on);					\
- })
-+#endif /* _CONFIG_AM33XX */
- 
- #define WARN_ON_ONCE(condition)	({				\
- 	static bool __warned;					\
-@@ -31,4 +46,6 @@
- 	unlikely(__ret_warn_once);				\
- })
- 
-+#define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
-+
- #endif	/* _LINUX_BUG_H */
--- 
-2.16.1.194.gb2e45c695
-
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index 01a71d9..c820feb 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,9 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r1"
+PR = "r2"
 
 BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "240ae44c5535bb7a2b6553813f5c42a4a1c5772a"
-
-SRC_URI_append_ti33x = " file://0001-HACK-am335x-Work-around-file-expansion-macro.patch"
+SRCREV = "7ae3421850d555f3d9397390f39bcb22e64a5147"
-- 
2.7.4


