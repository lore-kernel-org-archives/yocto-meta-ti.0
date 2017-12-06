Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2BF6BE00D1C; Tue,  5 Dec 2017 17:18:49 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25759E00C0F
	for <meta-ti@yoctoproject.org>; Tue,  5 Dec 2017 17:18:46 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vB61Ikac024516
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1512523126;
	bh=jUQDTyuzY3u0cjU7mlg7cbmPwwrxk4/V1+nd8tQV7xs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bkq0w2bCLJJ8dnBWaTZ7EgglgKqiJHGrltwVW5syd3X0jHkP3m0Mn1ebm1ZQucMmA
	y7y6ilklQgg0YcOA9QcZG4Bf6xxYKHb1USOebPGxva/mmKZ19Vu1z2oDVbI/225k3k
	t1tqzEnAeKQ12BfJ0GTUBNxbhoriDkYsoRBCccmo=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61IkQc009197
	for <meta-ti@yoctoproject.org>; Tue, 5 Dec 2017 19:18:46 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Dec 2017 19:18:46 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Dec 2017 19:18:46 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vB61Ij4W019630;
	Tue, 5 Dec 2017 19:18:45 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Dec 2017 20:18:37 -0500
Message-ID: <1512523119-12945-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1512523119-12945-1-git-send-email-denys@ti.com>
References: <1512523119-12945-1-git-send-email-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/4] wl18xx-calibrator: update recipe for version R8.7_SP3
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
 ...ibrator_8.7.1.bb => wl18xx-calibrator_8.7.3.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-connectivity/wl18xx-calibrator/{wl18xx-calibrator_8.7.1.bb => wl18xx-calibrator_8.7.3.bb} (88%)

diff --git a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.1.bb b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
similarity index 88%
rename from recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.1.bb
rename to recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
index e3b2e7f..8a759ed 100644
--- a/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.1.bb
+++ b/recipes-connectivity/wl18xx-calibrator/wl18xx-calibrator_8.7.3.bb
@@ -5,8 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4725015cb0be7be389cf06deeae3683d"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "wl18xx-fw"
 
-#Tag: R8.7_SP1 (8.7.1)
-SRCREV = "39542357111d1f24e866c2857d561a348c04cce4"
+#Tag: R8.7_SP3 (8.7.3)
+SRCREV = "5048b59a444ac59ba7171d6e122d5a84581aebf2"
 SRC_URI = "git://git.ti.com/wilink8-wlan/18xx-ti-utils.git"
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


