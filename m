Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DD36E00EFB; Fri,  9 Mar 2018 13:05:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01B98E00DB1
	for <meta-ti@yoctoproject.org>; Fri,  9 Mar 2018 13:05:08 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E894020B7B;
	Fri,  9 Mar 2018 21:05:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Q19RadvFW2Yf; Fri,  9 Mar 2018 21:05:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B66D020059;
	Fri,  9 Mar 2018 21:05:06 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 09B63163325;
	Fri,  9 Mar 2018 16:05:06 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Fri,  9 Mar 2018 16:05:04 -0500
Message-Id: <1520629505-14927-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] u-boot-ti-staging: update to the latest
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
X-List-Received-Date: Fri, 09 Mar 2018 21:05:10 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index c820feb..67bf438 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "7ae3421850d555f3d9397390f39bcb22e64a5147"
+SRCREV = "7a172930b2d94c7eed67fe4d9881984b5a79ef29"
-- 
2.7.4


