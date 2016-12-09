Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E78FE00D42; Fri,  9 Dec 2016 14:18:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AEF51E00D3F
	for <meta-ti@yoctoproject.org>; Fri,  9 Dec 2016 14:18:38 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C1BDB20B21;
	Fri,  9 Dec 2016 22:18:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sh9MU-NHwCTJ; Fri,  9 Dec 2016 22:18:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9A393209D7;
	Fri,  9 Dec 2016 22:18:36 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 120A81621CC;
	Fri,  9 Dec 2016 17:18:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri,  9 Dec 2016 17:18:35 -0500
Message-Id: <1481321915-18006-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481321915-18006-1-git-send-email-denis@denix.org>
References: <1481321915-18006-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] linux-ti-staging: update to 4.4.37 and ti2016.06-rc1 tag
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
X-List-Received-Date: Fri, 09 Dec 2016 22:18:42 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index b7888df..9cee40b 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "dd8a2ec8d0acf6431e7f67b4cebf44171cfa837d"
+SRCREV = "aaf30e5234b6e50ce4ef8dd96f571e5393c760d4"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 92ef5eb..a2f3a32 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -80,8 +80,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "33a812efb875d4dd31d1705fa6144ed11324a6eb"
-PV = "4.4.32+git${SRCPV}"
+SRCREV = "93654b33257e160f2406d8906cbad936a7efadf6"
+PV = "4.4.37+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.7.4


