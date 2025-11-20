Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77CBECFA457
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 23:17:53 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.994.1763680671028576030
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Nov 2025 15:17:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Xf9kdaQ6;
 spf=pass (domain: list.ti.com, ip: 52.101.46.67, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wXdnatjJGb35D3OQa2vWtNdiq3T/6zfPNHDkLIoSCcqeL40lxNBlyfrRJfMajcxCK+msEz7LNv78llcnWsDhCllnRixkXcIyUfyE6En8FnzQ+dl13qPlc9ml1WxcQC4DHhUaO/+XPLOJBlB2+FjQQDgVb+Kd+nZnfwl9S3KRS+Sinf1ZuLGgU7+Mi3dWBj6/kCIME76OBTmpESdOOimBMbmRGJ5TzwbpLCBgMdKVNgk6dMP2cDw9FRljgTxvkwRKP4vjSL/jnbdPzFBkKDT34/qAA+zA9BrofYVKniJCMhBlU5FtlKNrpiNHhvH4hS3BJdHy5CtW8Yb4kDLAv6wq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RM/OtoSvHYM+ZKpjCoKr8DmsRA1IJCltMD6XoXpeYYc=;
 b=A5fRtsm4IZZslOjz/QI/IS+jJ7MXCStY+VN0XhgmYONVgdiu9AqBHo+r/ZFuOLkU5bCuxMRLmVvpAqnlRSE2JKFGL/wlU13f/1IS9HpS3PHCI6d8QdsKqJtQUj0WWrC7NGgR+rrhuQ3xB7LvsPnmiJBgVC8ZsOb+dZQExQwhWeYc6ZFDoO6PdVFl/fdQEpA/ygPZVsQUetKEpjwEymhZ1HYZF/Ypux78gfGM4PBZdVEvsemATBFIsY2Se1V5TvrtAqzEZA4cIgxuff4GAZhhr6MXtQe22jhpDPWX3DUyvhjxgQuSxlZnaJbqD6DdR1ql9ksSlihozdljSaIRpDYUYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RM/OtoSvHYM+ZKpjCoKr8DmsRA1IJCltMD6XoXpeYYc=;
 b=Xf9kdaQ64NVIPhvCv7TMRF4UVEx8LK4rWhFcl1rEyI7aPgeuq7rTpDWeKjsmyDsMatxtEO8MNxMzHscMpmiHK0WPo/bHNaY5GvX5rm3qY6liQMAbwEVfD4+LMIDRGJqx8Yxcqd0u7fV0VH6PSYGm8mMCSXgS6H7/huecvJuvMoUHhPkj8ym0NDdK+k4amsXTKpH8zKotvVJzuM0JYr1/c4Tt+8vOwBvQeZk357+Hi7oi46ubhCL4y0e6KU8puo8hORQsv54qxfCHpF283s02ElvC24XaDAHDpIhJVKGNJk/jCKoqMoRtdCbuQcmlistOscH7XXuE8Y64BYA4Pw26Qg==
Received: from MN2PR02CA0020.namprd02.prod.outlook.com (2603:10b6:208:fc::33)
 by CH0PR10MB5065.namprd10.prod.outlook.com (2603:10b6:610:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 23:17:47 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::6) by MN2PR02CA0020.outlook.office365.com
 (2603:10b6:208:fc::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 23:17:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Thu, 20 Nov 2025 23:17:47 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:17:44 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 20 Nov
 2025 17:17:44 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 20 Nov 2025 17:17:44 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AKNHiba3190023;
	Thu, 20 Nov 2025 17:17:44 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 06FC89ACF4; Thu, 20 Nov 2025 17:17:44 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511200845
Date: Thu, 20 Nov 2025 17:17:43 -0600
Message-ID: <20251120231744.245564-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251120230931.1485281-1-lcpdbld@list.ti.com>
References: <20251120230931.1485281-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|CH0PR10MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f2d2e03-df51-4f3f-0f73-08de288b0464
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?W8enx/+F53QqJ9t2WgxsuoRGxbgXzsRAm0bhyGIz1oON6aouPMLEdqQB6LRY?=
 =?us-ascii?Q?8g3j1jJdiKuKe9vdOS6hLTrrCuTKuMwKl6OIU9BJy5IL2Owj+9Bj0DjwqTd+?=
 =?us-ascii?Q?UYZ4NlkTiv4yDU08pX2+UKDzgU8ZNzkSA3uhBxd06S+fN4wH+FzmeZE1XIDF?=
 =?us-ascii?Q?Bhl6YSAkQnJe/JUctsR+xfeTBlgvMhvaBmzMkyChP1WTiEDsyQNctoPU9t7E?=
 =?us-ascii?Q?K+oMaNLKMcgGVhaBG5xsatum8gigJKs0qoiZGH8GL4JaZwAYIrpF0mAOvKVs?=
 =?us-ascii?Q?0c/EFoAoiNtVAJSoLT0fMSOSGbQNMWF36A4rbELctzCEvxkTzwOziK9dZpQZ?=
 =?us-ascii?Q?ekX1b/QgkFDV87o2/NJEnV7pqgweLvKo4xJrUtLsIXMjG60oise8Ov19p9Y9?=
 =?us-ascii?Q?ZxwI6dfp1CWwN6LBuhhKbDWc1rt56qApGibb2f2oZeX4dsh9Yy3HksQ4IbJp?=
 =?us-ascii?Q?pfIYObuQjY1skiZK1wGrQVSurX0rSXwtSqWcXLgqDcvaEGgiRRJZ84QCBpz5?=
 =?us-ascii?Q?pprMSzyWjsIgz0yjljv9lpSScIbn52xDcwcnk8pbsxJHbErZ6vKgBHXrXHK/?=
 =?us-ascii?Q?OgEKWIaw72A2gJ7W4y7zMJ60C2CCBBtGaOW82Qq/w8BKsdJZMvLk38T47wuD?=
 =?us-ascii?Q?Xa5vdOkth+NLdgGHvWqi0kVxSnRwIdSeV4MC/KdgAa+RkOH+VRoAP1gWM0ZU?=
 =?us-ascii?Q?B5Wak+quek7145ThpMUeu8wV0170YJ2JvvtetJWqvs9m9MDxKVSnTkenm6h2?=
 =?us-ascii?Q?v3Otxe1rsBxdqTb04PQRiNRa0DQnEmfij3cZlS7E/xy9NF8Hz5hAepqWjRxM?=
 =?us-ascii?Q?/1utRO2DqnoATc0R+2lxiHpAv+64ttnpXv+44tI7KIjqBk0mxheRacG1IOUu?=
 =?us-ascii?Q?M2z1OWGn9aPxYRtnmVz5QPYREnwqxRIeYqN+F2gdB+sH98aMMSkUdRfIQ86e?=
 =?us-ascii?Q?kgJdSa2QTxSN7Td7vBRkJLFxRkR5pjK4NP+ODM77OSeH/lFxfMFJFZsdCE2w?=
 =?us-ascii?Q?6AC1pnJL8NUTXaLcv3jkDOcvDKtovKthwLR3MLu4ClJZ9jJHZQI9nwFL8Mb7?=
 =?us-ascii?Q?kDVemJ9H5Hp1mLpsLmALaGAm0YLJTq7lnFaZX5ITCiDbH8K2tXbPNqhm90r+?=
 =?us-ascii?Q?wML/6/n+9sGqv2nQbQcn+hpCRIPa6/CJvO1uY2RbM8clz5cYCRM4qvOuTu4Q?=
 =?us-ascii?Q?kcbwPzZaMKyhffhzvH06rRWG5Jeque1jeKsjE32bO2h3h/BCrK7F24TQeOVs?=
 =?us-ascii?Q?Pm8HU9Vt9m4PPEPzuTWTrcGuf/lnvgVGuAQuMWNe2/RBv1H2y4/Mz1SNRHr1?=
 =?us-ascii?Q?hBUieMFoxgGA82/cy/RL/4NmUSGR+dlq+8VUS4vSn7+nb4D+lQl+wkEM0zao?=
 =?us-ascii?Q?i7pITzDd1mM2yMlbTHj/MsV5XbAUHgLZMw3505gvq8jprlnD1H2ulmPhGXXN?=
 =?us-ascii?Q?CLxu2fvpUT91JQ0ExMqYbUV4WT+YNaG+1dRdku7PSs0s9VkJO4Sq+ZbI8Pg9?=
 =?us-ascii?Q?AbbamcMkXludUmPTMWbH8svwhMh0p8oZ1ka5N3O/XMovYIVjBh+1jSQyFnr/?=
 =?us-ascii?Q?zTZoAmaCQpnkCa+dMvc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 23:17:47.0248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f2d2e03-df51-4f3f-0f73-08de288b0464
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5065
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Nov 2025 23:17:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19299

meta-ti / na / 20251120230931.1485281-1-lcpdbld

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
WARN - [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202511=
200845
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.scarthgap.202511200845. (COMMIT-MESSAGE-2)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202511200845
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 20 Nov 2025 17:09:31 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3e833ca145b843ed34d73862c46b49132=
eec246c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: layer: add github MIRRORS definitions
- Commit SHA: 3e94609a1c25c1a2eff6cc269d3720e5e6ebc578

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




