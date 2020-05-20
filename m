Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8580.1589962340198024097
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5E4F40C3F;
	Wed, 20 May 2020 08:12:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3scVuYh4rvIp; Wed, 20 May 2020 08:12:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 92B0040C28;
	Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EE9AE173205;
	Wed, 20 May 2020 04:12:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 4/8] ti-xdctools: drop old unused patches
Date: Wed, 20 May 2020 04:11:44 -0400
Message-Id: <1589962308-54665-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589962308-54665-1-git-send-email-denis@denix.org>
References: <1589962308-54665-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../devtools/ti-xdctools/arm-linker-hack.diff       | 19 -------------------
 .../devtools/ti-xdctools/fix-hardcoded-paths.diff   | 21 ---------------------
 2 files changed, 40 deletions(-)
 delete mode 100644 recipes-ti/devtools/ti-xdctools/arm-linker-hack.diff
 delete mode 100644 recipes-ti/devtools/ti-xdctools/fix-hardcoded-paths.diff

diff --git a/recipes-ti/devtools/ti-xdctools/arm-linker-hack.diff b/recipes-ti/devtools/ti-xdctools/arm-linker-hack.diff
deleted file mode 100644
index 26debf8..0000000
--- a/recipes-ti/devtools/ti-xdctools/arm-linker-hack.diff
+++ /dev/null
@@ -1,19 +0,0 @@
---- a/packages/gnu/targets/arm/linkcmd.xdt	2010-12-30 19:33:53.000000000 +0100
-+++ b/packages/gnu/targets/arm/linkcmd.xdt	2010-12-30 19:42:55.000000000 +0100
-@@ -40,12 +40,13 @@
- 
- %if ("BINVERS" in prog.build.target) {
- %    var _utils = xdc.loadCapsule("gnu/targets/linkUtils.xs");
-+%    if (prog.build.target.GCCVERS < "4.3.3") {
- SECTIONS {
- `_utils.genSections(prog)`
- }
--
--%    if (!prog.build.target.noStdLinkScript
--%        && prog.build.target.BINVERS >= "2.19") {
-+%    }
-+%    if (prog.build.target.noStdLinkScript
-+%        && prog.build.target.BINVERS >= "2.19") {
- INSERT BEFORE .gnu.attributes
- %    }
- 
diff --git a/recipes-ti/devtools/ti-xdctools/fix-hardcoded-paths.diff b/recipes-ti/devtools/ti-xdctools/fix-hardcoded-paths.diff
deleted file mode 100644
index 36142c4..0000000
--- a/recipes-ti/devtools/ti-xdctools/fix-hardcoded-paths.diff
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -ur a/packages/gnu/targets/ITarget.xs b/packages/gnu/targets/ITarget.xs
---- a/packages/gnu/targets/ITarget.xs	2011-08-06 13:24:44.000000000 +0200
-+++ b/packages/gnu/targets/ITarget.xs	2011-08-06 13:23:37.000000000 +0200
-@@ -251,7 +251,7 @@
- 
-     function askLd(target)
-     {
--        var ldCmd = target.rootDir + "/" + target.GCCTARG + "/bin/ld";
-+        var ldCmd = target.rootDir + "/" + target.GCCTARG + "-ld";
-         /* If the ld executable cannot be found, and the prefix is not used,
-          * it's probably a misspelled directory path.
-          */
-@@ -486,7 +486,7 @@
-     tool2cmd["link"] = cmd;
- 
-     /* define the ar command template */
--    cmd  = prefix + target.ar.cmd
-+    cmd  = prefix + target.GCCTARG + "-ar"
-         + " $(AROPTS_P) " + target.ar.opts
-         + " $@ $(AROPTS_S) $(aropts) $(files)";
-     tool2cmd["ar"] = cmd;
-- 
2.7.4

