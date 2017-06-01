Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96DC8E00B77; Thu,  1 Jun 2017 08:33:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DE25E00BA3
	for <meta-ti@yoctoproject.org>; Thu,  1 Jun 2017 08:33:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v51FXYvN010981
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496331214;
	bh=GYw0LfW7tNepa2mLVXtkYxuRJknhPTYZ8dmQdgZEUZk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fexG+QrpAl8ZhER2zPIaGBV3IjQQ+oal8OsfQ6SPFdaUsZPa/sOrRhnPaij7Cc2Op
	mleF8XClYh5wqN+t0nYtgn/RZ1hWvO0Q0L12PyEBuRkVGDKoN0scEfprh1wdxmGkW+
	4NKvIBcl7I2dtgk+jL9wvpl7b8W6Z93rDYy5tqeA=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v51FXT1S021708
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:33:28 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v51FXRvL026013;	Thu, 1 Jun 2017 10:33:28 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Jun 2017 11:27:53 -0400
Message-ID: <1496330876-6173-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
References: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v3 3/6] ti-pdk: limit the set of cores to build
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
X-List-Received-Date: Thu, 01 Jun 2017 15:33:48 -0000
Content-Type: text/plain

* Use LIMIT_CORES to enable only the cores with available toolchains.
* Add new variables which will allow recipes to fully configure the
  options provided to make.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 classes/ti-pdk.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/classes/ti-pdk.bbclass b/classes/ti-pdk.bbclass
index 45024b1..91f2844 100644
--- a/classes/ti-pdk.bbclass
+++ b/classes/ti-pdk.bbclass
@@ -49,8 +49,13 @@ export XDCPATH = "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${
 export SECTTI="perl ${CG_XML_INSTALL_DIR}/ofd/sectti.pl"
 
 TI_PDK_XDCMAKE ?= "1"
+
+# By default, only build the cores with available toolchains
+TI_PDK_LIMIT_CORES ?= "a15_0 ipu1_0 ipu1_1 ipu2_0 ipu2_1 c66x c66xdsp_1 c66xdsp_2 arm9_0 c674x"
 TI_PDK_LIMIT_SOCS ?= ""
 TI_PDK_LIMIT_BOARDS ?= ""
+TI_PDK_MAKE_TARGET ?= "release"
+TI_PDK_EXTRA_MAKE ?= ""
 
 TI_PDK_XDC_ARGS ?= "${TI_PDK_LIMIT_SOCS}"
 
@@ -85,7 +90,11 @@ do_compile() {
         BUILD_DIR=${B}/`get_build_dir_bash`
         cd ${BUILD_DIR}
 
-        make release LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}"
+        make ${TI_PDK_MAKE_TARGET} \
+             LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" \
+             LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" \
+             LIMIT_CORES="${TI_PDK_LIMIT_CORES}" \
+             ${TI_PDK_EXTRA_MAKE}
     fi
 }
 
-- 
2.7.4


