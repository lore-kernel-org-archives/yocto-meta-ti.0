Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 35270E00B76; Tue, 27 Jun 2017 09:04:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6E84E00B65
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 09:04:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5RG4ZSZ021374
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 11:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498579475;
	bh=aj5JSpOzqawcuYdhlj2dLk6TepYoZdQ5RQfXTPF0Qy0=;
	h=From:To:CC:Subject:Date;
	b=dyLBITEv87tnxMusroG91z5EG6VeMb1Zma73mH+CQcrkRy1YcDwKbXrzx7J6MpYYH
	xWLCpIk0OL4hZBUdb89eVQlBbp8nw8w3DsUOIJIaOgZTSoj4+a7HhjbWzwfdubtA+D
	L9znngIniEykwRsbbdxr8ZQ1XZzZky1CxNjgXfqM=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5RG4ZJq017320
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 11:04:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Jun 2017 11:04:35 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5RG4Z2M001074;	Tue, 27 Jun 2017 11:04:35 -0500
Received: from localhost ([172.22.135.11])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v5RG4Y317287;
	Tue, 27 Jun 2017 11:04:34 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 27 Jun 2017 11:04:16 -0500
Message-ID: <20170627160417.20771-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [PATCH 1/2] uboot-ti-staging: update to ti2017.02-rc6 tag
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
X-List-Received-Date: Tue, 27 Jun 2017 16:04:40 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index ed2058b0..b7b641cf 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r7"
+PR = "r8"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "5861b3bd349184df97ea26a93fc9b06c65e0ff5e"
+SRCREV = "edf25d94d55c42994b2187e4884b89789fd82324"
-- 
2.13.2.516.ge629a7d28


