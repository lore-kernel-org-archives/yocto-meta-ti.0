Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C0A8DE00AAF; Wed,  1 Nov 2017 11:40:51 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0208E00928
	for <meta-ti@yoctoproject.org>; Wed,  1 Nov 2017 11:40:49 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA1Iecgr014359
	for <meta-ti@yoctoproject.org>; Wed, 1 Nov 2017 13:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509561638;
	bh=NZYX9mYHDweebyia2A3JXajV3Zlk2jwfbk4Qa9pJwMk=;
	h=From:To:CC:Subject:Date;
	b=K5MzLtdGUsKGqUSzMS5Jg0WqZ62IZdgExReg83sOBf0SkTUeTq4NuMU84f96Yvwnc
	kWG0UxMMF0U/R2ru8Arde+2IE0ar1IzC6BhELSt3vei+u4de8VKVsLFPM1CZGorY++
	bxE+O7RpyYPAZ9QTufD3LjpnPk+dzrN1YJ0YfjN0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1IeX4g023434
	for <meta-ti@yoctoproject.org>; Wed, 1 Nov 2017 13:40:33 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 1 Nov 2017 13:40:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 1 Nov 2017 13:40:33 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA1IeXAN007197;
	Wed, 1 Nov 2017 13:40:33 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 1 Nov 2017 14:40:31 -0400
Message-ID: <1509561631-52359-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] cmem: Update to new version 4.14.01.00
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
X-List-Received-Date: Wed, 01 Nov 2017 18:40:51 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index cebced3..53c305b 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -4,10 +4,10 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
 
 BRANCH = "lu-next"
-# This corresponds to version 4.14.00.00
-SRCREV = "b514a99ac45c64f0439282d0774d7cff5def4c6f"
+# This corresponds to version 4.14.01.00
+SRCREV = "b687f3c3658221cdb2731e2421a26004ee7193b8"
 
-PV = "4.14.00.00+git${SRCPV}"
+PV = "4.14.01.00+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
-- 
1.9.1


