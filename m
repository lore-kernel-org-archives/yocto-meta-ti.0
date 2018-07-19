Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F23F4E01642; Thu, 19 Jul 2018 10:24:33 -0700 (PDT)
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
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4B5C3E0158F
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:28 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOR2k022008
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021067;
	bh=XRORRU5Z8eHZzd9/g2XGLxyRLac8sLyHi6HY0QP2U0w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=VO4NRYT+thXM7Pe3n6LJBUHm1hQkbguHL7ITxoR9PcfoxBMPgwhsaRGIE/sjFwa6A
	Bnwj9MDbNU0LT9vczmeY/WNpG83r2mDDS4BYsUtji6c5d12VlOrsINbgGwFszR7oNt
	2Nd8FYXIBwCZT6Gqxb3eP2bCu7Ztth84t4kEIF8Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHORwV011569
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:27 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORi023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:47 -0400
Message-ID: <1532021058-48916-15-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 14/45] gpmc-lld-rtos: Update to version 1.0.0.2
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:34 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
index 01ea501..912a797 100644
--- a/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
+++ b/recipes-bsp/gpmc-lld/gpmc-lld-rtos_git.bb
@@ -12,14 +12,14 @@ GPMC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/gpmc-lld.git"
 GPMC_LLD_GIT_PROTOCOL = "git"
 GPMC_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.GPMC_LLD.01.00.00.01"
-GPMC_LLD_SRCREV = "86df4c099ad9c84f4b92d515ba64c343c75cf44d"
+# Below commit ID corresponds to "DEV.GPMC_LLD.01.00.00.02"
+GPMC_LLD_SRCREV = "320b18c703f70e01ea1b487c7bf9c4e08e7ae2df"
 
 BRANCH = "${GPMC_LLD_GIT_BRANCH}"
 SRC_URI = "${GPMC_LLD_GIT_URI};protocol=${GPMC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${GPMC_LLD_SRCREV}"
-PV = "01.00.00.01"
+PV = "01.00.00.02"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
-- 
1.9.1


