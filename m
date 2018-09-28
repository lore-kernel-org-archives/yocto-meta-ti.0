Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D54DE00AB9; Fri, 28 Sep 2018 09:26:39 -0700 (PDT)
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
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1D3D3E00ABE
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQZ13058390
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151995;
	bh=zzh6gIdkMuhrHT2GsGAOIn6QCjjeYtzHApk+haXGEvs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KufudpMQYdLiYbf++eouRcMsCqjT/yVxUUu7zv+Xw/beIer8DLdQcnBErLOdzNi6U
	giamUVxm/zXGdZ1GpzrACS6sPNSbDcUhRudWjdr6/twzzhHYKQlfM33sZioFEkacyC
	0bBTgSAiwTjFBT/mEkOA6V9zC9C/XvtFLMKS0270=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQZBe000716
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMO011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:13 -0400
Message-ID: <1538151990-44823-13-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 12/29] mcasp-lld-rtos: Update to 01.00.00.11A and add support to k3
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:39 -0000
Content-Type: text/plain

The LIC checksum update is due to copyright year change

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
index 902b7a0..440133d 100644
--- a/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
+++ b/recipes-bsp/mcasp-lld/mcasp-lld-rtos_git.bb
@@ -3,9 +3,9 @@ SUMMARY = "TI RTOS low level driver for Multi channel Audio Serial port (McASP)"
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=1;endline=47;md5=cc81a11c1566fe1cf19270744f504619"
+LIC_FILES_CHKSUM = "file://mcaspver.h;beginline=1;endline=47;md5=25868d96216e5d6f286d5fb05a3be9f4"
 
-COMPATIBLE_MACHINE = "ti43x|omap-a15|k2g|ti33x|omapl1"
+COMPATIBLE_MACHINE = "ti43x|omap-a15|k2g|ti33x|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 MCASP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mcasp-lld.git"
@@ -13,14 +13,14 @@ MCASP_LLD_GIT_PROTOCOL = "git"
 MCASP_LLD_GIT_BRANCH = "master"
 MCASP_LLD_GIT_DESTSUFFIX = "git/ti/drv/mcasp"
 
-# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.10"
-MCASP_LLD_SRCREV = "c44ce7ee06c6cfb698bd12d2fa1b58dca04c1375"
+# Below commit ID corresponds to "DEV.MCASP_LLD.01.01.00.11A"
+MCASP_LLD_SRCREV = "3620edb04240b63b50b7b9dcb3da361af8152048"
 
 BRANCH = "${MCASP_LLD_GIT_BRANCH}"
 SRC_URI = "${MCASP_LLD_GIT_URI};destsuffix=${MCASP_LLD_GIT_DESTSUFFIX};protocol=${MCASP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MCASP_LLD_SRCREV}"
-PV = "01.01.00.10"
+PV = "01.01.00.11A"
 PR = "r0"
 
 S = "${WORKDIR}/${MCASP_LLD_GIT_DESTSUFFIX}"
@@ -32,6 +32,11 @@ DEPENDS_append_ti43x = " starterware-rtos \
 "
 DEPENDS_append_ti33x = " starterware-rtos \
 "
+
+DEPENDS_remove_k3 = "edma3-lld-rtos "
+DEPENDS_append_k3 = " udma-lld-rtos \
+"
+
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
 
-- 
1.9.1


