Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2AFCCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 05:30:45 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.20])
 by mx.groups.io with SMTP id smtpd.web11.1298.1761715830967805082
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 22:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ejvt6jfv;
 spf=pass (domain: list.ti.com, ip: 52.101.56.20, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PRB0qoezSXoYfIMEZCToChxjVFE22h6wmfx8vGby1VloE9Eun2uSIY2KBNHMpSSBNLlB1WSxSjfGyzYNVKmX5V/CkMerVcLW7ILkftkKMNG8fnCi2JPP6kpp0BP0XtNBpfkJ7PIatNlsdMvRDIfLlzcDKmisN4prVad95bchBIkcLqDyP2MU0Eyq4uUWPyZhi9wM687afxeAT53nQ3fO8tviOIw5wrRTTLiGq8t+7dl/UY+JXXgDEeX/M3DDd75SvzHeFFlIHpa4nzE2O42g9H9fpbM3CvTR9onw1nsPQ+UCey90UgcmiZg9UgiFMbK5C+myFIvl5/w5KcYdaxmvKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhxSczTdrIuSPZVEqafimRngKKmjisym3GYZN3j69iI=;
 b=xgLZtzo39eNE2RReteVp7R7DGDqMm/vQpTabWrE4EVsdyjcjQAbST/CZYFJkCxrWsNwzptsXM0IGZlf+l/1EBqkOpo5hEvvY8MFw89AqkCGNlI2nww9KedzNNCgsnDZz1Mosf9ivNU44N1UxfKjxFyxampxKLBzev3HTpVNlCMdjN5Pjqvp/AEhk7nkWLSgAyqu696LiUt3A1lei28XgvjviCfJL1RYDiSwCLHeMN724UfTdHfFMHvsVFs2ag4rZCBIHbSemgcU9zaDXvyIEU5oXGJvuuhk+cxcUmV6TpbiuVLY4bqGGGOG7SdBbgW4l97Vog7hDS1VKKE8lMztEug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhxSczTdrIuSPZVEqafimRngKKmjisym3GYZN3j69iI=;
 b=ejvt6jfvM5RMFOgN+YJqZxOlgQ37isxyJ8dVLNKyXVlOLKTN0qo0KKkQJzAWf8Zqzc1nvw+Ix98ePp7nPI7gWT1TOHlgUMvMwypdI71XCbu0QsOWqrNENvoQeckTlNBC9Pzxf12KTHEdOPcpqOAMIgXOSjJP/mr+ekq5sUIU+eIhJMu4pzcC+11zVyAm4kMnEydH+HFY2e/f7Td5vI9R+N2trstwn00rQaeaJVDLV0WCT65pmDx6K2K3b9cggr2R+AMKYJ99d0uTYMHShTkFQB88uFdskorqkQCf73XyUBompIvcHl0tqVo9HoH33pdpaE2JfGgzDJycbQaBT9q5aA==
Received: from MN0P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::6)
 by CO1PR10MB4482.namprd10.prod.outlook.com (2603:10b6:303:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 05:30:25 +0000
Received: from BL02EPF0001A0FB.namprd03.prod.outlook.com
 (2603:10b6:208:531:cafe::b3) by MN0P222CA0001.outlook.office365.com
 (2603:10b6:208:531::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 05:30:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A0FB.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 05:30:23 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:30:12 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:30:12 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 00:30:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T5UBkR1293319;
	Wed, 29 Oct 2025 00:30:11 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DEC7913F536; Wed, 29 Oct 2025 00:30:11 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [meta-ti][scarthgap][PATCH v4] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 00:30:11 -0500
Message-ID: <20251029053011.1953812-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029052623.2979655-1-v-singh1@ti.com>
References: <20251029052623.2979655-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FB:EE_|CO1PR10MB4482:EE_
X-MS-Office365-Filtering-Correlation-Id: c1031e49-be90-4b01-79df-08de16ac4294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?M4ONHGWFI8oQMW0j6Dd7uVM3KPxcJiE1AXC2cGyZ0kdFqPZuDs27Si1mE2Kj?=
 =?us-ascii?Q?3QNGXsD71NRy3vN2jCXWvtYkiSg21hoJv8tQEnvVRZbrErl09S+xTccAGUEF?=
 =?us-ascii?Q?juyPGoeBfPR0kjZpdywFgn4yrFMLzAGgBgOgq1rM0Hyd+UGwXlvO4uNE7jGh?=
 =?us-ascii?Q?I01fNw3WopdKkr6cqhRqw5ueX9Zvf4XsNszkjmvdI6uN5xyePWBkaRy6eFpl?=
 =?us-ascii?Q?v1Kl+09RrfYov4uThOVzTtAGoMxlvrLBk0wtbOcci5wxKDGIv11rgXpLTFiv?=
 =?us-ascii?Q?0mTKLmdxdA0rqASbYyrBMmRVHXtlcj7QYQV1ZUBQt112hc3JoRCaS2O7LDui?=
 =?us-ascii?Q?9/G15KRbdSBwgh0Fk2u1bjL14wpEl1oo4YXrP1mJML5YfF1HCIQqg6oq8wEv?=
 =?us-ascii?Q?fSdwI9rVElJ/fu0f9uMfwi6XKAQJBTxkNw+uCPOg2CWWT/9Vk3ddCvn16u1P?=
 =?us-ascii?Q?OxXnPy+bJxlZeZxxzF+Jedbo+c4Jl0LrcuCfa1RPvleUMgNPmKrMwLToRA6m?=
 =?us-ascii?Q?4yq+Y6rTeLA1V58kCFDNBvd747B+rnm3Q7kj2JYSi+ctl2K/oruu+u/5u/1N?=
 =?us-ascii?Q?DvW3Nwcslor2w3O31FmeGAxCfI9/QUDAzzzzuWR6DJp2LDoCGXmSfjqPQnEl?=
 =?us-ascii?Q?MOW/t1A0QxBVTX+dpcyZ3qB1De/xfuqXj5JbXqt5age4gdZZCk5wkiepy2bf?=
 =?us-ascii?Q?FiU47Xaunjhc28K18rdLQ+cLyWNAgQQOsT7fp6MUMZernvqAI1mDOgVZ/jCJ?=
 =?us-ascii?Q?flWX0wb2fGCWpsypYz+uSpM1nuET7xORz9htRwpJ4iMor1MOg6SfnZQdJQ5S?=
 =?us-ascii?Q?XfjwUUS4Zxcn9LjtBZUd+buQhBZozJJxszt+klnttm/aNkZeBl2+4AO+AwMP?=
 =?us-ascii?Q?fH77lSH9WRiEFUdZrVweB3oGxZX8DHFwDfXkok2sx0Y+MDaLXmsZ0Vy8zxIb?=
 =?us-ascii?Q?pYyKefMHSzN1rxWA1ccXzMGBDvQp36Du0ZIa3FE24/QqJiW8cPORhXPwXSfV?=
 =?us-ascii?Q?RyCwI8qon14qzMQEjAps5lN/WMFy9+crWm5tbo1pJ3kBJObdzsId5oyxjKwg?=
 =?us-ascii?Q?KPdUvsu+Ps4oMXjTbgdDVvbXO4U23hdJfLre6hX8H2J1nNhQdgR7c8ESyibw?=
 =?us-ascii?Q?o+Lut/ft+ub59GoOIE/ZeoFCyAvvHSLIJ3TH+oBpfOvH+5zHEDQ1r9dIRL5N?=
 =?us-ascii?Q?2j4k5hY8xsczg/9LZM+/ClOS6cKFRbaYG0W4w39D/imNGNtjEvd5hmJB/swy?=
 =?us-ascii?Q?ysZISWYBxR8o+IGNQeUvDvKNbgppfGnyrByNwSzbTpbID2VhumBT3kl5KAue?=
 =?us-ascii?Q?7Oz/rP7PkcrFDVLroNV07UDS5Ciewo4hl0XHjLTGYjQ3yRSgboOu1EkFHq8K?=
 =?us-ascii?Q?YBi5QYyMSuBijl9eGCIkDR0f4r7qr6f6qKUrzRHQmfCp2X8p7RJUD5S+zu6P?=
 =?us-ascii?Q?vtNMURNouTbkYtRxkcJR6SFQfDbfWHuLNbaO7sQfedI8pYK/cK+ZRO9kbLE3?=
 =?us-ascii?Q?MY+/wECNC0P6dX6G3lWjcgxNtPIbDa8/Us1Rks3FKnFCCoSfR1MN5oQ84SLz?=
 =?us-ascii?Q?Fkw0hwlLPL2OD+eBA30=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:30:23.9759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1031e49-be90-4b01-79df-08de16ac4294
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0FB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4482
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 05:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19200

meta-ti / na / 20251029052623.2979655-1-v-singh1

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v4] ti-librpmsg-dma: update ti-l=
ibrpmsg-dma SRCREV & LICENSE
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 29 Oct 2025 10:56:23 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 5693946e4c27984e1a824b653c9db7a2e=
a774644

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Sabeeh Khan <sabeeh-khan@ti.com>
- Commit Subject: meta-ti-extras: cc33xx-fw: update cc33xx firmware to 1.7.=
0.323
- Commit SHA: 6245469825ca824c83b2796553bcb9163c6daf66

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




