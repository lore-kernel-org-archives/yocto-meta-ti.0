Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F27D6AB08
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 20:11:42 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.37])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5348.1775160700958437390
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 13:11:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=bAyx3/Wy;
 spf=pass (domain: list.ti.com, ip: 52.101.53.37, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ho8OIaU/Aw+KJdWU7gL6yjneEKHU9bzu19VqS8dyJEs3KdIOfACnrBDOmo8NqAtIrFGSh3hnJurkwKLfxG+51Vu2htgDRgTjybWhSqLQyqCLx0YrrH+p9e/InfpeS8bgrzzAyCl3DltU6PiAOu/qCScuzwFH1tfY0e7j70DzExEV8ZFFn+ITqWyezwAc+sAZvRFEoyQqcXL8z2/CiXB+cWpQeOkPuGAVhz9swBtDeIzMal5ZORypyIrhQzn5HYNU2vwIDgrvIiWkmM3P98Dqr8afXwjbyiKDGj1YuDqn363XjUC07X2D4CbjOjKAnfCmeskaSqwYH9o9KFJs2+4Xww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyToKf8oDDRYmmAXTKdGCQ7ppE+/o2PVSOXOkXCi5ss=;
 b=QZC0zePin04RhHrkwQOGeNVp24BvmpthQyBbsUfOY3W4DluBAW5O0QGFLavRfJuDmu/k9YqoZMi7zMxo99fdso8V73WTKkOyEyoxXBEoRXCH8onN0V1wsQv/WdkzQnrhEHMnnal2A4VFQ0bzPbrNCm/h8DIZFIw2vEI5H7hg2/EJPKw6qu/vpzsNp9M0JkxMeVZFhYNgrf2Z5yRd5OZ57i6rnjaYtFWTRZFygkMzQEkubHGf0bua9TxGl2jdL7pogMJu8tX0Dtqj3ZFeHeA6ZUwkzEMJwGw9Xfo8LPt5KaifZww1dmz6PsMtyppJldrNhmAlIzMPaEdwEQtBxqnZww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyToKf8oDDRYmmAXTKdGCQ7ppE+/o2PVSOXOkXCi5ss=;
 b=bAyx3/Wyy+U6wcihard/syen04UDgvdHFE1TsU8q88uC4lso6SvBn+R3rrzStBgJr0ERlAjXU/2q7V9mLudGhRrohk51htp5O6rrEFcqKUzfeAZlsu9y0iBdig1E7M6lrJyT8sc5q3cEFo1lc4m1DTs2/0pI7msJNw8AhZM4qo48LydDA1S6v9Kszpt2ZLyxc2uHKhCRreksbPBgYNb4ZxLd5lUyYC0nTXmEqMZ0kPQ8QC20V6COkfLl0Edg7mtOlEyegMSyCHhO3a5ZnnB2r/u33SNwvCdhu3TqBupE15JYYZwMllARX0X2Z2T8WtLEU1s2M8AFRvVh3KaSNcFA7A==
Received: from BN0PR04CA0153.namprd04.prod.outlook.com (2603:10b6:408:eb::8)
 by CY5PR10MB6010.namprd10.prod.outlook.com (2603:10b6:930:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Thu, 2 Apr
 2026 20:11:38 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::6e) by BN0PR04CA0153.outlook.office365.com
 (2603:10b6:408:eb::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.20 via Frontend Transport; Thu,
 2 Apr 2026 20:11:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.0 via Frontend Transport; Thu, 2 Apr 2026 20:11:36 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 15:11:27 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Apr
 2026 15:11:26 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Apr 2026 15:11:26 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 632KBQPb3710915;
	Thu, 2 Apr 2026 15:11:26 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id CCF0113F52A; Thu,  2 Apr 2026 15:11:26 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202604020811
Date: Thu, 2 Apr 2026 15:11:26 -0500
Message-ID: <20260402201126.4135609-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260402195932.2018318-1-lcpdbld@list.ti.com>
References: <20260402195932.2018318-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|CY5PR10MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d3751a-d1fd-46f4-e401-08de90f40b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	CsCqJHDez9J0kalr6TLHsrTRMfp2rVae3e76tKLY/7KNdSk4+74olD1eXmDAvgfl5F7crDa8CPpuXEpianRqw/2ZjqHtGHYGMDd5m76e0abVXOZiSwbMOoiKgm6ZkPfLDWGWE+u+8vwhrLckqw3qmZeLAEb/E5m5VL8cgBPEmthRJVF71jHp063QSIK/TJ5arn58h0WRPg0nEKRLCUluyPm8ZBmyiLZSUfl8OwEbvrNXNSVCy27vgQYRqAvLv2cca/78kzo8/okWmkq07TMGsQzYBpeadZ6ahTESIpbeMdpnue8zksCX8CzL6PnDBIPPBMdwp+hUaxVK5Eyr/EzcNIaxPcrB+er0TfpbTpcy6fF84yB9dWz2mGpHPsuJO8q0RPSc4+KOgZhxWhOgpx8NmW5OIHtwj2s7tpnqKlhQXHyJVforKWFkeq0pjtiY1jsIir67DuXYUNeWeDEfpoy18WlpIOLC847yG8iIOKYnRYO0PT12fv5WwqajNDxU3Q3iHl0PUMyxkvuv3zTIx4QgndPePVryUtyPLrwtKIln4JhvXBkgKyjGo/ZQMT1YpGb8lpTV0Zrh1CuKleEQPMJeNEoRG9+q2PWOSp7yjW4wQCxL1JtE783Ae5RE9lAaanc8jBSBiyhjg77F+/NqY+Zaz3A+VNKijziJqM7dDW4KdD7hdrOcnYvv2MH3VAbUNT+albOaEBfYCpRq7ZM+IaaV2MP+9ZRhw+zNYqZIKG0hiYqJuCgmUK8e5oGIKcSiOPNNFEoaNQOuTANzANzajrhulw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	G4xqSXKYpX8W6JXuCjmeR3mp1QY9ySB5ZhCbwIr/qXhfOVw8RQIB6UVg0lF+yvRKqgbmX7GHrRZhnKCs4gXfWAf/x1Ky/JmUCofPKXcIb7+LrGuTTaFiMkf2jDCNunZZAbfkXmaA+3qg27ZTzFB6dxJt/+SVMcjVCrNgdCxH651tMepZO7mRENAG2oy2T3CuqrUhwUuIWDYrs284/ozk5Xw/5TMV4Gqsg2m5+mwx6DHrd0CHtmtipUpfyBdTU7j2DCt0qMhrw5+JjNtCN3wRuzdjBbkMuZyTeRHdgDQFqQHp0UP9tLgcc3omCZP/Pr7ihmRqlggEDtOJS1PEvzkgj4Xhc5WqcnsaCH92ZBYHUi1XZKEgnANW6jCskGCNSJ+Cv+64+e2Zl7wsrVAC39VvV6nHi4jWNO6M4lY8ombRiubU7ZHHySb1le0Zs4/4QPsN
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 20:11:36.6497
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d3751a-d1fd-46f4-e401-08de90f40b35
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6010
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Apr 2026 20:11:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19833

meta-ti / na / 20260402195932.2018318-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202604020811
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 2 Apr 2026 14:59:32 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 835863ed98d0eea02bf81de528e81e1a6=
c53f2a4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202603231002
- Commit SHA: fd73fdea29b758ea6a9994c1c7a859e4be2eb7c8

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




