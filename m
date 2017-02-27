Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C527E00A4F; Mon, 27 Feb 2017 11:19:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F2FCE0086E
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 11:19:16 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1RJJFo8016326
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 13:19:15 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1RJJF2R002214
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 13:19:15 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Feb 2017 13:19:15 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v1RJJFtM029784;	Mon, 27 Feb 2017 13:19:15 -0600
Received: from localhost (a0272616local.dhcp.ti.com [172.22.189.31] (may be
	forged))	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP
	id v1RJJF324512;	Mon, 27 Feb 2017 13:19:15 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Feb 2017 13:19:13 -0600
Message-ID: <1488223153-11830-2-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.2.333.g70bd996
In-Reply-To: <1488223153-11830-1-git-send-email-dmurphy@ti.com>
References: <1488223153-11830-1-git-send-email-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] uboot-ti-staging: update to ti2017.00-rc2 tag
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
X-List-Received-Date: Mon, 27 Feb 2017 19:19:31 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index bd8b9ca..ebf29cd 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -2,4 +2,4 @@ require u-boot-ti.inc
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "438d0991e5a913323f6e38293a3d103d82284d9d"
+SRCREV = "3ca4ec25c8a6a3586601e8926bac4f5861ccaa2d"
-- 
2.7.3


