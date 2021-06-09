Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1708.1623199856411332405
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Jun 2021 17:50:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IeUIKEk2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1590otsT097326;
	Tue, 8 Jun 2021 19:50:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623199855;
	bh=BcK115H+rFtum5MY+2XGSiiqzyvUlyByN2UlAQrtUA4=;
	h=From:To:CC:Subject:Date;
	b=IeUIKEk2L0rQbBJ1X8helMXgS5OPqEBmaMiHhMMhQNfzktinivythQ9Faw71q2P/Z
	 7r0uqyot33PH/+Zw4MvSBtIv4kedsw3rU7SRk00dhwyOn0bdL4RP7/Jf0tUQ6GRQDX
	 GdS1Lzfwb7v3WsL7UgRHbxECEeO3ERYf3eIY31FQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1590otVg083202
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Jun 2021 19:50:55 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 19:50:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 8 Jun 2021 19:50:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1590otJ0010411;
	Tue, 8 Jun 2021 19:50:55 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        <lukas@wunner.de>
Subject: [dunfell/master PATCHv2 0/5] Update to latest kernel and uboot
Date: Tue, 8 Jun 2021 19:50:50 -0500
Message-ID: <20210609005055.7975-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

This series updates meta-ti to latest u-boot and kernel branches.

u-boot: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2021.01&id=c66dd9b8467472278803c2426098a2828c93ebcc

kernel: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=30e2abf77fce04c08e2813af45d6af7aee4c42bf

rt-kernel: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-rt-linux-5.10.y&id=548b9ee2b58177d1746a941da67b649e411457af


Along with this kernel update, Support for the following dtb/o is added.

* J721e PM1 SOM
* AM65 display
* AM64 icssg1-dualemac

linux-ti-staging: Update 5.10 kernel to the latest commit SHA is based
on dunfell-next and it current dunfell-next has
2de2c5ec linux-ti-staging: Update 5.10 kernel to the latest commit SHA
6983b50e linux-ti-staging: Update 5.10 kernel to 5.10.35 

So if anyone wants to apply to dunfell or master ensure you pick the
associated patches from dunfell-next too.

Patches will apply cleanly when dunfell-next is synced to dunfell and to
master branches.

--

Changes since V1:
* Added cover-letter.
* consolidated all patches in a order.
* Updated 5.10 kernel sha
* Added J721E PM1 SOM

Praneeth Bajjuri (5):
  ti-uboot-staging: Update to the latest ti-u-boot-2021.01
  linux-ti-staging: Update 5.10 kernel to the latest commit SHA
  conf: am65xx-evm: ReIntroduce display overlays for 5.10
  conf/machine: am64xx: Add overlay to support icssg1-dualemac
  conf: j7-evm: ReIntroduce pm1 SOM with tps65917 PMIC

 conf/machine/include/am64xx.inc                  | 1 +
 conf/machine/include/am65xx.inc                  | 2 ++
 conf/machine/j7-evm.conf                         | 1 +
 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 6 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.17.1

