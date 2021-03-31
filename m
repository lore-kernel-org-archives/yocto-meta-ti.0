Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.522.1617235062348457249
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HQconG8M;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvefF124621;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=qLbpWhEXQJDYyBqwTMTkWZE+j2Ekp/6roYIH79sqqec=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=HQconG8MJI4fYSg54/HxSJqYCiblgPQ9s20W55Wp0WljYQyjv0ZIOL+6WbAJRd8Eb
	 yR7EwuE3JI+C0MTcC/P0jNsO2AcD9VPwcEIL5YHQjehMky5o+dG+nquWRRg67h8Hyh
	 5BdmlOEKS0cmJEWP37l9Z9Kd1jiOCV46ovCiU1lU=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNveQt087239
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvdNt093131;
	Wed, 31 Mar 2021 18:57:39 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH V2 1/8] conf/machine: k3: Add multi-certificate boot image support
Date: Wed, 31 Mar 2021 18:57:29 -0500
Message-ID: <20210331235736.30481-2-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331235736.30481-1-nm@ti.com>
References: <20210331235736.30481-1-nm@ti.com>
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
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---

Changes since V1:
- picked up reviewed-by
V1: https://lists.yoctoproject.org/g/meta-ti/message/13607

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

