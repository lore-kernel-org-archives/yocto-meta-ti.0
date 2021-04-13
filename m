Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.4683.1618289148876269055
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Apr 2021 21:45:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=te8AkZFP;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jlv8126302;
	Mon, 12 Apr 2021 23:45:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618289147;
	bh=moGEEYW1X1r98MAkD3YHuvAV1w5AGX5QFRJymemtRRo=;
	h=From:To:CC:Subject:Date;
	b=te8AkZFPgJPeTBxNTUScFAFxEQIM+yqRNyDC/tsAKBmJx//NjpaSpH5Ust/ZwxD6a
	 u5yQu1mzUOTtqTc/J8L83J9PXyGCJqX5h6YA4WiycDtWPTZeTZUlAymDVMFbeUu/Im
	 41id3ig5RMgVOgh89M5QZ82oKKXhaZWUI05G46eA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13D4jlMs092701
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Apr 2021 23:45:47 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 12
 Apr 2021 23:45:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 12 Apr 2021 23:45:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13D4jkZ5069221;
	Mon, 12 Apr 2021 23:45:46 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 0/4] Initial migration to 2021LTS
Date: Mon, 12 Apr 2021 23:45:42 -0500
Message-ID: <20210413044546.12409-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Initial Migration to 2021LTS.
This series adds initial baseline update to 2021LTS i.e. 5.10 kernel
and 2021.01 u-boot.

Praneeth Bajjuri (4):
  Revert "linux-ti-staging, u-boot-ti-staging: lower default preference"
  ti-uboot-staging: Update to the latest ti-u-boot-2021.01
  Revert "linux-ti-staging-5.10: With the kernel being AUTOREV'd remove
    the minor version"
  linux-ti-staging: Update 5.10 kernel to 5.10.21

 recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 9 +++------
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 6 ++----
 3 files changed, 7 insertions(+), 12 deletions(-)

-- 
2.17.1

