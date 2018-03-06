Return-Path: <sjmolfetta@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56270E00DE2; Tue,  6 Mar 2018 06:12:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 181F1E00AF2
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2018 06:12:33 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26ECX0P008569
	for <meta-ti@yoctoproject.org>; Tue, 6 Mar 2018 08:12:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520345553;
	bh=c9ZyjKXndSFHtoEGmtONO4LvA63wkspFQg6zhbuXSVE=;
	h=From:To:CC:Subject:Date;
	b=kC2LatQyydnodCQrNGyH9BkcJgUhyUAIBc6e2ix/+XrR1IxFg2dI0DMN44tSiXtLd
	vPflUmO+yDjTw/pnJpNH60oPtIkSv0zBh4MGdu9pKSn4xcD/3QytSy+CX1fmSFrwko
	2EaQDSoEDfe8W28F3WaMwd4yfIY1Ulpf1qbbTAd0=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26ECXa7004807
	for <meta-ti@yoctoproject.org>; Tue, 6 Mar 2018 08:12:33 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 08:12:32 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 08:12:32 -0600
Received: from houapbldadm.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26ECWK8002062;
	Tue, 6 Mar 2018 08:12:32 -0600
From: Stephen Molfetta <sjmolfetta@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Mar 2018 08:12:31 -0600
Message-ID: <1520345551-2371-1-git-send-email-sjmolfetta@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: sjmolfetta@ti.com
Subject: [PATCH] dra7xx: updating board-rtos depends
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
X-List-Received-Date: Tue, 06 Mar 2018 14:12:35 -0000
Content-Type: text/plain

DRA7xx board changes have introduced dependencies on mmcsd-lld-rtos and
pm-lld-rtos.  Adding these modules to the omap-a15 depends list will
bring in the dependencies for dra7xx builds
---
 recipes-bsp/board-rtos/board-rtos_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index e844e79..1fc9c8e 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -20,7 +20,7 @@ SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BOARD_SRCREV}"
 PV = "01.00.09.00A"
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " i2c-lld-rtos \
                    spi-lld-rtos \
@@ -29,15 +29,16 @@ DEPENDS_append = " i2c-lld-rtos \
 
 DEPENDS_append_omap-a15 = " osal-rtos \
                             ti-ndk \
+                            mmcsd-lld-rtos \
+                            pm-lld-rtos \
 "
 
 DEPENDS_append_am57xx-evm = " gpio-lld-rtos \
                               icss-emac-lld-rtos \
-                              mmcsd-lld-rtos \
                               pruss-lld-rtos \
-                              pm-lld-rtos \
 "
 
+
 DEPENDS_append_ti33x = " gpio-lld-rtos \
                          gpmc-lld-rtos \
                          icss-emac-lld-rtos \
-- 
2.7.4


