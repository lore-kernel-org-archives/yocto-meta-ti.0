Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C7FEE00B1A; Mon, 20 Nov 2017 13:08:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40CF5E00AD7
	for <meta-ti@yoctoproject.org>; Mon, 20 Nov 2017 13:07:58 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A2FB2031B;
	Mon, 20 Nov 2017 21:07:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id rdYj0J_hvkSg; Mon, 20 Nov 2017 21:07:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 37FC120433;
	Mon, 20 Nov 2017 21:07:57 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id AA038162742;
	Mon, 20 Nov 2017 16:07:56 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 20 Nov 2017 16:07:55 -0500
Message-Id: <1511212075-77219-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511212075-77219-1-git-send-email-denis@denix.org>
References: <1511212075-77219-1-git-send-email-denis@denix.org>
Subject: [morty/master][PATCH 2/2] u-boot-ti-staging: update to ti2017.06-rc1 tag
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
X-List-Received-Date: Mon, 20 Nov 2017 21:08:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index 5b7b2ae..26ddfd6 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r18"
+PR = "r19"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "340fb36f043fc1c41b987c57350426ca7ee895bf"
+SRCREV = "55dc9466139b126311e92e7a80f088c32df3dfcb"
-- 
2.7.4


