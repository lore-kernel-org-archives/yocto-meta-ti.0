Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A535D26296
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 19:37:19 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15018.1768937832191016167
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 20 Jan 2026 11:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=F6bZTOkZ;
 spf=pass (domain: list.ti.com, ip: 40.107.201.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vP/N1G8Tg4IMcdPWwm1N4K2/KhX5gQeXwMIpxYLwW8MMWPqff7d4J+wPduObKQKcaN3dqr6Ve5EAQxBRsuqEE0sdU6RZXnBrxs+fwOtA/UgK+h06aIBtv8fFM7FX4GYTJg2R7g61VvnUEvOxB7O1Fazt5G5BAMvE51jp3xv6In8u86C4/ZCGz8N6cF2T5f5CChdKqSaCVjcJCJK4+J8ihsHScfJPOclMXWwnTp7fZrUqLL8CDWRZ7kTrPPxR25OhKd3BCMMdXfJ5z95Zp8bW5MZpm4ClaD5qe2+B1dn58LpAPQfHQ7o0eyzmrCpZE54vmmMk2R3spoEbfR8y4Is4JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAfPOnu7p+v9yeJFygPlrVTGs1nljDqIoZKAo1Gzd+8=;
 b=DfxYHdc856B4FO+EamAtVp+ZW89MUWZV579GXDKQnFz/agY8PHdYS+SBVyuBnFDDK0pKpXtqAT3ImcW9qduFYaRJlOMZSsaY7y3qgBtaCfTEjjBI61ocJD/jsCK0zIfqpPcDhhM8rhPJIiaz2IpKbwQuenClg4ol+MgYM3jwyrHxg7Da7vc/s5yNUZJWreOx/0hCbSWlm47dwzUMYRrN/8YGVh+4VqqD/R/9oOmCsfhEh2Ss11U69DySolpx7YAO5uuFXT9Pm9y3+UVHyZTxnCQ1htHn+MTVdmwwhgEDeT6Zm1k21b+FeiONayHHh8vRrgxlLSmPOWbdc98hTLwiqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAfPOnu7p+v9yeJFygPlrVTGs1nljDqIoZKAo1Gzd+8=;
 b=F6bZTOkZ+W2LNnnY3OdXxHYtnB/LfiOdhdD/jbTSHPw5ClzXZew0qSYou4EeGzCLAPSmp2srg5sdTW/FtQ1rRhvx+QjcVrfwB7J+rx0a19EzzQOF+ApvYuOymbDaHDoaqZAhiyOBBznedFk4n8QQkZngZM7ukY0MfmTJNBgPZ77sNl9HPgbBW4lelgyrYFmqdeIytBVgZ5r2Wy9wmL1zK1HMo7vG0TZwxJ3wcc9zCWUEACxgWEUlX9FiSw9pdb2phGgvDpwDQ+sb4iBe2nZ9k3VKrO90XMn3fSVux445oy2wmZ5MsU5LfedQxjZfaKC16D/NpFwXDWCGlmReQCatyg==
Received: from CH0PR03CA0206.namprd03.prod.outlook.com (2603:10b6:610:e4::31)
 by LV0PR10MB997613.namprd10.prod.outlook.com (2603:10b6:408:345::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Tue, 20 Jan
 2026 19:37:09 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::a9) by CH0PR03CA0206.outlook.office365.com
 (2603:10b6:610:e4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Tue,
 20 Jan 2026 19:37:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Tue, 20 Jan 2026 19:37:08 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:37:06 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 13:37:06 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 20 Jan 2026 13:37:06 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60KJb6CI1746653;
	Tue, 20 Jan 2026 13:37:06 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 865AF9ACF4; Tue, 20 Jan 2026 13:37:06 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] u-boot: Adapt to upstream change to UBOOT_CONFIG flow
Date: Tue, 20 Jan 2026 13:37:06 -0600
Message-ID: <20260120193706.1540600-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260120191542.2214409-1-reatmon@ti.com>
References: <20260120191542.2214409-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|LV0PR10MB997613:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b7f485b-0276-4008-7dbb-08de585b4ce0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZSBw9GiYGfQdwAoun9bWHcn7iZzgZqoUvGLOqoRtS9pOdh4tDIiDUY9e1AVP?=
 =?us-ascii?Q?NbU2297wcFdNgwZl2cq1EkUgkacT9pQRHQfNCRdzPdRlwjtBwMVWvZE0wKhl?=
 =?us-ascii?Q?A3oW/2OIeULb9s8DIQzMYYaZho/G8Gw4z8mf56QzwfMN6uJAaL3X623r0Axd?=
 =?us-ascii?Q?ca0ofje3uZP5/PIE44Eu1IbVhFt63dDlDpUuuDnvipGYjQNHQI2YH2n1DpIy?=
 =?us-ascii?Q?XFv9RsGhjWw7XT+7XdMH4Zw+nOFwJCkgZJ1C+HmZpsNIRxxJU6HYOgMc0Nel?=
 =?us-ascii?Q?btX8gdjWqLyf8S/4oUakEnrfgJ/6DEbkMzYst3DBwuOemusjdH2XZhNRbLTe?=
 =?us-ascii?Q?amVyAEfRaG+lvMXbueHdAHxtaQ2LV813OAlWu0IlT6pepbvSz5t4SkjS0bxi?=
 =?us-ascii?Q?gaQK2bghRnZ/Hqj5BILKfoOVzWsa5xo9sJSC+cFXdMTUPnvqOLW5XwZE206T?=
 =?us-ascii?Q?68X8PDDWHnMHDoBOz6SV5288kX+/p5gP6DZVTSadKHXHnzgpcN+8n91pR3Lo?=
 =?us-ascii?Q?LJoUUPmcUway/2IGVidgA/DTalHtNuOz30TUqGOGJIjCQOHD5w5kbFN83wxz?=
 =?us-ascii?Q?QN39oKe6joAxhWsQA0sN/HVARvVzqlW4Owb+fT0mdwhcco3Imq9hvg5Zn64h?=
 =?us-ascii?Q?qcR4mu9jpyybrugGjRhM+yjErSlQ+WkKdlZosZzNgNYcXyy7I58UdOUDnyNn?=
 =?us-ascii?Q?BL9y4b7uYWNtZcIs9CmxQlytIQKKVfa1PPNDaXwx5X+uWMjkNcgt4PgkZizv?=
 =?us-ascii?Q?squzihfATPWfGP/oEPO4ouqy5f6WQ6dByy2eHvYaOdvzek3mWoz/DBLaRhie?=
 =?us-ascii?Q?57xpbKdJxhjnlc7Vom2qDpVilonYc63+9jn41gOj1xh/Bj05G4RdSpI1qdYh?=
 =?us-ascii?Q?/kCfxwr1WDhYvmLVxua70y50KxvOPmqxAVxpnZ4NQm+GQn4jjrEZXG3Rt3mX?=
 =?us-ascii?Q?TXv6XqFNIN8dQtXhvKoPi7DQOH562ljmNEwMVaiOjjTC5rN56JaRR0cnL2wH?=
 =?us-ascii?Q?dzWWUO78PBoaCssNYAKNzY8ry5wBlfVlllWuUZ0Z2XkYnX93p4QiCBuNDcrk?=
 =?us-ascii?Q?24S0q1P0ocp6iQAttGjmN9aZOQ/U2R842b0r9pxjRD0H3t2hrhpAt2bZqNOm?=
 =?us-ascii?Q?80ZTDgkOXs/iKIRA4aqCdzzDPpHmqHd1rppPtY7idfvHLKh5jiH4YE0FHgoc?=
 =?us-ascii?Q?+7TlSh+B86HqPbePezqtYbguHdShKLxOoE90m3BZRy6EOtJbV6W7FgxTAgnw?=
 =?us-ascii?Q?OEvAio5ZDD0p2Xvw9zh9JEQs97N5dBoykXlvrgV+dPa0Q15nsxkP2vwcdofq?=
 =?us-ascii?Q?/RiVKwtQZCx3S+ZaC8yjoU+X1IIRQ94pixoYufV/cal5TRAoiY0DGwSF0dSp?=
 =?us-ascii?Q?fbYVDknb+buCc3sQliypAQjXrUZ3yMMcZhFwf0cw8i28xCbY/BMuX7EPI7eP?=
 =?us-ascii?Q?0NR8tEvGdkS3fgqjz3GkxQVnCJhnOItMPRNaSbfiuK3owUkoUBHvvNvCBguc?=
 =?us-ascii?Q?+BH13CHwxkC0ySvylXWqZSCahEtXVgM1vTTLk5sKqvAMvCOHYxa1h9T8vi7j?=
 =?us-ascii?Q?xMmiTXasM9FBdbSAQoTIBbRMpx3Cm6Fs+NgE/W1L0qb2m3FYc2I+gctKAnSz?=
 =?us-ascii?Q?3Qs8HsDLecwYi0v4gyOEHQQ7vZDowOw9BwYuzhuiV2IqvX0UbRaWKCuCMpBj?=
 =?us-ascii?Q?kdSTdQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 19:37:08.7185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b7f485b-0276-4008-7dbb-08de585b4ce0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997613
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 20 Jan 2026 19:37:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19430

meta-ti / na / 20260120191542.2214409-1-reatmon

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
WARN - [meta-ti][master][PATCH] u-boot: Adapt to upstream change to UBOOT_C=
ONFIG flow
    WARN: Commit message does not include file/recipe name: u-boot: Adapt t=
o upstream change to UBOOT_CONFIG flow. (COMMIT-MESSAGE-2)
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
- Patch Series: [meta-ti][master][PATCH] u-boot: Adapt to upstream change t=
o UBOOT_CONFIG flow
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 20 Jan 2026 13:15:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e55a6808d46ba3601c1c4d1390897e07b=
91b3b91

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202601171053
- Commit SHA: fc26d5dc11e24ba44afe8cbd9fa7639631b3d209

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




