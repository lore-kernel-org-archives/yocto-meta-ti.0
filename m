Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF5EDC02194
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:49:47 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.116671.1738676979754013389
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 05:49:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=eii0J4pT;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514DncFC3226061
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 07:49:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738676978;
	bh=2V6MaYAGVfbwzM7B/QVVnrzQf/4pusVHFmWoF+iApi0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=eii0J4pTn5d0qizxVpUjrdhiP0Pt8jGpHJXOXcs9TWbAEGrOzhNBi3SvQkIJrKwUZ
	 7WLyugEeEydgigo6dSYv+agH/bsSewTKg+9XpfHqKwTGsvPcBoD/X9xwaeA66VucCM
	 vm4Go/G68rhnXWjnrZri3L4mQjhCvihuq3ZVHqvA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514Dnchd027179
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 07:49:38 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 07:49:37 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 07:49:37 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514Dna8n043523;
	Tue, 4 Feb 2025 07:49:37 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 3/3] conf: machine: am62lxx-evm: Add logic to generate UBI filesystem images
Date: Tue, 4 Feb 2025 19:19:25 +0530
Message-ID: <20250204134925.968150-4-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204134925.968150-1-c-shilwant@ti.com>
References: <20250204134925.968150-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 514DncFC3226061
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 13:49:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18258

Add logic to generate UBI filesystem images which can be used to directly
flash into the NAND=E2=80=99s file-system partition.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf=
/machine/am62lxx-evm.conf
index 93ad0089..d7ea059f 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -4,6 +4,12 @@
=20
 require conf/machine/include/am62lxx.inc
=20
+IMAGE_FSTYPES +=3D "ubifs ubi"
+
+MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 8000"
+
+UBINIZE_ARGS ?=3D "-m 4096 -p 256KiB -s 1024 -O 1024"
+
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62l \
 "
--=20
2.34.1


