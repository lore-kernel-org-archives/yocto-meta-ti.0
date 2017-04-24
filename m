Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84BE1E00A9B; Mon, 24 Apr 2017 09:04:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06D5FE00AB9
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 09:04:52 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OG4pIl026404
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 11:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493049891;
	bh=TjLrKsXqNGooGidRkIT78PTKqlPn1hk/DsD0q0sOtP0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=M9FAvNygalSUCELWlfeBEQKgLCmH63/ZQmAOohtvaBq3MiFe1qQZJ8Xor9qwAYb0B
	wvaMJ/FByJ5Mc7DIowIfwV7lDY5+KFTrIqbkfhFugyMkJR+FCWWdu2cwKl8ACjRNhk
	XvmY+JWW+OopipgLRHJIwY11mAlVxxG7Qz60WKAw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OG4pIn013448
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 11:04:51 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 11:04:51 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3OG4poi020993;	Mon, 24 Apr 2017 11:04:51 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.81.233])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v3OG4p301330; Mon, 24 Apr 2017 11:04:51 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 24 Apr 2017 11:04:44 -0500
Message-ID: <20170424160444.7980-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.13.0.rc0.45.ge2cb6ab
In-Reply-To: <20170424160444.7980-1-dmurphy@ti.com>
References: <20170424160444.7980-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] boot-monitor: update to ti2017.01-rc1 tag
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
X-List-Received-Date: Mon, 24 Apr 2017 16:04:54 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/boot-monitor/boot-monitor_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb b/recipes-bsp/boot-monitor/boot-monitor_git.bb
index 04165b4..da53867 100644
--- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
+++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
@@ -15,7 +15,7 @@ BRANCH = "master"
 
 S = "${WORKDIR}/git"
 
-SRCREV = "cf8b431e8b3b2ee4a4aa08964d56d3ce1b11da24"
+SRCREV = "d7b2bbd419400228da621f445526e519b56aef93"
 
 BOOT_MONITOR_IMAGE  ?= "skern-${BOOT_MONITOR_MAKE_TARGET}.bin"
 
-- 
1.9.1


