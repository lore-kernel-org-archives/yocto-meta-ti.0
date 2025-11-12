Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB7E1CD3437
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 17:55:29 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3740.1762970125039971338
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 09:55:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uvBI/z5M;
 spf=pass (domain: list.ti.com, ip: 52.101.62.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XOLyMcksoabnKHcNs1WNM50YMyqzvF0YsKRKGMBqps+NAJ9C+dhpmkIXVCRPUFKo14Ys/GnSjzfufAoM1kCTfcIfqDJhphk9xGfSHqD6sAD8PLmI/l37jsBP5gZNMPk1jEyFWrfGYmD4tCChmXu+5uI57MRwtUqL6t+Krg2ZwTOt0cshKhvrBthzlDkkT7dmSQuK10F1Y8tCLne2mF7T8cQf8pCH0R2KmimR4tVqaDf8pVO+T+cjP+NypRG3+9TtyogIX4fzv4wsUZYlwU/5uFC4PB8Rfv9oAAPTBFBze9Rg7JGfn9OBCwXMWxtu/T7oxvpjTfHo7BZtJMo/s3KHWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a1HyAcGujikBcd4uFK+VFc+X+cUKW8k86/sfYK9A0Ac=;
 b=DXlBpIyT50nIpveGob1b147Z392Ejg1phL4Mn/R5UEPa9IW/3/PLraMZb4g55W+htOQYfcXzUBNLqHgpONjkqm2M7Z7pxt/ZmGbYoEw99K7PJ+lSszwmlwHW0L27wv4vKtEnBUUArC2ZJ7XVNTh31kO91i5+VUkuZRyVDD6cYZEEmS5p05QduKVK22bG/UfScD+mSeLgSBM89hNvRdQ6nPNh2EsQu/ZiAykmYdG5EXkg8cSYhCRdyWMV9D68s7O9IYlf0AwjDu6cCstiOPCmtKBXQ9EmC7mWk+dF0x/eRUgEwxB94rFljfHricdCTwj32ZvCnMlXtW8Z4ycf1QaTYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a1HyAcGujikBcd4uFK+VFc+X+cUKW8k86/sfYK9A0Ac=;
 b=uvBI/z5MqHqH6eEwbrC0RGMDjd2AbkHAPBRZ6G/nm3CxRsAanxY7bB7vuXDJDoAZM8teQ4s9/rkzV84kmlm+cCZiH90XaqcnawxOAIqfqcQd/t5LWEjFGn0fc8jpqjLXkDPGch5JCAJXMmB4mDCBsaFNDSXcWrL1R9Wli+cVW/gFKiwg5K9zJC1R7I5AefeFVUWzQBKe9/othaU+0Jt0aWps2RN3ONJuCaQninVldjzMPTJwRVSMFiicQVpXEsq5vUk4SE3VBtARr7JhmEGVIX1zeNupPUAh/nJDHxzG78o/BiTH6lNGvn3WLEqhMU8xcKSZ8VfQup19+Yzxfdd5aA==
Received: from MN0PR05CA0005.namprd05.prod.outlook.com (2603:10b6:208:52c::20)
 by BY5PR10MB4225.namprd10.prod.outlook.com (2603:10b6:a03:20f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Wed, 12 Nov
 2025 17:55:21 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:208:52c:cafe::c3) by MN0PR05CA0005.outlook.office365.com
 (2603:10b6:208:52c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Wed,
 12 Nov 2025 17:55:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 17:55:19 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 11:55:15 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 11:55:15 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 11:55:15 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACHtF8K3077714;
	Wed, 12 Nov 2025 11:55:15 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7B401138B5A; Wed, 12 Nov 2025 11:55:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] ti-img-rogue-*: Migrate GPU driver version 24.2 -> 25.2
Date: Wed, 12 Nov 2025 11:55:15 -0600
Message-ID: <20251112175515.233305-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112174942.3548570-1-a-christidis@ti.com>
References: <20251112174942.3548570-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|BY5PR10MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: 88cbaeca-072e-453f-a25a-08de2214a518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?j3b65eUIa/onVLfvMykrJ11UXwDFLUCayH+OAHsvwD/lCJocjKvPbS1UIBia?=
 =?us-ascii?Q?i5tizUtxvcf/zl0c9epsIA20kdlvReJK3R6sacbc6TRrMjzgXDVOjZt4IKP6?=
 =?us-ascii?Q?zReBGuzO8jkvZ4OgQ1PXse6vH23ELJSe17WVlUeDKPL2CxZxDdRV083FBAn2?=
 =?us-ascii?Q?w/WkR/P0QlyRaJtfJQ+jH9QReuMMKhE64UkzkTR6mVQYTYZ27BCYzWinpLlF?=
 =?us-ascii?Q?oMz1j1rnIMGxyS389PEhFx7ug5pqhPKY65MyaP0hf07TJaxSPszmlrhO+IpX?=
 =?us-ascii?Q?ERUIkBTkwW9h1P+NNlm54P9aHrw6EB3uTvObtXtjBgf8vtvssPFcYcSwEEsJ?=
 =?us-ascii?Q?CEM2YQVOpd/K0MercEWbkCIH3kUmbpXfBAMaUBk1sm0DUQlSfmHKHO1q66XQ?=
 =?us-ascii?Q?5aQhDc3Jlh0yKZFf7pnhl3pJGOAuWoHj0US/Xg6K0+C2sAk1g0j7qiXlxXZn?=
 =?us-ascii?Q?X1SwQSsgQH9Xda5wVB+f6FDhgrDiNYg7oItpNWf8MAP3TrtU/mPqqklPOgIC?=
 =?us-ascii?Q?aFXBpZou63MAolkfVL64iN07GVhPectDpQYLS995zbZRpkk1VQXNknLYDZFK?=
 =?us-ascii?Q?vIiX4ArnnsTz+iAmF7Ne+wWUrxe5g45ubLjxadg77jcvdL84IJZj5Z9y4Pl5?=
 =?us-ascii?Q?t8IzF1XPN8JbzgeexEtp4P4Y335COjRcUkUVfjJZGPSWx51NKvWwtQl6pGbm?=
 =?us-ascii?Q?qyHkoxhMvj4jFB+QIca/VhAU976051baYr0s2iCXSlmBFXI+cjyvoE0cFwYM?=
 =?us-ascii?Q?8zhKk1A8qXZsOFj7Vn9csH012rlZd+Vl9/jrhEb09AE42KNfDUy0HTdBqKNB?=
 =?us-ascii?Q?vdao8Oh+Xf2L9gwiquAlOq0loyW7Swhpv3b1xDLIMxZNkT2lEvTbawh6B5Ky?=
 =?us-ascii?Q?qBG4dnqrs803MwBVRIdpz61pHsJQ8siRFQpEywzBjpUHmbSYmrUlN8pvPVlr?=
 =?us-ascii?Q?fm3eEH/+qznzshVAxRMcjHnBu8hiOgBVvUEWjQgdweGosR1YNWnQxXuGddhG?=
 =?us-ascii?Q?trfZuNVHzOdU2KduBDDxEbVa4MaeBsm3Ntdi+9VQE1ZeOa7Tgy5UY/OFcf1P?=
 =?us-ascii?Q?iN9YM8+iYkp026ejyKNiZbw2zli/wDqas7+qYK9KjuTViUfZ++VIYu7qTU79?=
 =?us-ascii?Q?7H5quN3jFl/V7GMK5TqlXbOLggOvMxBT0wkheEIfQXMo9Ah0PMBosn47FPkN?=
 =?us-ascii?Q?BtRbRFm65QFqQExgihriGVf24yT3sqIpwGjutMdrUEs+PWuT5EOrsnq6qnfW?=
 =?us-ascii?Q?RwJ86qX413RZWTemH3UPXFA50s96i/z8rPkEctw8o7aJXEH9reXf45Cvr+4l?=
 =?us-ascii?Q?pvlkbssQdPCffQABeadBe4AYU8OnqaIlqKNI4oBVOYYg18c+4Vs+o3gwemnb?=
 =?us-ascii?Q?9YyJO7U+xGQq8pxeKGqczZCl9qDrd3I0DMDmiVIRMT5GSqqIk+Q4YiL1LTfQ?=
 =?us-ascii?Q?Km5dE5yhYAwRR3OMl/REBcXcSqzL26nL+gXA5LR5chTL9aUb5C0lhAwOnR6G?=
 =?us-ascii?Q?pAhWspvVuJztdMLV0wetyjgLdoe5s8XY/K13gqL0ura7LZNEpCgEI6tVfOO6?=
 =?us-ascii?Q?OYVCTzE4G2AwJLKPdVE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 17:55:19.6490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88cbaeca-072e-453f-a25a-08de2214a518
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4225
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 17:55:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19250

meta-ti / na / 20251112174942.3548570-1-a-christidis

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
WARN - [meta-ti][scarthgap][PATCH] ti-img-rogue-*: Migrate GPU driver versi=
on 24.2 -> 25.2
    WARN: Commit message does not include file/recipe name: ti-img-rogue-*:=
 Migrate GPU driver version 24.2 -> 25.2. (COMMIT-MESSAGE-2)
        patch



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
- Patch Series: [meta-ti][scarthgap][PATCH] ti-img-rogue-*: Migrate GPU dri=
ver version 24.2 -> 25.2
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Wed, 12 Nov 2025 11:49:42 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 93199e9cdcd66d40a1bd0bb739b37b852=
4bf5899

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511070802
- Commit SHA: 5b095d968eb225b72e44dc164683aa9157ec2b93

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




