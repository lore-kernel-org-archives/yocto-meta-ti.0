Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 34796E00E88; Wed, 14 Feb 2018 19:20:09 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 095A1E00E39
	for <meta-ti@yoctoproject.org>; Wed, 14 Feb 2018 19:20:07 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D96E220AF9;
	Thu, 15 Feb 2018 03:20:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5Rvh1PiWFPHG; Thu, 15 Feb 2018 03:20:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B4205204AF;
	Thu, 15 Feb 2018 03:20:05 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5156D1632A8;
	Wed, 14 Feb 2018 22:20:05 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 14 Feb 2018 22:20:03 -0500
Message-Id: <1518664803-56132-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518664803-56132-1-git-send-email-denys@ti.com>
References: <1518664803-56132-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] u-boot-ti-staging: upgrade to 2018.01
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
X-List-Received-Date: Thu, 15 Feb 2018 03:20:09 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb                    | 7 -------
 .../{u-boot-ti-staging_2016.05.bb => u-boot-ti-staging_2018.01.bb} | 6 +++---
 2 files changed, 3 insertions(+), 10 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
 rename recipes-bsp/u-boot/{u-boot-ti-staging_2016.05.bb => u-boot-ti-staging_2018.01.bb} (21%)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
deleted file mode 100644
index 07e45ec..0000000
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require u-boot-ti.inc
-
-PR = "r21"
-
-BRANCH = "ti-u-boot-2017.01"
-
-SRCREV = "c68ed086bd00054e28c46e033385f79104c3f84c"
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
similarity index 21%
rename from recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
rename to recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index fa15569..d64fe44 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r30"
+PR = "r0"
 
-BRANCH = "ti-u-boot-2016.05"
+BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "4db46a6bbde46e4587b77e14763787f66c292701"
+SRCREV = "806db183bfaff66890c560c4b462404448023e36"
-- 
2.7.4


