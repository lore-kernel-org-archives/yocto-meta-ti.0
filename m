Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FA3CF45D7
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 22:20:37 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45919.1768256436814730846
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Jan 2026 14:20:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=OOh2f3QM;
 spf=pass (domain: list.ti.com, ip: 52.101.201.7, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uTu322c/GcAhpIeV10543oxiU5pMr0K17vobOZkJzO9ccyYcCu+f2F9/C35qs2ieqyLX5XN94hroaX04FmUrtGV7DG8YFmSfnu62xDw8k4j247Rk0AN3Yl7UoF8Q+k2PNnEUe8CzxogGpbGJ1n8Pe3sA1azHHzJf7/eqNalQbheEtJMZBVLlDxzOFF8YhGAdkKW4DQ6eSilLjG9crgiDfe4hGasZbCFcghZ1UJzKqlXSOJl9m6gg/Ttwso/Kz156bEIRi6r2VGA5dg+iNh8wS4Ih3e19Vqa0V25WH4TSAt+GbrYwOkOQ6pMJ02db0E6uAWBzoqt2aDLY3ts1gGlf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qa0NqhiUZITzcZmHoV6WIyKSYJvKjqrNwpxx8603vIo=;
 b=aDZh0F2HgrUhYz0HqQEyhktniwolfxg2OOdwj/4f4mRlc7klrMii7UpEQAdPhllj0JT09SiN2+3ViZYIfscVpB7Kw00Q5j8oZC7JLKmhylrMR0Q+59lzBahmo7mQpV5dDRYyvBNcPq0uVvsqgzFdquV1a76/6xfFaqznz6dKy/zKF1Zh6RB8NuSz0Gqo+FYfKR+pKxA53UaALulOZm/SOjUF8xUPIrBbjJ7Hp7BM9kDTT3Ch1YNuvuvEagwBIZSFRs25KDLpuml+KKfQDaHW/PxdotiRdtmHKpE3BTHLrZvZ+PEdWDuixQ6CVP6i6SK0nUCKAlzOTdfxyIuaf6mhPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qa0NqhiUZITzcZmHoV6WIyKSYJvKjqrNwpxx8603vIo=;
 b=OOh2f3QMLEFBfsoSSGHsniX9UdlVbXcvNZ70H7lw6UnoDaIhVB1narpoex489e6zEfJm90ZOH9ai+/EoblSpD6eoDGFLTe2lXEAbeIjK/Rjvx8GBVff/ki6d3poQIkS0TXWeBH5SQz/TP2khqQssUYSrbZknkXM6dfBmljwo7x6aZO7zVZXWx0YEqdshzPEEAcDE6hJ989aGIj1VXcEAlK467DvlhMSKv0j5B1x4HCgD6WYFNjz0VmuAVrRHUBnStHgZToKrsv4v9JvRRIZWgCqcl76DWWJ8/3PQlLEb4vb2KRfUln+yqHnk8CU9JSqDyOwEKgE0HpIiz/eVn3fYbg==
Received: from SJ0PR03CA0024.namprd03.prod.outlook.com (2603:10b6:a03:33a::29)
 by BLAPR10MB5009.namprd10.prod.outlook.com (2603:10b6:208:321::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 22:20:33 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::31) by SJ0PR03CA0024.outlook.office365.com
 (2603:10b6:a03:33a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 22:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 22:20:31 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 16:20:31 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 16:20:30 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 16:20:30 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60CMKUgT1339093;
	Mon, 12 Jan 2026 16:20:30 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A2FB49ACF4; Mon, 12 Jan 2026 16:20:30 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Brandon Brnich <b-brnich@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][MASTER][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
Date: Mon, 12 Jan 2026 16:20:30 -0600
Message-ID: <20260112222030.1790325-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260112221607.455389-1-b-brnich@ti.com>
References: <20260112221607.455389-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|BLAPR10MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 02061e72-b72a-41e7-5607-08de5228cc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3UiRVwVy0pa5BxfvufgJ/r4yF/cTZ5tsDlR0AkP/IsnRDE51LHBrpUhShWG1?=
 =?us-ascii?Q?EmpNCy2AKiHpkM3613ytgtye7liPiJrboklm1OahmdIGAKMb6gDf1vLnQZbH?=
 =?us-ascii?Q?w6ToBO2QKwjksOaJRfn25PZ4/p5LzrC2Eue1cSHPi5FMGfxUfUxju/El9K5Z?=
 =?us-ascii?Q?6ebp1rNuyNROYJkhLHvIzbMBNWQf24kHeIuVPrnTIu75262FxKWAPagbeN7Y?=
 =?us-ascii?Q?mJ1vpsPMAhcjd012spqcHYenHsVri9B+0lrgoBcCjczwJI2KYugf58/0bqtP?=
 =?us-ascii?Q?B2ek1ksHZ1X3C+a0jRei9HIWyqXGyU4ZH8Wt2PLfsmPVegIB6SkuISEBEAf0?=
 =?us-ascii?Q?7/vGk6v8EGOJTQ0BHlMKbpIyHteGY07KWlxnkkgEx7poUdDRf6PfXusCoGpb?=
 =?us-ascii?Q?TeVZj/e0V1aSaBa4u/k+S0YnJI+fYDwGKtUHU510xuFgXVsKgHmxjQgrLeG8?=
 =?us-ascii?Q?AgIdHRw8z9XkT23hY45D79YJUVQtuGHVBpRcrJskPRajm4nNXFdntEOI8rts?=
 =?us-ascii?Q?F9s98o9vCu5QfGzLeZ48FZLkh3M2Qs1uyCpADibCH8MtBv/yvYzsCHHp4Acf?=
 =?us-ascii?Q?bjcTwS32wdAW2nnpl0HbslKVrqLCPDKxw0p3Cxmitj1CrRsBKqguPGYChdeE?=
 =?us-ascii?Q?HVqqdisgQsjjQESJBnqL8uACulgydLrOSIOn5nV20BRXEHl/paRioLZP6R0/?=
 =?us-ascii?Q?gQTcYd4Iy19apqAr1GlvB/z0pCEaO4pbUrcZW5CiU74B/2aVLVVHhbmatN46?=
 =?us-ascii?Q?R7GoTRBcSmyAc2hzX2FpIfVtUtVvMDt4NLHbnRrYt+jgOBe97xO2UfnXGjKA?=
 =?us-ascii?Q?MFeucWEX8EbvZQ9ddoy0yViXYw4r5OyKpZtOgSdmCCSOVUbgXyh8KowJzI1w?=
 =?us-ascii?Q?SRoTeF+TvDJCC8SQE8G6keYArfWfYFaowp+tFAvpJLTPUPNwfScqaLODW/HP?=
 =?us-ascii?Q?+ZKgPWT36+FZYiMW/2qpRS3V5yblQ/XcHzbOvQjRALxA02v+ykS1irO17wAE?=
 =?us-ascii?Q?RhfpLfkFXHK7GRdw4ZlYfl4W7ftx2wYZvV4/PkZDjaMVVwE2+yjhJbaKTXZQ?=
 =?us-ascii?Q?4cQw6IqeGca4XDv1qq4G0EBYG73apQ3G1IaAdGNQUhWWpX31+ewt3mjcX+tR?=
 =?us-ascii?Q?i8jDffPKvRU7ZsJTRC/YLsyiBmW3jEkjpcq7CwiZNNKLYdltT2+Rqi9/X/G8?=
 =?us-ascii?Q?eVZMQzLLCRKemREmikoPM04dJhwOPTGigRTYEpY7VrJXaKV3h/ESFyOulWj0?=
 =?us-ascii?Q?BVIb9HzygX6hkt7GMVzVvQDErZFxDYKo/lAwpDmj3oDQjy59c8F9+J9gEHlJ?=
 =?us-ascii?Q?lH+0OdNlvpICO3ub4skktoTCnUeMKqepKCeLc4OTw9qaFg6O/VOnJ+UDs+ND?=
 =?us-ascii?Q?DmbrtwEz+m2O4RlzNk9AD8Xu6W3FD+5DCnfM9utOzLm6F3MfguaeLx/7j7yA?=
 =?us-ascii?Q?rlmBmvWPDU90r2HY8D0JzhAX+y8AHyo1CuCajMh9SZjA+cXLpOncqYa0VOBS?=
 =?us-ascii?Q?s9irMwcl69i4jB+4lnOc/S8qygoo94AEpfiT/4Iv434smumm3kUG3AybAoNR?=
 =?us-ascii?Q?KyuLOwBMsJVecNlyFbA=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 22:20:31.6319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02061e72-b72a-41e7-5607-08de5228cc95
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Jan 2026 22:20:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19408

meta-ti / na / 20260112221607.455389-1-b-brnich

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
FAIL - [meta-ti][MASTER][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
    ERROR: Invalid branch specifier: "MASTER". (META-3)
        patch:67
            Subject: [meta-ti][MASTER][PATCH] ti-bsp: ti-img-encode-decode:=
 Update SRCREV
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




