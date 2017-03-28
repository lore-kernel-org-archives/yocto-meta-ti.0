Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0EE6E00724; Tue, 28 Mar 2017 09:44:08 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B25A7E0050B
	for <meta-ti@yoctoproject.org>; Tue, 28 Mar 2017 09:44:07 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2SGhV8d027784;
	Tue, 28 Mar 2017 11:43:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490719411;
	bh=crx1ZUpdzzti7Jgqd59G8kq4AYQ+XtGdZmohhLPLkeU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HF1VuUsBwbtXmFWekliG0eoOhF3kthnW/DAypGZYlz0mLtReDjop195Pf/iV4VvCZ
	DUwJJX8dY2BEirRshjVr9tae8WYZ2UIh5CTgE5Q5Q8g958oTwRPMI/Pj7Y+TftY3+k
	AQblgWRteZA94YX5/PeNTO32aFRXKNVLcqBcVo/g=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2SGhV9U026278;
	Tue, 28 Mar 2017 11:43:31 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 28 Mar 2017 11:43:30 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v2SGhVJZ005431;	Tue, 28 Mar 2017 11:43:31 -0500
Received: from localhost (a0272616local.dhcp.ti.com [172.22.177.36])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v2SGhV302116; Tue, 28 Mar 2017 11:43:31 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 28 Mar 2017 11:43:47 -0500
Message-ID: <1490719427-8242-2-git-send-email-dmurphy@ti.com>
X-Mailer: git-send-email 2.7.2.333.g70bd996
In-Reply-To: <1490719427-8242-1-git-send-email-dmurphy@ti.com>
References: <1490719427-8242-1-git-send-email-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] uboot-ti-staging: update to ti2017.00-rc6 tag
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
X-List-Received-Date: Tue, 28 Mar 2017 16:44:08 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index 9d77aef..aa9ab60 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -2,4 +2,4 @@ require u-boot-ti.inc
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "734f6d49ae509f72bbd97893f2a98dea20c7bdc0"
+SRCREV = "bc8176c3f14dfabd7ebb883b65b2b04b70f3cf0a"
-- 
2.7.3


