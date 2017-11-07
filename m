Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6D64E00AAF; Tue,  7 Nov 2017 09:02:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B7B1E00928
	for <meta-ti@yoctoproject.org>; Tue,  7 Nov 2017 09:02:55 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vA7H2tUb032290
	for <meta-ti@yoctoproject.org>; Tue, 7 Nov 2017 11:02:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1510074175;
	bh=ZyV4nNu/6fs61E7ercCS5KQFcL+r4F5J75Dq8a7FRBc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YWN05YJNGBOqg8/jvwU9EuerXkUNX+HSwX0K0iwx80r+odw3R8AeUqW0QwynqCulC
	S+0KU3C3mOqX0cWJOMgas3uiO9hEYC1LMuUTMpFNAtk9L6Rn7rdb+FeXrH7yZwtHP4
	Z1aMeETU5Gl7FQFIbiZa7/BxMOew5493EmZTQcXg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA7H2tiW031519
	for <meta-ti@yoctoproject.org>; Tue, 7 Nov 2017 11:02:55 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 7 Nov 2017 11:02:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 7 Nov 2017 11:02:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vA7H2saf022213;
	Tue, 7 Nov 2017 11:02:54 -0600
Date: Tue, 7 Nov 2017 12:02:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20171107170239.GY12918@edge>
References: <1509650370-29526-1-git-send-email-j-stiffler@ti.com>
	<1509650370-29526-2-git-send-email-j-stiffler@ti.com>
	<20171106194205.GU12918@edge>
	<b7390ee8-ea68-2220-2484-a7a837de86bd@ti.com>
MIME-Version: 1.0
In-Reply-To: <b7390ee8-ea68-2220-2484-a7a837de86bd@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/2] icss-emac-lld: update to version 1.0.0.8
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
X-List-Received-Date: Tue, 07 Nov 2017 17:02:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 06, 2017 at 03:57:19PM -0500, Jacob Stiffler wrote:
> 
> 
> On 11/6/2017 2:42 PM, Denys Dmytriyenko wrote:
> >On Thu, Nov 02, 2017 at 03:19:30PM -0400, Jacob Stiffler wrote:
> >>* Extend compatibility to k2g-evm
> >>* Simplify compile and install tasks as "TARGET" is no longer needed.
> >>
> >>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>---
> >>  .../icss-emac-lld/icss-emac-lld-test_git.bb        | 47 +++++++---------------
> >>  recipes-bsp/icss-emac-lld/icss-emac-lld.inc        |  6 +--
> >>  recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb     |  3 +-
> >>  3 files changed, 19 insertions(+), 37 deletions(-)
> >>
> >>diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> >>index f62bf33..5093d7c 100644
> >>--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> >>+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bb
> >>@@ -1,6 +1,6 @@
> >>  DESCRIPTION = "TI ICSS-EMAC low level driver tests"
> >>-DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal"
> >>+DEPENDS="common-csl-ip pruss-lld icss-emac-lld osal ti-pdk-build-rtos icss-emac-lld-rtos"
> >Why is rtos specific packages being pulled into linux build?
> 
> This requires the RTOS format for the firmware image, so it is using
> the RTOS package to get that firmware image.

How much of RTOS dependencies are getting into Linux build? I see starterware, 
what else? Is it getting too heavy just for a firmware image?


> >>  DEPENDS_append_ti33x = " starterware"
> >>  DEPENDS_append_ti43x = " starterware"
> >>@@ -9,39 +9,22 @@ include icss-emac-lld.inc
> >>  PR = "${INC_PR}.0"
> >>-COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
> >>+EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} PDK_PKG_PATH=${STAGING_DATADIR}/ti/ti-pdk-tree/packages ICSS_EMAC_SRC_DIR=${S}"
> >>-EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} ICSS_EMAC_SRC_DIR=${S}"
> >>+DEVICE_LIST ?= "${TI_PDK_LIMIT_SOCS}"
> >>-do_compile_am57xx-evm () {
> >>-#   Build the tests
> >>-    oe_runmake tests DEVICE="am571x" TARGET="SOC_AM571x"
> >>-    oe_runmake clean
> >>-    oe_runmake tests DEVICE="am572x" TARGET="SOC_AM572x"
> >>+do_compile () {
> >>+    # Build the tests
> >>+    for device in ${DEVICE_LIST}
> >>+    do
> >>+        oe_runmake tests DEVICE="$device"
> >>+    done
> >>  }
> >>-do_compile_ti33x () {
> >>-#   Build the tests
> >>-    oe_runmake tests DEVICE="am335x" TARGET="SOC_AM335x"
> >>-}
> >>-
> >>-do_compile_ti43x () {
> >>-#   Build the tests
> >>-    oe_runmake tests DEVICE="am437x" TARGET="SOC_AM437x"
> >>-}
> >>-
> >>-do_install_am57xx-evm () {
> >>-#   Install the binary
> >>-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am571x" TARGET="SOC_AM571x"
> >>-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am572x" TARGET="SOC_AM572x"
> >>-}
> >>-
> >>-do_install_ti33x () {
> >>-#   Install the binary
> >>-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am335x" TARGET="SOC_AM335x"
> >>-}
> >>-
> >>-do_install_ti43x () {
> >>-#   Install the binary
> >>-    oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="am437x" TARGET="SOC_AM437x"
> >>+do_install() {
> >>+    # Install the binary
> >>+    for device in ${DEVICE_LIST}
> >>+    do
> >>+        oe_runmake installbin INSTALL_BIN_BASE_DIR=${D}${bindir} DEVICE="$device"
> >>+    done
> >>  }
> >>diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> >>index 8e2ffd4..621219b 100644
> >>--- a/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> >>+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld.inc
> >>@@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
> >>  ICSS_EMAC_LLD_GIT_BRANCH = "master"
> >>  ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
> >>-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.07C"
> >>-ICSS_EMAC_LLD_SRCREV = "08cb0540eeab7721fe82b603cb6285393f314117"
> >>+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.08"
> >>+ICSS_EMAC_LLD_SRCREV = "e689df18417236110590f7b290525a610d63f574"
> >>  BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
> >>  SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
> >>  SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
> >>-PV = "01.00.00.07C"
> >>+PV = "01.00.00.08"
> >>  INC_PR = "r0"
> >>  S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
> >>diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> >>index 272529b..81a6f5e 100644
> >>--- a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> >>+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bb
> >>@@ -6,11 +6,10 @@ include icss-emac-lld.inc
> >>  PR = "${INC_PR}.0"
> >>-COMPATIBLE_MACHINE = "am57xx-evm|ti33x|ti43x"
> >>-
> >>  TARGET_NAME_am57xx-evm = "SOC_AM572x"
> >>  TARGET_NAME_ti33x = "SOC_AM335x"
> >>  TARGET_NAME_ti43x = "SOC_AM437x"
> >>+TARGET_NAME_k2g-evm = "SOC_K2G"
> >>  EXTRA_OEMAKE += "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} TARGET=${TARGET_NAME}"
> >>-- 
> >>2.7.4
> >>
> >>-- 
> >>_______________________________________________
> >>meta-ti mailing list
> >>meta-ti@yoctoproject.org
> >>https://lists.yoctoproject.org/listinfo/meta-ti
> 

