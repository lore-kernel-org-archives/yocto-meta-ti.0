Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 298E8E00D7E; Wed, 26 Jun 2019 11:20:19 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B84B6E00D75
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 11:20:18 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5QIKIn8083533
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 13:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561573218;
	bh=2U/7/bKJ2Xf08M3+Q4lsQEWmmd1e4D6AiG3yzb3va3g=;
	h=From:To:CC:Subject:Date;
	b=R9mX4dEsRITa0n+ZEpZOXAyzsG3ez8J7L2Js4Rju3HJOpD3iMQIi2TNwjVpiFDa46
	qVlEx8fM5xduP9fREx9xNoisX5JVux32cQgQwXyZMLZG+pUxXAoQCjGZ1QKkR3RSGt
	XgmTLqBVCIP4pE7fF1dmwsGTkgI0er1l6pzZSdI0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5QIKI6m062944
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 26 Jun 2019 13:20:18 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 26 Jun 2019 13:20:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 26 Jun 2019 13:20:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5QIKHjI043876;
	Wed, 26 Jun 2019 13:20:17 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 26 Jun 2019 13:19:57 -0500
Message-ID: <20190626181958.17218-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.21.0.5.gaeb582a983
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] u-boot-ti-staging: update to ti2019.02-rc1 tag
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
X-List-Received-Date: Wed, 26 Jun 2019 18:20:19 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
index 7f3925a0..d769b51c 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r16"
+PR = "r17"
 
 BRANCH = "ti-u-boot-2019.01"
 
-SRCREV = "5ca8cfcdfd4cca4f9e911f68e68f81cc2ff61e2b"
+SRCREV = "06e0b5babedd4ddbde7239c9e9d642f5705593ae"
-- 
2.21.0.5.gaeb582a983


