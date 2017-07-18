Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F6ABE00C3B; Mon, 17 Jul 2017 19:52:26 -0700 (PDT)
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
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 33F05E00C39
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 19:52:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6I2qOFW025087
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 21:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500346344;
	bh=hFFDEU+IZS7bsAWRcMuMXZvfbilBOtB185igy0IhmCo=;
	h=From:To:CC:Subject:Date;
	b=pCTbTbQMLRph03Kt4nQv6oh0ptQXzYfjloefMdyPSfTHPp4Pk+QHG6LJ4SzjWGZ5i
	OAkjktrKDDo1IJYJWgphKQmoRZAfpzM6zy7YrCjfq8eSDexmA482YcfDpLrH67rxjL
	vg71ScTO7Kzmxe90oef55rq1Sfo6WmGHdXexSr8Y=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6I2qOaf009230
	for <meta-ti@yoctoproject.org>; Mon, 17 Jul 2017 21:52:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 17 Jul 2017 21:52:23 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6I2qNXu013126;	Mon, 17 Jul 2017 21:52:23 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 17 Jul 2017 22:52:22 -0400
Message-ID: <1500346342-47228-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH] multiprocmgr: Update to new version 3.0.3.0
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
X-List-Received-Date: Tue, 18 Jul 2017 02:52:26 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index b8bbb56..441f44a 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -8,10 +8,10 @@ MULTIPROCMGR_GIT_URI = "git://git.ti.com/keystone-linux/multi-proc-manager.git"
 MULTIPROCMGR_GIT_PROTOCOL = "git"
 MULTIPROCMGR_GIT_BRANCH = "master"
 
-# The following commits correspond to DEV.MPM-3.00.02.00
-MULTIPROCMGR_SRCREV = "303692fe954f36df91c90c300875a6587cb23556"
+# The following commits correspond to DEV.MPM-3.00.03.00
+MULTIPROCMGR_SRCREV = "c18c02bb655bae5c88d357b5810ccc69e6f1e128"
 
-PV = "3.0.2.0"
+PV = "3.0.3.0"
 INC_PR = "r0"
 
 BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
-- 
1.9.1


