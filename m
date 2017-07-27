Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 624ADE00CC1; Thu, 27 Jul 2017 14:23:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F85DE00CBF
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 14:23:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RLNA7i016061
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501190590;
	bh=yrUZccCYzWSPw82uAZjOC2OTn2Vjst90LxVrJenAqN0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cE3P4bhq2+VYCtw3uqOYB1P7KpNDRaNbOBa290CA94zIECd4gBg1oztWj015ZanRv
	j1ehVnRxcYFU5O75WCeKnVl44Mquiyl+Eecr1U0KUiFe9rEqbArRd9iCselb6arU2w
	9hiKBr1d6SKinKbMHK7ntONWe2STHH9GyNFOPnVU=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RLNAvs012420
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 16:23:10 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6RLN9IX026111	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10
	-0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jul 2017 17:23:02 -0400
Message-ID: <1501190583-48494-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501190583-48494-1-git-send-email-e-ruei1@ti.com>
References: <1501190583-48494-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 3/4] matrix-gui-submenu: add browser submenu
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
X-List-Received-Date: Thu, 27 Jul 2017 21:23:13 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
index 7e1f7d1..f592f7a 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-submenus_2.0.bb
@@ -7,7 +7,7 @@ require matrix-gui-apps-git.inc
 # reset the LIC_FILES_CHKSUM setting from the matrix-gui-apps-git.inc file
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 
-PR = "${INC_PR}.17"
+PR = "${INC_PR}.18"
 
 # These packages make submenus in matrix and are not architecture specific
 inherit allarch
@@ -34,6 +34,7 @@ SUBMENUS = " arm_submenu \
              videoanalytics_submenu \
              machinevision_submenu \
              touch_submenu \
+             browser_submenu \
 "
 
 do_install(){
@@ -66,6 +67,7 @@ PACKAGES += " ${PN}-arm \
               ${PN}-videoanalytics \
               ${PN}-machinevision \
               ${PN}-touch \
+              ${PN}-browser \
 "
 
 # Make sure app images has been installed
@@ -93,3 +95,4 @@ FILES_${PN}-opencl = "${MATRIX_APP_DIR}/opencl_submenu/*"
 FILES_${PN}-videoanalytics = "${MATRIX_APP_DIR}/videoanalytics_submenu/*"
 FILES_${PN}-machinevision = "${MATRIX_APP_DIR}/machinevision_submenu/*"
 FILES_${PN}-touch = "${MATRIX_APP_DIR}/touch_submenu/*"
+FILES_${PN}-browser = "${MATRIX_APP_DIR}/browser_submenu/*"
-- 
1.9.1


