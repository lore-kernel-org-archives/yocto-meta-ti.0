Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482B5C44508
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 21:04:54 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.10])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22486.1769029491261864474
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Jan 2026 13:04:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=c1KkBIgy;
 spf=pass (domain: list.ti.com, ip: 52.101.46.10, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lw73MnNPVaOt7KThB2/D/sRGYg2U5BLF//m0IKPX6W8EzSfjasatQ2JTWjzBOVYg/CZHtT9cNuvmdEZ/YKND2xX05Ixx9tuX3xCow2LpXNMIf4l2DvV9JjS7ESndKyACG3K5iz7oqpDEBJWIvm03VC5LdCoFHoKQIDiBlNAhPVGobQ7cEP6TLwCqi9Qcm8N9VTVgd7bHms4KE947ZVpSRKxEL1SQ5goAFgbGUbWeH4AmneaAMky7y+nU/cXw7P1wBy9yKJXNPoGO9MmsjmK+nQCBZoxAt+2WV2ovbCMjJZxpYnCtT+2Bn1dVs6aKapPxdTtkV4bSqTDzVDrUSTBBsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syS6KlYYHkXHr1FArAE5qKOAywOKSkTHzRX4Q0uT/1U=;
 b=nKcC0ZYTAw6HlAOAlSazd2PBRn4kbKE94VLilfkBJ/yN43usWyXBex+wHDi7XpV4UNaWzyaxCeicMNrtVJGalhAv0cGYqSlTwiW3QH2VK9y4QcA7yJm7ONEOH69sv+dsVUC/nIHwhfT5DnByM6h8Ymc3pkkv6fZbXLq61ezZARk3dwLJN6Lm3ig4nS1ztWi76Js6VHObG9fu3Aedi0d6HfoAOYUTI2RFitmQaGsDDsJu/hYm1CbmlXltCx53zr5JAPH3n6TKbnyCzo9WV+bYUd8lSG39WZ43OWi6FrdkFCR98MI05V4cDg5VDGiY1WzPR6gKuSS2/1TpBL2+KKzTGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syS6KlYYHkXHr1FArAE5qKOAywOKSkTHzRX4Q0uT/1U=;
 b=c1KkBIgyYku+3ofD7VR2esLmL675RWyP5PvcVP29BFixoZZpMxUOe8Yytif34SfDgvOVFMC+aUudDINbMyDSNunOg/2q+DQhMSeioV+ssE+M7Dt6DpsuCL8W4MRoZ3WYkFZpWMGn2ngrMsyeBUv/n0xTDdZr3MldZVAezXTObe31Sxj0CEatM1hXBIBK88ITOmznsJmECTzGkS6hgRUCufIkDHvdDeJQIrHZ4kQko4IYCgH+Qfa3tZIftTQK505KRA+xIqZCCd55obxRZwJE8+7iDV83LYt7xCsuzDu2enr8riEApgSjdEvpZyNYaZE3aizVtRroPXpPkTvuvpb01w==
Received: from BN9P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::11)
 by IA4PR10MB8730.namprd10.prod.outlook.com (2603:10b6:208:562::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 21:04:47 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:10b:cafe::f3) by BN9P223CA0006.outlook.office365.com
 (2603:10b6:408:10b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 21:04:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 21:04:46 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:04:43 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 15:04:43 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 15:04:43 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60LL4hdG2198632;
	Wed, 21 Jan 2026 15:04:43 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3AB2D9ACF4; Wed, 21 Jan 2026 15:04:43 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] conf: am62: Add usbdfu tie-test-builds configs
Date: Wed, 21 Jan 2026 15:04:43 -0600
Message-ID: <20260121210443.318516-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260121204855.814231-1-reatmon@ti.com>
References: <20260121204855.814231-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|IA4PR10MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d3af810-fb9c-44d6-f755-08de5930b4fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jBznUWouWfpb8oL7HCa2+AKKfksa+p6GkcFDSeUTweGjg27OfXjV/uqNl8xU?=
 =?us-ascii?Q?+nh6esCBANKwhafBXL8F1yc5EdEEW3HA2DwaX+5D8o7bEN1X2uKrjJvgCWZc?=
 =?us-ascii?Q?M66o1bgL32sH0DU7GvV5g4l8D7tufNCFPAlevuw8pnuVm4nroE2uCY4NesLn?=
 =?us-ascii?Q?GKaOOXCV697PARRkLHGAbOupXA8/JeMY0QQ0YHqA+1EJpfBEhAYfr4aF8J1Q?=
 =?us-ascii?Q?w8UqJj0NfRNnLd++t98eGxqtQ/uGE0o5xCx/uvc1fbq+LrR806ZCSaVEKKqD?=
 =?us-ascii?Q?SNy1UwtL2hFylu3FVlR3MJZS3ROlnN01SCQMmcZm6lvJuhGXPEy+2e4jyuvN?=
 =?us-ascii?Q?0b0D3dEMffDAcrrWjf8T1bkUYW7TL6Qj4Lt7POlYC0lI+KXS6Uz7MDHdE+sE?=
 =?us-ascii?Q?bYYxKPYSGSyuR8PC8eLEXwrtjbSZ7sbxpnt6joihbAgI6lzLJpwqwh/UjHeJ?=
 =?us-ascii?Q?CNmkWMG/aQpZlZqp/2OscHg38MgBF+rXXxmAoCwIPeKuYMRV/m2zAUq9Fe+Y?=
 =?us-ascii?Q?R6yRGg/NE0+w/6QfQt6mb4jFjspgE5aUmnoppIcwjmGaT5ZlmNOYIl9QKe7/?=
 =?us-ascii?Q?ELBurpVKs+H/mWH34ChgZVk0LFD6mThnECT3/nxKMOntN+6Z8kDhPTy8s5MD?=
 =?us-ascii?Q?ra9+RSlD0LvipEKklAEmtE2annPWsuk5AVTaIQe0h7be+viGmm2yPRVzue4D?=
 =?us-ascii?Q?Pk7Ovb4yvLURbFYWclqKiRXZpCGOVy/o+TzaE+YxeBkKca0d4hpFNYeZWhSz?=
 =?us-ascii?Q?PTBh6vMgPp1qLbnQiibW+7O3gLc5xJgzI687wXMFHReT8T0cdTzfq0fOIuCn?=
 =?us-ascii?Q?5S0ZidDsSu8Lv+LgLwnUE++PDfBfdqEJWTS2cwbi1MXVeB1pTrDJPqTjKlbn?=
 =?us-ascii?Q?VRnJ9rSAaKt6N3Wl5Rr3fROLq/VYDFqrrEBXDGuQtoC98bDH4/54fmH4qEb2?=
 =?us-ascii?Q?l8CcFI1JPQtGy7rSI2qHeMyW0G+0FuClAGQQyo+KMqXdWjKpKOGnanYyqfcS?=
 =?us-ascii?Q?HnRjSsTLxcERk+24fYX8c5KZzCeZXchQMvwlxAVZWxX0FESEGQ6KbFrFiknt?=
 =?us-ascii?Q?IRGquUVRmb480VzsR0hlMYCA983jtvaXxH9Djyukjh1pvJ/tUTjE0ZLsLlxZ?=
 =?us-ascii?Q?BW/P+R4sWOPruzzmNSpUH6sZtcLl1GTPc8MIrn0vOSUgbr7NLZnck3HUQ4yC?=
 =?us-ascii?Q?5TQAeWQuCXrj/uL7ur2T+e47jptlo/ec3QQb/ieq/tE3+KbZw7tjLi5vI51X?=
 =?us-ascii?Q?sfYG9KDjZUHyw2V0DTQp4a3E1edewUsBpDu0l9xGQvXa2+OgLPuz/Ddq84qh?=
 =?us-ascii?Q?XQOf3UbxjmmW1+ZDK/8i10YqQiXtpw9lPtWgNLwVXFcvCbg+W3gvJHgLPeGs?=
 =?us-ascii?Q?bUA9Wq13KGeKY/d+1DFDfutaKfwNlQsFp0/F3HzxIeJum80RjUIV/dS5EdLg?=
 =?us-ascii?Q?h+EAxv0s/8rAMwGNGuNmh/OvvxP7MhWpL3gUj3rj6i4wDQxIoSEhOVRo2U9A?=
 =?us-ascii?Q?/lEZfUNniOvTshWo5e+6UbM3IxsVX13Iqun9iObo9bzQmLHGDBgl/eAo0AjF?=
 =?us-ascii?Q?8eRegEpfNQ5WAslG9cKjPFpEszF/zpFqtqQ4EblPIptD1syeXfh10kkGfCLO?=
 =?us-ascii?Q?qysWd72RDNKV7Dv715ZQ7MXsjxuAURijtSFcabsnI8q4ENCS8ppiiRHGb4EF?=
 =?us-ascii?Q?QAXA+A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 21:04:46.1842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3af810-fb9c-44d6-f755-08de5930b4fe
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8730
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 21 Jan 2026 21:04:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19437

meta-ti / na / 20260121204855.814231-1-reatmon

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
WARN - [meta-ti][master][PATCH 1/2] conf: am62: Add usbdfu tie-test-builds =
configs
    WARN: Commit message does not include file/recipe name: conf: am62: Add=
 usbdfu tie-test-builds configs. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 am62: Add usbdfu tie-test-builds configs.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 2/2] conf: am65: Add usbdfu tie-test-builds =
config
    WARN: Commit message does not include file/recipe name: conf: am65: Add=
 usbdfu tie-test-builds config. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 am65: Add usbdfu tie-test-builds config.
              conf (COMMIT-MESSAGE-3)
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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH 1/2] conf: am62: Add usbdfu tie-tes=
t-builds configs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 21 Jan 2026 14:48:54 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: ce23367c8ed5812941f5419423cc8ff95=
2510a07

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master-ltsprep.202601210100
- Commit SHA: 7ccb6f04d3b589df321fb9957884d80ad35afb21

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




