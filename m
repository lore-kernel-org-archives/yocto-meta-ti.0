Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19995C02198
	for <webhook@archiver.kernel.org>; Tue,  4 Feb 2025 13:49:38 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.116222.1738676972426647547
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 05:49:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=BJm4lkoT;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 514DnUf52341415
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2025 07:49:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738676970;
	bh=Np4u+DSvxn/WrvRYV6lWfejEw9YttWV2u5CxyzUY4CQ=;
	h=From:To:CC:Subject:Date;
	b=BJm4lkoTrmLw6GkfE+u3vDh2RibG+aGgdsgx5z0VTnVe7KOVyLvsG1YztKBfk3ETY
	 YOOyet89hUYy/c57xxQLstfMhSNAboa6lIoXgvryqbcsOHNuxyGnfi/T5MLM2spZEf
	 /4VxolApFBX/PdWH4cXlvGibA3MvGZo1y8mJp5CA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 514DnUSt027133
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2025 07:49:30 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 4
 Feb 2025 07:49:29 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 4 Feb 2025 07:49:29 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 514DnTgE052775;
	Tue, 4 Feb 2025 07:49:29 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH 0/3] Add support for AM62L
Date: Tue, 4 Feb 2025 19:19:22 +0530
Message-ID: <20250204134925.968150-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Feb 2025 13:49:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18255

This series aims to enable platform support for AM62L in meta-ti-bsp

Link to AM62L TRM: https://www.ti.com/lit/pdf/sprujb4

Chirag Shilwant (3):
  trusted-firmware-a: Switch TFA to TI fork
  meta-ti-bsp: Add Support for AM62L
  conf: machine: am62lxx-evm: Add logic to generate UBI filesystem
    images

 meta-ti-bsp/conf/machine/am62lxx-evm.conf     | 22 ++++++
 meta-ti-bsp/conf/machine/include/am62lxx.inc  | 14 ++++
 meta-ti-bsp/recipes-bsp/ti-dm-fw/ti-dm-fw.bb  |  2 +
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  6 ++
 .../trusted-firmware-a-ti.inc                 | 12 ++-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  | 21 ++++++
 .../Add-initial-support-for-AM62Lx-SoC.patch  | 75 +++++++++++++++++++
 .../optee/optee-os-ti-overrides.inc           |  1 +
 .../optee/optee-os_%.bbappend                 |  6 ++
 9 files changed, 155 insertions(+), 4 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/am62lxx-evm.conf
 create mode 100644 meta-ti-bsp/conf/machine/include/am62lxx.inc
 create mode 100644 meta-ti-bsp/recipes-security/optee/files/Add-initial-support-for-AM62Lx-SoC.patch

-- 
2.34.1


