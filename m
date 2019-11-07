Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1F81EE00D77; Thu,  7 Nov 2019 10:09:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09375E00E18
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:52 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9qlH106923
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150192;
	bh=PWWVQq9tvkaZZn8V1BdZ3Tuy6FARvQ/1/fqWf6rUhzk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xVoaxQ4Ry7EoVg+oo9OJzwqhPkWx8GFus5fS9VqRr6QkXIO2l3bO3eTbngZiKPZ0J
	FvYSJ4oW/y2JqtGI7YK051z2+xtTiQp/xsY8ED1ohf1Q6+y2GUnLcMdR/ohWRqxeRR
	GKW1pxLLWE0qYuyLB31L5VX8Z9Jy4nx+AwVtXu6A=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9qpP125213
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:52 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:52 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:36 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIQ067418;
	Thu, 7 Nov 2019 12:09:51 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:15 -0500
Message-ID: <1573149037-762-21-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 20/42] nwal-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:57 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/nwal-lld/nwal-lld.inc | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 024aeef..7718554 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -1,28 +1,19 @@
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b7982a377c680ad71ca2fbb735982462"
 
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
-NWAL_LLD_GIT_PROTOCOL = "git"
-NWAL_LLD_GIT_BRANCH = "master"
+inherit ti-pdk-fetch
+PE = "1"
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.13"
-NWAL_LLD_SRCREV = "dd41b84a985ef2824068e57525158c350e0d51be"
-
-BRANCH = "${NWAL_LLD_GIT_BRANCH}"
-SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${NWAL_LLD_SRCREV}"
-
-PV = "02.01.00.13"
 INC_PR = "r0"
 
 BASEDIR = "${WORKDIR}/git"
-S = "${BASEDIR}/ti/drv/nwal"
 
 DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l  = "k2l"
 DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "yes no"
+TI_PDK_COMP = "ti.drv.nwal"
-- 
2.7.4


