Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF71BE00CF9; Tue, 24 Oct 2017 07:23:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 34458E00CEF
	for <meta-ti@yoctoproject.org>; Tue, 24 Oct 2017 07:23:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9OENR08005704
	for <meta-ti@yoctoproject.org>; Tue, 24 Oct 2017 09:23:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508855007;
	bh=WIjQdezOg5nsZqTIRP49czrzF1eLALLBaxvra8zTMMQ=;
	h=From:To:CC:Subject:Date;
	b=g12CsHOjYvXx+gKDREc+O8LdtW/j7+I/El4rUkZmKuHCZqAyeRDBt/kaiYUhU6HJ+
	/t6TGuHXm88DqYzN3EvOSzFZ6FoXrokI1FU3/9IZKd4pnyCnkkZyK3R8kq7yE6cLaB
	BuV2mTvt/txuPfBRMtQZ4WJiKsV8ZB91cmPBzaXw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9OENRkf031831
	for <meta-ti@yoctoproject.org>; Tue, 24 Oct 2017 09:23:27 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 24 Oct 2017 09:23:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 24 Oct 2017 09:23:27 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9OENQso022918;
	Tue, 24 Oct 2017 09:23:26 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 24 Oct 2017 10:15:50 -0400
Message-ID: <1508854550-14910-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] ti-pdk: clean the sources during the configure task
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
X-List-Received-Date: Tue, 24 Oct 2017 14:23:28 -0000
Content-Type: text/plain

* For the XDCMAKE recipes, a clean was already occuring udring the
  compile task.
* Move the clean to the configure task to more closely match the
  base.bbclass.
* As the non XDCMAKE recipes generate dep files, add a clean in
  configure for when dependencies have changed.
* Use oe_runmake to share options between "make release" and
  "make clean".
* There appears to be an issue with parallel builds using the
  ti-pdk-build framework, so unset PARALLEL_MAKE.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk.bbclass | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 76abfe4..f876802 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -63,6 +63,14 @@ TI_PDK_EXTRA_MAKE ?= ""
 TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
 PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
+PARALLEL_MAKE = ""
+
+EXTRA_OEMAKE = " \
+    LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
+    LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
+    LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
+    ${TI_PDK_EXTRA_MAKE} \
+"
 
 do_configure() {
     BUILD_DIR=${B}/`get_build_dir_bash`
@@ -79,25 +87,31 @@ do_configure() {
         find -name "*.xs" -exec sed -i "s/sectti\.exe/sectti/" {} \;
         find -name "*.xs" -exec sed -i "/\.chm/d" {} \;
         find -name "*.xs" -exec sed -i "s/pasm\_dos/pasm\_linux/" {} \;
+
+        cd ${B}
+        ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
+    else
+        if [ "${CLEANBROKEN}" != "1" ]
+        then
+            cd ${BUILD_DIR}
+            oe_runmake clean
+            cd "${B}"
+        fi
     fi
+
 }
 
 do_compile() {
 
     if [ "${TI_PDK_XDCMAKE}" == "1" ]
     then
-        ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
         ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${TI_PDK_XDC_ARGS}" ROOTDIR="${ROOTDIR}" -PR .
         ${XDC_INSTALL_DIR}/xdc release XDCARGS="${TI_PDK_XDC_ARGS}" -PR .
     else
         BUILD_DIR=${B}/`get_build_dir_bash`
         cd ${BUILD_DIR}
 
-        make ${TI_PDK_MAKE_TARGET} \
-             LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
-             LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
-             LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
-             ${TI_PDK_EXTRA_MAKE}
+        oe_runmake ${TI_PDK_MAKE_TARGET}
     fi
 }
 
-- 
2.7.4


