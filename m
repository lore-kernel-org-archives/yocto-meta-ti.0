Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2C7DE0137C
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 01:24:51 -0800 (PST)
Received: by mail-ww0-f51.google.com with SMTP id dy1so3405404wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 24 Jan 2012 01:24:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.95.105 with SMTP id dj9mr19043001wib.18.1327397091040;
	Tue, 24 Jan 2012 01:24:51 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id em13sm17583637wid.7.2012.01.24.01.24.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 Jan 2012 01:24:50 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 24 Jan 2012 10:24:33 +0100
Message-Id: <1327397074-15731-6-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1327397074-15731-1-git-send-email-koen@dominion.thruhere.net>
References: <1327397074-15731-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkb5l0hDV4nGDfXwQzErgtJUOMdbOSWADBdP7Zcd5vJpy8JlfNvRj/6R5AY6VTkZ9ug6BUM
Subject: [PATCH 6/7] omap3-sgx-modules: add 4.05.00.03
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Jan 2012 09:24:52 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ....16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)
 copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_1.6.16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} (79%)

diff --git a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
similarity index 79%
copy from recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
copy to recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
index f37299d..f034fc8 100644
--- a/recipes-bsp/powervr-drivers/omap3-sgx-modules_1.6.16.3977.bb
+++ b/recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=21228a42e27d1d104b31a83f7c9da935"
 TI_BIN_UNPK_CMDS="Y: qY:workdir:Y"
 require ../../recipes-ti/includes/ti-eula-unpack.inc
 
-SGXPV = "4_03_00_02"
-IMGPV = "1.6.16.3977"
+SGXPV = "4_05_00_03"
 BINFILE := "Graphics_SDK_setuplinux_${SGXPV}.bin"
 
 inherit module
@@ -15,12 +14,9 @@ MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/${SGXPV}/exports/Graphics_SDK_setuplinux_${SGXPV}.bin \
-           file://Compile-fixes-for-38-kernel.patch \
-           file://kernel-30.patch \
           "
-SRC_URI[md5sum] = "ff8c1f2b8e4cb42f4ced6a613b081ada"
-SRC_URI[sha256sum] = "cdb0bd3964e107733d632aa8224e0537b05c1ffac34befc036423458c8d75255"
-
+SRC_URI[md5sum] = "0e651eaa92bb91760f0b40a17697a7dc"
+SRC_URI[sha256sum] = "bfe764a8959556195545d6fff76f63a489642f345c105bbbc309a3f243c2dd0e"
 S = "${WORKDIR}/Graphics_SDK_${SGXPV}/GFX_Linux_KM"
 
 PVRBUILD = "release"
@@ -29,10 +25,14 @@ export KERNELDIR = "${STAGING_KERNEL_DIR}"
 PACKAGE_STRIP = "no"
 
 TI_PLATFORM_omap3 = "omap3630"
+TI_PLATFORM_ti814x = "ti81xx
 TI_PLATFORM_ti816x = "ti81xx"
+TI_PLATFORM_ti33x = "ti335x"
 
 MODULESLOCATION_omap3 = "dc_omap3430_linux"
+MODULESLOCATION_ti814x = "dc_ti81xx_linux"
 MODULESLOCATION_ti816x = "dc_ti81xx_linux"
+MODULESLOCATION_ti33x = "dc_ti335x_linux"
 
 MAKE_TARGETS = " BUILD=${PVRBUILD} TI_PLATFORM=${TI_PLATFORM}"
 
-- 
1.7.2.5


