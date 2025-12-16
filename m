Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C774D5B87E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 00:35:21 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10279.1765845319643830417
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 16:35:20 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=M9e4fQBz;
 spf=pass (domain: list.ti.com, ip: 52.101.61.9, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZzc0gBEGK0qsP3nDUmwl1Zm7FrIWMHaj6rAT7TfnJlfHk40xnkV1fQHJsPfMgeTOpSWKcqKMqsI5G289up0YG2GwdfdQihpS7Ys14GuKXSIbVYxcY1fkZayf+FZENmJR8VqmELzX2XF5VxiXQdWcF4IVgDpNHVP4fonxdsaPScgu6ys5WP6wk8pPK5vgjqVekqx2BHds+pq4ja8pOSIp08bZYeYXgnBH5y4ouafcs1FsKHSgeHyiAWMQzyDIfymchda7R432mZMClN/EqeSVrBzD7KCGyqxwhDBo2t/QmE1csPIRjYUTvWM7A5LMXou7SEUjK3K3XVQceSL4RvkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pH+W70c1/jWiThyL7t63D4vcJCqFZby3PEIbnHUI+g=;
 b=B8u3V6/4ET37xbGYFYc52anPcUzQmIAw+9jwjYLkP1xlDjrRlHIfndW0irMrrXHYT+jLcXl3aH9+tRRHB6LSn74AXD8WsHteUNjc3HJvjRCDT1Q29NuoKkwTHk0jVEyO3QWD/LQqs9RgdQDJif7dvgRxWOkUzQPcfw0ppBJlGtYMhpNLXpbwqHwFgSimrlAIUxvXNWg8okZdkv/4XSumDX4MRySdcvC6CBMMar2y8KtxXWyr0eCk2sCGSZZgIyeM4nUuZatKH8wZ7Kg48Lhxd/fv6D8yNB6NdVvaPiXWJBbwWfJ7LkYD/Ow98pxTgazeY+jEvlgV8u4n3eqSxj5vLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pH+W70c1/jWiThyL7t63D4vcJCqFZby3PEIbnHUI+g=;
 b=M9e4fQBzpiJJJ5WWRFP5aWYNgsmcX1R/ZNk54NQGkuHiu0g4FCYC27bvj40z8dOiOtaQeqgRYbX5FUxQYmVqkWK+yzlif1kFsU3cNxn+nzVgHHS42JRxqJ8GjOVIBIpo8tsFTb+d4Y57+Up+sw/iO9MibuXjgaK+t7LTJ6eSOxAfnBY1dZ5t5NFoVV1UKMpb7l53hO/Bj3nqv9Acbrx2QwJPKRAc5hGbv9ezpFwT8vvuuJdjM5YUtvMc8ook0T1xJRtebXCRUa2A+d66jz36YEFC6DDmEGbkcoTy+IVPW5lP3afxlr2CBpnf/Ofb7x32GD9H9GwwXII9vz9e/kvWlw==
Received: from DS7PR03CA0014.namprd03.prod.outlook.com (2603:10b6:5:3b8::19)
 by CO1PR10MB4499.namprd10.prod.outlook.com (2603:10b6:303:6d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 00:35:17 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:5:3b8:cafe::fe) by DS7PR03CA0014.outlook.office365.com
 (2603:10b6:5:3b8::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Tue,
 16 Dec 2025 00:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Tue, 16 Dec 2025 00:35:16 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 18:35:12 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 18:35:12 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 18:35:12 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BG0ZC172580685;
	Mon, 15 Dec 2025 18:35:12 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 97A47136F37; Mon, 15 Dec 2025 18:35:12 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Denys
 Dmytriyenko" <denis@denix.org>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add support for beaglebadge
Date: Mon, 15 Dec 2025 18:35:12 -0600
Message-ID: <20251216003512.3100239-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251216003229.2229848-1-jm@ti.com>
References: <20251216003229.2229848-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|CO1PR10MB4499:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dcb9f16-ee54-4b35-d600-08de3c3afc1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OLaeHgb224jqcyUzQ7AxJhfOgTG5ilYjV9f+0/R/LZ1/O9lALaBZ46bjFpxx?=
 =?us-ascii?Q?m8Gp4W94RfW7kji/e/7YovtoSLFOKjur/Ff4xEPg2zJy1QItk4Jp1yFNeOdt?=
 =?us-ascii?Q?CXIC8Z0tAGZDwTKF4Vp3zfaPgyQiL1Sayt+wvKbawVV1ovtWsN+WzB6c37UD?=
 =?us-ascii?Q?LJgWXmng9wzA2yUubdzCrrb40bi+CCKIiMwpmCYYSsT6upIPJexOG35hZS24?=
 =?us-ascii?Q?fb1TXFrfRD2HMhuGC0Whr+zQ8Q04VVARWxAg/IggXyt095/PYI9GOHNGBtrU?=
 =?us-ascii?Q?XdZMN6mM3UhSheeGsHOUbSBnpaY9u1qDQNpKn1qtY2xH3FYpv9wMQZpb/r+f?=
 =?us-ascii?Q?ve87GIRAo+tfTsOsAjopuGl1rKCTZohvsA9BTprJKteAAvovtis4IPZpL4Nc?=
 =?us-ascii?Q?mW7wMuHnomw04bHNpgZyMD2+coXitN2AL4I4vCmnDdaFwpf2/QlzGL8kZRAX?=
 =?us-ascii?Q?HOaH2TeVUHqdVYjMXTCHczl6xu8MACUSW/A30kvD8g901smrO5Ct0/KGNGEt?=
 =?us-ascii?Q?mS/rgQm6sdiMQwUInpffh+zQ0qU1fL1NrciZ4seHU2tG/RVB6JeXcdz6ExJg?=
 =?us-ascii?Q?vevnjfqoOsLKagxGDsbn9Sh8pa/f0gh73kyZKb9ulkNdWNL8xW9iA/ePBlnX?=
 =?us-ascii?Q?6nKrIpp8HVoYuv+A3nOMi5oDHEEhuupxgcAo40hSt/hjZ5lb9ZRLn+UWVa3u?=
 =?us-ascii?Q?qiHG6kv6OxX7Ly/P6pv2Xm/jUDnGNtFkLRAiWhBKD1vfJ15OUEv/YXKYX/DH?=
 =?us-ascii?Q?ZBQEuT4BHzdMjVMjTbZETO6wyHpx90/8Wm26QdBnJDAk8pk9pcmunUQ0uKsr?=
 =?us-ascii?Q?3W2W8D9BpPWFm1kNxpXr0J7FdlX7szSlKqELgdleIzhwXP9hFoCFqyCX2D/K?=
 =?us-ascii?Q?5aXTezxVPyYPCbjZ0MNrcsCcVikmy/ACcE95eHFGf8Q1H6/kcx2BsZko0ZZT?=
 =?us-ascii?Q?6GQsuV5xRUnLlGfpgx6R3PFdJaViXhS+0+tyQx8MDWTSu89E0ySV0jjWbxST?=
 =?us-ascii?Q?K5C2GRT/Cw8eafp5aJdez8NgWWchCfp/Py4rPFcuPOLJ0XvRZtdMdrCHIBZ+?=
 =?us-ascii?Q?cHJfYQ7qEefNogojOoqnGvgACPTiD1tnrrVL0CDqkibvA6VEciXKjkHxWvAK?=
 =?us-ascii?Q?gvPnAO151T7qa6PfaG5hk94JpL3WFVSGERwdSl/ld7q8J4upWvj9rSuAp3Jz?=
 =?us-ascii?Q?os4wRrI2/Wh5slvFDKWwMYoJdHwH78+ZUVauBPd2tm0ZIMdNjHSc3E3Cfm4f?=
 =?us-ascii?Q?NTc7UQ06e0xb/FZQxWkGgIIMArTRaxJFgAt+w26ewWyg306C6E/2BG6eiYDM?=
 =?us-ascii?Q?BlvMSDfU17QZoyJtDZdx7VV3xjSgJG2uaQ+zI76lZNI5nWKm3uSvJFtarmEx?=
 =?us-ascii?Q?tPwoktwm6yOatJbPA3KwMnvY0Pw21/9RSz9V0bPlKLMRdzvWMbC1Qk0oOBa3?=
 =?us-ascii?Q?QPUW8Vgteu8Pho8uF4pI/+B51vhPOuBtXRY60DZKH5AyEg61sa1J7b8usuSG?=
 =?us-ascii?Q?uUpYiV+sbpqP6nNykssC/SJ+3nwigVZjO5RdwBN0Oyj3KlSPPQCJDf6GcNkS?=
 =?us-ascii?Q?1RTcoMTrgP8D0fhoZS8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 00:35:16.7607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dcb9f16-ee54-4b35-d600-08de3c3afc1a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4499
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Dec 2025 00:35:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19359

meta-ti / na / 20251216003229.2229848-1-jm

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
FAIL - [meta-ti][scarthgap][PATCH] meta-ti-bsp: Add support for beaglebadge
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: Ad=
d support for beaglebadge. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: Add support for beaglebadge.
              meta-ti-bsp (COMMIT-MESSAGE-3)
        patch
   =20
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




