Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B00CBE00777; Mon,  6 Mar 2017 10:53:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73C52E00655
	for <meta-ti@yoctoproject.org>; Mon,  6 Mar 2017 10:53:00 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v26IqxaR022425
	for <meta-ti@yoctoproject.org>; Mon, 6 Mar 2017 12:52:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488826379;
	bh=C6rXm7olWAV2nagf1wIsxNH7DXdWwBYybwiNt0x87Pw=;
	h=From:To:CC:Subject:Date;
	b=KFHnAvvPeAiGBvEg93V58DjocsSQlezOTFTPpYHde6aGMutf6USVlNL4SJBdT0K6t
	y28Em+gE5eMa0n5jZt36khQosPxwf+ifS+t3K+Ip+CRUJbDYe4CdQVyWsJ5YjGgX4c
	L3W245iKLS6p44YN4tkU8wuDJLPOgvTMdO/jEpUQ=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v26IqxZL020017
	for <meta-ti@yoctoproject.org>; Mon, 6 Mar 2017 12:52:59 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Mar 2017 12:52:58 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v26Iqwhd019771;	Mon, 6 Mar 2017 12:52:58 -0600
Received: from localhost (a0272616local.dhcp.ti.com [172.22.187.105])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v26Iqw323113; Mon, 6 Mar 2017 12:52:58 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 6 Mar 2017 12:52:59 -0600
Message-ID: <1488826380-9069-1-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.2.333.g70bd996
MIME-Version: 1.0
Subject: [PATCH 1/2] uboot-ti-staging: update to ti2017.00-rc3 tag
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
X-List-Received-Date: Mon, 06 Mar 2017 18:53:03 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index ebf29cd..8d6a3c7 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -2,4 +2,4 @@ require u-boot-ti.inc
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "3ca4ec25c8a6a3586601e8926bac4f5861ccaa2d"
+SRCREV = "8369eec4f36f4eb8c30e769b3b0ad35d5148f636"
-- 
2.7.3


