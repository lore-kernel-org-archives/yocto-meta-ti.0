Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3C59E0090A; Mon, 19 Mar 2018 13:39:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95F9EE0070F
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 13:39:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JKdh4P023548
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 15:39:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521491983;
	bh=NAdM+mCYEAn6DbSypr6BEeYlLniR9rOxez13FJMjyRI=;
	h=From:To:Subject:Date;
	b=wmk0yYF17ALhT773v+m0/lgErucr+ZuKeyKWKdo9Q1mXD8/NHL32DD82wetoC0SA0
	7VRSQcdsKQb5mOUfStukFMynLpWC4qE9GRnhdk73xyQveO2A3bAI4POQ8gnGOwZ95T
	ltd/BB01O0r5muSru9Hm46FJ74bf0vbUZDs38H7g=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JKdhbu019290
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 15:39:43 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 15:39:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 15:39:43 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JKdg1X010891
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 15:39:43 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Mar 2018 16:39:39 -0400
Message-ID: <1521491979-26604-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v2] board-rtos: Updating to version 01.00.10.00A
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
X-List-Received-Date: Mon, 19 Mar 2018 20:39:45 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Adding INSANE_SKIP_${PN} = "arch"

 recipes-bsp/board-rtos/board-rtos_git.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index 1fc9c8e..0a89a77 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -12,15 +12,15 @@ BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
 BOARD_GIT_PROTOCOL = "git"
 BOARD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.BOARD.01.00.09.00A"
-BOARD_SRCREV = "387d77aff6e36af54c239a315cb2d477f1466f4d"
+# Below commit ID corresponds to "DEV.BOARD.01.00.10.00A"
+BOARD_SRCREV = "14636b1363383167abb8d2b8ed6297d0b1c64930"
 
 BRANCH ="${BOARD_GIT_BRANCH}"
 SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BOARD_SRCREV}"
-PV = "01.00.09.00A"
-PR = "r1"
+PV = "01.00.10.00A"
+PR = "r0"
 
 DEPENDS_append = " i2c-lld-rtos \
                    spi-lld-rtos \
@@ -59,6 +59,9 @@ DEPENDS_append_ti43x = " gpio-lld-rtos \
                          ti-ndk \
 "
 
+DEPENDS_append_dra7xx = " pm-lld-rtos \
+                          mmcsd-lld-rtos \
+"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
@@ -70,3 +73,5 @@ export PDK_BOARD_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
 
 XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
+
+INSANE_SKIP_${PN} = "arch"
-- 
1.9.1


