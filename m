Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58501C02194
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 11:12:37 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.9684.1738753954087872961
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 03:12:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=C3EBpH0g;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCW4h2587045
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 05:12:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738753952;
	bh=bMpsFK3OjF/kUFeCzkmsLA9lvDYmfZrorZ8hw/dPOLw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=C3EBpH0g0m2lVFssSjYL8SVOaNDXvgD8ExafJ433JHqJS4dL0lEeAUyUOnrumc1de
	 sjk2l5PN3HaZa1nQyVI3NOjxstqVhzO77MY6/Pi0bbF6ufOytOZRkPc1Fv0DbmXEN6
	 9clfyNri/bRCWWmgm1OWWbzfiz0psFVxk3MkWUpc=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 515BCWJE082170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 05:12:32 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 05:12:32 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 05:12:32 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 515BCVVc008018;
	Wed, 5 Feb 2025 05:12:32 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH v2 5/5] conf: machine: am62lxx-evm: Add logic to generate UBI filesystem images
Date: Wed, 5 Feb 2025 16:42:11 +0530
Message-ID: <20250205111211.1847450-6-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250205111211.1847450-1-c-shilwant@ti.com>
References: <20250205111211.1847450-1-c-shilwant@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot02.ext.ti.com id 515BCW4h2587045
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 11:12:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18277

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


