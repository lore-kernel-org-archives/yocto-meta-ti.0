Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BDC2FE00D6E; Mon, 18 Dec 2017 10:55:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8EA6CE00D6B
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 10:55:46 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBIItkSB021786
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 12:55:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513623346;
	bh=/2NQJOebX/rwZ5L630web/HQt1UzgkG+pQd2IjbTM0I=;
	h=From:To:Subject:Date;
	b=ReOWzMqryMiE4q9eZl/ETdDTRlyZSYtAKKRAR182Rk5bH0dvyxOmwEFmaqnuIvVuU
	rJNoiLkmpkDFvoiVZoknj+XImGHdZ58ISeaZa/s33NQJkuB+Zrdwzw/CbYOakOWK7m
	FDKLpmHc3s31PLEP62Va259F5cwgX5Ls4RsFVTVo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIItkcp021839
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 12:55:46 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 18 Dec 2017 12:55:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 18 Dec 2017 12:55:45 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBIItjEW017413
	for <meta-ti@yoctoproject.org>; Mon, 18 Dec 2017 12:55:45 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Dec 2017 13:55:42 -0500
Message-ID: <1513623342-35056-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] profiling-rtos: Updating to version 1.0.0.5
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
X-List-Received-Date: Mon, 18 Dec 2017 18:55:48 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
index 2afbef9..64cdfcb 100644
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -12,14 +12,14 @@ PROFILING_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
 PROFILING_GIT_PROTOCOL = "git"
 PROFILING_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.04"
-PROFILING_SRCREV = "535ee56fcc6a476029d9567df49a5308b866efe4"
+# Below commit ID corresponds to "DEV.UTILS.01.00.00.05"
+PROFILING_SRCREV = "a9ceef7bb6b75b590e1a13573179c7d8dfb9049c"
 
 BRANCH = "${PROFILING_GIT_BRANCH}"
 SRC_URI = "${PROFILING_GIT_URI};protocol=${PROFILING_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PROFILING_SRCREV}"
-PV = "01.00.00.04"
+PV = "01.00.00.05"
 PR = "r0"
 
 S = "${WORKDIR}/git/profiling"
-- 
1.9.1


