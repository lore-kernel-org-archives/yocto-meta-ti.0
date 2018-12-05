Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD87EE00C1B; Wed,  5 Dec 2018 10:57:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49440E008C6
	for <meta-ti@yoctoproject.org>; Wed,  5 Dec 2018 10:57:16 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB5IvG0L026164
	for <meta-ti@yoctoproject.org>; Wed, 5 Dec 2018 12:57:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544036236;
	bh=v9fbNbDfUfbuFoWAgi5YUROe63jkdJ8NFrGR1ZMxXZA=;
	h=From:To:CC:Subject:Date;
	b=LZDV7RSOiQK8AxZJlfslgwqr50uaosHbqKyerwChMMzujiDGCpJnpTlC9OwMt3Ra1
	vDaeFYOgiIHSJaurlhOHZk2cW+cGbqLfmdyOzMM70dieHd49TygxJEiiv8CoKzrnJR
	UXiDu0vDEzVWlxOKu1pLiGCcwXLSyPcfjmkthA2o=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB5IvGGa056428
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 5 Dec 2018 12:57:16 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 5 Dec 2018 12:57:16 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 5 Dec 2018 12:57:16 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB5IvGPr030000;
	Wed, 5 Dec 2018 12:57:16 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 5 Dec 2018 13:44:54 -0500
Message-ID: <1544035494-29215-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] u-boot-ti-staging: bump SRCREV to latest
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
X-List-Received-Date: Wed, 05 Dec 2018 18:57:17 -0000
Content-Type: text/plain

* ARM: armv7: Add early stack for erratum workarounds

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index e3910ec..88cfa28 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r29"
+PR = "r30"
 
 BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "eac41e26ac56fcabf9826b21377931c7b8e646f2"
+SRCREV = "313dcd69c2b32648266f91bcf223f9e539bc4201"
-- 
2.7.4


