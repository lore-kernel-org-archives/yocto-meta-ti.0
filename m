Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 553F6E00C62; Tue, 19 Sep 2017 08:01:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7833E00C14
	for <meta-ti@yoctoproject.org>; Tue, 19 Sep 2017 08:01:05 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8JF15nu026010
	for <meta-ti@yoctoproject.org>; Tue, 19 Sep 2017 10:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505833265;
	bh=wFht+qFotsJn3UuP4cHme+WuAeJzRItuY9pvehoZjRI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yF5mUgeFxR7eVdZr/9zPEMN8gGHok7X7nijLtXxyO9Sffe5b8IXvg3UiRTuMVfXQz
	szYcivzCpi6YnfbC6JZVvuLNoSByZj9OiNsDZE63stn2eeO4esczOfrqahGLpRnOOq
	CTtwftB7xzkgCNs+LVF4fhXtqlcAG36XV28cH2qs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JF14Cd012432
	for <meta-ti@yoctoproject.org>; Tue, 19 Sep 2017 10:01:05 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 19 Sep 2017 10:01:04 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 19 Sep 2017 10:01:04 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8JF12ZZ029672;
	Tue, 19 Sep 2017 10:01:04 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 19 Sep 2017 11:00:57 -0400
Message-ID: <1505833258-3641-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1505833258-3641-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1505833258-3641-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1 2/3] hyplnk-lld: Updating to version 2.1.0.7
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
X-List-Received-Date: Tue, 19 Sep 2017 15:01:06 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/hyplnk-lld/hyplnk-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
index c0d8464..e4aeff4 100644
--- a/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
+++ b/recipes-bsp/hyplnk-lld/hyplnk-lld.inc
@@ -13,14 +13,14 @@ HYPLNK_GIT_PROTOCOL = "git"
 HYPLNK_GIT_BRANCH = "master"
 HYPLNK_GIT_DESTSUFFIX = "git/ti/drv/${LLDNAME}"
 
-# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.06
-HYPLNK_SRCREV = "a1953ca33114c5a4daca6289a7fb75b201f566d2"
+# Following commit corresponds to tag DEV.HYPLNK_LLD.02.01.00.07
+HYPLNK_SRCREV = "7799dd3b1ef425494bf52534adebb915f6566885"
 
 BRANCH="${HYPLNK_GIT_BRANCH}"
 SRC_URI = "${HYPLNK_GIT_URI};destsuffix=${HYPLNK_GIT_DESTSUFFIX};protocol=${HYPLNK_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${HYPLNK_SRCREV}"
 
-PV = "2.1.0.6"
+PV = "2.1.0.7"
 INC_PR = "r0"
 
 DEVICELIST_k2hk = "k2h k2k"
-- 
1.9.1


