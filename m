Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B503E009A0; Mon, 19 Jun 2017 11:09:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24E7BE0084A
	for <meta-ti@yoctoproject.org>; Mon, 19 Jun 2017 11:09:16 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5JI9G56014986
	for <meta-ti@yoctoproject.org>; Mon, 19 Jun 2017 13:09:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497895756;
	bh=Nt4giyWhbHY+isHD2t+3DOQOIAQ2HUYkb8AIfkNAedQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=chGxc8ugopGanVaZAXPj4hdmfaDOTrp6plR0EIUYWK9L/ib6n6JdKGHrTNsbnIi8H
	FJ4ZG7YB2OW9GE2sjhPxIQ62rMxAzay0ti7eKfLmLQsXkBAFQ4hktWq4TpIOkZ7s9z
	orTpfPQpF8lWOE9ocx+3+PgwY7XxiNJLxOxIpVZk=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5JI9GJj020520
	for <meta-ti@yoctoproject.org>; Mon, 19 Jun 2017 13:09:16 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Jun 2017 13:09:15 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5JI9GPp031851;	Mon, 19 Jun 2017 13:09:16 -0500
Received: from localhost ([172.22.138.14])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v5JI9F318658;
	Mon, 19 Jun 2017 13:09:15 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Jun 2017 13:09:07 -0500
Message-ID: <20170619180907.21423-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170619180907.21423-1-dmurphy@ti.com>
References: <20170619180907.21423-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] uboot-ti-staging: update to ti2017.02-rc5 tag
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
X-List-Received-Date: Mon, 19 Jun 2017 18:09:18 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index 4e4b9ab7..ed2058b0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r6"
+PR = "r7"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "9df421e2401f973b299547db063e2f30fcd62648"
+SRCREV = "5861b3bd349184df97ea26a93fc9b06c65e0ff5e"
-- 
2.12.2


