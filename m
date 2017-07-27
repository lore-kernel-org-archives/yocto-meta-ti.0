Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52C15E00CC6; Thu, 27 Jul 2017 14:23:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	TVD_SPACE_RATIO autolearn=ham version=3.3.1
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
	*  0.0 TVD_SPACE_RATIO TVD_SPACE_RATIO
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80BD1E00CC1
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 14:23:11 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RLNADS016057
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501190590;
	bh=lXRpkJNdr/bXFOqM79XJU6Dfy3LjN+5B/5PQWLBxCDo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QApMDqqN4UOJXFZLs6jODUYWyzcSISSyp057LNfrcnZWF5l4LjmncjH97HUH+YimI
	HfHOfI1cVEn3tkE/e3yIJy76TZzBrc5OucpJmRktSMVjvmZJEd/y1UlMoaOk1X22y+
	9lrk6wZVqIe/TG19EGslqugeypNH4AgF94IVRUPY=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RLNArY020267
	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 16:23:10 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6RLN9IW026111	for <meta-ti@yoctoproject.org>; Thu, 27 Jul 2017 16:23:10
	-0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Jul 2017 17:23:01 -0400
Message-ID: <1501190583-48494-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501190583-48494-1-git-send-email-e-ruei1@ti.com>
References: <1501190583-48494-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 2/4] matix-gui-browser-demos: add browser demos
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
 .../recipes-core/matrix/matrix-gui-browser-demos_2.0.bb  | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
new file mode 100644
index 0000000..63811c7
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Various Demo Browsers for Matrix v2"
+HOMEPAGE = "https://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps"
+
+require matrix-gui-apps-git.inc
+
+PR = "${INC_PR}.0"
+
+inherit allarch
+
+S = "${WORKDIR}/git/browser_apps"
+
+# Make sure browser submenu and app images has been installed
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-browser"
+
+FILES_${PN} += "${MATRIX_BASE_DIR}/*"
+FILES_${PN} += "${bindir}/runGoogleChrome.sh"
-- 
1.9.1


