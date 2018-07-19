Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33945E00E04; Thu, 19 Jul 2018 10:24:31 -0700 (PDT)
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
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9506E01503
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOROV121145
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021067;
	bh=ZdXccplVj5r4eTZ+3TeQsSRYvotBwjZwpBhrF4KpWj4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hu1esXYmx6w+X4sgJnwNhmgiQw6dxVaJoSEwxzGV5Chajn3v5twGttiVtXD2M85M3
	4BXfm2m8p73iewtcMIfPj2ZzEs+aqYhb4R++B7ATjFEe75ZW/ZjXk2oJ7ohUD8GUWw
	OGd8DATk7b+PEI+0vDp6bTjbeZnnbJxUmC81yz10=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOREp011551
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:27 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:26 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORe023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:43 -0400
Message-ID: <1532021058-48916-11-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 10/45] fatfs-rtos: Update to version 1.0.0.10
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:32 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
index 55f67bf..546ec87 100644
--- a/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
+++ b/recipes-bsp/fatfs-rtos/fatfs-rtos_git.bb
@@ -12,14 +12,14 @@ FATFS_GIT_URI = "git://git.ti.com/keystone-rtos/fatfs.git"
 FATFS_GIT_PROTOCOL = "git"
 FATFS_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.09"
-FATFS_SRCREV = "a5652991a9dd9a9b9b9c5c2cf35d1417f8272b00"
+# Below commit ID corresponds to "DEV.FATFS_LLD.01.00.00.10"
+FATFS_SRCREV = "6d4e228e53dd50da0d0fed3877a9b366519d80b4"
 
 BRANCH = "${FATFS_GIT_BRANCH}"
 SRC_URI = "${FATFS_GIT_URI};protocol=${FATFS_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${FATFS_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.10"
 PR = "r0"
 
 DEPENDS_append = " mmcsd-lld-rtos"
-- 
1.9.1


