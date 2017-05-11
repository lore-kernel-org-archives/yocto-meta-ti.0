Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 796D4E00B62; Thu, 11 May 2017 15:47:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 346E3E0095F
	for <meta-ti@yoctoproject.org>; Thu, 11 May 2017 15:47:43 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 517EF20BE9;
	Thu, 11 May 2017 22:47:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 6nUofMeQ8ize; Thu, 11 May 2017 22:47:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 261DD20069;
	Thu, 11 May 2017 22:47:39 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 94AFD16248F;
	Thu, 11 May 2017 18:47:38 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Thu, 11 May 2017 18:47:37 -0400
Message-Id: <1494542857-5360-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Suman Anna <s-anna@ti.com>
Subject: [morty/master][PATCH] prueth-fw: bump to pick up the correct 3.1.4 binaries
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
X-List-Received-Date: Thu, 11 May 2017 22:47:47 -0000

Since no version update, bump the PR explicitly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Suman Anna <s-anna@ti.com>
Cc: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/prueth-fw/prueth-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prueth-fw/prueth-fw_git.bb b/recipes-bsp/prueth-fw/prueth-fw_git.bb
index 77445e9..e8221ec 100644
--- a/recipes-bsp/prueth-fw/prueth-fw_git.bb
+++ b/recipes-bsp/prueth-fw/prueth-fw_git.bb
@@ -4,7 +4,7 @@ LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
 PV = "3.1.4"
-PR = "r1"
+PR = "r2"
 
 CLEANBROKEN = "1"
 
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "am57xx-evm|am437x-evm|am335x-evm|k2g"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "4ed1022c62bfe4ed4c66112024c8ee1301e9439d"
+SRCREV = "6e1cf7bbc7e8050cb5c64a9098ed0b8a5c9de884"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.7.4


