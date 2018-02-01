Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 46EA3E00E22; Wed, 31 Jan 2018 18:43:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDAD0E00D1C
	for <meta-ti@yoctoproject.org>; Wed, 31 Jan 2018 18:43:42 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w112hfdX025961
	for <meta-ti@yoctoproject.org>; Wed, 31 Jan 2018 20:43:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517453021;
	bh=IbDa1etBlQbnaPPD7OCATnkE8sqJShrPIWnQgwemnVY=;
	h=From:To:CC:Subject:Date;
	b=FREcRKfDnXVriQU2f7n6+pnbfiVqwwB98zeV4qrksYTaqOon1Dmqaq/9Es3fvcqtT
	wim3cvLirfoYFPxOHP2/hD9ES896YbkykQMVbufQif018MGDY8baR612pY3U+joLBu
	0QfIduFbuVhMYD19chZqZ4dFmPH3Rd0lPXn6QnPs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w112hf3g018346
	for <meta-ti@yoctoproject.org>; Wed, 31 Jan 2018 20:43:41 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 31 Jan 2018 20:43:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 31 Jan 2018 20:43:41 -0600
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w112hfMD026028;
	Wed, 31 Jan 2018 20:43:41 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 31 Jan 2018 21:43:38 -0500
Message-ID: <1517453018-40338-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH] cmem: Update to new version 4.15.00.00_eng
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
X-List-Received-Date: Thu, 01 Feb 2018 02:43:43 -0000
Content-Type: text/plain

License update due to year update
Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-bsp/cmem/cmem-mod_git.bb | 2 +-
 recipes-bsp/cmem/cmem.inc        | 8 ++++----
 recipes-bsp/cmem/cmem_git.bb     | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/cmem/cmem-mod_git.bb b/recipes-bsp/cmem/cmem-mod_git.bb
index 14c7edf..1031e85 100644
--- a/recipes-bsp/cmem/cmem-mod_git.bb
+++ b/recipes-bsp/cmem/cmem-mod_git.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "Kernel module for contiguous memory allocation from userspace"
 include cmem.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 inherit module
diff --git a/recipes-bsp/cmem/cmem.inc b/recipes-bsp/cmem/cmem.inc
index 53c305b..436368e 100644
--- a/recipes-bsp/cmem/cmem.inc
+++ b/recipes-bsp/cmem/cmem.inc
@@ -1,13 +1,13 @@
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/Category:CMEM"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=9b745e2765a6ba8a636c91aed4b02ac1"
+LIC_FILES_CHKSUM = "file://include/ti/cmem.h;beginline=1;endline=30;md5=26be509e4bb413905bda8309e338e2b1"
 
 BRANCH = "lu-next"
-# This corresponds to version 4.14.01.00
-SRCREV = "b687f3c3658221cdb2731e2421a26004ee7193b8"
+# This corresponds to version 4.15.00.00_eng
+SRCREV = "86462821d99cf0e5c4ad33158e08feeb01b26484"
 
-PV = "4.14.01.00+git${SRCPV}"
+PV = "4.15.00.00+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ipc/ludev.git;protocol=git;branch=${BRANCH}"
 
diff --git a/recipes-bsp/cmem/cmem_git.bb b/recipes-bsp/cmem/cmem_git.bb
index b30029d..bab9238 100644
--- a/recipes-bsp/cmem/cmem_git.bb
+++ b/recipes-bsp/cmem/cmem_git.bb
@@ -4,7 +4,7 @@ include cmem.inc
 
 RDEPENDS_${PN} = "cmem-mod"
 
-PR = "r1"
+PR = "r0"
 
 PACKAGES =+ "${PN}-test"
 
-- 
1.9.1


