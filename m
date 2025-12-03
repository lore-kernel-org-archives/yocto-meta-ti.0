Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CA6D116F3
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 09:30:45 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11120.1764754235340773577
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 03 Dec 2025 01:30:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=o7pSdNLM;
 spf=pass (domain: list.ti.com, ip: 52.101.85.0, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PXqo3UFfrhpszYkuydwGGr1UO9FPFIXBtWDqXaOxfFPIjm6IyNZOI2DNjlzwCwpIoZrEug8w46Prslq2EhyVx06cN19S9mxI/S8G5h8B6Vy68Pk3BhqchCoJer9bT/kBlvzUJn1oDVUELIZUetR6lYFXbWA5QOgzhhqrQUsP7Mk/G7GHDvDdSMi3XjRP/lCsxJQv8g3cbrk0XOWAyoOTUguUYB1SQarvq1zdJ4Y6jJf2BGJt9WA48Nmu4adnzIhYiUys6yG5l94YJVVb00ptk4ypfrB2LSDrNU/4ImcaOU8NYL8IyQzH94wFbZ/hE5LY+NrkT4AJEqD8RJWi4uCECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifx6hsGOOEpi3oPnX3IuT7XwMQCx5G2RI2ijxZlAKAw=;
 b=vmfo5PTxQqw1V/ASWLgF0D1CrZBkbve0d9WmFQumwVwWrp/CMqhm64dyasLB5+md9vdsmEYTtZ/ORT2o9UBHU7F/AWEGEGNMmUe1ugvY6ctrS9Ijg/Obd7wyjUT1KqvDRhJvOGLKV6kwXfAgFcVrYrCqZ/Z8Bi5NghDcBdTDOL9cROkSuEcxzDuaj1FgflaGsYsKR/40DS2g4hsRjBFIbscJdeAvuIljt72BU5SpQ6BMLn3XGmGNBbipf3TeH0Gt1HU4O87GHtFsd8X5EdDKgMVcigpil7uUOAuIpJ3VM8KwG4vlNUz3WV962bvIKrpWrZfbU+wmGxvtYd1ysEfKQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=smile.fr smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ifx6hsGOOEpi3oPnX3IuT7XwMQCx5G2RI2ijxZlAKAw=;
 b=o7pSdNLMSL9jJCFFd9Lc83V4THrr1SbcHV3UQelnOUP4FWV2jFPgrV+qE4PmssDVsllsHHVjIXUOgF80KGIl0Me8wMzyiSVrQ6o04hBpZkWXg2OWO9eLTE6N7gCgcAJc5OPSh88P/MXdwBG2gbiC6H/yCLOPXHmchYep1PaxYx5SyfQLwtv3zBBwOXKVTScSwQx9c1A7WDp13Sn7rxHVmoQ43V0Jb120IYNPm54ICC5ejfD8neRafgQ69+TAnlM7eOkqKqb5HUk7lqSEt9SWO6Br8JSxMvld+z/CKSrrTm99QqW5N2k7ZipcUSm6VN+ffkuKwASrqBkH9C0pQLUsLw==
Received: from BN0PR02CA0048.namprd02.prod.outlook.com (2603:10b6:408:e5::23)
 by PH0PR10MB5818.namprd10.prod.outlook.com (2603:10b6:510:140::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 09:30:32 +0000
Received: from BN1PEPF0000468B.namprd05.prod.outlook.com
 (2603:10b6:408:e5:cafe::30) by BN0PR02CA0048.outlook.office365.com
 (2603:10b6:408:e5::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Wed, 3
 Dec 2025 09:30:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468B.mail.protection.outlook.com (10.167.243.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 09:30:31 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 03:30:25 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 3 Dec
 2025 03:30:25 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 3 Dec 2025 03:30:25 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B39UPXK2797628;
	Wed, 3 Dec 2025 03:30:25 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 23E249ACF4; Wed,  3 Dec 2025 03:30:25 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Romain Naour <romain.naour@smile.fr>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [kirkstone] ti-linux-fw: c66x DSP firmware hang
Date: Wed, 3 Dec 2025 03:30:25 -0600
Message-ID: <20251203093025.2998870-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <90f2cb30-35ff-48cf-a6a8-5edabca062be@smile.fr>
References: <90f2cb30-35ff-48cf-a6a8-5edabca062be@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468B:EE_|PH0PR10MB5818:EE_
X-MS-Office365-Filtering-Correlation-Id: fa5d41bf-c720-4de9-8333-08de324e9a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8NBS1sfHrMeqAXn5w+A17jqvZ60ETD0R/ETdQHAVh+Ye1cEgSwdvNht83PiD?=
 =?us-ascii?Q?EIwFr7XE60LFTmKc/Skr76Hh5tItr1SmVpbZOBhZlnfjXSx4lI48iX4SqIFs?=
 =?us-ascii?Q?vYpawZ5RoW7Nv5qgrbDUnIMOtVnM+pRNP2x8HKvZ64ao2uAUQBR8aeJyollH?=
 =?us-ascii?Q?wO5UapNQ3rWllVhJCOYuMjjeWB4he1ziJopXFy/Lz/vxlacZhCw7pjb3xEBz?=
 =?us-ascii?Q?95wiYFKh7JihWC+nddVW/G7i0AQr3WmFnSN2ou9hWIiz917g+GbLYADYhUfk?=
 =?us-ascii?Q?t36NANy8fYZ7ckL+3IWk6fVoNUyhD3QhExV3kisdC//H1VlDxIxDpWNxfUSa?=
 =?us-ascii?Q?TbuQup2oMqGqBJmp0P/hX9Dmt7GDZ29/mH8OuvPBRp0U/oZasNQbrOl9OMnf?=
 =?us-ascii?Q?vWJkfDE/fDIYlGuzMWPsmn5qEH3cptFBi4aY4hTdj+CXm42EjvToV23YPR55?=
 =?us-ascii?Q?Ikz7GmC+aDGpVlKsZiSgLI1tUCxKgW/HgeSWD9rSODBWsqSDkvDL4F6z0EVU?=
 =?us-ascii?Q?Veh9KOx2saEja09AxIuovQWK/BUN2bmqVWD3nqZy3YJyRkjhtfLknSG9Vtgq?=
 =?us-ascii?Q?hOrcqNADbeY1gqanuty5VPX9/P7GtHfN9ST3jiUONDxGXe62f8VUqsYNgNJ9?=
 =?us-ascii?Q?F52/Tf4S+5DTZlYep6aNnIzN4MeYUQCRmlT4UPkgzT7vPJaWkpQ4kexKg/NI?=
 =?us-ascii?Q?s8TyS5DVNEG3p8U6H8mpLUS1q7134OAIvBeywMo8ufDFdC8zYAeDU3S543R6?=
 =?us-ascii?Q?HsimWlq2/rQvBGkVgsPWvbcTfK2tECGk3QNWcJmrA8gp1OdC4v7trhTjvJaw?=
 =?us-ascii?Q?lQt10EMqfJ7n8PgFnmAWHwpAAcAMG8KXsOBUdgsuIcAHVjg8aNB1W+s75rm0?=
 =?us-ascii?Q?nAoujEQJktCOlM94AgiPESoDQl35dA1uGVC/eCJHYvZ9wcIAaOvp4z+YuULJ?=
 =?us-ascii?Q?k5l4POYgPi2GVpy767hDeNd0pLagWSX5hi/xjNlTeVLYKCdT/LSuP3y7o/ve?=
 =?us-ascii?Q?uCuLI6H+g1EInh90jpLcICIuMKH/tn02dzJz6JVjngd2rFUN0yaqO6c7Dv26?=
 =?us-ascii?Q?1MczTTmQb+TlvmG/aG94aCEazbnOZ2a93o9lm5PGHIwBNcc4U5xUXbWyvQEv?=
 =?us-ascii?Q?ImcyxdBedmUPYKLRQMzBQq1hiXhAKVPibu12WGz/x0vsy8xlU5dxJegYG/Q4?=
 =?us-ascii?Q?JEXMm9C66I7PYfs/PzLrOM3YtK3PBEXgPg+hSJUt2Oepdpr/Y0ZBQOLwpzdA?=
 =?us-ascii?Q?JSkoiYaqJ9v8bmHN4fakfFYlJmaSac191JBl0TeoqL3ehGATrU2izPeFKey0?=
 =?us-ascii?Q?YW6pxRCyHbugQ4okaFiPf9X0/x1bV6JG5AKJBy6qU4kIo7yn8yL9V/YWHinF?=
 =?us-ascii?Q?+zzdTK78/4lgJwndJmF1UE/zBwuTldKCie2QDeNRC/1/nmUIPa4c7FvQQ1mt?=
 =?us-ascii?Q?Rkc1iljsJnGksoptqUFiOtUFre96qEstaPvHMqrkIldTXgOj+La1cnD6f2Zf?=
 =?us-ascii?Q?D5/w7HITNRwpcNsLrzqXA1+BCwtsAL2i4bPH1IWdmOCrVcmRJiJZ0mM4fbh8?=
 =?us-ascii?Q?zZuJYGyMu9AU8Cx1LLY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 09:30:31.1716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa5d41bf-c720-4de9-8333-08de324e9a6c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5818
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 03 Dec 2025 09:30:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19323

meta-ti / na / 90f2cb30-35ff-48cf-a6a8-5edabca062be

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
FAIL - [kirkstone] ti-linux-fw: c66x DSP firmware hang
    WARN: Commit message does not include file/recipe name: ti-linux-fw: c6=
6x DSP firmware hang. (COMMIT-MESSAGE-2)
        patch
   =20
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




