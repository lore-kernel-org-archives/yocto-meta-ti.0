Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A23EBE00D98; Tue,  6 Aug 2019 11:54:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12859E00DA3
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:38 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76Isc2u025513
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117678;
	bh=2pf6ISHej2NA864kWTkBsQSy1tfduN8OGZB+pxSgl1M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=zOjat4TvO0fxHdMZeleZ5hFUZw1PQm/SBpo9dLp4bWWazhygJhDzlUJyujlThJ/UF
	NLU59yuc2PG+K5TQ78Sj2Q94p9l9qot4cbWjrNjdIVaweArFAOgTlRZw9kj4DzOhgh
	ghEgxg5fTe9upkhvILaCvi/frjZh5SwDm9IJDDLQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76Iscxk033810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:38 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:37 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFi070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:37 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:07 -0400
Message-ID: <1565117660-52661-13-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 12/25] pktlib: SRCREV update to 2.1.0.8B
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/pktlib/pktlib.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pktlib/pktlib.inc b/recipes-bsp/pktlib/pktlib.inc
index f2afa31..af3f8bb 100644
--- a/recipes-bsp/pktlib/pktlib.inc
+++ b/recipes-bsp/pktlib/pktlib.inc
@@ -10,15 +10,15 @@ PKTLIB_GIT_PROTOCOL = "git"
 PKTLIB_GIT_BRANCH = "master"
 PKTLIB_GIT_DESTSUFFIX = "git/ti/runtime/pktlib"
 
-# Below commit ID corresponds to "DEV.PKTLIB.2.1.0.8A"
-PKTLIB_SRCREV = "1fb44eb37ba0fcf94011204c9776360bfef5696c"
+# Below commit ID corresponds to "DEV.PKTLIB.2.1.0.8B"
+PKTLIB_SRCREV = "6d3758fda4c8c40fa9bd1194a9c713c9675b5a40"
 
 BRANCH = "${PKTLIB_GIT_BRANCH}"
 # Don't use DESTSUFFIX when cloning since repo contains ti/runtime/pktlib directory tree
 SRC_URI = "${PKTLIB_GIT_URI};protocol=${PKTLIB_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PKTLIB_SRCREV}"
-PV = "2.1.0.8A"
+PV = "2.1.0.8B"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${PKTLIB_GIT_DESTSUFFIX}"
-- 
1.9.1


