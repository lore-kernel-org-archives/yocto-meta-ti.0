Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69706E00E05; Thu,  7 Nov 2019 10:09:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB373E00BA1
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:48 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9mI9039628
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150188;
	bh=qd6YTph+aSx4ts4jWqvxektWH3Z24ErI695O0ddD91c=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=P500w2gk0wfGL/QrXBfBf8HF9yWvZJLE/bwHZF4hTBJ+TSlS91eWFV6PWYtgzA8Aa
	elvF8R8gHwPv2HyaWC+WW6YyrZDsc2JSW8fLghI22tJrN11LEnrVU7VdN7h5qNyXRc
	6gY7an11MVD2yg9svdhpUEkJTHwbAvJjuME0VGUo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA7I9l5e004003
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:48 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:47 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIA067418;
	Thu, 7 Nov 2019 12:09:47 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:49:59 -0500
Message-ID: <1573149037-762-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 04/42] board-rtos: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:51 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/board-rtos/board-rtos_git.bb | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb b/recipes-bsp/board-rtos/board-rtos_git.bb
index be5f90c..e6284a3 100644
--- a/recipes-bsp/board-rtos/board-rtos_git.bb
+++ b/recipes-bsp/board-rtos/board-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI RTOS Board Library"
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=9bed8e4ac2fb37fc627cefe49eb1c919"
@@ -8,18 +9,8 @@ LIC_FILES_CHKSUM = "file://board.h;beginline=1;endline=32;md5=9bed8e4ac2fb37fc62
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BOARD_GIT_URI = "git://git.ti.com/keystone-rtos/board.git"
-BOARD_GIT_PROTOCOL = "git"
-BOARD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.BOARD.01.00.10.06G"
-BOARD_SRCREV = "8f5b3079847937f97c7b27d76f8aac52fa1c11b5"
 
-BRANCH ="${BOARD_GIT_BRANCH}"
-SRC_URI = "${BOARD_GIT_URI};protocol=${BOARD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${BOARD_SRCREV}"
-PV = "01.00.10.06G"
 PR = "r0"
 
 DEPENDS_append = " i2c-lld-rtos \
@@ -81,3 +72,4 @@ export DEST_ROOT="${S}"
 XDCPATH_append = ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages"
 
 INSANE_SKIP_${PN} = "arch"
+TI_PDK_COMP = "ti.board"
-- 
2.7.4


