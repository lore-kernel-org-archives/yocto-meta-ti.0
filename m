Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1FA22E00D68; Tue,  5 Dec 2017 17:18:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23BEBE00BEA
	for <meta-ti@yoctoproject.org>; Tue,  5 Dec 2017 17:18:46 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB61IkRt030809
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512523126;
	bh=xkYMeusySQ+X/GGjQ648v2+u1ggJtJM+s2dJ6O4U8Jg=;
	h=From:To:CC:Subject:Date;
	b=vmo28FzjIfEAKq80itjonVuf0KcVmQoCzSYDNqnnaWVsQySNBC9F6FlMy0HuA2hJ9
	ukzuauHsedsmyGexQhDAXs2hDiSYSjWNZMgdTxnIQIxNa+lAOoR44y8CXRyUuPv+TB
	W7uHhK4p1Dk/ceaBLVC0Al90d7ntnK1KXzWhHRKw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61IkBf009194
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:46 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Dec 2017 19:18:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Dec 2017 19:18:45 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61Ij4V019630;
	Tue, 5 Dec 2017 19:18:45 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Dec 2017 20:18:36 -0500
Message-ID: <1512523119-12945-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/4] wl18xx-fw: update recipe for version R8.7_SP3
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
X-List-Received-Date: Wed, 06 Dec 2017 01:18:49 -0000
Content-Type: text/plain

From: Eyal Reizer <eyalr@ti.com>

Signed-off-by: Eyal Reizer <eyalr@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{wl18xx-fw_8.7.1.bb => wl18xx-fw_8.7.3.bb}     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/wl18xx-fw/{wl18xx-fw_8.7.1.bb => wl18xx-fw_8.7.3.bb} (86%)

diff --git a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
similarity index 86%
rename from recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb
rename to recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
index ec360fe..a52ec89 100644
--- a/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.1.bb
+++ b/recipes-bsp/wl18xx-fw/wl18xx-fw_8.7.3.bb
@@ -7,8 +7,8 @@ SRC_URI = " \
 	file://0001-Add-Makefile-to-install-firmware-files.patch \
 "
 
-# Tag: R8.7-SP1 (8.7.1)
-SRCREV = "fe3909e93d15a4b17e43699dde2bba0e9a3c0abc"
+# Tag: R8.7-SP3 (8.7.3)
+SRCREV = "f659be25473e4bde8dc790bff703ecacde6e21da"
 BRANCH = "master"
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


