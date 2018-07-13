Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 519CAE0124B; Fri, 13 Jul 2018 12:10:34 -0700 (PDT)
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
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B962E01242
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 12:10:31 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DJAUev015050
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:10:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531509030;
	bh=cMEi3mr5MfplkiEx9/wxuVhMbcUUNSCWftcAP7CZdZM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tCYFi+plxdTxQbCgA4hWl6MpROjAsDGBLLZ/1jKIU3taUtn3jc+SuEhmohzkBpEzs
	BizPqUoyzVbMz3QWV9tPmSFMUaYFKrGKEB6uil9tpdppIPDi9IfRWEvu66NGcvptZn
	YcyfC6K6Ourqqj4PLMxWlpmhqlUGNaQxAfAapS3g=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJAU8H028952
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:10:30 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 14:10:30 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 14:10:30 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DJAJ9s005345
	for <meta-ti@yoctoproject.org>; Fri, 13 Jul 2018 14:10:28 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Jul 2018 15:10:16 -0400
Message-ID: <1531509016-6395-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1531509016-6395-1-git-send-email-e-ruei1@ti.com>
References: <1531509016-6395-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 3/3] ti-sgx-ddk-km: add k3 (AM654x) support
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
X-List-Received-Date: Fri, 13 Jul 2018 19:10:35 -0000
Content-Type: text/plain

- add K3 (AM654x) support based on SGX DDK 1.17

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...gx-ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 copy recipes-bsp/powervr-drivers/{ti-sgx-ddk-km_1.14.3699939.bb => ti-sgx-ddk-km_1.17.4948957.bb} (75%)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
similarity index 75%
copy from recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
copy to recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
index a4eb82a..3ce9105 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9
 
 inherit module
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+COMPATIBLE_MACHINE = "k3"
 
 MACHINE_KERNEL_PR_append = "o"
 PR = "${MACHINE_KERNEL_PR}"
@@ -26,11 +26,9 @@ SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch
 
 S = "${WORKDIR}/git"
 
-SRCREV = "d2b3959738cfcc6209e8e882d1989de790866c8f"
+SRCREV = "b630d462f5fbb86e5f98965ba1af35da1207822f"
 
-TARGET_PRODUCT_omap-a15 = "jacinto6evm"
-TARGET_PRODUCT_ti33x = "ti335x"
-TARGET_PRODUCT_ti43x = "ti437x"
+TARGET_PRODUCT_k3 = "ti654x"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
 
@@ -39,5 +37,5 @@ do_compile_prepend() {
 }
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary_omap_linux_xorg_release/target_aarch64/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
 }
-- 
1.9.1


