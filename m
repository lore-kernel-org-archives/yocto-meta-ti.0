Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8789FB5EA6
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 02:05:36 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.71])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.67494.1773713130359421620
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 19:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=TWlO2Dv4;
 spf=pass (domain: list.ti.com, ip: 52.101.61.71, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ci2K6ML1Go/XHeYoyRb5898ddeOS9ODta/R9zJlIItbUhm9I8L8jrrkyD8FJ//fd8HnWVaS4Vwt55VbK1046ZRT6e2R8eeW3DbDVBHx3xo5i6kkhsq7DrNZMZbwzbJpAvDFmgNoEc5alN3ad6MxZCMAcEFkdwKHmI0EDOherkLCB6rmjmqTYXaK5lCEtCM0HRJOPL6tMtKfJFhHbXoNJ0V22zY62SZ9pPaeLWT1FkETOqh6vsYKs+WiVPd60ohhUA7eIu3WqKSOVTj9ue1bjh0xgqkbb15jsQZDTZajnwtLQaIJTF8XT703++fuf/aIMlQRL97eQ9kAeX96R3xNBCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YdkvqCCvCxOrbBwmIqznoqehHsrFun05GD4enQWuBZY=;
 b=Y+U8A7Z1QyduvJzZrWDsPGuqSttoM2zFuzH3EKOzq6Oa3S/PSOLX+/4NUq/TinAbihcrNBOzgDh+DCLhTlnaclunKdB60fxTUTzccQ1cV8l4G7REuC70jbK4zhHZwmuSZwboqD6DoRwe9+4T+AwE9uDn57quGmGDe9kzBLhZQgV7TwcJUQt/i1gTotX5BkY71o7ChbAzLVHi6GGnQP6MCQRMkSuZxz98Y2ubs/Ii/3Qvtg3yTwJtLLJRB50YaQ24zNIUb2rMX8Keh+3Cn3f1fcH7XPZQUUGYXexZO4wXBc1+WGy8Lez50LtjZWsP3UjLWszjNnAO3+Qa+lG6ak5PgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YdkvqCCvCxOrbBwmIqznoqehHsrFun05GD4enQWuBZY=;
 b=TWlO2Dv41Ulp0lfphZg9l+E1ai+K/Ps9g921Vih7rkimc/H8y2SAcHbG9YfPGcdSWk6D3YWOWj+KNlPvr6YaIG/DsDDeg/OdVXeyQRpx2zyfr2cjniQGvfCuwHOsqXj0Sm/OdeRPg60jKBpxQKR04nybs8kq9OCV8Ag0PvOhvPAbcteYistYZYAtwL4lUa+gFir9U+MzOC12lrRamiyGqJoX7lnTnqERgdieDF+L0HqXO56ff4azCAGyxUBxml9cW7uyqmMxQFVBn+7RQSDPL2Llcziu0Q4up/vbreXh8vUbNuZY4+uHTEAqOWjbL8sGjKR8ppsiuyRVwQjB68G0Bg==
Received: from SJ0PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:33f::16)
 by CO1PR10MB4756.namprd10.prod.outlook.com (2603:10b6:303:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 02:05:27 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::7f) by SJ0PR05CA0041.outlook.office365.com
 (2603:10b6:a03:33f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 02:05:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 02:05:25 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 21:05:09 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 21:05:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 21:05:09 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H259L32305089;
	Mon, 16 Mar 2026 21:05:09 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 198B7138B5B; Mon, 16 Mar 2026 21:05:09 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603161800
Date: Mon, 16 Mar 2026 21:05:09 -0500
Message-ID: <20260317020509.2748853-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317015231.85449-1-lcpdbld@list.ti.com>
References: <20260317015231.85449-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|CO1PR10MB4756:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f63a361-b09a-4894-6554-08de83c9a7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	YkL96dLQG1XYnz1D0GARxxvMFisOOMRXKvcdYxnckwI1whcOWOn3n4WKRlNWNp14Y8kRvFs5p/Yrv2PFMMSXYdoAKkGeYBdVfnmjq3oACD2HpSnWmedNAWbzDf+j1NSuHfC/zSBUerdy61XgGAdnUx53io21OgTyv4wcEHlCEcWpiCFjT5kmupU8QjbkSxUbHW4ZU/EBZ6fVy/d0lpenaUmzxPFgeVhFRjNoKAp0F/RrjHmHH43n7b1whfJ8DVXCozgWOD0VIAmryARR+nbjyMzsWzwVKci/FZNVckTPn/M20x99uXBaLcMJTNLrEzd+E7JRuwN7GJONGz4L+//+i6NNuACt/SnptRnGNozCy1Ejd22H1WjFsJ/SjqSFzTsA8ch/QYVoFwyV5PdG+ocUts0BabXE1K5aItIXwAEMNoDzyftDZQT+F+Qt5ATqPqz/2WVV2oDMqpANU57HfIJ169Qr+7Iha1IRTHX8zXYZS65NIa02vXAHSlnjLWyL5b9KPd3nfll1CBSSWNfIseAgmFidZvjCkUxXQJUgCSBqlXlKCnicaux+H+9YdiIaWCKmUUPb9wsHBDxXiJCSpzOKMhglvVo7wjG4FUfQXxd6QI76cEGQbjYl/UAIKdxdJmIgmGPz3uTFY2fOy40nTPuI4LfgrHd/OHuo0w30saxbyTsC6g0FikCxR1bxYveTx5Jb2Abva/klcmnKutVCEILEYN68V2q92TOdCaWKD9PI4lUGu8RL9PCsk9yVGM0c1iiK+JI1oXL06/BPxdexJE1gUA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	pYD1Zb14M4v1mu0wonNSUCC7LO2dm3afkaFerUBLrvtBufRopIGwXOFnXaJakoJDhb6VUh/owprr9qFEAOkiY2+ZeObEENQDD9vrbSYqS4Xt/Ij4UUm0jqZWDrVEyhPO1uEh33PtKkzvjBbrDkhlnKEX2NVyhUvl8WPXB5vOqhQaDYuVB/YImB3hFZ654cI+UhbH+vwzgg2/mLhSbfxlKqD3VOwie7fGgfP2aFOQHkQoTwbk6W+jX6DR5E3PS3zrbrIHsHovbVxvLBC+wCbuvNzWILIhGy2AxJmDQZ6RR6OG+hY9w4268QHf34yWJB6Qfmw2SDRlFxOmkZ4pZL+W+hcpM8hhPqQ9t+X6xZkrUFM5NtR/aoFcPO1V4qXIOARlp10viZkfy1ftS1sHqMF2mGbjze3E5B6Fc3Uzt7FYtRabhLeah2WkeV/0qB3VUYCE
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 02:05:25.7679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f63a361-b09a-4894-6554-08de83c9a7bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4756
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 02:05:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19729

meta-ti / na / 20260317015231.85449-1-lcpdbld

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
603161800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 16 Mar 2026 20:52:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 840ce8c729d0dc7961764accdb6cab092=
8989857

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 00d3d9ec970580d296870c0886bd6836c3caca0d

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




