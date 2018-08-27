Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26FB6E0090A; Mon, 27 Aug 2018 07:34:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91CDDE0090A
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 07:34:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7REYYQr078555
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 09:34:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535380474;
	bh=F5r/t/YVKO4kIuce9vD2uDvVftpFZP/98KdL3I3hKms=;
	h=From:To:CC:Subject:Date;
	b=B9iTw/BZdJ2mwa/t61mgD4Nib+z3z3VNqGKUW5zfiABaIFDAr+pAf67yCGJH/lTcC
	BkOEDvXAlryaz4ZlzqvYQN7FR4WF6lqNs2jCbYaThqkrHfC6RK26bMM/xTLMC4MV0R
	K3LQH4hQSna7shWJv8tFDoWzl6Tg6azFXFaNAqmc=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7REYXdE013372
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 09:34:33 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 27 Aug 2018 09:34:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 27 Aug 2018 09:34:33 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7REYX2t009677;
	Mon, 27 Aug 2018 09:34:33 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Aug 2018 10:22:12 -0400
Message-ID: <1535379732-6212-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] board-rtos: bump SRCREV for am57xx-evm build fix
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
X-List-Received-Date: Mon, 27 Aug 2018 14:34:35 -0000
Content-Type: text/plain

* License checksum changed due to updated year (2018) in license text.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index cd9d173..df3e961 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -3,7 +3,7 @@ SUMMARY = "TI RTOS Board Library"
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=0e3182ba6a963da159c37eafa9752ade"
+LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=9bed8e4ac2fb37fc627cefe49eb1c919"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -13,14 +13,14 @@ BOARD_GIT_PROTOCOL = "git"
 BOARD_GIT_BRANCH = "master"
 
 # Below commit ID corresponds to "DEV.BOARD.01.00.10.01"
-BOARD_SRCREV = "47946e3f744054c5e5eecdce136b03191bd4f461"
+BOARD_SRCREV = "983d89de8143645571e7893e95632a8be0fab67e"
 
 BRANCH ="${BOARD_GIT_BRANCH}"
 SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BOARD_SRCREV}"
 PV = "01.00.10.01"
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " i2c-lld-rtos \
                    spi-lld-rtos \
-- 
2.7.4


