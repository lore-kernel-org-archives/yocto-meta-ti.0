Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45FBAE00E0F; Thu,  7 Nov 2019 10:09:57 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F7C7E00E16
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:53 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9rbj070508
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150193;
	bh=8WaeRMQXbv/n4ToKTUAHUH8yXV04sN1pOLJF0Jzq6GM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WtoFtR4Pwf1mXilJxEpJXTqYX3BCZeeVk7HaFp4qbTz4rQHCmrCrDsIo0afB7SjJi
	+eHQEuw8jkxsFtG4zjk9Y2ljNUo/5jx/KxM0biK9yEoNs0b8teVyvszJOA0oVcnTBf
	6LkRISSfZAqaJ/HY0j7ARelYMgS0rcsoMP7WVP8M=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9rx4125222
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:53 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:37 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:37 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIS067418;
	Thu, 7 Nov 2019 12:09:52 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:17 -0500
Message-ID: <1573149037-762-23-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 22/42] pa-lld: migrate to ti-pdk-fetch.bbclass
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
 recipes-bsp/pa-lld/pa-lld.inc | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 5af0e71..46d2d60 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -4,22 +4,11 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=cd04fb087063
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pa-lld.git"
-PA_LLD_GIT_PROTOCOL = "git"
-PA_LLD_GIT_BRANCH = "master"
-PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
+inherit ti-pdk-fetch
+PE = "1"
 
-# Below commit ID corresponding to "DEV.PA_LLD.03.00.02.08A"
-PA_LLD_SRCREV = "02e790bdeba574c0bcca9c0bfe2c071c180c53c8"
-
-BRANCH = "${PA_LLD_GIT_BRANCH}"
-SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${PA_LLD_SRCREV}"
-
-PV = "03.00.02.08A"
 INC_PR = "r0"
 
-S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk = "k2h k2k"
@@ -30,3 +19,4 @@ LIBPA = "libpa"
 LIBPA_k2hk = "libpa"
 LIBPA_k2e = "libpa2"
 LIBPA_k2l = "libpa2"
+TI_PDK_COMP = "ti.drv.pa"
-- 
2.7.4


