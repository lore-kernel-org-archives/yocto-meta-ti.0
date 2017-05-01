Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD5BFE00AF2; Mon,  1 May 2017 12:38:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B21CEE00AA2
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:38:33 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41JcWkL026245
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493667512;
	bh=RBlxMWugQUIMTz+4QRONo/z5MFjys6JCdcz9kCx4wn4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=m2LzpoEems3tJCpxNASjCvjrjhv2yR875iUUwD0Vx6Mdgjxg3/+yP/93TfAhbwFOH
	yxI6AcaqAPbyUK0fjCHG1wBVdBBxgbFj52MrPE5DA8gPQ4n6uyPCCYYrSsbBUCYMXP
	NyupiKMeeuBfaf4aAqAzSMXBMS7OAfvR5xr6LHXk=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41JcWvU004928
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:38:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:38:32 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41JcW08012479;	Mon, 1 May 2017 14:38:32 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.109.252])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v41JcW303244; Mon, 1 May 2017 14:38:32 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 14:38:29 -0500
Message-ID: <20170501193829.5768-4-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170501193829.5768-1-dmurphy@ti.com>
References: <20170501193829.5768-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [v3 PATCH 4/4] boot-monitor: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:38:37 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v3 - Removed the supplmental patch and directory 
v2 - No changes

 recipes-bsp/boot-monitor/boot-monitor_git.bb       |  3 +-
 ...-Fix-issue-with-setting-CHECK-and-VERBOSE.patch | 42 ----------------------
 2 files changed, 1 insertion(+), 44 deletions(-)
 delete mode 100644 recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index e4ea67f6..1b6f3206 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -8,7 +8,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 DEPENDS = "u-boot-mkimage-native"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ks2-boot-monitor.git;protocol=git;branch=${BRANCH}"
-SRC_URI += "file://0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch"
 
 PV = "4.0+git${SRCPV}"
 
@@ -16,7 +15,7 @@ BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "d7b2bbd419400228da621f445526e519b56aef93"
+SRCREV = "e1f885ab6dc544884728e333cc6e396f7eb08286"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
diff --git a/recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch b/recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch
deleted file mode 100644
index ae6d25ca..00000000
--- a/recipes-bsp/boot-monitor/files/0001-makedefs-Fix-issue-with-setting-CHECK-and-VERBOSE.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From f22f18d426c8f5b70c0bce9ac6015c067c46f5ad Mon Sep 17 00:00:00 2001
-From: Dan Murphy <dmurphy@ti.com>
-Date: Mon, 24 Apr 2017 17:02:56 -0500
-Subject: [PATCH] makedefs: Fix issue with setting CHECK and VERBOSE
-
-Within the ifndef tabs are not allowed.  These need
-to be converted to spaces.  Without this CHECK is always
-set and sparse is expected to be installed.
-
-Fixes: aba308b9868d ("Makefile: Use OBJROOT for build output to enable out-of-tree builds")
-Reported-by: Denys Dmytriyenko <denys@ti.com>
-Signed-off-by: Dan Murphy <dmurphy@ti.com>
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- makedefs | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/makedefs b/makedefs
-index 1c4e2a5..ab710c3 100644
---- a/makedefs
-+++ b/makedefs
-@@ -58,7 +58,7 @@ ifeq ("$(origin C)", "command line")
- endif
- 
- ifndef VERBOSE
--	export VERBOSE=0
-+        export VERBOSE=0
- endif
- 
- ifeq ($(VERBOSE),1)
-@@ -69,7 +69,7 @@ else
- endif
- 
- ifndef CHECK
--	export CHECK=0
-+        export CHECK=0
- endif
- 
- Q_CC=$(Q:@=@echo	'     CC	'$@;)$(CC)
--- 
-2.7.4
-
-- 
2.12.2


