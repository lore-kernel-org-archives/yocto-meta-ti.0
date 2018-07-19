Return-Path: <h-gou@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 956F8E01102; Thu, 19 Jul 2018 12:11:43 -0700 (PDT)
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
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F622E009CF
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:11:42 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JJBfJ6012131
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 14:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532027501;
	bh=Jkxveb7DC/QLikLIt/vbXq86kw1LYRp3r0O754LTrJI=;
	h=From:To:CC:Subject:Date;
	b=weqAySZijGa4YirbXvCXQNaNwhoJtAL2i5oLH2m64FYuY+RQ34ZidS9xn+UWlU676
	gbOOrndsvi+lqTmeGuq44lhLaI22Hz/8NiU0JgAhndTVt34t/k9D6F0xBiMxI8h5iS
	MS8Ah63+H1Sz8CuNRnIlmaajoSWbLsy/19BICqow=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JJBfE5022269
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 14:11:41 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 14:11:41 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 14:11:41 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JJBfhr015183;
	Thu, 19 Jul 2018 14:11:41 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 15:11:38 -0400
Message-ID: <1532027498-15536-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master/ti2018.01] [PATCH] pruss-lld-apps: build example applications of pruss-lld
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
X-List-Received-Date: Thu, 19 Jul 2018 19:11:43 -0000
Content-Type: text/plain

* The current example application is Simple Open Real-Time Ethernet (SORTE).
  It is ported to Linux user space utilizing UIO.

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
Please note that this patch is on top of pruss-lld version update
to 1.0.0.10: http://patchwork.dal.design.ti.com/patch/39393/

 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb | 33 +++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-apps_git.bb

diff --git a/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
new file mode 100644
index 0000000..5867984
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-apps_git.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "TI PRUSS low level driver example applications"
+
+DEPENDS="common-csl-ip pruss-lld osal ti-pdk-build-rtos pruss-lld-rtos"
+
+DEPENDS_append_ti33x = " starterware"
+DEPENDS_append_ti43x = " starterware"
+
+include pruss-lld.inc
+
+PR = "${INC_PR}.0"
+
+S = "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
+
+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages PRUSS_SRC_DIR=${S}"
+
+
+DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
+
+do_compile () {
+#   Build the apps
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake apps DEVICE="$device"
+    done
+}
+
+do_install () {
+#   Install the app binary
+    for device in ${DEVICE_LIST}
+    do
+        oe_runmake installapp INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
+    done
+}
-- 
1.9.1


