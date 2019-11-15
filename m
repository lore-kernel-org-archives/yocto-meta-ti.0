Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2711CE00E85; Fri, 15 Nov 2019 07:34:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AA2DE00C5C
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:18 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYIut038819
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832058;
	bh=HQUDBWZvsC5Fx6+J+Nh7URgFFtxrR1Oks3KA8cumtoI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=h2hG1Cxp4TAGjWyx7y9ImQr476f8UoL9WAbbsegL53BzZULPJW9IHGsjG1QspxGjO
	wvbb38DxJzRZypD+bKT/ioOaw9Qs1PlU0jAeY1DXtL4x5kUyogqsyB+8r9nRkLkwCd
	pLb1SzlRuWbeNBvPzOqwOD/1D5LuN4klWmq2nkHU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYI12050802
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:18 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:18 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfi041975;
	Fri, 15 Nov 2019 09:34:18 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:42 -0500
Message-ID: <1573830902-17409-23-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 22/42] pa-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pa-lld/pa-lld.inc | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/pa-lld/pa-lld.inc b/recipes-bsp/pa-lld/pa-lld.inc
index 5af0e71..83c57e3 100644
--- a/recipes-bsp/pa-lld/pa-lld.inc
+++ b/recipes-bsp/pa-lld/pa-lld.inc
@@ -4,22 +4,14 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/pa/COPYING.txt;md5=cd04fb087063
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pa-lld.git"
-PA_LLD_GIT_PROTOCOL = "git"
-PA_LLD_GIT_BRANCH = "master"
-PA_LLD_GIT_DESTSUFFIX = "git/ti/drv/pa"
+inherit ti-pdk-fetch
 
-# Below commit ID corresponding to "DEV.PA_LLD.03.00.02.08A"
-PA_LLD_SRCREV = "02e790bdeba574c0bcca9c0bfe2c071c180c53c8"
+TI_PDK_COMP = "ti.drv.pa"
 
-BRANCH = "${PA_LLD_GIT_BRANCH}"
-SRC_URI = "${PA_LLD_GIT_URI};destsuffix=${PA_LLD_GIT_DESTSUFFIX};protocol=${PA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${PA_LLD_SRCREV}"
+PE = "1"
 
-PV = "03.00.02.08A"
 INC_PR = "r0"
 
-S = "${WORKDIR}/${PA_LLD_GIT_DESTSUFFIX}"
 
 DEVICELIST = "k2h k2k k2l k2e"
 DEVICELIST_k2hk = "k2h k2k"
-- 
2.7.4


