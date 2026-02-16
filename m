Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D0EE83842
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 23:13:02 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.882.1771283572448910433
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Feb 2026 15:12:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=dybRgDe5;
 spf=pass (domain: list.ti.com, ip: 52.101.52.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbhGDEaULQQNmAWSHdIUl6a+6uJOY698YnTBjrw+QGIzzF8cQ+BRKDznO9KnV81l8SeBlOGgdVU5IndCUA8Id8k+edcu0VkwhAfUBJKaWAY1r/qDhCwHCGeVY/Smq2yQePp0dOK/SvLDBo0pOL+DMjS3Oy7k54kOf8grJ/w4BIVVD1KLPlsIL6rT53NtmPPo9iWqcD/u6Aff/tZCHRsBj9tx5b8aiT89Y+66nRU45KZD719wkHg9r0aa5ZRHhnP5Hc+iUSE5TtxcMMXk6OgiY4EHSPaM4LbbGvX3GpE88OWdvR1OgWRdKyqVYCPYA3hYLdiCESd/igzsACHsVbfKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7de3NPrdX2x3iicPOJJ6qUlLhJ2aBA9WcVtLQtJDc5g=;
 b=ppIc/ngd2hesJOkB9lpr2AJ0+I+ny2+qC0mytL3cuptb+7RWMTx8QlKIyUGR3NBgHXIlCdszEf2eHNkP8j0hU7na6vkdP7SqXo5CAXD44MxwhCWwNa1b7JQE3K+/bOZBr8STF4AWXDnTyZd0/Afhu1QFtMkLJrSV9/LccJWqba+7C1gkcIJCKSzclmJjj1CYdb6u6zZDMDxZL8A7Pq+jAZLumUsSUBuWAI5eGJ496lCfrZrXzTLI9axy4hFNEzoS+UlLqjL7m7GuR+lexH9kdFagGswmbc1N4Ev6ROxnqH2VIZ3BHa/Tx26mdRNf/pK+6nrRNJVtCDd5Hrwra7gRyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7de3NPrdX2x3iicPOJJ6qUlLhJ2aBA9WcVtLQtJDc5g=;
 b=dybRgDe5hDQtsRMEnCGcmHS14ad9dcQVT+wS7BjXuYMBoHZOkxWfO0SbetslC8LNnbZdpy660TblAyWqoZGyhud+/DJpbJXP9V+CI22wrKCk8z4+MXlS4N22B5ryHNQwDTqMadKRaI9gyli2IvDFne2YIOaUU8AHQoHdu5cAKKIKI+5+IMf3qax4c2U1bmefPPJTYW2efxiUXpO8NB6dTKnPx3Ob7icIebAQh3W1JcgEMZ4WttbcjHT2dxOBWbo9kiYsg4t6z+eHavupYJJGlMrkBI6nRq+4oR5NKxLNaewK0zgFW66RqJjIzDR17mzTpDJGgI/2IoNkmcDC3ochbA==
Received: from SJ0PR13CA0213.namprd13.prod.outlook.com (2603:10b6:a03:2c1::8)
 by MW6PR10MB7658.namprd10.prod.outlook.com (2603:10b6:303:244::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 23:12:46 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::1c) by SJ0PR13CA0213.outlook.office365.com
 (2603:10b6:a03:2c1::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Mon,
 16 Feb 2026 23:12:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 16 Feb 2026 23:12:45 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Feb
 2026 17:12:44 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Feb
 2026 17:12:44 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Feb 2026 17:12:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61GNCiM0273828;
	Mon, 16 Feb 2026 17:12:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 19D569ACF4; Mon, 16 Feb 2026 17:12:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vitor Soares <ivitro@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Vitor Soares <vitor.soares@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [meta-ti][master][PATCH v2] j784s4: move TI_CORE_INITRAMFS_KERNEL_MODULES to j784s4-evm.conf
Date: Mon, 16 Feb 2026 17:12:44 -0600
Message-ID: <20260216231244.3094395-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260216230422.635024-2-ivitro@gmail.com>
References: <20260216230422.635024-2-ivitro@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|MW6PR10MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: b8bbf3a8-a56a-4b62-0373-08de6db0e4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?urmu3IemYhmb5cqHfCyg/1xn+07/wwgcLA96z6Z+29m2VhaghVDyK4T7VbuY?=
 =?us-ascii?Q?/vKJV85kN+sUxzbbDdSbThJRhDvjqY4TUYwrUEHiQOr6hKOK/LmfYtamV1Fj?=
 =?us-ascii?Q?udZmNcVXggG14bdwYvos0DYfwhBk2x1edt0J77JPSSESO8JXTw8CeG7kuoZo?=
 =?us-ascii?Q?paPHKQcImQJv7H5XxhVvN9BVm6JIot0nYDWImadqMAPYdzmSCx5r/KWU0NA9?=
 =?us-ascii?Q?NeqW0S03H8S3mq3rttF9DrAUuhGVZnKmW1P2CzhW1DdQrtTZ+eUXx0LJf/YP?=
 =?us-ascii?Q?KMDYdz5RZFYSXzeka9d6cp/Kgt7M2t9oB+T4reR7iVylcqWsdXLPoohT50Bt?=
 =?us-ascii?Q?1vC8QAky3rkZ7Lx1rMeb7toE/IZ0Cywf7v2gxHF5YK6iHQJit33902lUFGSc?=
 =?us-ascii?Q?f8D6qGZ2oVA1kDEbtWul/tPHn6vcNVDJnv+oAVQHZ4jWcClxtgcE89vGwSA+?=
 =?us-ascii?Q?lqT4KxlRK0wVG4gPYR1z/wDMl13+pFOQdymVknxTH0qZ8Cc62hAj8pBbJ4eM?=
 =?us-ascii?Q?hdKrrdsOKlqer4+JcBWFbvT/6Go8OhFOWC9grwNlaY9zSfsMMmk7t9PW0+RT?=
 =?us-ascii?Q?ogG5SBdKfPbrx5ZTVGf/ZfxB+RjAYGqJPcrA3pr0RZlgMrXP6Z/SA3UlCLTu?=
 =?us-ascii?Q?PwHDTGptWqCwpzd0bhTUuipdcR3MTgagnzS4JhTaTcySBK5QJBt8npEj2adZ?=
 =?us-ascii?Q?stb4ddkybxww17/AaEZ6HG5d4e5x7gnUCAvCmTjjQ1vKcaYi+q7AGfSjqVJX?=
 =?us-ascii?Q?wV+duQDXbeJcAVmv8tVX0alti8v1SP9jTdelU7q2YF51ThWT9rl0jnnnrvCS?=
 =?us-ascii?Q?ciZNbD5OpdGRXZ6Y4hB+saH5ULu3R+iOJvVOLGErn8WOg2AQu3kenYwASO3w?=
 =?us-ascii?Q?TB9GyipMUurgV9tQ0NZob2Kskfzk66T46TxMfl1ByCp3+lLa535hnscUnKSQ?=
 =?us-ascii?Q?QJ7dhlb/szweEsR3bHqxyySzjZzdsZzUbM9JFwXBUDPXhBPubbTGV5mUF/MX?=
 =?us-ascii?Q?dFM08+epOP4EoCHMnIv6ITpSReDPvlAO/YLpbHPGN0jRKEXtg9nuPWJsLCaG?=
 =?us-ascii?Q?BG+D4RujM4tL84loFcnZVlOE2vlMzjcV3HItJyYNhHt1TNxGdCaZykXsykQz?=
 =?us-ascii?Q?NgWSA3xT35kyz6xJTrBbSVjhUFGkAKv305eVF5QdBnjz2o0TyqalZQkNXukf?=
 =?us-ascii?Q?VDQLb3MZuCNw3g7kKs3vGuliSHPK+YIxy4wpzTYwhe1qktcTNmjR5Xt5EDho?=
 =?us-ascii?Q?W/cmgcZyAKNFF/XAswJ/NQT8yWJxooWlu/V6P5CUHX39Z9WYZ+zc3fZojLGd?=
 =?us-ascii?Q?KDbvVKDbwoHZZYCe9Vwcor+vdlPLOhE+L9xId/sDKvNMkVgrT4jK+vkRU6x3?=
 =?us-ascii?Q?ClefkIiyU9C8dqLwhsLWFWBMHmQ4ZCnkP4TynrGcOKjCpE5SN6wJ1fXmcGhP?=
 =?us-ascii?Q?oHZN4KW8XlfxdP68GH8gSByRkHDn7dnTNovSpM/kRAT8Z7m+K1HaomNW53zO?=
 =?us-ascii?Q?Qgw+BRvApBITFvLT/yH/srvH0hKrtIACmePI7ulwpTx/toE3v7jF1i+Xug6S?=
 =?us-ascii?Q?LHAV2fJgV1HUuhdFcAhGgrvH3BJeXtIsMWrW4jcU0nWXA0oDcflCGvjanU0x?=
 =?us-ascii?Q?y3Dr+NMer/WYMYfSHuVAkixthoOLbnSnQfn+TISWUW9BzFYtnR7PfidfrqnD?=
 =?us-ascii?Q?eWYbVw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	W4+cGD3bHlGqU2yvafEW2nY+ttPEm0jTUnQbPseMy4dvgBg4z7E18HYdJo8GvU1Z9pBWUDwPif+Qwzwm6Zs594hqSuUJy4d2TW6J78ggNDofuRRfTS8YyI7zkggg7oFDWG/fOE7aE9++hOJmCd5HfW7eG7Fpdtj/rYK2KOIwFDsmi0hKok//wHvR0aZ+cNV6u96ZQZd2aF/Ti3BYgPcTHxZ4c1Nc259ysd5BU7iEXA/t4+9G+lfFgbzo4HxwnCUGDn+hPXgYWq9AD6xB97avr8gxTVov3T4CzdN7VEHAzedq3J1rle7ehTkc285EAQdt7AEWntk6Bw/JbA90WNMMpL5cV9KZR3AKucAiKyvUWAJ+/AEGQcReurEyd1CiYsYsGAhz6CZTwd9Jcaz9P3f4rbyTolIpDkNBJlZvLk/dQIEQhpfNlwt96GRP3bFREnHP
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 23:12:45.4012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8bbf3a8-a56a-4b62-0373-08de6db0e4e9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7658
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Feb 2026 23:13:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19519

meta-ti / na / 20260216230422.635024-2-ivitro

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH v2] j784s4: move TI_CORE_INITRAMFS_=
KERNEL_MODULES to j784s4-evm.conf
- Submitter: From: Vitor Soares <ivitro@gmail.com>
From: Vitor Soares <vitor.soares@toradex.com>
- Date: Date: Mon, 16 Feb 2026 23:04:20 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: f82153d1c2ea00de3fe0137a0fb077adf=
1538de2

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: e9a0af0f3815c30ebcca6d098cfb935cffbe2311

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




