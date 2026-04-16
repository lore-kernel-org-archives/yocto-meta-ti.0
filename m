Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42335F88077
	for <webhook@archiver.kernel.org>; Thu, 16 Apr 2026 06:55:24 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7838.1776322522297671054
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 23:55:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UncOZ6B+;
 spf=pass (domain: list.ti.com, ip: 52.101.52.5, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LP64S+geVfP3QgVQX2SoQjZxCj2X3QKrGiODoGvXd0j38YOohT7p9mnGG7sW5wj6KEPUAUo9W/cMLCDEHNSIgJr7vMWQje4Ftw6V4rU6WlOmhW5b7qNDJWX40jjhBEajbi+FxzW6GLvbeyiTeEQT9/d5whcv/Y3f66zi3vlwO1y/PvqMuRNjwqXa2/iJFIXKwfPGJC/y/MUsme8yYa7NiTF56xoYY8GvkG0ZE/hMyHTylMtUcGSa1szYrVTKuXKm2Ahqf4D0/9JFExRQDJ3w+b+sVbhrT+p/drWjnNgUG2B3IdY3/MQAF28a5Xx5ytflEYocO1IhMegrilomwbQnhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tFXnRRhWGrfBD/CGXscsMv3VyaK4rETxNQV+fE1n7Q=;
 b=DEo8DTX7KQIf/7t8wmv2Dtbi5LRaQvRqEOcD0dag4RK1U3J41dfpChlJmLRYf0OsMk/mUzL7mPrwEtq64Ta7yXUpdnBpCd73Ym5CQYGL0czKc0i/cucrZe+6Ox+napGRsbHsg4ay84qoixZ3hk1Z7T1YwweSS5FrgcFpcV7nX/iLrgKOkfe2cJ2hEovc09qW5vcH/JbF/QS95tpbWvMbe3jFjcrYTxouYyQ7tkMQS7E6nLIz5/q9Qn3MeWW7i8EFrtoqYvDXACAKeL3pIxIN3G0k54z583UoT4o48cnj/39lWB9nr+zCA9ZA0uIRdmMdpF780tGH2TlzLLd7OiZZSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tFXnRRhWGrfBD/CGXscsMv3VyaK4rETxNQV+fE1n7Q=;
 b=UncOZ6B+IfOorqEA5YI5TZka9T7paz+IMMTynzsNwCYYoK9hyCA26a883jdCdaYZahBGxM3bXhdi6cnGADSrutziLCX5JqGcFPRR2TStMGpHl8rsLFE2JQ0BZuaoBWZWqvobDJoDCi9Ap61Q98Wxi2awKYS2UhGSfTk8aTPcfaXENO5vmIcmjovx9z+F6NT0GmSf+5m6URIkTLfqZf3Zf47vLyj8xZtrnyDSn5bB7gTWWn8niX5nb1rBFxX/h9YRnAuIz8OlFXQT2U/vnzqesh45F9RzKA+UFTfKICJPLT+MPmUhrpEkrZQrpEbpbp/GaquFEFL11AXb22tKziaAvA==
Received: from SA9P223CA0019.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::24)
 by SJ5PPF0BB87A13E.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::78a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Thu, 16 Apr
 2026 06:55:19 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::3d) by SA9P223CA0019.outlook.office365.com
 (2603:10b6:806:26::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Thu,
 16 Apr 2026 06:55:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 16 Apr 2026 06:55:18 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 01:55:01 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 16 Apr
 2026 01:55:01 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 16 Apr 2026 01:55:01 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63G6t1Hu1993969;
	Thu, 16 Apr 2026 01:55:01 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id EDB882A51; Thu, 16 Apr 2026 01:55:00 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Franz Schnyder
	<franz.schnyder@toradex.com>, Ryan Eatmon <reatmon@ti.com>, Francesco Dolcini
	<francesco@dolcini.it>, Andrew Davis <afd@ti.com>, Denys Dmytriyenko
	<denis@denix.org>
Subject: Re: [meta-ti][master][PATCH v2] conf: machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf
Date: Thu, 16 Apr 2026 01:55:00 -0500
Message-ID: <20260416065500.2290454-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260416064023.1762200-1-fra.schnyder@gmail.com>
References: <20260416064023.1762200-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SJ5PPF0BB87A13E:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e0bdf1-7ac4-44fe-3164-08de9b851ec0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7+mYPOytuyhuyv7dyKrA9QZK6IF41YKlUtDlVJxyJKePQsuSy2xjkEqDqyb1i85M0xuI9aK8lNrORZlrrkNeRFucShI0tgWjCXbtBND8//jnYSBbnWUh/hO1R1+EDJKFZdwLby03gJH5KdylBxaulpnT5K5z4RowyRPjCRoYJBDYMgku8b5kWYHYN3pJQe+i4TWMkAipumDDzhIhC40IE5aBCPS/fZayRMtNSpEO1SVQHexOC6oA9s0qJMxM+bctKb/RKpDbLeoSMlpyazRej9UYurOiY/xyB1tvXwXaE4zp8Z9T+vNaoicaS3yTIFhXMmO715+uwnEFu/MIFmlYGgeFPjsek714pCi4uR2gZRawdhTmRHkOcj+z6375ICkJzmaqcViTIqfwyjARga+7+O/tBsHpvRHg8pB6AHlddkOr3WYH5yhptQx7junlNSmeMcDElytKj2oCAFKflTJ1w+s+4DpxVOCF33nLOak8/EU4XRFtyJPAYi5GLiJcCY11v+5YZLitTw6WzRpSjgVm0UQNOn11hU33FpAhSrR/i2vA8p+8bVxsxADztGSSANGdDTVIgxNrI4qEjmmzdivVCudp9bD4OdTIjMuq7KiaN5Tgqlgf1huBrq2EXT90o8FWroA/QYFIKf0i6TEKQ5OCpgrq8uV2v1UFy20ZbvJv6MV1ONe8g5nQi7pxcUimF8bAqnbsoJVoCmRnhDrsKSsZrsvomheucTyV1bg+Gqh4y30=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BpK1wHKz9caraTk6F911PgD1SK3EUGQp+3Jnh0NNrlFCOaIyS35ZD5zmxs0V0YKXkIy+dH3T2Tw8rRvIHrEUI0ytLxuX4JJdIB0ZP1qXmxN70A06e1kqNmvfZ4/JoQxanaZkWCwhFAihANVuBYXijCjJLpaX3BGowBqHZwYSQ51gOrx2E0o3XvFkk9AM4nxoz3HztBJKxIHPACpmi7OHDzNNtGcjfpMgUojodXbCYweKAGMxo2A4LIwLrQAKNRQbNnuuMbPuoxSKngLCBJVkmya3FS+o092OKDC9YGWi8sTcQ4S/veWNLDpeRaXOK985nkNA5mv5wx2a6MlbZ1WhGOL8LYGvVghvgE7iQD1/yTzcDFySieydmZYBEZIhcspLELYqrs43wLKtAw9dHRnFcaNOR4vaCMfRDC8G/HjZYa0iROV2yxNuW2zr+rdL/tHF
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 06:55:18.1338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e0bdf1-7ac4-44fe-3164-08de9b851ec0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0BB87A13E
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Apr 2026 06:55:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19855

meta-ti / na / 20260416064023.1762200-1-fra.schnyder

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
WARN - [meta-ti][master][PATCH v2] conf: machine: j784s4: Move ti-eth-fw-j7=
84s4 to EVM conf
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf.
              conf
              machine (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti][master][PATCH v2] conf: machine: j784s4: Move ti-=
eth-fw-j784s4 to EVM conf
- Submitter: From: Franz Schnyder <fra.schnyder@gmail.com>
From: Franz Schnyder <franz.schnyder@toradex.com>
- Date: Date: Thu, 16 Apr 2026 08:40:22 +0200
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: cef3aaee26c630f72b75cf7e67571ce87=
6c20770

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 184758af4e6c34169d229c75fe94e8886ac3d7e5

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




