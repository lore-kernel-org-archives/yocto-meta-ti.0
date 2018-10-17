Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFE7BE00ABE; Wed, 17 Oct 2018 13:20:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 611B5E00AB9
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 13:20:56 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9HKKt58107370;
	Wed, 17 Oct 2018 15:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539807655;
	bh=HFxpmyJgYb5kRiD/TOZnnsck3qHTVqeW6x/sPzVa7tc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CrCexvboftPjBgTP6LXUgoVoLN2VRRCUZV99ymr+MPwoalzWOBG5gTIpcx+Hc2F8w
	oEMRP2Oa36edJnmENYyML5B6HwuMycdq3ZGrwoo1iNlpLMg4QxoZVeWnzBfAjO9d2I
	jXqIvQbWbpd0ULU83YV+dGscpjbJaD27kR+umE/w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HKKtn7000488;
	Wed, 17 Oct 2018 15:20:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 17 Oct 2018 15:20:55 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 17 Oct 2018 15:20:55 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9HKKsvH002862;
	Wed, 17 Oct 2018 15:20:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 17 Oct 2018 20:15:58 +0000
Message-ID: <20181017201558.8551-3-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181017201558.8551-1-denys@ti.com>
References: <20181017201558.8551-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/3] beaglebone.conf: Package kernel and devicetree
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
X-List-Received-Date: Wed, 17 Oct 2018 20:20:57 -0000
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

Use variables from u-boot recipe, makes it easy to switch between TI staging
and mainline u-boot from oe-core if someone wants to.

Use SPL_BINARY and UBOOT_SUFFIX to define IMAGE_BOOT_FILES

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/beaglebone.conf | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index 9aeb2992..5e7348a4 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -1,6 +1,6 @@
 #@TYPE: Machine
 #@NAME: BeagleBone machine
-#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board 
+#@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
 
 require conf/machine/include/ti33x.inc
 
@@ -16,11 +16,17 @@ SERIAL_CONSOLES = "115200;ttyS0"
 # fall back on generic am335x_evm_config for now
 #UBOOT_MACHINE = "am335x_boneblack_config"
 
+SPL_BINARY = "MLO"
+UBOOT_SUFFIX = "img"
+
 WKS_FILE = "sdimage-bootpart.wks"
-IMAGE_BOOT_FILES = "MLO u-boot.img"
-IMAGE_FSTYPES += "tar.xz wic.xz"
 
 do_image_wic[depends] += "mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
+IMAGE_BOOT_FILES ?= "u-boot.${UBOOT_SUFFIX} ${SPL_BINARY}"
+
+IMAGE_FSTYPES += "tar.xz wic.xz"
+
+IMAGE_INSTALL_append = " kernel-devicetree kernel-image-zimage"
 
 # Refine the list of device targets for ti-pdk class recipes
 TI_PDK_LIMIT_BOARDS = "bbbAM335x"
-- 
2.17.1


