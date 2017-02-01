Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6F64E00524; Wed,  1 Feb 2017 14:04:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,TVD_SPACE_RATIO
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64A18E004D8
	for <meta-ti@yoctoproject.org>; Wed,  1 Feb 2017 14:04:11 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1E90720B81;
	Wed,  1 Feb 2017 22:04:10 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DuXlYdcwLA-W; Wed,  1 Feb 2017 22:04:10 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EEFF220B64;
	Wed,  1 Feb 2017 22:04:08 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by mail.denix.org (Postfix) with ESMTP id 24CAA162335;
	Wed,  1 Feb 2017 17:04:08 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed,  1 Feb 2017 17:04:07 -0500
Message-Id: <1485986647-26059-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485986647-26059-1-git-send-email-denys@ti.com>
References: <1485986647-26059-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 2/2] u-boot-ti-staging: add version 2017.01
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
X-List-Received-Date: Wed, 01 Feb 2017 22:04:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
new file mode 100644
index 0000000..e07b874
--- /dev/null
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -0,0 +1,5 @@
+require u-boot-ti.inc
+
+BRANCH = "ti-u-boot-2017.01"
+
+SRCREV = "d31a991ba516f814b340e0b0d280624ca902d563"
-- 
2.7.4


