Return-Path: <tmannan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7E1EE009B2; Tue,  4 Sep 2018 12:28:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59DE0E009B2
	for <meta-ti@yoctoproject.org>; Tue,  4 Sep 2018 12:28:52 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w84JSpMG104996
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:28:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536089331;
	bh=Z9iXV+awG2h+svYNb5cKkWbf4uOqOTMud6rwWwaiGKc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xBebXlze4US3o8XOCspR2Vfkijabx9I4Df6LC/fQROWNF7zCNfXrcAaMy4vaA2eUw
	r/aLh1WvzLKzeKhHO0VlYf3vS2SogIsqhPbCP1T8KcxzgUeOEjKCB7Q8qt4GTGPqGm
	DzL3KNSazYQyHdTA6exFJ6EmlnZ21ezks0u61ryc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84JSpmY004895
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:28:51 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 4 Sep 2018 14:28:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 4 Sep 2018 14:28:51 -0500
Received: from ares-ubuntu1.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w84JSnoK014327
	for <meta-ti@yoctoproject.org>; Tue, 4 Sep 2018 14:28:51 -0500
From: Tinku Mannan <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 4 Sep 2018 15:28:45 -0400
Message-ID: <1536089325-9189-2-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1536089325-9189-1-git-send-email-tmannan@ti.com>
References: <1536089325-9189-1-git-send-email-tmannan@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] icss-emac-lld: Updating to version 01.00.00.13
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
X-List-Received-Date: Tue, 04 Sep 2018 19:28:52 -0000
Content-Type: text/plain

Updating to use COPYING.txt as license checksum file
Updating md5 checksum

Signed-off-by: Tinku Mannan <tmannan@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
index 1c38a3d..d7ca641 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://icss_emacDrv.h;beginline=1;endline=40;md5=88d270788c1d8516511304f11a28586d"
 
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=76cafd87d8495b42c2355f7681de15a2"
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
 ICSS_EMAC_LLD_GIT_BRANCH = "master"
 ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
 
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.12"
-ICSS_EMAC_LLD_SRCREV = "5d6b34fe3e19490606be39843a4096ea1ae6de2f"
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.13"
+ICSS_EMAC_LLD_SRCREV = "a4071ded3edb0cfebaa62b1f1f35686ea24585b1"
 
 BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
-PV = "01.00.00.12"
+PV = "01.00.00.13"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
-- 
2.7.4


