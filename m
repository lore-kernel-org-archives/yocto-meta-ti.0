Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5806C0219C
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:40:55 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.42571.1738852853668312157
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 06:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=kkAqQS6/;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516Eeq3w2746011
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 08:40:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738852852;
	bh=bMpsFK3OjF/kUFeCzkmsLA9lvDYmfZrorZ8hw/dPOLw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kkAqQS6/hTTzEW8XRRuO8VEslv/bo+QhY5DjdO28DTzLhy5QE4e3O8x00ODM0jsoU
	 uU+SrziWHExvebrFuBt159JOBrOPXdHXRJxgBEwRgTO3j6Iun2dfpW5cvfrj1cmnaH
	 zpQYVm65nblTNUPz8lpvfPZyNrm569mw4cerxeR8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516Eeqoj013710
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 08:40:52 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 08:40:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 08:40:51 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516EepOW070836;
	Thu, 6 Feb 2025 08:40:51 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master][PATCH v3 5/5] conf: machine: am62lxx-evm: Add logic to generate UBI filesystem images
Date: Thu, 6 Feb 2025 20:10:21 +0530
Message-ID: <20250206144021.3007831-6-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206144021.3007831-1-c-shilwant@ti.com>
References: <20250206144021.3007831-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 516Eeq3w2746011
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Feb 2025 14:40:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18285

Add logic to generate UBI filesystem images which can be used to directly
flash into the NAND=E2=80=99s file-system partition.

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf=
/machine/am62lxx-evm.conf
index ff373238..fc348c9b 100644
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


