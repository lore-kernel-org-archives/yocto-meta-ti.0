Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1B97EE00D72; Thu, 14 Dec 2017 07:44:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D43FE00D41
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 07:44:35 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEFiYik007393
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 09:44:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513266274;
	bh=PJRi8KNLlNhb6buyxE8U8bOPnC2+6MNYkECf/SUvxFI=;
	h=From:To:Subject:Date;
	b=dXe8EcRs5wmPcXgA26ERFtvoBaAr0pmNvMLLeFtoEyCiFAPLabTHZyK4D5c5pp9GQ
	hyOK210dx26v+f4kBiL/7VWynDojPfRhnDeT/tZU84SncixDB7d1fIsG+t2idWDOTo
	qiFi0SU1FJ4fHV6khsI7yG4cN05qHtoK8hXVple0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEFiYWl003169
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 09:44:34 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 09:44:34 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 09:44:34 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEFiY6j005032
	for <meta-ti@yoctoproject.org>; Thu, 14 Dec 2017 09:44:34 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Dec 2017 10:44:32 -0500
Message-ID: <1513266272-25411-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2] board-rtos:Updating to version 1.0.9.0A
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
X-List-Received-Date: Thu, 14 Dec 2017 15:44:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v2 - Correct the typo in the COMPATIBLE_MACHINE 

 recipes-bsp/board-rtos/board-rtos_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index 37b2a64..e844e79 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -5,21 +5,21 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=0e3182ba6a963da159c37eafa9752ade"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
 BOARD_GIT_PROTOCOL = "git"
 BOARD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.BOARD.01.00.08.00A"
-BOARD_SRCREV = "16b4ec027e2b0a3b91105a948d2c2d6db997bee0"
+# Below commit ID corresponds to "DEV.BOARD.01.00.09.00A"
+BOARD_SRCREV = "387d77aff6e36af54c239a315cb2d477f1466f4d"
 
 BRANCH ="${BOARD_GIT_BRANCH}"
 SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BOARD_SRCREV}"
-PV = "01.00.08.00A"
+PV = "01.00.09.00A"
 PR = "r0"
 
 DEPENDS_append = " i2c-lld-rtos \
-- 
1.9.1


