Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79D9EE014AA; Thu, 19 Jul 2018 10:24:33 -0700 (PDT)
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
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51202E015BD
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOSj4071079
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021068;
	bh=43B57T2DEsjCspeeTSz7Kagc+sdILN4SwPjo0824dZQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=V684+L4srmkzQPtZTeeYRE1z+4izGj/gv+rNDbTcbTIoKIb39+107TaNtZdJHhLO9
	H80iyIpx3dnUIg1ViWaqnPVVQkKiemEHVu1DHClDPAZNGXBqql7dR6JA+WD8CxqGgq
	at36Ua/9CxeRNmfW8o3apbg/XEPgmgG+j93d+L2M=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOSk2015442
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:28 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:28 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORm023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:28 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:51 -0400
Message-ID: <1532021058-48916-19-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 18/45] iqn2-lld: Update to version 1.0.0.11
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:33 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 0a65e4f..2737562 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -6,14 +6,14 @@ IQN2_LLD_GIT_PROTOCOL = "git"
 IQN2_LLD_GIT_BRANCH = "master"
 IQN2_LLD_GIT_DESTSUFFIX = "git/ti/drv/iqn2"
 
-# Following commit corresponds to DEV.IQN_LLD.01.00.00.10
-IQN2_LLD_SRCREV = "dfc6bdd3b397b58e234f74eadda6d79ee399e682"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.11
+IQN2_LLD_SRCREV = "cf78b793523e42867f2c538ae19227d2ae764b86"
 
 BRANCH = "${IQN2_LLD_GIT_BRANCH}"
 SRC_URI = "${IQN2_LLD_GIT_URI};destsuffix=${IQN2_LLD_GIT_DESTSUFFIX};protocol=${IQN2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${IQN2_LLD_SRCREV}"
 
-PV = "1.0.0.10"
+PV = "1.0.0.11"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l"
-- 
1.9.1


