Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6FC4E00E85; Fri, 15 Nov 2019 07:34:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB619E00E91
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:16 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYGu8038764
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832056;
	bh=FYkwGBICZYt2NK9ooz89zOCLMOXoQb3Tu7hmn6HCp0Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=i4hkAbqxQg9qmVtJMaZJd3Iln4gkjRphkElk4umDQqLnDJgactUUuq86TWqyugnic
	EZLaH7vAb53e4Wb7Vcs8s/sdFRZESEDg95sE2YnjMs5TgwCdk+8/kuHgRMcnazloit
	OvXovS+8g0cuvFsY03x3jLHWPZb0J6XU1FYP4abs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYGdU010506
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:16 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:15 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfa041975;
	Fri, 15 Nov 2019 09:34:15 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:34 -0500
Message-ID: <1573830902-17409-15-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 14/42] icss-emac-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index 72d546b..4809e1f 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -4,25 +4,11 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=76cafd87d8495b42c2355f7681de15a2"
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
-ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
-ICSS_EMAC_LLD_GIT_BRANCH = "master"
-ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
+inherit ti-pdk-fetch
 
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.17"
-ICSS_EMAC_LLD_SRCREV = "5978212c59468eab68e232a538ee005162b6902f"
+TI_PDK_COMP = "ti.drv.icss_emac"
 
-BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
-SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
-
-# The LLD version
-PV = "01.00.00.17"
-
-# The FW version(s)
-PV_DUALEMAC_FW = "5.2.7"
+PE = "1"
 
 INC_PR = "r0"
 
-S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
-- 
2.7.4


