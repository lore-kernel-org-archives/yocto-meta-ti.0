Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5D5CE00AF6; Mon, 24 Apr 2017 09:05:22 -0700 (PDT)
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
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A565E00B51
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 09:05:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3OG4uTZ032617
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 11:04:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493049896;
	bh=VPdieA6h2ceBMqD/LfpAuPPwoJBXhYw9/F00KzMv9nw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F0iKKB5TE6/nebU4mmLIDhdkMO/g9mv91tDxQrXroLUtVLEq0AHaNV6QI8x5vtPJm
	zJzMkTeJ0EpYItdk078fZ6pZlpRouHhFxwiGNc10ZQ758blJO1as6IwptUqB56FPY2
	RmrQJ/v47KpwYD3UD+kpQh/iAY9iXmRHNtWvRUGU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3OG4pAx013444
	for <meta-ti@yoctoproject.org>; Mon, 24 Apr 2017 11:04:51 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 11:04:50 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3OG4oAB004034;	Mon, 24 Apr 2017 11:04:50 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.81.233])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v3OG4o301326; Mon, 24 Apr 2017 11:04:50 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 24 Apr 2017 11:04:43 -0500
Message-ID: <20170424160444.7980-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.13.0.rc0.45.ge2cb6ab
In-Reply-To: <20170424160444.7980-1-dmurphy@ti.com>
References: <20170424160444.7980-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] uboot-ti-staging: update to ti2017.01-rc1 tag
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
X-List-Received-Date: Mon, 24 Apr 2017 16:05:23 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index aa9ab60..c279e41 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -2,4 +2,4 @@ require u-boot-ti.inc
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "bc8176c3f14dfabd7ebb883b65b2b04b70f3cf0a"
+SRCREV = "da5f8ccd0176b613a70566456577a4cfde96d653"
-- 
1.9.1


