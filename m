Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74DABECD6CC
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 17:20:38 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24670.1770830431057856590
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 09:20:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UrWZHodY;
 spf=pass (domain: list.ti.com, ip: 52.101.53.7, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7+hVotDMu+LI4MzU0F5Y6lAvAIU600VWQ0SbPKPednQdkVL5GIPXsQn9qkc+Q+itvMRMfb8ck2RA609X4STg0hfaqJtWO4yYEnsPZfWTnjJjFcs3OE2IMjyX5KPOjGI34PVha1zF+Ma0cr41RiF5ZHlIS097uuJfOghgiOBcJbZ631cGmsrY7eXJV0bCBsH8IZWPKZraLbyYbtQEGzCC4aIsol2/mFx/FL9y4h9dMxtfcDmptV70ZQFGm5tqfzARz5RMbmk65O0UuYuHegeFv5q3QDhX8uUhTsCRY+OHlNzbL1FCOZ0Ayf/8L7cSYEMP7N0cpaI1K2soxd1biXLYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d4p9tpHJy7a0EZBNG3wGHFd3YgIsFSuD6z3lElGObIY=;
 b=dbeBUm+74qghT1eHR4HCoeBMCRDBCPN+oBHqvxu1vVvKeKs+mbAunvCEZHmtavw+7WL718zoBmxGYTm/5zMS9WEao0XlLxcs2HxVvjKyb3dU+RL+MjowkmTKhcycMp/NqBGio6dtsWQ781GXhZ3ZLRIPJMKacM+k+0RHYmLUJ9gCEjXxlU6cDZatiHy0kfpmk/W88RfJv/kp8DlLcqRzvENWZNAhMXBR0My7aSMMxXZQB6up+PlMzKQbrdHZvwrZFl2ODB82Pej9ubaa+v0JO7lXGtU09ZNi5rgucJVSlaT3EyyqaP5Sfih9DPHUt/wj5d91Xx/4u162F2vEeIj7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d4p9tpHJy7a0EZBNG3wGHFd3YgIsFSuD6z3lElGObIY=;
 b=UrWZHodYk7I6aq8hltIH+SYesonhpxRJjHJg+PooUeBgsUfM9Gs1pkaxH9oXkYDQ9FHuIQBnswhf1Yo31naw3Ra1kkqxNCDQxrRvPqLS2wGf6esSTWh0MnAAG1UWhc+tpZD0eV7sMoBT2lC0iA4RSzgfQ6D3ZmLQC3IrIOktbKbeAYkkRCwmCsBjN/GGbGhHm0+0DlS9IswUZDgkTs88cXwWv8Pmt2p97JY8HB+3AKRc78n3rrbgMyDB2vMuOVej1ax97ST5847XWwovB29s6lD6x1Ax/3rVHSRHDdrYZ8yTiiQ3A4lOXwSJwK9G6spqKRA/Vbif9WeoxAT0zN++4w==
Received: from BL1PR13CA0132.namprd13.prod.outlook.com (2603:10b6:208:2bb::17)
 by DM4PR10MB6792.namprd10.prod.outlook.com (2603:10b6:8:108::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 17:20:28 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::23) by BL1PR13CA0132.outlook.office365.com
 (2603:10b6:208:2bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Wed,
 11 Feb 2026 17:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 17:20:27 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 11:20:25 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 11:20:25 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 11:20:24 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BHKPIP1596285;
	Wed, 11 Feb 2026 11:20:25 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 20D1F9ACF4; Wed, 11 Feb 2026 11:20:25 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Vitor Soares <ivitro@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
	<vitor.soares@toradex.com>, <francesco.dolcini@toradex.com>
Subject: Re: [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
Date: Wed, 11 Feb 2026 11:20:25 -0600
Message-ID: <20260211172025.2523511-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
References: <4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|DM4PR10MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 70833766-bcdf-4d2b-a856-08de6991d9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xPZTaFdiK5Eq0gfsg7OOn7u+zfD9kGwnzz4LkjLxFyo7X3F8nP59C8JITSH+?=
 =?us-ascii?Q?QVeBuwbt+ePbfKFqwm0LND4Qj6IiPuUSAz0ez6rpkL3VxyK1C0zVEbscKAx5?=
 =?us-ascii?Q?YCr19LlIgNY6DSAYHQm/a7s04zBzwqtXEkwkFz08hVnoMxayqQDCPw8rR9ro?=
 =?us-ascii?Q?l9MFIyj389zAmKHoLo/q8zxU46u6BWqP9Ttpqi1z+hG81BPsCMOmVJtF5roV?=
 =?us-ascii?Q?dD9WazhxPcPIcCVDbzstDwAeSSsZEHevKfi47WROA9pZJJfcCCpN3TEO8J6N?=
 =?us-ascii?Q?8Pa+WcCGe4f7MYyEYomJpp7azp0vEtnugmmI1BXgRh1zisQake5esNpKGC8d?=
 =?us-ascii?Q?kJr6uUMu5EdNDm5xG3LsDztYvfi1oENf0sM/ljZKXdhRtnRP8xJcMctbHBOY?=
 =?us-ascii?Q?fueD1e4pU1Bu5wx5E0mokgoHVzhD36ITwm2Lq4sTvyKTRPl8kTezOSbhKZr1?=
 =?us-ascii?Q?U2jWBur+b/lLwpvEjLeZ8hdaiBKiTxjQtfhUuX2PM10dHN9x8jaIUoTQT46a?=
 =?us-ascii?Q?h1J8HsLnj+PVB2Q1+Yn9B7vkGIy+8MCaxe0WuRdpT9fObakiog/X25Z6Z6n4?=
 =?us-ascii?Q?VHvxoVp2gcHv1fID3xpR7yYp4rpESosCrcWGVgu09tNJLdmmo2Ua84Oy22Ng?=
 =?us-ascii?Q?RCHOjVtqgYzELj1S5nOi3WIMdZezx3f6HP6rY7Xp/IeOAQpAyJgU0eMutV/0?=
 =?us-ascii?Q?yVc899sQr+KNTjqOrFR8d0YgNjePSDt7BNxCpIx2Sb995v7RMGAhMXk93nwN?=
 =?us-ascii?Q?279SIv5RKjs0ckLb+XGS71iC1Zm84HNAbEwtgy5GYwnz5bj36kHwK2vZovXg?=
 =?us-ascii?Q?tFNe4PRC29/chgnT/ZPNiabe2MJhryukV2Rz73hgEBzo4RHLDf4VWkN/aRZB?=
 =?us-ascii?Q?CWOI+pmAXVQx1NvA6WK4nI7IjWm9C/mBOzRhniSuxXqmye3VKPRZUiSx5X71?=
 =?us-ascii?Q?T+1aM2AkocrkomULq8DGhgNbpYhdcIKSNXroarFeM0gVg8bUBc+DbrTQ/lm9?=
 =?us-ascii?Q?TnpYIX2Rih6hSGIQJPmED/fKTj4qBMztaYNE2JnWiIq9bkskmXgMVpOp16wB?=
 =?us-ascii?Q?oyqQd/CYO5P8q6lHwF7MVcBUzT4SiOqx62RL68Va0Zl5fBstH1g/Iwm6n0rv?=
 =?us-ascii?Q?CJ9tg0L9HfMGqKjM4EUJ479x3cJoPM5wFXJ9KOYXaq6NVeeJoGPx36BbQUh9?=
 =?us-ascii?Q?eZWAFxtCFugLodTK+z1i5eaVQN8CKUGNVP6Oth9HPzd/sIt39zONd1OX8kDV?=
 =?us-ascii?Q?2CgHP9gE8BoLaZMV8zivHSOf9Tx0HRjOugafH35ZLMIxJ51/pS8tZdwsYIJ5?=
 =?us-ascii?Q?3VH58MuPOROvu64XBjTKLp9Ar7spmITT1VAhBp24sWOkC3VB60AwAvbA/aJY?=
 =?us-ascii?Q?oHLGzhoUZ/MmvH8dHKAs97GbvHJJNIf3SjT5VDFXXN/Nwt+X1X8WWAwVDvS6?=
 =?us-ascii?Q?7AHEL0GinJ5TgNON/4lgpknw87KBPVCj81iA8b2MJL3ScGdBKVZveCKMaVlb?=
 =?us-ascii?Q?DbiidHd6pCimbHap+AtVSyIRNBBfs2+u7bY67mglcXMIy3fg1MBpBBaZd8SP?=
 =?us-ascii?Q?+pIs3vFCbOrim627fJ9k555wKrAF7gmhfX/AVHlVvK4nq+T5lkdE7Rbo29rT?=
 =?us-ascii?Q?oL/+SaRW1XBn1Cvz2ARQDPytd1nT278DuzFymIqLZ2PguzZ1pkpeNMwubPLO?=
 =?us-ascii?Q?SiqVjg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JOHQylXKAcuhf+PUJzxkK4VyLYZc6BysvWaYBARRtBdwUN/6yRa4mVAPPsDflSiA8vvPjgkY2Xdvcfk40iT3RMw++hjoKNarfRPDHdFwdXpKmxYN7scwWHPHUNd01dZ13uut2RbaErRSb0+0HhgwUwLw4+M8r2YmHkW0PRVKDizX14kg9PCGDTFPPNifcZ7F/mrQMCR/T28gsbrqiOLHqFAzEgS8kZyyr9UJ3z4xVzgSu3t/efzwOORwrZrtNyGFTPeU2dVEpVI05r4QYljcobOgBhCBtrLR0ihPfiXMlhU3LVVx5d60goSADd5U8NhVLoKM9RMraeUs5uF7k+DTXtUAlWj0Aw+O6kwZR3E+jmP9ABV56MVcPZpFBKOTEib0YJ4TgCMBAtBvAqShrm5vg2/Ve60v3+5qhG5Uw9fTC8tnxnDdRo8IO8Qc+B5pukRd
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 17:20:27.5612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70833766-bcdf-4d2b-a856-08de6991d9b3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6792
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 17:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19483

meta-ti / na / 4e08fa3658b1e54add6d5476c7234e86dbcbb60c.camel

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
FAIL - [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:55
            Subject: [meta-ti-bsp] SERIAL_CONSOLES defined at SoC level
   =20
    WARN: Commit message does not include file/recipe name: SERIAL_CONSOLES=
 defined at SoC level. (COMMIT-MESSAGE-2)
        patch
   =20
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




