Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 76ACEE00A9B; Fri, 28 Apr 2017 09:12:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BE20E009AA
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 09:12:14 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SGCD8i002667
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493395934;
	bh=c7vtFEdrZxVkeonQk1s1iIYlepeCzVIoBR7ITgqzgiQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MFShO35L8GscKXbZHEDCDy1IZiPwnCs4VsKQuLLvmYZ17+z1KniZMbT87Tc8piPme
	2/YBUyAe/zv7ARAPTZ9x+a/YVVXa13Y/sMTb2T4v0JXhipUT+qI/2Y1KO8HXV43/Wc
	YzKEszZNIPAp4jdoW99iychlWEpUTj5qZZfmvBrI=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SGCDQe009904
	for <meta-ti@yoctoproject.org>; Fri, 28 Apr 2017 11:12:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 11:12:13 -0500
Received: from a0866445-vm1.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3SGC8ei021789;	Fri, 28 Apr 2017 11:12:13 -0500
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Apr 2017 12:11:56 -0400
Message-ID: <1493395920-21543-4-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493395920-21543-1-git-send-email-jsobota@ti.com>
References: <1493395920-21543-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/morty][PATCH 4/8] pa-lld: Update to version 3.0.2.3
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
X-List-Received-Date: Fri, 28 Apr 2017 16:12:16 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/pa-lld/pa-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 28dfb9d..671d42f 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -9,14 +9,14 @@ PA_LLD_GIT_PROTOCOL = "git"
 PA_LLD_GIT_BRANCH = "master"
 PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
 
-# Below Commit ID corresponds to "DEV.PA_LLD.03.00.02.01"
-PA_LLD_SRCREV = "e95de49323678a55072c90fb213b94f96cf494b1"
+# Below commit ID corresponding to "DEV.PA_LLD.03.00.02.03"
+PA_LLD_SRCREV = "5fef109f4ce43c6bc45000f2e609321d262165b2"
 
 BRANCH = "${PA_LLD_GIT_BRANCH}"
 SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${PA_LLD_SRCREV}"
 
-PV = "03.00.02.01"
+PV = "03.00.02.03"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
-- 
2.7.4


