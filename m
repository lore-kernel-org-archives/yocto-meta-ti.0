Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CCE8CD5BD5
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 05:06:47 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4407.1779944786924045983
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 May 2026 22:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ekiix5uI;
 spf=pass (domain: list.ti.com, ip: 40.93.195.37, mailfrom: lcpdbld@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n36L6xkqzAEQCsHjEKmNsxShT3aPUIf4Zstbpn/QkdTFndwteDhzIm+xVi/Pltu1gRAdhheIGcQ611Ka0m8UPPNjwG43ya6VJZWYUgjWkKVnxFpsu7OTPxgqE4THrNt3kU+UoKA1V9HN+JLAkQqerbVoPJB0sW53eBT/3XJz6Igeym4+dN0betEP8uKbXeSWuzCz6cpc0tKrj8gb51g7rDMVXhd0zS95xs0nw8MdRn0H2QcC8I4I7fPFesY9Ls96HxgWxsWgIklhxJSaC3+tbBoYgnMNqHabvmJ3EFWWRR4jhOP+nSYuoQsD3LI78IGzDL1Haar0TvjEUoeMkjsaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6/EENO/KabvLy/bUKLRk6xc/tc9CJMYNatPzyNOzSaU=;
 b=RQW9vlB94uk78b7cHXZdGa91wOvXlDFhr3rZ0ABpTkRHzTY7x0LYTZD0xvUF3hLm+b5CqPSfYF9x5EkH6h6NLsxz9JDINP09C0yn4evIqL6bJ64CH3fKpWRb7d3Bv/WgbAbo8kAcyCNs1/W8SC6hBobcdFftPEqs8O9t08j8gJoCnzyV3W9ZEMtGDwDoW1e7u/tzyFZSHw24fS9JVV1Rj6lx9kGXvI+Gk58KOWlPvgG7dx1VHSupYlHoBXQ5VgUWlJ0rahbXsM6SykFiStA5x8dEFM3jpcXkBTYHK628AYX3LzvfKO0S0RKXaDnOlgzCu3gbiXXfKS5Np1scpN5mhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/EENO/KabvLy/bUKLRk6xc/tc9CJMYNatPzyNOzSaU=;
 b=ekiix5uIncKKfHNfChdWRgr8tPGkzUPFuhfobrpyTuJh+NCc7iMzmE9AA8hWKANiHGolTOZ83EGdV4GcdP5DXw/IwRhruJDnWfi6JhTf0yi7ToPeVWjl+qwbZUY5XF4Qho9abDXqtGLh+nLN4Qbwygprexlwo2EKiHZij3kUjQbHnsQwSP/qwFfsHhN5bv2LoO70Dsvo11zGL3vvufeCu3VbmJ+L64Pg1SKXmZ15zxih2fJKCx3CkHojNuDbk5r8GTO06US/WNGJ2PqsADCVh510S2qcBEGmWmHrMT8bcODjKuBIJlbLvkz2BbiZ4BMA4qPQKc8DUo3Bc5sd3s+keg==
Received: from MN2PR06CA0007.namprd06.prod.outlook.com (2603:10b6:208:23d::12)
 by SJ0PR10MB5646.namprd10.prod.outlook.com (2603:10b6:a03:3d0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 05:06:24 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::7e) by MN2PR06CA0007.outlook.office365.com
 (2603:10b6:208:23d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.13 via Frontend Transport; Thu, 28
 May 2026 05:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 28 May 2026 05:06:22 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 00:06:04 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 28 May
 2026 00:06:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 28 May 2026 00:06:04 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64S564pX1348561;
	Thu, 28 May 2026 00:06:04 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 786F52A69; Thu, 28 May 2026 00:06:04 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202605272200
Date: Thu, 28 May 2026 00:06:04 -0500
Message-ID: <20260528050604.1451589-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|SJ0PR10MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: cac3bb3e-cc21-4a29-78fc-08debc76dc90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	CvoNfUPLD4kJRVcK5Wktf8RzdNxmB4VQbn2nHvpQ5rP7ScInAUQkT5FMUurA2t7wU6bU/40bVSc6SUHSWIbHqAd01bzhR64yB80Q12LVWa9fkSm5NKazqcCjuRay4g6khjBqc6RkEc4hHsD1qwB2Vl9SWmkO+Lq1NoMSAbMIccli+GCpYFLffId8gTX6+T0BLvx78R3W/qgzLGyHYclv/J3cNTWVTHHCrHRgJKH8GuiPFSsEjaAov0kJkkahz2sMb3VhMg6/F1sSdN+ut/035z7cmpOdB+HuyORpUebxsSxxvmEuDXYGVIsOvDLv3vdY2Zh9F+fYc+plXae0prsoiBSvCWcirpUDaQTEKZ9OIz4axZfAXSkMu/GFnhAZwmZnatd59rA36J7I3fK082Bgov3f4KTteKx3r1+WiTERgriJwuc01yBAbG9XghorzUxFAGpzd0xdk8r8Zxi08QlJi+1bOnudNsPBlISJhMFarUjlPz1oycgiAyv0HweG5OCn8LrttJQTP8llg03VPoT0b1lZlYLGCnFoF+R4Uhey543oNpr9pS2eGUa96G3Ec8lezhpY+rZU4aGfuQUe0yRsaLbLdvMr49YOIO8l+EW7FrfWD/Ga5W99Vgnz7uNKt8uz2dhmZtq03ZhSUo1qXwAv1lm8lDWKOnTZ4sijg/+1jTqD3tlSjwM3weky95s1FQTEGHiot2pjvR2jhpxv8coRy+v0Nhy6dC2aHxniSUp8zNs=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	v/K9SwDbP6sOknIvcXt5m98sj4ciReRYF81D0YkNouPrgyx/IS7gy7ZZemUr8tG73piUPVGVL+9OdT/Euez7LbGvCGdvZKuNZVLDJ7Q+qygL97uvrQf/n7gV5pVwVZ7i/evtN8lFvrcROTR4GRmIDwuukVrgUT1crEahkIAvzT4nv9xt+QP3j+/ONrOWpUWMk1QDUsqlxhcaPaSF7dBqeQiLO131Ia1+YCForse703OQAezvKlox6IBWeyco4P4YykobdOAeCISqtjhZNm0iYgaciVJBPGu6VDH4MN220vm3SkSERaLblObbmIZhl3XkkupTZ6UtMd+pj9nvQ+kzYxWU+ydVVo/+mXq+Y1h28cyleKUZmvj5QAdpkn23bPkXHLtOb5J0kc3AQ3M/EL+XGNwDnUmBc82rl4v7EbrThHqsN0A+HxhCXUP/gGtLYMQm
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 05:06:22.4557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cac3bb3e-cc21-4a29-78fc-08debc76dc90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5646
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 28 May 2026 05:06:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19941

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-=
ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.i=
nc
index a66862be..1661b35e 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A =3D "git://git.trustedfirmware=
.org/TF-A/trusted-firmwar
 SRCBRANCH =3D "master"
=20
 LIC_FILES_CHKSUM:am62lxx =3D "file://docs/license.rst;md5=3D6ed7bace7b0bc6=
3021c6eba7b524039e"
-SRCREV_tfa:am62lxx =3D "27ec63132041f7b9c6b3747731de4f8c6036a430"
+SRCREV_tfa:am62lxx =3D "d87a51fe5eecdfac7503d0e784ef3bbfaba8a4bb"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx =3D "git://github.com/TexasInstruments/=
arm-trusted-firmware.git;protocol=3Dhttps"
 SRCBRANCH:am62lxx =3D "ti-tfa-2.14.y"
=20
--=20
2.43.5


