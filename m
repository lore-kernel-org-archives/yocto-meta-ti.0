Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ACAEFE01313; Tue,  3 Jul 2018 09:07:42 -0700 (PDT)
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
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45BCAE010BF
	for <meta-ti@yoctoproject.org>; Tue,  3 Jul 2018 09:07:40 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w63G7dft110265
	for <meta-ti@yoctoproject.org>; Tue, 3 Jul 2018 11:07:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530634059;
	bh=pcjsZi8sNPgF7G/CAyBKCTTExpZiAtlivACrlR0Le/Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SR81VAeD9iGvIv/6kesJ/Ez1x9O0k3WkEHfosAV1AdrSZRpeS73ScXaR4QTIe2x4O
	YrljoczoXxxYfsq3g6NDA3IbP9byfTb+30/cZhmdqN1qgOHe3Fw1glHIpR3Wizf5Ve
	SI9JRAu26NcV/FOl2fbGBVynFbaDft2FFMy2wTg4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63G7dkp023196
	for <meta-ti@yoctoproject.org>; Tue, 3 Jul 2018 11:07:39 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 3 Jul 2018 11:07:39 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 3 Jul 2018 11:07:39 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w63G7d7V011219;
	Tue, 3 Jul 2018 11:07:39 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.144.28])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w63G7dx25800; Tue, 3 Jul 2018 11:07:39 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 3 Jul 2018 11:07:36 -0500
Message-ID: <20180703160736.15569-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20180703160736.15569-1-dmurphy@ti.com>
References: <20180703160736.15569-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] inux-ti-staging: update ti2018.02-rc3 tag
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
X-List-Received-Date: Tue, 03 Jul 2018 16:07:42 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index e6feff9d..fbfa92e1 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "3e637f01a8c09912cc459b4d2a12f8f97b36d1fc"
-PV = "4.14.50+git${SRCPV}"
+SRCREV = "cb407c0328dd3e46b8df9e1733f7d55c971a4ebe"
+PV = "4.14.53+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index 17d553e3..9adeb2d9 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "e33929df94bbdc30306a7247dee10316e94252d7"
-PV = "4.14.52+git${SRCPV}"
+SRCREV = "43744f7843e8a99b0e888817571cb77c6007371e"
+PV = "4.14.53+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
-- 
2.17.0.582.gccdcbd54c


