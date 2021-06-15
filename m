Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7793.1623755588503852294
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jun 2021 04:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jyA8VB5L;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: nikhil.nd@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id BB56838C070D
	for <meta-ti@yoctoproject.org>; Tue, 15 Jun 2021 11:13:07 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15FBD3mo018563;
	Tue, 15 Jun 2021 06:13:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623755583;
	bh=1moejlruoWOAYoanCW3f0AlPzCK8/2PJClGGb7cQ0h4=;
	h=From:To:CC:Subject:Date;
	b=jyA8VB5LWKkRGl1afALQ6V9SYDZ954xmdgmSuF9ImXzVYClT/95RkUkYq+xdPFCX7
	 7zyBB+WbzrP+lDUcS1OyH4jusbYSUi26Wh6HsB3rqKunKXw9zeh2+lnq5BjRoGuAUH
	 UkdbdcgyBaYA+S85gUf5PhDyv9vC37PrZSWIkNmM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15FBD3xu084454
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Jun 2021 06:13:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 15
 Jun 2021 06:13:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 15 Jun 2021 06:13:03 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15FBD0Gm081387;
	Tue, 15 Jun 2021 06:13:01 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
CC: <meta-ti@yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell/master 0/2] Remove Jailhouse support
Date: Tue, 15 Jun 2021 16:42:42 +0530
Message-ID: <20210615111244.24807-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This series removes the Jailhouse and corresponding recipes from
meta-ti

Nikhil Devshatwar (2):
  recipes-bsp: ivshmem: Remove ivshmem packages
  recipes-kernel: jailhouse: Remove jailhouse recipe

 .../ivshmem-uio/ivshmem-uio-driver_git.bb     |  29 ---
 .../ivshmem-uio/ivshmem-uio-tests_git.bb      |  23 ---
 recipes-kernel/jailhouse/jailhouse-arch.inc   |  22 ---
 ...hebang-in-helper-scripts-for-python3.patch |  56 ------
 recipes-kernel/jailhouse/jailhouse_git.bb     | 168 ------------------
 5 files changed, 298 deletions(-)
 delete mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-driver_git.bb
 delete mode 100644 recipes-bsp/ivshmem-uio/ivshmem-uio-tests_git.bb
 delete mode 100644 recipes-kernel/jailhouse/jailhouse-arch.inc
 delete mode 100644 recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch
 delete mode 100644 recipes-kernel/jailhouse/jailhouse_git.bb

-- 
2.17.1

