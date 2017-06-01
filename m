Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FF74E00B49; Thu,  1 Jun 2017 08:33:31 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B49EFE00AE4
	for <meta-ti@yoctoproject.org>; Thu,  1 Jun 2017 08:33:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v51FXTuS029903
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496331209;
	bh=cy/GCp5K/wl1GwXTLC+jUDg519OT2Dh8Owo6zB3vnLs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F8OVmF6rf4tfi9VtvJgHV+15ozV6UqcYMbzKHuKKf3y1yEpj6o3xrjqqWhic3Jt9W
	obYmJreVIExtCL3ukqkt+31GZBqYf2WkOIL31xMGzvHdz0cqbCzAM8RGqOig3PvMg9
	5YnJnXl70UJBs9CB8l9bCBAvhrAlpiuJaIZlkrbk=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v51FXSdW014412
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:33:28 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v51FXRvK026013;	Thu, 1 Jun 2017 10:33:28 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Jun 2017 11:27:52 -0400
Message-ID: <1496330876-6173-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
References: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/6] ti-pdk: clean up variables by adding TI_PDK_ prefix
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
X-List-Received-Date: Thu, 01 Jun 2017 15:33:31 -0000
Content-Type: text/plain

* Add TI_PDK_ prefix to variables which may be set by recipes to
  stress that they are used to configure the ti-pdk class.
* Deprecate TI_PDK_XDCARGS in favor of TI_PDK_LIMIT_SOCS as both are
  used to define a list of SOCs.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Cc: Justin Sobota <jsobota@ti.com>
---
 classes/ti-pdk.bbclass                              | 18 ++++++++++--------
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 16 ++++++++--------
 recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb           |  8 ++++----
 recipes-bsp/pktlib/pktlib-rtos_git.bb               |  6 +++---
 recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb           |  8 ++++----
 recipes-bsp/rm-lld/rm-lld-rtos_git.bb               |  8 ++++----
 recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb       |  6 +++---
 recipes-ti/ipc/ipc-transport-srio-rtos_git.bb       |  2 +-
 8 files changed, 37 insertions(+), 35 deletions(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 981ec12..45024b1 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -48,9 +48,11 @@ export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
 export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages"
 export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
 
-XDCMAKE ?= "1"
-LIMSOCS ?= ""
-LIMBOARDS ?= ""
+TI_PDK_XDCMAKE ?= "1"
+TI_PDK_LIMIT_SOCS ?= ""
+TI_PDK_LIMIT_BOARDS ?= ""
+
+TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
 PARALLEL_XDC = "--jobs=${BB_NUMBER_THREADS}"
 
@@ -60,7 +62,7 @@ do_configure() {
     mkdir -p ${BUILD_DIR}
     cp -r ${S}/* ${BUILD_DIR}
 
-    if [ "${XDCMAKE}" == "1" ]
+    if [ "${TI_PDK_XDCMAKE}" == "1" ]
     then
         cd ${BUILD_DIR}
 
@@ -74,16 +76,16 @@ do_configure() {
 
 do_compile() {
 
-    if [ "${XDCMAKE}" == "1" ]
+    if [ "${TI_PDK_XDCMAKE}" == "1" ]
     then
         ${XDC_INSTALL_DIR}/xdc clean ${PARALLEL_XDC} -PR .
-        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${XDCARGS}" ROOTDIR="${ROOTDIR}" -PR .
-        ${XDC_INSTALL_DIR}/xdc release XDCARGS="${XDCARGS}" -PR .
+        ${XDC_INSTALL_DIR}/xdc all ${PARALLEL_XDC} XDCARGS="${TI_PDK_XDC_ARGS}" ROOTDIR="${ROOTDIR}" -PR .
+        ${XDC_INSTALL_DIR}/xdc release XDCARGS="${TI_PDK_XDC_ARGS}" -PR .
     else
         BUILD_DIR=${B}/`get_build_dir_bash`
         cd ${BUILD_DIR}
 
-        make release LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}"
+        make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
     fi
 }
 
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index ab848bd..6892daa 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -8,15 +8,15 @@ inherit ti-pdk
 DEPENDS_remove = "${PN}"
 
 # Build with make instead of XDC
-XDCMAKE = "0"
+TI_PDK_XDCMAKE = "0"
 
-LIMSOCS_ti33x = "am335x"
-LIMSOCS_ti43x = "am437x"
-LIMSOCS_omap-a15 = "am571x am572x"
-LIMSOCS_k2hk = "k2h k2k"
-LIMSOCS_k2l-evm = "k2l"
-LIMSOCS_k2e = "k2e"
-LIMSOCS_k2g = "k2g"
+TI_PDK_LIMIT_SOCS_ti33x = "am335x"
+TI_PDK_LIMIT_SOCS_ti43x = "am437x"
+TI_PDK_LIMIT_SOCS_omap-a15 = "am571x am572x"
+TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
+TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
+TI_PDK_LIMIT_SOCS_k2e = "k2e"
+TI_PDK_LIMIT_SOCS_k2g = "k2g"
 
 export PDK_CSL_ROOT_PATH ="${WORKDIR}/build"
 export DEST_ROOT="${S}"
diff --git a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
index ef1d959..f27f5e0 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-rtos_git.bb
@@ -7,7 +7,7 @@ DEPENDS_append = " rm-lld-rtos \
                    qmss-lld-rtos \
 "
 
-XDCARGS_k2hk = "k2h k2k"
-XDCARGS_k2e = "k2e"
-XDCARGS_k2l-evm = "k2l"
-XDCARGS_k2g = "k2g"
+TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
+TI_PDK_LIMIT_SOCS_k2e = "k2e"
+TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
+TI_PDK_LIMIT_SOCS_k2g = "k2g"
diff --git a/recipes-bsp/pktlib/pktlib-rtos_git.bb b/recipes-bsp/pktlib/pktlib-rtos_git.bb
index e76b445..2cca3ea 100644
--- a/recipes-bsp/pktlib/pktlib-rtos_git.bb
+++ b/recipes-bsp/pktlib/pktlib-rtos_git.bb
@@ -8,6 +8,6 @@ DEPENDS_append = " rm-lld-rtos \
                    cppi-lld-rtos \
 "
 
-XDCARGS_k2hk = "k2h k2k"
-XDCARGS_k2e = "k2e"
-XDCARGS_k2l-evm = "k2l"
+TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
+TI_PDK_LIMIT_SOCS_k2e = "k2e"
+TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
diff --git a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
index dcfacfd..adb091a 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-rtos_git.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 
 DEPENDS_append = " rm-lld-rtos"
 
-XDCARGS_k2hk = "k2h k2k"
-XDCARGS_k2l-evm = "k2l"
-XDCARGS_k2e = "k2e"
-XDCARGS_k2g = "k2g"
+TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
+TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
+TI_PDK_LIMIT_SOCS_k2e = "k2e"
+TI_PDK_LIMIT_SOCS_k2g = "k2g"
diff --git a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
index c9364a3..b5f2fd1 100644
--- a/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
+++ b/recipes-bsp/rm-lld/rm-lld-rtos_git.bb
@@ -6,7 +6,7 @@ PR = "${INC_PR}.0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-XDCARGS_k2hk = "k2h k2k"
-XDCARGS_k2e = "k2e"
-XDCARGS_k2l-evm = "k2l"
-XDCARGS_k2g = "k2g"
+TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
+TI_PDK_LIMIT_SOCS_k2e = "k2e"
+TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
+TI_PDK_LIMIT_SOCS_k2g = "k2g"
diff --git a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
index 2607a14..b34cdd4 100644
--- a/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-qmss-rtos_git.bb
@@ -17,9 +17,9 @@ IPC_TRANSPORT_QMSS_DESTSUFFIX = "git/c66/qmss"
 
 S = "${WORKDIR}/${IPC_TRANSPORT_QMSS_DESTSUFFIX}"
 
-XDCARGS_k2hk = "k2h k2k"
-XDCARGS_k2e = "k2e"
-XDCARGS_k2l-evm = "k2l"
+TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
+TI_PDK_LIMIT_SOCS_k2e = "k2e"
+TI_PDK_LIMIT_SOCS_k2l-evm = "k2l"
 
 export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
 XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
diff --git a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
index b95d646..19ee5c5 100644
--- a/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
+++ b/recipes-ti/ipc/ipc-transport-srio-rtos_git.bb
@@ -18,7 +18,7 @@ IPC_TRANSPORT_SRIO_DESTSUFFIX = "git/c66/srio"
 
 S = "${WORKDIR}/${IPC_TRANSPORT_SRIO_DESTSUFFIX}"
 
-XDCARGS_k2hk = "k2h k2k"
+TI_PDK_LIMIT_SOCS_k2hk = "k2h k2k"
 
 export IPC_INSTALL_PATH = "${IPC_INSTALL_DIR}"
 XDCPATH_append = ";${IPC_INSTALL_DIR}/packages"
-- 
2.7.4


