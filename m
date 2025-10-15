Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2641CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 12:00:52 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.14463.1760529650919930287
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Oct 2025 05:00:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=IYYmm/mv;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59FC0mI01395308;
	Wed, 15 Oct 2025 07:00:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760529648;
	bh=cvviIMhpaPF0s2kmxUTrRVTXycPefVeUIWDHIXXYkqU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IYYmm/mvLczLDNwKur0l0YgSTV+b9yMwDHLPT3OV1ylnMdvQXhiRBf2wonvVubgb/
	 WrpIPnNFA+GGuJKkkxxHm2ooY3UYqkG4uqnRY0VhgFuVAq68M5GeHRCoJg+GZaC7yp
	 5J/OAoD76GrmCd74ylb1xSwIImGIL88bk26Iy9jo=
Received: from DLEE208.ent.ti.com (dlee208.ent.ti.com [157.170.170.97])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59FC0mpt794734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 15 Oct 2025 07:00:48 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Oct
 2025 07:00:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Oct 2025 07:00:48 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59FC0W7M1859032;
	Wed, 15 Oct 2025 07:00:45 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <reatmon@ti.com>, <a-limaye@ti.com>,
        <n-francis@ti.com>, <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
        <b-padhi@ti.com>, <bb@ti.com>, <denys@konsulko.com>, <rs@ti.com>
Subject: [master][PATCH v5 3/4] meta-ti-bsp: wic: Add initramfs path to to grub config
Date: Wed, 15 Oct 2025 17:30:31 +0530
Message-ID: <20251015120032.288741-4-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251015120032.288741-1-m-shah@ti.com>
References: <20251015120032.288741-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Oct 2025 12:00:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19129

Add initrd path to grub.cfg config so that it picks up
the initramfs image from the boot partition and includes
it in the boot process.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/wic/sdimage-2part-efi.wks.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
index ae38daa7..2582692f 100644
--- a/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
+++ b/meta-ti-bsp/wic/sdimage-2part-efi.wks.in
@@ -4,5 +4,5 @@
 # reserved space.  We cannot use a GPT here.
 
 bootloader --timeout=3 --append="rootfstype=ext4 ${TI_WKS_BOOTLOADER_APPEND}"
-part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
+part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER}${TI_WKS_INITRAMFS}" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
 part / --source rootfs --fstype=ext4 --label root --align 1024 --use-uuid
-- 
2.34.1


