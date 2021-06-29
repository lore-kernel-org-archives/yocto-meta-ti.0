Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.7923.1624972606336358937
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 29 Jun 2021 06:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=l1ylyE4l;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: yogeshs@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CB79938C0854
	for <meta-ti@yoctoproject.org>; Tue, 29 Jun 2021 13:16:45 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15TDGgeg035362;
	Tue, 29 Jun 2021 08:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624972602;
	bh=lpGZRajbYL0nPMpDZYu6m6vElKNRKJvmsw9Jj/nmVZo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=l1ylyE4locfiZ2eCNilaqJIXurAdAbxLxCxqb8R+BJ/KPh8k2MmPlzgcWC83NWhC0
	 P7cwsaiZmcxL1OaUnSYajbTR0eFccmg0gIvP8LrRidfnk6d8496BRrz0Z+PnyqslQ3
	 anbqFmdAmXnrXq7Vpgt3DxlWx18arxnbIjzZMZGg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15TDGgRq055290
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Jun 2021 08:16:42 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 29
 Jun 2021 08:16:41 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2176.012; Tue, 29 Jun 2021 08:16:41 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        "Bajjuri, Praneeth"
	<praneeth@ti.com>,
        "denis@denix.org" <denis@denix.org>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [meta-ti][dunfell/master 0/2] Remove Jailhouse support
Thread-Topic: [meta-ti][dunfell/master 0/2] Remove Jailhouse support
Thread-Index: AQHXYddoiVxQWc+OAkqqbs6WmsYB8KsrDgDA
Date: Tue, 29 Jun 2021 13:16:41 +0000
Message-ID: <f32e4985feff47e58adf8222124224ac@ti.com>
References: <20210615111244.24807-1-nikhil.nd@ti.com>
In-Reply-To: <20210615111244.24807-1-nikhil.nd@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.66.120]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Applied to dunfell. Will pick it for master.

-----Original Message-----
From: Devshatwar, Nikhil=20
Sent: Tuesday, June 15, 2021 6:13 AM
To: Bajjuri, Praneeth <praneeth@ti.com>; denis@denix.org; Siraswar, Yogesh =
<yogeshs@ti.com>
Cc: meta-ti@yoctoproject.org; Devshatwar, Nikhil <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell/master 0/2] Remove Jailhouse support

This series removes the Jailhouse and corresponding recipes from meta-ti

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
 delete mode 100644 recipes-kernel/jailhouse/jailhouse/0001-tools-update-sh=
ebang-in-helper-scripts-for-python3.patch
 delete mode 100644 recipes-kernel/jailhouse/jailhouse_git.bb

--
2.17.1

