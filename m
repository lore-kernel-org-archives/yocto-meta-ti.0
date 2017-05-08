Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F08F8E0077F; Mon,  8 May 2017 06:56:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1F83E0059A
	for <meta-ti@yoctoproject.org>; Mon,  8 May 2017 06:56:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v48Dua9s028414
	for <meta-ti@yoctoproject.org>; Mon, 8 May 2017 08:56:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494251796;
	bh=fY5YWhFpCUKtO/s2+Y/5Oaau+tl2a2/qGIZS4Ig9kNE=;
	h=From:To:CC:Subject:Date;
	b=RGXmmcXkW5Hzvq2C6fqCet5WOjtuuGrKSb1+q3T7iiPAsKZpMQpDo/XBHfbtsyZxn
	nlan9+w3GlKquPc8RQytpv43z66S+XxOKA3aGAwe6Z8V3XvSah4gqjjtEMwDpoC4F0
	NsGdNVthccB5esfGSvdA3wRhY0uPHXyO4gmVQOVw=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v48DuUIv015301
	for <meta-ti@yoctoproject.org>; Mon, 8 May 2017 08:56:30 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 8 May 2017 08:56:30 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v48DuUr9027485;	Mon, 8 May 2017 08:56:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 8 May 2017 09:54:22 -0400
Message-ID: <1494251662-13946-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] osal: utilize oe_runmake
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
X-List-Received-Date: Mon, 08 May 2017 13:56:59 -0000
Content-Type: text/plain

* Use the oe_runmake wrapper to invoke make
* Supply common make arguments to EXTRA_OEMAKE such as which makefile
  to invoke.
* This resolves build issues when osal needs to be reconfigured
  as do_configure would make the clean target of the incorrect
  makefile.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/osal/osal-test_git.bb | 10 ++++++----
 recipes-bsp/osal/osal_git.bb      | 10 ++++++----
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/osal/osal-test_git.bb b/recipes-bsp/osal/osal-test_git.bb
index 9d4fa6d..58156e3 100644
--- a/recipes-bsp/osal/osal-test_git.bb
+++ b/recipes-bsp/osal/osal-test_git.bb
@@ -4,17 +4,19 @@ DEPENDS="common-csl-ip osal"
 
 include osal.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
 
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} OSAL_SRC_DIR=${S}"
+
 do_compile () {
 #   Build the tests
-    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
-    make -f makefile_armv7 tests PDK_INSTALL_PATH=${STAGING_INCDIR} OSAL_SRC_DIR=${S}
+    oe_runmake clean
+    oe_runmake tests
 }
 
 do_install () {
 #   Install the binary
-    make -f makefile_armv7 installbin PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_BIN_BASE_DIR=${D}${bindir} OSAL_SRC_DIR=${S}
+    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir}
 }
diff --git a/recipes-bsp/osal/osal_git.bb b/recipes-bsp/osal/osal_git.bb
index ecb46b2..bb30ab5 100644
--- a/recipes-bsp/osal/osal_git.bb
+++ b/recipes-bsp/osal/osal_git.bb
@@ -4,17 +4,19 @@ DEPENDS="common-csl-ip"
 
 include osal.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 S = "${WORKDIR}/${OSAL_GIT_DESTSUFFIX}"
 
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
 do_compile () {
 #   Build the lib
-    make -f makefile_armv7 clean PDK_INSTALL_PATH=${STAGING_INCDIR}
-    make -f makefile_armv7 lib PDK_INSTALL_PATH=${STAGING_INCDIR}
+    oe_runmake clean
+    oe_runmake lib
 }
 
 do_install () {
 #   Install the lib
-    make -f makefile_armv7 install PDK_INSTALL_PATH=${STAGING_INCDIR} INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
+    oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} INSTALL_LIB_BASE_DIR=${D}${libdir}
 }
-- 
2.7.4


