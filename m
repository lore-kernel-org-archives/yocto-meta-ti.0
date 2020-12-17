Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.7993.1608211950928486117
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=IGsYGoEN;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 19D2A38C117C
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWTWU042442
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211949;
	bh=xjZIQZdYGWh/4E5Uj7Ap1AxR+3VYOJHMoa75R/JQ+Xk=;
	h=From:To:CC:Subject:Date;
	b=IGsYGoENx0sc9i3XV9dl38rdtdDDk6gXqNhHKueplAA4GoQaQQbUsYbBA+SvQrL2P
	 NTczpAOkTcUWQl07QHK+sb6AovHB6iOrMO20lDJ2r65i8ZdXe/Yds7r3crjbR3T4O9
	 EkAbsW3nKT/pqV32QtOilD6M4jjLfF2qGKpFo6J8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWTLQ124600
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:29 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:29 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWS6R080177;
	Thu, 17 Dec 2020 07:32:29 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 00/10] AM64 Cleanup and other updates
Date: Thu, 17 Dec 2020 07:32:18 -0600
Message-ID: <20201217133228.22886-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello

This series of patches updates various SRCREVs for upcoming release candi=
date
as well as cleans up AM64x hacks and variables that needed to be updated
for AM64

Dan

Dan Murphy (9):
  linux-ti-staging: Update kernel to latest commit sha
  u-boot-ti: Remove unneeded variable for am64xx
  machine: am64xx-evm.conf: Remove commented code and update PDK values
  ti-rtos: Update metadata and versions for RTOS firmware
  ti-uboot-staging: Update to the latest commit
  am64xx-evm-k3r5: Update SYSFW_SOC to am64x from am65x
  k3conf: Update SRCREV to latest
  ti-sci-fw: Update image gen and sysfw commit SHA
  prueth-fw-am65x-sr2: Updating firmware to 02.02.08.02

Praneeth Bajjuri (1):
  trusted-firmware-a: Update SRCREV for AM64X support

 conf/machine/am64xx-evm-k3r5.conf             |  3 +--
 conf/machine/include/am64xx.inc               |  9 ++++----
 .../prueth-fw/prueth-fw-am65x-sr2_git.bb      |  4 ++--
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc           |  5 +++--
 .../trusted-firmware-a_%.bbappend             |  2 +-
 .../u-boot/u-boot-ti-staging_2020.01.bb       |  4 ++--
 recipes-bsp/u-boot/u-boot-ti.inc              |  1 -
 recipes-devtools/k3conf/k3conf_git.bb         |  2 +-
 .../linux/linux-ti-staging-rt_5.4.bb          |  4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb  |  4 ++--
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb    | 21 +++++++++++--------
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb    |  2 +-
 12 files changed, 31 insertions(+), 30 deletions(-)

--=20
2.29.2

