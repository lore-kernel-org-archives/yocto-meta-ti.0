Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E21EEA869
	for <webhook@archiver.kernel.org>; Thu, 12 Feb 2026 22:28:17 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.57847.1770935291844217106
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Feb 2026 14:28:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=w1J3x74T;
 spf=pass (domain: list.ti.com, ip: 40.107.200.37, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDoNzfoaKk5uJCUKNv/ez+U1EPFTTubwPqQpWBOQgUXPCvx0Hr81vbaaBhb2Xfy2nWJQiyOdWQSjkJJPE4hYOJA7Ln3iZCfU21jX7x/S15lR41IXFSuyEz6uxwEvBVTUscZeWk8wxIO1cDjpHkCgF6y/ODBdeyZxhPiIqxLFC/dQj+8JTyaHTo1jaFNXAHT1JkfqaRPGmq5vmDdCGz7F7Gu+L9iHcQiRBGVcvxwfCQnvECwLVq1FSR7nEROzLE9E+YsUmqQAUe12H4OeaLIFBHhwH2jYh4m7sTJ6BWLPzVp5q7BSqvgIvBJmNehhAUSrIbi2Q3NY4Dp1OovFGGK+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GsGBb3Iq6zEx+FH4Z1obmyC67IXbmgoIrKUyBs5f9W0=;
 b=Q1WCSPRb+1LceYPxRPka8mTVAY1xrf4QHOOOPx+s5hKUDasr+DZUkEgs5TMR+MVRfjRhphp8YFNoylwZT8RGURK4ikGzgPUkKPB8PeNNP4AFNH3AvqqQh9U37uoMq4ZYuCQMAeyUSchC//KNLrJxiKt8oz//lWvkXDfGmd5lMm+bwuB6//WRPl+es98+k3ocglnjJ3aVYgY2avbn6U5mYYDn45y2YQeAKOHKoBhd+OPLhMsCqzJmyN2u/Y1Lkm9t6sSiQJujUsV5nD9Xhfl9y32VlLaNjFKsfOpchwGg77IzFNO4l1bOGpmKPQSMWszAztWC5p5GgmKqPL8MkI7zUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsGBb3Iq6zEx+FH4Z1obmyC67IXbmgoIrKUyBs5f9W0=;
 b=w1J3x74T/DvSUz9lQ5N99U546eW+PRK0qijKLjvFZWWXw49ky2HrLQFPe7DifFHIpj5YWbCrG0PMHWrG/dd2dFSsiVnNAkPO+9zzz2Yvw9Op4yoUYrymK1wSf3SFMy3j0ZN3/XRfh3H3drl8byQe/n6wzvFolqmSgrCYbVwJHlO6+3WY2LqyvjWyiHQlHVMfU1wkJtHPMZeVN0Kv3Tf/ux/U91spWbaMh1PzObnzyfzQdTOMjWAVKrfvs+VgJMfxIgObU8y3Td2qhppO31T9LgaN/prH6fHSJ4uBYTDitGU2opDZb4a8wEsWBcpB78FT+JeOAVHIlizdcSpcsY9Ejg==
Received: from SA1P222CA0020.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:22c::21)
 by CH4PR10MB8002.namprd10.prod.outlook.com (2603:10b6:610:23d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 22:28:07 +0000
Received: from SA2PEPF00003F68.namprd04.prod.outlook.com
 (2603:10b6:806:22c:cafe::3f) by SA1P222CA0020.outlook.office365.com
 (2603:10b6:806:22c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 22:27:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SA2PEPF00003F68.mail.protection.outlook.com (10.167.248.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 22:28:07 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:28:06 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 16:28:06 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 16:28:06 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CMS69X150817;
	Thu, 12 Feb 2026 16:28:06 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 215059ACF4; Thu, 12 Feb 2026 16:28:06 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2] optee: Update to 4.9.0 tag
Date: Thu, 12 Feb 2026 16:28:06 -0600
Message-ID: <20260212222806.416753-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260212221955.3319340-1-reatmon@ti.com>
References: <20260212221955.3319340-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F68:EE_|CH4PR10MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 69754e2b-f6bf-4888-46f2-08de6a85fef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?St5i+rGxGooyZdPcHCuKB64sax334av1xbWLNZPk1MoEOXanR0Zj5O2QToh0?=
 =?us-ascii?Q?lYEmyNHSR41GV741FcMGYVMDqvBVMSdYxtsg+EPZ7YqDQNbENNBG/AA+JXQG?=
 =?us-ascii?Q?/huWERFAu9avpz0WOhYGIHaHYqpegaMHLzB9dpf/FFU21UQGdOROnyc3zmmx?=
 =?us-ascii?Q?pJehobhOCFfCqpLucIjT6DxNnpNOP6Bdp+RiNCm8sN8f0k87ILG36/4bLJj3?=
 =?us-ascii?Q?n1PDDBE15cSkKFMr+yCa53v4fDYbmlD1NMq5PdKJjDoIca00pMeGmeMjf1eG?=
 =?us-ascii?Q?8wmMDLelwnnSVTeCmNiwP07zyLc3gvcezNbjsEUt0fIRlPgqlxO0YGqqZVya?=
 =?us-ascii?Q?cIr7QnOcRSwJIw6phrPUO2i/LCk/jzIfNpn2z8M3UrqCyhHKcZbgbYJV8YI6?=
 =?us-ascii?Q?oh5RAxkStjTRf6AEnT0xOA0TrY/ofxSa4arHGJXOF4vMx8O1SW48Qio9fAPN?=
 =?us-ascii?Q?RYXxUPDWOVUScsCpl+NLleOwOpbkuPsD1oaL+nhKcs+YOxObuLRbOHgOgrE6?=
 =?us-ascii?Q?0N2Zjmh95tkGLh+P4/aItNYfmvv2O/TE0o5Y3C77ea2tMrbizRLI7c2hpFsx?=
 =?us-ascii?Q?EMVNq/HtXA24XTldPsS3iF3DXsqS8P03G4uCCYN6iq3W2waOTaPO176Ppzi0?=
 =?us-ascii?Q?yiuX8Mzq15cwhaikCkcMZ0aZmRjHae2Ig5bWAj+rs/T78ByJ/u5dfYDBO718?=
 =?us-ascii?Q?hz5vc463q4ciJIgawmwP/ClzIsjZEN9vhe51e1FBy/Su3eD+aqrw/YHYK0Ln?=
 =?us-ascii?Q?dGFMbVxZEqeGOdvYnFSbcPR/9Xp2Hsi2g918rgVXRdX5/IoFUVDlzVA1Gy/2?=
 =?us-ascii?Q?TonYkemis7lKMe7u68f6ffDjrXxnlYi1GiQ4lsqqSeRa+PIkh7YpXuH7Bwny?=
 =?us-ascii?Q?uiyFq1MUdOFJRLbrBUVoHowGfMgpm8pL/5Xf9a6OhOeODeON5JhCPeuJpdru?=
 =?us-ascii?Q?vxW+zCt5ogPHBBbPUAWKt9TQHpMbxQUzBcFmG3CTg70vatadzFWDFIfqqXIX?=
 =?us-ascii?Q?ukPi55sOBYk76cY4clF8XhQi5F9iD0G1MNtFPmdF9bkz0FbhIgjRqqxT7klk?=
 =?us-ascii?Q?HofyWtupQrIECi6FDA1Uv+PWNyBYTeIqk/AVidBB3m/a2BCPNrdtgGCiQwvP?=
 =?us-ascii?Q?WCmEDEsau2rHGLG3iTcV5+8IsC0ocR5DmA6QVZS3CopeTGs6BalvSPSOTVLc?=
 =?us-ascii?Q?3U3iUc5Oz71NRqrXOpv3KqKVUH1H8riOalNph1cl8vdpoWSOjTUe2/K/vnhU?=
 =?us-ascii?Q?D3Xt1XQbZfSEcMa1fpEQ34tNThSxdOYBN9dFX0sCf/VmD/CtOVnGL1X2NtPE?=
 =?us-ascii?Q?JsfTtHyQDgEBjbbcBwoamEwgd/bf+r8CWGKYREi3WFg02wn+GmU1A5OneL0d?=
 =?us-ascii?Q?fsbJqpwHYH63JKIgOQYpgeZIyyBq488xyV9vSDA8z/2B5Oc0mXpobG7yajjx?=
 =?us-ascii?Q?sfQMtiTFngCim1cNNNJHFtkog71kuBb4/9uiNuzpxiEIte3CVbpFNwa2Aml+?=
 =?us-ascii?Q?apPiULuz+obDL5NSV7vR18SrWdtUsUuxnP1deC6xWFyrtF4XT+MGNSU4tADH?=
 =?us-ascii?Q?KWHs+SC1HC+s21d3SlrXlRH/nDFI2z7qBdWwchyHR1hgwXerTXauPispe2Mq?=
 =?us-ascii?Q?Vsz+d/Z/UG1WAuccGEntBlf2crymeQTBD0AV7sO6qjHQ?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	boAlmvyY8b9a089BUp6q45reSNy+iyh1NFx4agSITAUDlZA+846UAg/AiKcJE/rKSj5/aB16vMQ5ezZhmyHtzE21Cob/wWzEzFWcVp78TFBTxL6DpGwJlyDYJCLs2Bv1cO7Jt+c789m9aQ2mg/S/RG5QtTVRvft+Pkt2cMxvLAIFagU4UwYwZc4nruVoOV3twauw69CP4pPsmSNp8yl7TkEnCurC/luyS19UR99Pv6ghWQUZ4rWPX16O5YnWj4xnN1E5YVfiTYCKytzGIe0UDdcj/o7I2gd4aTxj8WuqBqmQU8wC454IlVXnJJmTS50hW2cpjr1S7KN7UuzjyabT4tOn8E76dQJvjzLh+pmAwawafA57SPtkhMiYMVFdzAzBm7RnVEOGbpQxwTzZHaFcvAzMPy49TIeOihAIixdrwjTc3cPziQDCTCgFAHprU0WB
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 22:28:07.3074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69754e2b-f6bf-4888-46f2-08de6a85fef5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F68.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8002
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 Feb 2026 22:28:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19509

meta-ti / na / 20260212221955.3319340-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH v2] optee: Update to 4.9.0 tag
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
From: Manorit Chawdhry <m-chawdhry@ti.com>
- Date: Date: Thu, 12 Feb 2026 16:19:55 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1b10e134d9d91a01f9b3fc28bea2eef30=
32c8fc4

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




