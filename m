Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11830ECD6FC
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 00:13:01 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.34])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33752.1770855175958770604
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 16:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=QyocTqs9;
 spf=pass (domain: list.ti.com, ip: 40.107.201.34, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RakU4Afvfz9xRdJKY5Pc+Y0nUuxHvyUvCs+3ysxgIpJwhZVkCWEuR/frYbw+/UakNkUGolqCkdTK7aZ4BHUrsy6n5E/AOdfDly0nUXuRH9sXpNHZyz1G4gfLl1mnuPPFnrHiTbJosBURZje0ZnMn16tSJ5s56y2qLJMGGKuraq3p7y+U6OEaTxHUnO0gP8mWCj5Zc6jfoP7M8goKp6dSWCMxLTADjhjC506t02La23HX4HMU1vIoG4FQaJHYvhLIhNfobOe7vpyHbV+HXwxoClcH+J35vuWh4rTQZzLKDDtmC4W88ASgDDmTVD7SM/z/2JX9s+tTgJsR9BApgprB6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1qOvHfT5vVIJBTMuE0nbOt5d3dzpih5sX8AWopVh08=;
 b=dS1CPYqYlHuzkYKpY22IEUXEvvx1XVxmdXHmj44Qz4YwDLCiwypXOnBbWkdDLL9/0wZWfhLnaWMpzSdSdK4yRSSA2uSSmveQRfhW755OtEKku47GhdHoupxCzqVWe4LIaMkG/LGwm00Q5EmXqoyypFZjwvTyEpvlmNHiTq+EE41afnnrG3Hz+m6EIPPY1/tNG5xDE4J9XSQ7/idTjecgy8XedH2cpiHPO/xp9FvuF6v98kiJfVwfiGG0Dx66cBs2MKBxZrNbW0Nep4a8APrGRDn1Ojtdf4qI28i7OO048AA9zCXVTeXTQh6zZUZ2nZFhcmANrnX06ufpVqGUMMyiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1qOvHfT5vVIJBTMuE0nbOt5d3dzpih5sX8AWopVh08=;
 b=QyocTqs9UfIDZRvZ7Y/JFNNm5BeJa1CxJ3UfrRZx+hXJOg0bFZVI1JQClckMEhOMnE7wbypqUynlqffW9R2WQvGLdRq5MfiohSApprd2CGArkZ2g4u8XOIXjTC1WhEsjUNZCkT9dsm0hMinLLpyhsUwKHqaRARzrklNQef2Dst+IYfn2xvSxADJAhL6ST6FJ/3TxNfC96v4ipeJa3w6U4PgDUZpSMYYgqL9THas7v3oZRWJhjeHWTBnwV/x6jsW+vk57ooxiQtChy9UGNmctNVkBXWjIwhA4rfECm8HevZiziZQIDv38KSdBuql7YiTiGseOdqQiwuL2Anf9GEukjQ==
Received: from CH3P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::13)
 by DS7PR10MB4879.namprd10.prod.outlook.com (2603:10b6:5:3b0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 00:12:52 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:1e7:cafe::d) by CH3P221CA0028.outlook.office365.com
 (2603:10b6:610:1e7::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 00:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 00:12:51 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 18:12:50 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 18:12:50 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 18:12:50 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61C0CoiR3419842;
	Wed, 11 Feb 2026 18:12:50 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DADFC9ACF4; Wed, 11 Feb 2026 18:12:49 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v3] ti-core-initramfs: Rework logic
Date: Wed, 11 Feb 2026 18:12:49 -0600
Message-ID: <20260212001249.734587-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260212000026.1988674-1-reatmon@ti.com>
References: <20260212000026.1988674-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DS7PR10MB4879:EE_
X-MS-Office365-Filtering-Correlation-Id: e2f6e1e8-82ab-4029-2fd7-08de69cb761c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LsDGBgrAf2A9nfj2gtTWnkuuHna/zsvB2uH6mOk19WVClMwOPVuq7Af/rd0Q?=
 =?us-ascii?Q?dhCOmmHJsv8FVcuFx1FQD1jpTHuW/JUvXsllkx2JTuDuf4qL5lwgRHR5kdGt?=
 =?us-ascii?Q?k3G57D5jL2hFgVAfZdewTAmdjJfZhn35obA8/SALIMTsRzCyxRlCsvWpTCk5?=
 =?us-ascii?Q?om5omNgD/YIArzxkcWjQRrYpQukUKXQL184E6ERmwm5gUVUMuFhrKJm5b/gg?=
 =?us-ascii?Q?8iqpQHQ71sWnW/ikdhaqVxI4DQ8kcUx0FSwEKVr+DCiuk5X/TcmFWSO5U1OI?=
 =?us-ascii?Q?PEQ2/+lvP7SztmcTsHiGfUpNudAcdHRGcx2qpOCOVOIeCK99K60NjQ5QWV7R?=
 =?us-ascii?Q?FeNo4s0OZeQ4E2yWIWJSIsOcdxG/I3rueikXGP9H5Rgun8ZWdfLMAsSp7e40?=
 =?us-ascii?Q?0tLYH6ktBmSBVEXE+7+b2cOt9hsUXaWPHZPt2nhAYpb9KsRSyuPTgY2w4NtN?=
 =?us-ascii?Q?loVniqCzcQpBrMVG/6Qa4J2LxrrwSr81mQAHFvQeC3HNZsyckhQZJSt+DsKa?=
 =?us-ascii?Q?ySAPjRqsC46F7S/1nhAA+EoNVGJIswqkeZiSt1FzSBOVXzDVyQQkZHEvC8ly?=
 =?us-ascii?Q?qmyGmDSVF8lS66hPpog0t48r2QA1tvEin2qZ4J2Pg8eRU6U1pk+S7W5qZ7jH?=
 =?us-ascii?Q?oHICXmjlXT8Q+NpEltl67fD4ZDlq+TTQmHYO83QBPhvZCioOWnuonW89Z4mW?=
 =?us-ascii?Q?D6E/+5RJtBvDCrGuAj9lG25jf6GAbBJp1qD9DYa+TyEDHTMs4xJkMfR1zUSU?=
 =?us-ascii?Q?AqSL1pdcQBz3NkEbkaQRYar2nAntBtzNLbSNx32GfAn638D1AZObXJX5NBxU?=
 =?us-ascii?Q?wbGCbjhMbt8x5uNqzWnx67sBe6lU3IATOggSo4/yar6+GcR/CDRYawLWk79u?=
 =?us-ascii?Q?QnuubfthDaWOU6iAMx9pXUeUHI/a4ZA8O19CCH9aKaui6/+s0uDJH4BR8KmX?=
 =?us-ascii?Q?m3aEPZOvNmWyQjXIGggmR3tvTWKtOsY4h8ABCHsKH9GXDz9FyNDSn5K4hrDC?=
 =?us-ascii?Q?2oFti23aO1NmX37YukP7UnUDpeynTKevi02c6kBJyCY+WiswkrrU4knEGyQD?=
 =?us-ascii?Q?D9DchdwrUtw9VQp/PndehqaNUmE0J1r4HCsP1L8gIoxZqfV/yx7elourimpp?=
 =?us-ascii?Q?MhITgrMRPSa3qNr7X/RWEhMRYiIIPhsM8lZa379tDB3B0zt0y519hiWTjNdb?=
 =?us-ascii?Q?e8FQqlVpvgkaDVUemPtT7dQQv0C1K1w/yLDk13ZRU6Gx3vAt+p3sTfx4gW8i?=
 =?us-ascii?Q?B+7L7bPVXkE/+RoVb1m069zOZx1vcyVRMfYev9GXAvw+JsGCHETSNAcXDdpG?=
 =?us-ascii?Q?TL35rQGSkSYT85a0w5iMAXRmYYLg8RKfrPu4DNDM9MTnoRjoflJPuR/m8Q+c?=
 =?us-ascii?Q?TWVF6NPOeE8+JgYTOmzxMRGg2Bp1Cudd3DRX088l5DMzC8gMc9CYd3p0kvBf?=
 =?us-ascii?Q?91MnSha9fdF/DxlYNar6iOqkBUMU9dFVidBBjp8MfouIYqlun03xVqZbpaf0?=
 =?us-ascii?Q?eGX9QGZeOAWkoz4gY5pCiAe16PlpuH2aVCXZ8ZhtqhuLrWse7CrAkDhlhbaV?=
 =?us-ascii?Q?xqZdwfz/tKZQW83BGO+S48Ix+hyRM0FCj31YgLMYEdOQCW9cqxAcnyGBjtQn?=
 =?us-ascii?Q?71TMe8I5F4uCmKxG7XOKIp5WMWFwCOw6DjCvuztog6PQFXYQfOesdrk0+pGT?=
 =?us-ascii?Q?oiQxAg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iZVei3NoX3OBVsDiT2374ux/h82ABR29EzdIcq2x29V2MHL7qSFfDpyQSBkejNU3ZEmsW7TnXrIP8VU06hrHUZZPGsWpA2uHSRR4uPs1R8w+qTEwoudqkTgo160rW940gJXafz5o9wXiS/u7hE8gjylIx0aLlIWLivEc5tyaCWkzuvTBlllCcHicthSAupaU11Xehp7SWMCuSPADFhn0pK0mHVQBiCC/SRNnczJEZREZRD9HAhZYtVRvhHeKVHZXq0NPyssPMo6CreLDfj56nC5gSeeYY1g/m1vK4bC9E9IM4BJ/HrwnSl8h5w9T4PkvHn2kVu2xorctyjjviKSliuX96ycfofHH2KFQGnYcag6U2R1mr/WS61atgwyTfwrfTIAJ0nILj7wULEdcdmA6wcD0uIGNt/ZLsTXKlNjPbnX2urg9t8BIw5bqpSBjuqSt
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 00:12:51.2989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2f6e1e8-82ab-4029-2fd7-08de69cb761c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4879
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 00:13:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19494

meta-ti / na / 20260212000026.1988674-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH v3] ti-core-initramfs: Rework logic
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 11 Feb 2026 18:00:26 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6834f3137e55e9180c739afaead6c1787=
53d2ec8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202602111800
- Commit SHA: a6bf8a8f6ecbd6c7f8305690a9a0dbd0f67b576c

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




