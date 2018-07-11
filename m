Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8390E00CA9; Wed, 11 Jul 2018 08:45:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46606E0044F
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 08:45:36 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6BFjZVu028062
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531323935;
	bh=T2+sDRlCJByonVaRn8QajpLL36b8pS+B1mRMOHdn3aI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Mxv0+40PuuGhWYKQfIAqSROe3vD6uwvZJS0FjpAxjHFDG2rMAEYSFlsYaFBvsIb1/
	HPVcxsMVKLr6/V2eebhJ6DfWtKd27wjI3PiQdYlAgbiSYbGobEolHlLPZ/i/JTP/PY
	Di9etA+YBabkSusc1kzDikyofkvXhIz4pu2bYHvg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BFjZPM012438
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 11 Jul 2018 10:45:35 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 11 Jul 2018 10:45:35 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6BFjYCK031016
	for <meta-ti@yoctoproject.org>; Wed, 11 Jul 2018 10:45:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 11 Jul 2018 11:45:30 -0400
Message-ID: <1531323931-31875-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
References: <1531323931-31875-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 2/3] ti-sgx-ddk-um: add k3 (AM654x) support
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
X-List-Received-Date: Wed, 11 Jul 2018 15:45:36 -0000
Content-Type: text/plain

- add COMPATIBLE_MACHINE to distinguish AM3/4/5 with K3 (AM654x)
- add k3 support based on SGX DDK 1.17

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb         |  1 +
 ...gx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} | 10 +++++-----
 2 files changed, 6 insertions(+), 5 deletions(-)
 copy recipes-graphics/libgles/{ti-sgx-ddk-um_1.14.3699939.bb => ti-sgx-ddk-um_1.17.4948957.bb} (93%)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index d17411e..ef33d3a 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -3,6 +3,7 @@ HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
 
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BRANCH = "ti-img-sgx/rocko/${PV}"
diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
similarity index 93%
copy from recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
copy to recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index d17411e..e26cdab 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -1,14 +1,16 @@
 DESCRIPTION = "Userspace libraries for PowerVR SGX chipset on TI SoCs"
 HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-um-linux"
 LICENSE = "TI-TSPA"
-LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=550702a031857e0426ef7d6f6cf2d9f4"
+LIC_FILES_CHKSUM = "file://TI-Linux-Graphics-DDK-UM-Manifest.doc;md5=b17390502bc89535c86cfbbae961a2a8"
+
+COMPATIBLE_MACHINE = "k3"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 BRANCH = "ti-img-sgx/rocko/${PV}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
-SRCREV = "358fe42d34a7570896e5d1639869da564ddd0484"
+SRCREV = "a564d20ec1b6aed55b3e60aa9ff35f3809eca110"
 
 # There's only hardfp version available
 python __anonymous() {
@@ -22,9 +24,7 @@ python __anonymous() {
         raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
 }
 
-TARGET_PRODUCT_omap-a15 = "jacinto6evm"
-TARGET_PRODUCT_ti33x = "ti335x"
-TARGET_PRODUCT_ti43x = "ti437x"
+TARGET_PRODUCT_k3 = "ti654x"
 
 INITSCRIPT_NAME = "rc.pvr"
 INITSCRIPT_PARAMS = "defaults 8"
-- 
1.9.1


