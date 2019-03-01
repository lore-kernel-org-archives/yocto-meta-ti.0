Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2364CE0095C; Thu, 28 Feb 2019 19:11:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3FFEE0090C
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 19:11:53 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x213BqP8113600
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 21:11:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551409912;
	bh=7UJKSq6oI2orNBZlp1S2yHDoUCpSUkOfIlYtp6gFj/Y=;
	h=From:To:Subject:Date;
	b=qPB+OaqS5mY8TE+AQzUQqO4jps2V+2M8Cdx1pmdZ1NQGFKuB+hmTmrSO7cnkWMBkd
	0g/O1mPYihrwJ7erQN8VBAk+MR3T1sz6PJrROcN3ulHxp4pPSTGyfo7me3elzJkixw
	Je75147PZZdr90M7qfb55sV7Y9L3yr+93KGHbo7E=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x213Bq9S100698
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 21:11:52 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 28 Feb 2019 21:11:52 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 28 Feb 2019 21:11:52 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x213Bo3u007193
	for <meta-ti@yoctoproject.org>; Thu, 28 Feb 2019 21:11:51 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Feb 2019 22:11:44 -0500
Message-ID: <1551409905-42852-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [prefix=thud/master][PATCH 1/2] ti-sgx-ddk-um: bump SRCREV and enable AM3/4/5 support for DDK 1.17
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
X-List-Received-Date: Fri, 01 Mar 2019 03:11:55 -0000
Content-Type: text/plain

- bump SRCREV to pick up UM libraries for all supported SoCs at DDK 1.17
- enable AM3/4/5 support for DDK 1.17

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 3affbdf..c0225c5 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -3,15 +3,18 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
 
-COMPATIBLE_MACHINE = "k3"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BRANCH = "ti-img-sgx/rocko/${PV}"
+BRANCH = "ti-img-sgx/thud/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "ee266bb47c7b9b052d67e491fa8c28e301c36691"
+SRCREV = "2bce2bd76259848e7d263e0a85c164480a71ba7d"
 
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
 TARGET_PRODUCT_k3 = "ti654x"
 
 INITSCRIPT_NAME = "rc.pvr"
@@ -19,7 +22,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r30"
+PR = "r31"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 DEPENDS += "libdrm udev libgbm wayland libffi"
-- 
1.9.1


