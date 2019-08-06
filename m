Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8005E00D88; Tue,  6 Aug 2019 11:54:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D962CE00DA7
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:39 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IsdWe063229
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117679;
	bh=8UEVV88HcWGO9mQUgmUPFthpjKqRu/niIEpuFilLBLE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=l5WbkLUMo9BjG2vwH3jFjz0+sZdgjLES6NuTz8lorTUHKpEalpemkyk89Mxv70V6g
	TlYlNRf2XZOFGwMMPezw+JrHtcp1FHvRCvEtAVmxerOIENCJSlNPq6YvVh1W9LnjSD
	Wd+u3tqDhljRwkebQYhYgdwksT5OJ8BcSCTuTiJA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IsdkM063942
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:39 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:39 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFn070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:38 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:12 -0400
Message-ID: <1565117660-52661-18-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 17/25] tcp3d-lld-rtos: SRCREV update to 0-2.01.00.06B
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
 recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
index 8e62eea..31922c2 100644
--- a/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
+++ b/recipes-bsp/tcp3d-lld/tcp3d-lld-rtos_git.bb
@@ -13,14 +13,14 @@ TCP3D_LLD_GIT_PROTOCOL = "git"
 TCP3D_LLD_GIT_BRANCH = "master"
 TCP3D_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
 
-# Below commit ID corresponds to "DEV.TCP3D_LLD.02.01.00.06A"
-TCP3D_LLD_SRCREV = "336cdfbbe999f1ec51cdb36915c335141c317d4d"
+# Below commit ID corresponds to "DEV.TCP3D_LLD.02.01.00.06B"
+TCP3D_LLD_SRCREV = "a8b3791044edf632e8348cdbd287d48a754d11ac"
 
 BRANCH = "${TCP3D_LLD_GIT_BRANCH}"
 SRC_URI = "${TCP3D_LLD_GIT_URI};destsuffix=${TCP3D_LLD_GIT_DESTSUFFIX};protocol=${TCP3D_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TCP3D_LLD_SRCREV}"
-PV = "02.01.00.06A"
+PV = "02.01.00.06B"
 PR = "r0"
 
 S = "${WORKDIR}/${TCP3D_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


