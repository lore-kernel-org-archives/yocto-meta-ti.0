Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5FE68E00BAA; Mon,  5 Jun 2017 07:47:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5778DE00B21
	for <meta-ti@yoctoproject.org>; Mon,  5 Jun 2017 07:47:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v55ElKRj018924
	for <meta-ti@yoctoproject.org>; Mon, 5 Jun 2017 09:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496674040;
	bh=kA+VIbP+N2IZRt3mNzm+BtbvKnf10p9pWPxnuDaZ+CE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=gnz4Pq8p2YZABfq17reFNpoXR0apxo1Jq7ugKJom9xCVzG6KhPA1v2pbn1K0H+W3p
	edSL1q7gm56fLFWQKSmR8Tfekj5vbGXW2qVVdtTGx4Cug17foDLZCyE2kgJfXEMhiE
	YSYSQPYaOsyRo4Dvurd1FMT95aJVdx4r2RvsJa2M=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v55ElFh2005846
	for <meta-ti@yoctoproject.org>; Mon, 5 Jun 2017 09:47:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Jun 2017 09:47:15 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v55ElFfa011575;	Mon, 5 Jun 2017 09:47:15 -0500
Received: from localhost ([172.22.137.163])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v55ElE310613;
	Mon, 5 Jun 2017 09:47:15 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 5 Jun 2017 09:47:08 -0500
Message-ID: <20170605144709.3342-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170605144709.3342-1-dmurphy@ti.com>
References: <20170605144709.3342-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] uboot-ti-staging: update to ti2017.02-rc1 tag
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
X-List-Received-Date: Mon, 05 Jun 2017 14:47:34 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index c0d81b7d..5114fe31 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r4"
+PR = "r5"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "9fd60700db4562ffac00317a9a44761b8c3255f1"
+SRCREV = "5147c6edfb017e6cd337c5c13a5b5af2bc2c2654"
-- 
2.12.2


