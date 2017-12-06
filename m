Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3376BE00D6D; Tue,  5 Dec 2017 17:19:03 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9036AE00D6C
	for <meta-ti@yoctoproject.org>; Tue,  5 Dec 2017 17:19:01 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB61IpB1017109
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512523131;
	bh=67f2XNL99hLlIKd8Zd+aQhz/GqLXdqZGcAuyKeWDjM4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PnJ4uskeGNIXr4vRTWC73rtXBvLVAxIgbgeJNCPKtElX7+bOfCQYKWvTX5D+Lg4IP
	XhcmIsj2534p9Pn2FLZJMtHdavjtLRZb61TIv5LAvUPiCWKvHqInzM9abEGKfWWO0p
	0nWDsvrWKh32Lz7ZwRvVVz+C+2MEcW4v92YuzzTQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61Ik6v000494
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:46 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Dec 2017 19:18:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Dec 2017 19:18:46 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61Ij4X019630;
	Tue, 5 Dec 2017 19:18:46 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Dec 2017 20:18:38 -0500
Message-ID: <1512523119-12945-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1512523119-12945-1-git-send-email-denys@ti.com>
References: <1512523119-12945-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/4] wl18xx-target-scripts: update recipe for version R8.7_SP3
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
X-List-Received-Date: Wed, 06 Dec 2017 01:19:03 -0000
Content-Type: text/plain

From: Eyal Reizer <eyalr@ti.com>

Signed-off-by: Eyal Reizer <eyalr@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...pts_8.7.1.bb => wl18xx-target-scripts_8.7.3.bb} |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename recipes-connectivity/wl18xx-target-scripts/{wl18xx-target-scripts_8.7.1.bb => wl18xx-target-scripts_8.7.3.bb} (96%)

diff --git a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
similarity index 96%
rename from recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
rename to recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
index 07a164b..b9492b2 100644
--- a/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.1.bb
+++ b/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
-# Tag: R8.7_SP1 (8.7.1)
+# Tag: R8.7_SP3 (8.7.3)
 SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
 BRANCH = "sitara-scripts"
 SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
-- 
1.7.9.5


