Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.306.1617209500665925579
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZGUXiwJZ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYbf091135;
	Wed, 31 Mar 2021 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209494;
	bh=tANuJFAeGE2tstEjs1YHvlUTFDonuwccd2Sr//mVees=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZGUXiwJZu+bAZb62y242EylOe+gI1Lb3VtfkknL+w55vlf5mvGHKrTxuzEm24g5NZ
	 wxf7p9AZV7hCIXGx9Z6i6cfuPpP3cmYxrKiBELmdoA5/cnN+8d4ljRgynW+xpjCzGl
	 oXuIpHOUw8znMRXkfyNhUY3eKvngN3gRnAMIW0CA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpYtS091676
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:34 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYKj097810;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 1/7] conf/machine: k3: Add multi-certificate boot image support
Date: Wed, 31 Mar 2021 11:51:27 -0500
Message-ID: <20210331165133.3746-2-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331165133.3746-1-nm@ti.com>
References: <20210331165133.3746-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Lets keep things consistent by providing two possibilities for platforms
to pick from - legacy boot and multi-certificate boot.

In legacy boot, the base bootloader and system firmware are
maintained as separate binaries (tiboot3.bin and sysfw.itb).

In multi-certificate boot that newer K3 devices support, ROM is smarter
and can handle multiple x509 certificate based images: so we can strip
out the sysfw.itb and integrate it as part of tiboot3.bin itself. This
improves authentication and overall system boot times since we are now
able to boot both the system controller and the boot processor in
parallel.

We do have a scheme currently to identify the images necessary for boot
etc, but things are handled on a platform conf file basis. We can
improve that by introducing the pattern at the top level include and use
the relevant pattern in platforms as needed.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 conf/machine/include/k3.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index c727d724ac28..56ad40c3f963 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -40,7 +40,11 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
-IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
+IMAGE_BOOT_FILES_LEGACY = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin sysfw.itb"
+IMAGE_BOOT_FILES_MULTI_CERT = "${SPL_BINARY} u-boot.${UBOOT_SUFFIX} tiboot3.bin"
+
+IMAGE_BOOT_FILES ?= "${IMAGE_BOOT_FILES_LEGACY}"
+
 WKS_FILE ?= "sdimage-2part.wks"
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 do_image_wic[mcdepends] += "mc::k3r5:virtual/bootloader:do_deploy mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.31.0

