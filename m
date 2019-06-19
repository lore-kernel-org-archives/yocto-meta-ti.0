Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D194BE00D33; Wed, 19 Jun 2019 13:47:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B5D7E00D00
	for <meta-ti@yoctoproject.org>; Wed, 19 Jun 2019 13:47:39 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 57CE540BE7;
	Wed, 19 Jun 2019 20:47:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Klm7fuOhrI1y; Wed, 19 Jun 2019 20:47:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DDACC40BAE;
	Wed, 19 Jun 2019 20:47:37 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 48B89170415;
	Wed, 19 Jun 2019 16:47:36 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 19 Jun 2019 16:47:31 -0400
Message-Id: <1560977252-24613-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH 1/2] linux-ti-staging: update to 4.19.50
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
X-List-Received-Date: Wed, 19 Jun 2019 20:47:40 -0000

Includes other updates from Platform, Connectivity, A&D and GFX.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
index 6faaf76..744c3be 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
 
 BRANCH = "ti-rt-linux-4.19.y"
 
-SRCREV = "34156ede517fd68a356348a5ee24c2e3a90a13d1"
-PV = "4.19.38+git${SRCPV}"
+SRCREV = "b54073f9af9cf51aabb75b69d099da7ba53d134c"
+PV = "4.19.50+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
index 26b388b..d8e7678 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -56,11 +56,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.19.y"
 
-SRCREV = "7d94bf0b5ba7a68aa735c422f40d53957d094f8b"
-PV = "4.19.38+git${SRCPV}"
+SRCREV = "566bdcbaedf38d343bf68ef47682e664c027c365"
+PV = "4.19.50+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
-- 
2.7.4


