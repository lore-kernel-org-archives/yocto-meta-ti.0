Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C07C021A0
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:11:22 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2359.1739315478433586781
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:11:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=zFQGYs3s;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BNBG053783659
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Feb 2025 17:11:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739315476;
	bh=BLsZ+26nSYCiBfsHxDTpqReukXs164my83fCGYvRCTk=;
	h=From:To:CC:Subject:Date;
	b=zFQGYs3s4JzmwYFKfA8GlvrTj//eBm2hu2PKSu9eEecJY9trkx9PbIq6pWeFf5ZwX
	 pYPkkazOgzintaPaISW5hoRXiGddfy9peBVsR4Xl+3EJPRTtpKt/M6WHBbcer2LyXS
	 SCHBiPXJcD+pVhMlTJeasqlOX9Ly7uTJPQaFCMB4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BNBG24129580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Feb 2025 17:11:16 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 17:11:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 17:11:15 -0600
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BNBFC2045040;
	Tue, 11 Feb 2025 17:11:15 -0600
From: Judith Mendez <jm@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] HACK: conf: machine: am64x: Use new sdimage efti wks template
Date: Tue, 11 Feb 2025 17:11:15 -0600
Message-ID: <20250211231115.139972-1-jm@ti.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:11:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18300

Currently am64x boards are failing SD card boot since standard
boot is the current boot method for the boards. With standard
boot, the grub shell is invoked and the grub.cfg used to pass
kernel parameters to Linux. Normally we would like to use grub
class to modify the kernel parameters passed to Linux but
since this is not currently working with SERIAL_CONSOLES nor
GRUB_OPTS, lets make a template that includes our own custom
console= and let am64x conf use this.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc  | 2 ++
 meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in | 8 ++++++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf/machine/include/am64xx.inc
index 49e996c8..be65aa6e 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -34,3 +34,5 @@ TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am64x"
 
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "prueth-fw pruhsr-fw prusw-fw"
+
+WKS_FILE = "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2part-efi-csl.wks.in", "sdimage-2part.wks", d)}"
diff --git a/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
new file mode 100644
index 00000000..6dc69a17
--- /dev/null
+++ b/meta-ti-bsp/wic/sdimage-2part-efi-csl.wks.in
@@ -0,0 +1,8 @@
+# short-description: Create SD card image with 2 partitions and EFI support
+# long-description: Creates a partitioned SD card image for TI platforms that
+# supports EFI.  Boot files are located in the first vfat partition with extra
+# reserved space.  We cannot use a GPT here.
+
+bootloader --timeout=5 --append="rootfstype=ext4 console=ttyS2,115200n8"
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.48.0


