Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECEACE00ADF; Fri, 28 Sep 2018 09:26:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0FC3E00AB9
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:35 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQZtE078247
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151995;
	bh=CtwT3v0kvKGsDf9vXgsrqbV0mrKW78kdEwDcac/3x7M=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qJPcnWrbFk3CIGvwsa3pqm6UvvHwvUV9pwgs0KVt+/JLYwEHsUe3/XZ+8YAFjvsFB
	8utT/BooEgyaPUR/wpuvDK4pweZxL3cDM6UFmk8/pM8iz1s6538R6mnumUKfkaPvRj
	UsKew+U41ZNL0doNUFyal/GhOEQMHTGSlzete528=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQZII003176
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:35 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMN011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:12 -0400
Message-ID: <1538151990-44823-12-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 11/29] mmcsd-lld-rtos: Update to version 01.00.00.13 and added k3 support
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


