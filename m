Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BE98E0085D; Tue, 14 Feb 2017 22:32:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35A7BE0082E
	for <meta-ti@yoctoproject.org>; Tue, 14 Feb 2017 22:32:01 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5B1FD209E1;
	Wed, 15 Feb 2017 06:32:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id gzWPr8Dob-3c; Wed, 15 Feb 2017 06:32:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 243BD20893;
	Wed, 15 Feb 2017 06:31:59 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8353C162373;
	Wed, 15 Feb 2017 01:31:58 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 15 Feb 2017 01:31:57 -0500
Message-Id: <1487140318-116037-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH 1/2] linux-ti-staging: update to 4.9.10
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
X-List-Received-Date: Wed, 15 Feb 2017 06:32:05 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index 1355558..ecef4e6 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "fca7cc6d34a3d18cbe5f54b77c0f5db12081acf8"
+SRCREV = "eade06c1ea60e9069e35715b7b057eddae85a8e9"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 0c15c76..4f75415 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -53,8 +53,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "b4aa954ead9260eaf7138755fc9d062a9f4630eb"
-PV = "4.9.9+git${SRCPV}"
+SRCREV = "74790f16e5ca9cb3dbbe8baa6086f35f7095694d"
+PV = "4.9.10+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.7.4


