Return-Path: <jsobota@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1AA16E00DA2; Thu, 15 Dec 2016 08:04:19 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19E4EE00D9C
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 08:04:16 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBFFvccV017749
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:38 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBFFvcNc003916
	for <meta-ti@yoctoproject.org>; Thu, 15 Dec 2016 09:57:38 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 15 Dec 2016 09:57:38 -0600
Received: from a0866445-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uBFFvOK1018442;	Thu, 15 Dec 2016 09:57:38 -0600
From: Justin Sobota <jsobota@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 15 Dec 2016 10:54:38 -0500
Message-ID: <1481817282-7017-7-git-send-email-jsobota@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1481817282-7017-1-git-send-email-jsobota@ti.com>
References: <1481817282-7017-1-git-send-email-jsobota@ti.com>
MIME-Version: 1.0
Subject: [master/krogoth][PATCH 07/11] nwal-lld: Upstream version 2.1.0.11A
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
X-List-Received-Date: Thu, 15 Dec 2016 16:04:19 -0000
Content-Type: text/plain

Signed-off-by: Justin Sobota <jsobota@ti.com>
---
 recipes-bsp/nwal-lld/nwal-lld.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/nwal-lld/nwal-lld.inc b/recipes-bsp/nwal-lld/nwal-lld.inc
index 53f7313..69e43d1 100644
--- a/recipes-bsp/nwal-lld/nwal-lld.inc
+++ b/recipes-bsp/nwal-lld/nwal-lld.inc
@@ -8,15 +8,15 @@ NWAL_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/nwal-lld.git"
 NWAL_LLD_GIT_PROTOCOL = "git"
 NWAL_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.NWAL.02.01.00.10A"
-NWAL_LLD_SRCREV = "e7ed8c5abc4b93b99a5f45699eef8f3b8ca51d1e"
+# Below commit ID corresponds to "DEV.NWAL.02.01.00.11A"
+NWAL_LLD_SRCREV = "a93303e3d682d7161030113b72c3e1adf755bf89"
 
 BRANCH = "${NWAL_LLD_GIT_BRANCH}"
 SRC_URI = "${NWAL_LLD_GIT_URI};protocol=${NWAL_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${NWAL_LLD_SRCREV}"
 
-PV = "02.01.00.10"
-INC_PR = "r1"
+PV = "02.01.00.11A"
+INC_PR = "r0"
 
 BASEDIR = "${WORKDIR}/git"
 S = "${BASEDIR}/ti/drv/nwal"
-- 
2.7.4


