Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612ECD68BC9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 00:03:30 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29265.1766016204023567098
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 16:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=am/x1K1E;
 spf=pass (domain: list.ti.com, ip: 52.101.61.64, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzQjD0cCaUsHrDG6IRPgW+GynnYFm+eD8GgPWsCZxt0iiy7NJJbxYCWwkIFjdXsivwrzbi29OaSD+kwZpqBmJnhTXPj3mVJ6V0wUCbAO9D35gvUc9ilKqBzLHSomwzzN7oWOu42pIZvWTFdPZr4Of2ThPdutvk5+J2VY3ZemCo+Ix71mNNz8+Csu+t69rLW4ngQQeiI8BtVZRgWROtzRHfdPNV0RX2yq9oNVyjoAZFD622vBWiLL6bpT8JdYTifFDC0EI3brrXTGFV3EUXTST9F2psRi375di4ycS3AahQg8VPn/DYUMYWlvxLqh7/tTG+8R9Vxaz0dJDdP0EsNNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGYM/e7WM04YLt7WqSZbZXyTsTn8pdEm0LeoV4Ufibc=;
 b=A7FsflHqqh1V8Kof7e3RNW8bBLO6zaUXhNlB2avMZGgO24MBF6s197LN761vLekJabGQUCnvvdXApZQ//KzZ55MQM/KHT1+uD69wDzJLDXlIAIzOfZmGjv3CJ8tTDDg2tlsZcBTz6+4rXGYacFOZCLfYsAvhqdFRzIPFYqS6PyTmhIKxfFjgh4uTeME+nyO8yME7iCuXVO5Tcw76zjLyPY9tiEQhGL9PHO7EvdQ9aZR5GfqmhdPxnZld7MeG1sPilsTMmnZS01OgzZ5wLPb5/FSrYqZh5Foc9vV7gcDPBCAiXknLV9+zMCIf4QRG1Kbjd7PX3NYnze4DLVwucfoDbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGYM/e7WM04YLt7WqSZbZXyTsTn8pdEm0LeoV4Ufibc=;
 b=am/x1K1EXmRbGM9+ZuNfp9gQMK6MAuGzjx806lYavEIEKP94UXNhHhmaCY2XfYz71Kuqd/d/NoLrHuMxh1Uwo9UFtTEzHE2wEDZxDvwukcm3dYdhkL1eH0AAVAMLnfeFoyV3lIOsfsiX15HsDGmzC2NLRlQVBukJsfLWvjGWYQrU2bDCMilOeYwxKeIoyGyGc32oBy4HvzcJUr3inHQrPqJVGBue/inNLgy+bjFsKskWp/JT4+IBZANC0RjKN3LKcExm0AW9PVKhdAOl3o4EWM65YV5iFfMk0BnbTA+c+FvZ0pyJ0ht2jo/MmMWgtXDkzzsyIvQyYWDs9nheu7XZ2g==
Received: from BN9PR03CA0660.namprd03.prod.outlook.com (2603:10b6:408:13b::35)
 by PH3PPFDB252061E.namprd10.prod.outlook.com (2603:10b6:518:1::7cb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 00:03:21 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:408:13b:cafe::48) by BN9PR03CA0660.outlook.office365.com
 (2603:10b6:408:13b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 00:03:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 00:03:19 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 18:03:17 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 18:02:47 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 17 Dec 2025 18:02:47 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BI02lfi507390;
	Wed, 17 Dec 2025 18:02:47 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A2E30136F37; Wed, 17 Dec 2025 18:02:47 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denis@denix.org>, Andrew Davis <afd@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH v3 0/2] Add support for BeagleBadge
Date: Wed, 17 Dec 2025 18:02:47 -0600
Message-ID: <20251218000247.3077328-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251217235315.1333746-1-jm@ti.com>
References: <20251217235315.1333746-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|PH3PPFDB252061E:EE_
X-MS-Office365-Filtering-Correlation-Id: d2b9fed0-b0b4-4d96-b882-08de3dc8da61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2871UrhX4RAJoovkKF/TxVTiHpiu8PuUv+SfnTabOOy2a/SJNKkP6bfGyfV/?=
 =?us-ascii?Q?ePWUxTXvVXERmipUgAtQV7aThRHzmnOh4Pe4Aof0IpOp/SIuG7JXE2slqZL4?=
 =?us-ascii?Q?qpczfULIJvsQxyNVC3ZvIlkJJ0a5T9noDfO/XDfyk01N15AwQaT/rdfmxMo7?=
 =?us-ascii?Q?YfdBdwmvcXTJlUyvBVGMz3iXaC4HV01eyhVy4H5AUit84bOLreIlBjtHQ/ao?=
 =?us-ascii?Q?xXxwqaC5J1gAU0RwJD9l1zNVBV2GsBgkijkqK2KgiYm/Il+4BA1IuWkoTrD3?=
 =?us-ascii?Q?PxXyn3YXBWcF+CpjKTP7p2vZpGEWkhFxP3mnKGyNMuaYbzf7f7/MTxdgOz3g?=
 =?us-ascii?Q?hVmbIR1MenMh78v/p6dnidf/S5dMpBBH39MrWzF0Ez70U+Z53a+ZwYhwyF65?=
 =?us-ascii?Q?7nZ1L/fmeE8CP4htac2AeoVEsnAw5Nb6c1VdtBN+CcDxZ8eW6epuO3WS4+dh?=
 =?us-ascii?Q?JhJ5lQsZMpdvMBhEY74/uIQ0++RRJyb7NVqW7Bks1CO4iLXl/h7E5sMmG8g+?=
 =?us-ascii?Q?0ojOUPI7zpe1vmQ9q55kRdZCwMMQuybBtV/zJISOjvp6t5wWXrL2iSk7n2+H?=
 =?us-ascii?Q?ctOVFHuNXhlKOKjimA0kmjKnlItIR5fVqwNpw3bq0BNG/rmiBEK45s1q2UFs?=
 =?us-ascii?Q?XHZKar8KaSSt9j87ehBdPgoIChYHLEqsq0ykrl6qRcDcze1Kzg8cLRPIK9kE?=
 =?us-ascii?Q?/3pFZHP0dB3B07ZjCzbpUeR/YVJmRIiuDjKCdroVf5FYU8K1kyT0nuPRpTUy?=
 =?us-ascii?Q?uuTq+V2wjg5nSZwySg4ya5zdWYabwBg4aJEVzU295Kh3PdoCPWpb/LXfmbq8?=
 =?us-ascii?Q?+i9ACq7s3nAmE/V4vH+2ET+JDJ/pU6jp5iWYRFQkgHRsif/muNhDiurs9VIF?=
 =?us-ascii?Q?Q+NcyoyodkvX8eriV+qpWop4RCBZGysqG/LuVjSaMu0WVBYNNw0F/tgVWr1x?=
 =?us-ascii?Q?8XO9vYXp/IP69Q9JWdefXIeTPnON2hKEOOI0iGwnxlq+uTAiJUDFXsq/5HkE?=
 =?us-ascii?Q?brPiZF6PvKNjKk+nsMYcAuER4d6E6+KNvz3vrVcmui85S+STlJhVrfdBpGOh?=
 =?us-ascii?Q?Grkd5YlMmv0YZIKfiWDeCU1mBfX9oIs3yHEyq7pNLoS0ot0r+YuPbelyw0td?=
 =?us-ascii?Q?qhjgYoUutcPLqXXg3vorh5dO4dVH7qeNhXiPflbjtR1AqGtDcdXf7QoV1M6m?=
 =?us-ascii?Q?6sOy9m/RPkqUzteAjv7XHgZlRX8luNclpt9Z3DliMVQddzyETEUGAZUlP4Ea?=
 =?us-ascii?Q?F2I+sUmHwhIiUkBA11IE18zo3YK3vwdyI2T7Q3acoMObGbDrpKawXXcp7taf?=
 =?us-ascii?Q?B1vSk++UeZ30lN1nCiLwzMrfMJedpft3H5hO+x9kznFMrYjAsVmGJWb18Jfv?=
 =?us-ascii?Q?rGwNJSdNnKRn0NsFTfllx2+AS+pWKgFlOL8F6zYXST+heipGqA4KqogUj3mI?=
 =?us-ascii?Q?GeF3Ll6m64paMy2KafslB06w9mrEwwvepNemv5WB83QVGE4Y36zaXIQt/ic2?=
 =?us-ascii?Q?bn1u4lvFlGzqiVsOit6MhriUk+JVLCchr4ySFH4+kZIqtooBIIyQ2UgFbnx1?=
 =?us-ascii?Q?6yw55gGjnMqANTjdyM0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 00:03:19.8547
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b9fed0-b0b4-4d96-b882-08de3dc8da61
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFDB252061E
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Dec 2025 00:03:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19372

meta-ti / na / 20251217235315.1333746-1-jm

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
WARN - [meta-ti][scarthgap][PATCH v3 1/2] beaglebadge-ti: Add support for B=
eagleBadge
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH v3 2/2] trusted-firmware-a: am62l: Update=
 to latest ti-master
    WARN: Revised patch missing a comment. (REVISION-1)
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
- Patch Series: [meta-ti][scarthgap][PATCH v3 0/2] Add support for BeagleBa=
dge
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Wed, 17 Dec 2025 17:53:13 -0600
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 29a40d2044819dea405db491321bf9773=
491541d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202512111451
- Commit SHA: da65de7886ce6572c9c4fe7224039c40192a6c5e

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




