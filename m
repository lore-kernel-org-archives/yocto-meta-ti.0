Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96BD4E00BDF; Thu, 27 Sep 2018 08:23:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB5D0E00BA2
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 08:23:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFNQBM045037
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538061806;
	bh=CtwT3v0kvKGsDf9vXgsrqbV0mrKW78kdEwDcac/3x7M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L8dRNeWYh9TY45CkB1iMEpksOhbHBy5lS5kJFRRy8zR1GhxnIjhQvpt7K/HlOzyP6
	pZPRFOoE3sYP7XhgkUa0Uepgmo4aV37H2ZkwQaNqx4gxRx+jM+hpwtGAQTD2aKyqen
	Tog0Kt0mLeMueYmaLh2Anf3TR1PtIwEFTK6/I/7g=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNQoU018615
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:26 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:23:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:23:26 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFNIJM014983
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 10:23:26 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 11:22:26 -0400
Message-ID: <1538061764-54977-13-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538061764-54977-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 12/30] mmcsd-lld-rtos: Update to version 01.00.00.13 and added k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 15:23:28 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
index 6b063f7..82c828e 100644
--- a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bb
@@ -5,7 +5,7 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://MMCSD.h;beginline=1;endline=32;md5=f74069541d4d165a000a66b4043cb065"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|omapl1|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 MMCSD_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/sd-mmc.git"
@@ -13,14 +13,14 @@ MMCSD_LLD_GIT_PROTOCOL = "git"
 MMCSD_LLD_GIT_BRANCH = "master"
 MMCSD_LLD_GIT_DESTSUFFIX = "git/ti/drv/mmcsd"
 
-# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.12"
-MMCSD_LLD_SRCREV = "c3fe2b9a82cab5af9fa16e9424b1397054353a9d"
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.13"
+MMCSD_LLD_SRCREV = "73e5ce5b0c1ebf05ca440263721f045b09cd0688"
 
 BRANCH = "${MMCSD_LLD_GIT_BRANCH}"
 SRC_URI = "${MMCSD_LLD_GIT_URI};destsuffix=${MMCSD_LLD_GIT_DESTSUFFIX};protocol=${MMCSD_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${MMCSD_LLD_SRCREV}"
-PV = "01.00.00.12"
+PV = "01.00.00.13"
 PR = "r0"
 
 S = "${WORKDIR}/${MMCSD_LLD_GIT_DESTSUFFIX}"
@@ -32,6 +32,7 @@ DEPENDS_append_ti33x = " starterware-rtos \
 "
 DEPENDS_append_ti43x = " starterware-rtos \
 "
+DEPENDS_remove_k3 = "edma3-lld-rtos "
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
-- 
1.9.1


