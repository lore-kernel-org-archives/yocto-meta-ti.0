Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 811C5E00E85; Fri, 15 Nov 2019 07:34:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5119BE00ECB
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:20 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYKws057574
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832060;
	bh=ASXyCZEDSRoOmcwLHvaKZv6Lac3+jK3TZany2XY+qbA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lUeDBhXyVouIm5PQLdSchCkBjvL2pxasaEJPYh0F3l0qyCEQCIhtYJ1WHS4KfJ+GP
	7injj2LPSEKYw+/st8fqiKPOURRZ/GBL0PH93TubUY+MXu0Qnv/KUm8s+NIMMVS0/Y
	q6d992d5BHm1vq3DT6xCG8UW3FTkQEDOFSICgn6s=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYKOw050839
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:20 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:19 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:19 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfn041975;
	Fri, 15 Nov 2019 09:34:19 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:47 -0500
Message-ID: <1573830902-17409-28-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 27/42] qmss-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:21 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/qmss-lld/qmss-lld.inc | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld.inc b/recipes-bsp/qmss-lld/qmss-lld.inc
index f42f16e..5c9620f 100644
--- a/recipes-bsp/qmss-lld/qmss-lld.inc
+++ b/recipes-bsp/qmss-lld/qmss-lld.inc
@@ -4,19 +4,12 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/ti/drv/qmss/COPYING.txt;md5=cd04fb0870
 COMPATIBLE_MACHINE = "keystone"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-QMSS_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/qmss-lld.git"
-QMSS_LLD_GIT_PROTOCOL = "git"
-QMSS_LLD_GIT_BRANCH = "master"
-QMSS_LLD_GIT_DESTSUFFIX = "git/ti/drv/qmss"
+inherit ti-pdk-fetch
 
-# Below commit ID corresponding to "DEV.QMSS_LLD.02.01.00.16A"
-QMSS_LLD_SRCREV = "7ca6e92b2081bd2eb64fa3dc9ca33df78b3ce292"
+TI_PDK_COMP = "ti.drv.qmss"
 
-BRANCH ="${QMSS_LLD_GIT_BRANCH}"
-SRC_URI = "${QMSS_LLD_GIT_URI};destsuffix=${QMSS_LLD_GIT_DESTSUFFIX};protocol=${QMSS_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "${QMSS_LLD_SRCREV}"
+PE = "1"
 
-PV = "02.01.00.16A"
 INC_PR = "r0"
 
 DEVICELIST = "k2h k2k k2l k2e"
@@ -24,4 +17,3 @@ DEVICELIST_k2hk = "k2h k2k"
 DEVICELIST_k2l = "k2l"
 DEVICELIST_k2e = "k2e"
 
-S = "${WORKDIR}/${QMSS_LLD_GIT_DESTSUFFIX}"
-- 
2.7.4


