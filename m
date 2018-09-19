Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22D71E00B45; Wed, 19 Sep 2018 10:23:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AA541E00546
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2018 10:23:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JHNoL4089472
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2018 12:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537377830;
	bh=gL9WePwfBKU1k7Mz0FmaibW9YuQ0kinFcoKg9ufM0iE=;
	h=From:To:CC:Subject:Date;
	b=UB8sfLI5rhL9Gj+vhSH9YINcju4rs9aGSufNEGO7rn+IaFj+P7KztC7BfOjOjd7PB
	dtmdxARBysSkYzBzsWkqYfhFMgKLhUF5WdFYqUrAm56ftkNINH5Ry4bVEp0HxNMDEP
	byfg4gHViXHdTBzOy9yJ7VUabAiuCdWT8xD2LF7o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JHNoLD010385
	for <meta-ti@yoctoproject.org>; Wed, 19 Sep 2018 12:23:50 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 12:23:49 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 12:23:49 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JHNn1i012645;
	Wed, 19 Sep 2018 12:23:49 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>, <s-anna@ti.com>
Date: Wed, 19 Sep 2018 13:23:48 -0400
Message-ID: <1537377828-12985-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [2018.03/rocko/master][PATCH] sciclient-rtos: Update to new commit with fixes
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
X-List-Received-Date: Wed, 19 Sep 2018 17:23:51 -0000
Content-Type: text/plain

Update to new commit with fixes for issues related to irq set API

Fix build issue with debug files

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bb b/recipes-bsp/sciclient/sciclient-rtos_git.bb
index e059f4b..73f642d 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bb
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bb
@@ -12,15 +12,15 @@ SCICLIENT_GIT_URI = "git://git.ti.com/keystone-rtos/sciclient.git"
 SCICLIENT_GIT_PROTOCOL = "git"
 SCICLIENT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00"
-SCICLIENT_SRCREV = "4ac052a70764c5fcf9dd18d521fe3b631bfcd875"
+# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.00A"
+SCICLIENT_SRCREV = "cf151766d4cef7f93b47e4822a1ce6f17dfb9339"
 
 BRANCH = "${SCICLIENT_GIT_BRANCH}"
 SRC_URI = "${SCICLIENT_GIT_URI};protocol=${SCICLIENT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${SCICLIENT_SRCREV}"
 PV = "01.00.00.00"
-PR = "r0"
+PR = "r1"
 
 DEPENDS_append = " osal-rtos common-csl-ip-rtos"
 
@@ -81,3 +81,5 @@ do_install() {
 FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
 
 INSANE_SKIP_${PN} = "arch ldflags file-rdeps"
+
+INSANE_SKIP_${PN}-dbg = "arch"
-- 
1.9.1


