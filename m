Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0CE73E00D46; Tue, 13 Aug 2019 12:33:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BA7E2E008D3
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 12:33:26 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DJXQNU081267
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:33:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565724806;
	bh=lQpDrlMOygj0jmGv533WxdtSZSEYQvCn9y226SYC84c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SVHJVXbsu1fOCxmT+Yv++MB0kcFSOtpREZSMgGKTyF4mhvtV8Upa1HYlo+cFDznOf
	9U98kElT/Fy7ajKkOoSqWr0UXgAMmyvThJOnxMTzyFbZ77/X4ZFD38NrbZPHImwN2f
	8iv2h8VHXPnHlQjeiAdjOTAdf1aKG2G4t7sZ2y6o=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DJXQpX103503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 13 Aug 2019 14:33:26 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 14:33:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 14:33:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DJXPm3105278;
	Tue, 13 Aug 2019 14:33:25 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 13 Aug 2019 14:33:20 -0500
Message-ID: <20190813193320.17586-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190813193320.17586-1-dmurphy@ti.com>
References: <20190813193320.17586-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] linux-ti-staging: update to ti2019.03-rc2 tag
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
X-List-Received-Date: Tue, 13 Aug 2019 19:33:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
index 838bccad..8941de54 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
 
 BRANCH = "ti-rt-linux-4.19.y"
 
-SRCREV = "29e336b7bd52d27d6143ff3b1310a93fc1ae0ca6"
+SRCREV = "23e34c8e14573f23de2e3da63411ef5cc0e0b0e7"
 PV = "4.19.59+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
index b3005e0a..75f18f07 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -59,7 +59,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.19.y"
 
-SRCREV = "0bdb6f512425f74d865d497f717dc893aebab187"
+SRCREV = "ce37756a6aad97d1f7933dc0542977a032025b2e"
 PV = "4.19.59+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.22.0.214.g8dca754b1e


