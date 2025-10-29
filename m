Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F28ABCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 05:05:24 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.46])
 by mx.groups.io with SMTP id smtpd.web10.1137.1761714319457783510
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 22:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uinZ9iyv;
 spf=pass (domain: list.ti.com, ip: 52.101.62.46, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osjm0Ayiv0FpVKrTruNhQrEABmMe778uTLLWuMMCCW1qptfjJwFHbqQcM9LRWH6DyZ1nGAZtjC/10s7BrS/tEVWbw6nYLN9N82JvOgcWtA74hksXiXbGEt5Pe2TceykM6ZuDL3qWM/fmf8WxBV64Ba+CBEsqDiA35Hfm4ZIVcIwKk6mvfMdXhYEmiABtBPs7BRdKMzdVdr6x8W4gGbMMP35DMDzRftB3+MBC0xcRsBbFxb+uxoXu9XhQA271gEkpiEVxShAJA2zCm6lY3Patus6uZaUevKUVWsRugT8G+i0I63f+mELYQwapNKLp0ttwSEUzHsstKOuHiBGgujXg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PH5y1/ynDBQy/dkDU9HZBdhCkVP5zxyNzTGqzl71dSE=;
 b=sSWVcZphJD8sS8wgvXPw+8BmNpswkpb+zAHkbXEMNcyte1HjvUsu2VMr0xHACgCYPCjriLf8qSnHAE37qoQPHwoK25uEAvtkaWN6sUfKYIPtEHoMFf+n5AYs/UwObdQWWW97ADUZkj5ppUHQAFT0gx6nVCKClBskeRSQjuC+PWgE9ZJqdNP04jBsQ6v3xaeil7VZtJG78pxmyMtMInsLPh0jzO07WDYliUrBooQwOPgBXVihlN4Wl/EzcFHD0CrfjiOU059utuZ6MrGxePrB6WAUTP3nTD9Ctfpsy1A3F1Gz2FtaKurBOXTCx0Tn/wcXskiPcEl/h5T542lscnQrqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH5y1/ynDBQy/dkDU9HZBdhCkVP5zxyNzTGqzl71dSE=;
 b=uinZ9iyvESrPlVDY/UskKdHe1vODyzlzcqvsQUnxpunkxQTjCBZ8JQi4R2tHgrJ/syy87KrLQPX5klbhMk/I2NcmNCawFRPBCMzva+sawxDKZwfaJX1kLA62mr1WrSJQTro2abHk38N1CIzNH5O9YKPqVbg7mR/fKzE1G/RKeam7F8OMbQfn13vjpdaoN1679ZYwVd5Yq4BLawULy+WmVdtSG9CDcQz4mXd50A8oYHgbYRnDgIXolnHZ/1xFv0OTrSDQ6augKWZt1qnOzS8bNLEKmwPB4RHvkCK4Z5loTDpK/7P95pXEtbcp4910rfynXlOYR8o06m/HFU7KMEej0Q==
Received: from SJ0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:a03:3a0::22)
 by BL3PR10MB6235.namprd10.prod.outlook.com (2603:10b6:208:38e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Wed, 29 Oct
 2025 05:05:16 +0000
Received: from BY1PEPF0001AE1D.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::b5) by SJ0PR03CA0257.outlook.office365.com
 (2603:10b6:a03:3a0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 05:05:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE1D.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Wed, 29 Oct 2025 05:05:16 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:05:12 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:05:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 00:05:12 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T55C581273529;
	Wed, 29 Oct 2025 00:05:12 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id EB48A13F52E; Wed, 29 Oct 2025 00:05:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 00:05:11 -0500
Message-ID: <20251029050511.1939170-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029050230.1697118-1-v-singh1@ti.com>
References: <20251029050230.1697118-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1D:EE_|BL3PR10MB6235:EE_
X-MS-Office365-Filtering-Correlation-Id: 5feb381f-c82a-4b56-fe37-08de16a8bfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|34020700016|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lMNP1ubKkRE9FivIgYaBSamF7DCvjxgv7XNHhWcwOiyHExrpJ1hDMP4959c1?=
 =?us-ascii?Q?RlCKkyi/xr/XIcn01LVieQkM/ZNO4MskhKBzTVIUIWuvPoRrWLWjbzEH40FA?=
 =?us-ascii?Q?n2LbxdGVJ512DZPlwcjpMocdPH8DLlGNTy3FPysLzNjgmBH0PuzvAL49pHjI?=
 =?us-ascii?Q?dcZIDcoBXhWe0pWXHOsqwBQTOnG2neCAgtWDwiSFa5Qqh4yCnIQ7TUoTM0E+?=
 =?us-ascii?Q?ZfsOP90ajBLekT+k4i1pKwQk3BTKZj48j6SMxmv5UbSyc8hyReqDUtKX7LVW?=
 =?us-ascii?Q?2NT4gPT8TcvbuimkDdj8yWp2Yh+R/FWzuUTOqLlHlXJRyeT5B+wmhDhLzvXy?=
 =?us-ascii?Q?4w6oBlsaFP+THq1bX28EZv0x6RvesH0lbAtGu5h7C/lEwL+FUU2Qvumxlrda?=
 =?us-ascii?Q?nFcqK2uiTZ9Ej/qA+VfQ1TGHD6mIIlkXKPpj4TRBbFPMYKuKBbWQMrZKvsYA?=
 =?us-ascii?Q?7NYt0P0lVsDMRg4fKm8RDmUviAYhzjF80IaIM8CZViTglergZyQe1lvdQgq9?=
 =?us-ascii?Q?aFj+pHxEfDrfAfQJ2MhruQIrpHxSZUfIESnYD+x7Rf/mXE/j3vlotHdwpguQ?=
 =?us-ascii?Q?d0srfrCnJegLPz8E2XCBoqx+FtuKvnDUu0kl1AEEMs00ryuN+y3tMULStl9C?=
 =?us-ascii?Q?Cx2foRkCGGdZwwa5Q9IxW7tJpK+peHrK8C9DjWrxMSbyO/L852rD4NiO/m2/?=
 =?us-ascii?Q?uhwmTvFEmb5JLkfQP/0vSIRDqRP4gpNuCN1Rs0lWlWT8det+bUItxPhXPJE3?=
 =?us-ascii?Q?+NjoCSpye/UfY0XzjDPKEmPEtg5Xg5difQGut2lwDiIrhyNTpt/tFp/+FNgN?=
 =?us-ascii?Q?gnI9g4czRG2O4i50hPf/ByH0QOwAWVWgdisCaLWvd093GrP2AYpDeM07Qy3D?=
 =?us-ascii?Q?Oj7qZuMrniDlV+4YCapKq4CIFKAPFRw7xBOWKvSdYWpmQg2YK4SLgwMg/eua?=
 =?us-ascii?Q?sThBZkgVaxk+G99BBL03glwPgJT6j/a6IbRzbReNK6ow/7v67s19hHU4B2bX?=
 =?us-ascii?Q?miamEgEps3MYVJmL1V/z5ay1tMFZlm2h9khOA6qTcwlQ39dWkmQnwAR71wFx?=
 =?us-ascii?Q?5lsThqYYYykwLbt5W5QN5CPQDR1HR1fm2cKZERpAswt9Gc8a4uYS5d0b5A4l?=
 =?us-ascii?Q?YPfoYQ9SLp3+OK81E/virAJT42ahZlnERVBDT2OzZ47HRE4Ols2r2SsHx3ry?=
 =?us-ascii?Q?mLBPpHbyBCl/KUyo+Sc32jYkPpnkJpdmr5fcs11CcYxT7WwFBa3StdrogkzN?=
 =?us-ascii?Q?sRLnJAFWwPmjrRGk2k5Mg1HY8LtrE5XWYqBMKKiNW918seUINgSgDxUQKh0R?=
 =?us-ascii?Q?Uo2GG/CaLcJMsvYxzbz2w/9+w7iPB0bkOvSh5kGlSNO3xkK3MnUknEdkaVN0?=
 =?us-ascii?Q?BJKDGj006CtcQDLLkbZGPDcS/LTqp9liXvB45JIRHq/EssE1FOh+0WTQe3no?=
 =?us-ascii?Q?8kpoq2bn9NB4fytwv2/D8iefn0j7amGvMsETGOSVP+OVzd/JQxDZpcsUhyBh?=
 =?us-ascii?Q?Z7JNhQ4sL5iRJQUywyq+72ifBAgAzyHuFCYcNNIBkdP4+AJPMO8OC4c7dCuz?=
 =?us-ascii?Q?L4jfUZpAkOV7pPrg/nA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(34020700016)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:05:16.0018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5feb381f-c82a-4b56-fe37-08de16a8bfcb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE1D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6235
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 05:05:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19196

meta-ti / na / 20251029050230.1697118-1-v-singh1

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:66
            Subject: [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV=
 & LICENSE
   =20
    ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-=
UPDATE-1)
        patch




