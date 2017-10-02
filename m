Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D760DE00D14; Mon,  2 Oct 2017 16:12:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1CEC7E00D03
	for <meta-ti@yoctoproject.org>; Mon,  2 Oct 2017 16:12:23 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92NCDQG021531
	for <meta-ti@yoctoproject.org>; Mon, 2 Oct 2017 18:12:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506985933;
	bh=Q/dpLhT3JFyQWKhk0RzqbtEbSSfpki8TH68oHuP8FLU=;
	h=From:To:CC:Subject:Date;
	b=OzWgh9S1CZRqzb+0Xd/PWgQwxtV3BkKUHmOv4zMwU8tajAj0Q932o56scX/NAnm9K
	8ROCOLub6b5ocL7fU6eEe+vwInoPC8winK6kf+Eh5pBEsAj/7EEN5/U43RAAnW8X6Y
	YXN0ovVixNtObr2tZc7GBukZDwB7BCcbYUf4Qgmw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92NC8Kc009763
	for <meta-ti@yoctoproject.org>; Mon, 2 Oct 2017 18:12:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 18:12:07 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 18:12:07 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92NC7NM017278;
	Mon, 2 Oct 2017 18:12:07 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 2 Oct 2017 19:12:07 -0400
Message-ID: <1506985927-15355-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH v2] pm/vps-lld, cmb/audk2g-addon: fix double-inclusion warning for ti-paths.inc
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
X-List-Received-Date: Mon, 02 Oct 2017 23:12:25 -0000
Content-Type: text/plain

ti-pdk.bbclass already includes it.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - same for vps-lld, cmb-addon and audk2g-addon

 recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb |    1 -
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb       |    2 +-
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb             |    1 -
 recipes-bsp/vps-lld/vps-lld-rtos_git.bb           |    1 -
 4 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
index 6959864..0cb9ff1 100644
--- a/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
+++ b/recipes-bsp/audk2g-addon/audk2g-addon-rtos_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "TI RTOS Audio add-on software for k2g"
 
-require recipes-ti/includes/ti-paths.inc
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
index 4d69863..0fade74 100644
--- a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -1,5 +1,5 @@
 SUMMARY = "TI RTOS software supporting circular microphone array board"
-require recipes-ti/includes/ti-paths.inc
+
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
index 6fedc80..05388e5 100644
--- a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "TI RTOS driver for Power Management module (PM)"
 
-require recipes-ti/includes/ti-paths.inc
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
index f13e2fc..88f79e1 100644
--- a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -1,6 +1,5 @@
 SUMMARY = "TI RTOS Low level driver for Video Processing Subsystem (VPS) "
 
-require recipes-ti/includes/ti-paths.inc
 inherit ti-pdk
 
 LICENSE = "BSD-3-Clause"
-- 
1.7.9.5


