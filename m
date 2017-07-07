Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 70412E00BBC; Fri,  7 Jul 2017 12:14:53 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D0B2E00B53
	for <meta-ti@yoctoproject.org>; Fri,  7 Jul 2017 12:14:51 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v67JEfnk024935
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:14:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499454881;
	bh=9rCk0L8ezw0oCHo+TvjixwuCtPAJJo/sBHVFlyXURCE=;
	h=From:To:CC:Subject:Date;
	b=lI+nIKTHJWE7rOMlfcode0oRKSBXIBuP0Ly3IlwrjxUn2JJpXjILrZzhFT437rfP8
	O88KW2FufOygJAwrAd23JEvAyEeLs9I630CQTTPeZWjpPJtLn9Ap4J3mXRf3bjQTdx
	KiuuNYyuFxgLSo0aUxDfDI9dFUJlHik5IJtWjAmk=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v67JEaCG007720
	for <meta-ti@yoctoproject.org>; Fri, 7 Jul 2017 14:14:36 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Jul 2017 14:14:35 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v67JEZJm016600;	Fri, 7 Jul 2017 14:14:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 7 Jul 2017 15:14:33 -0400
Message-ID: <1499454873-44417-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pa-lld: Updating the version to 3.0.2.4
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
X-List-Received-Date: Fri, 07 Jul 2017 19:14:53 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pa-lld/pa-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 671d42f..6f3888a 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -9,14 +9,14 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below commit ID corresponding to "DEV.PA_LLD.03.00.02.03"
-PA_LLD_SRCREV = "5fef109f4ce43c6bc45000f2e609321d262165b2"
+# Below commit ID corresponding to "DEV.PA_LLD.03.00.02.04"
+PA_LLD_SRCREV = "12cf2064c93b9ec980eb5012218ae88cd993b96a"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
 SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${PA_LLD_SRCREV}"
 
-PV = "03.00.02.03"
+PV = "03.00.02.04"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


