Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070A11093175
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 01:51:07 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13545.1774403456911779527
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 18:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kQwISLOm;
 spf=pass (domain: list.ti.com, ip: 52.101.46.16, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuYgtFTAXmBMKUDUnPlCK6XvPShcLGLYSs4sIcrO3jEUy30nNPA+Dc0YAuOrfkd6puZ8msr2DZLrVqlv79O0z3trs+2SdnNp6aYZCD7tvZupil6Qd4R73LIEv9nJtJuhCjMViHv/PQkNVmDI66EjNxdwUiCQnVo2yVbUL/B2wOkErbdRHnMd5I5tEB/1mlah8tVpdNPYuZ4P9Kcf6OkYSN7dfm1CcXW+sqmN3Ne8hEM1v6SViunexEQyvIqmkhRHdGhFuCjwLdXbuRH92rfvk4sSJryVGtsg8Bge0HEOzwtqtdeaBakwHqP2EOGt56dbIIzjsTK3l4etEXAeAyeFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XX6rQoA1lTBhDk4FjDB4FSe50W3PswKrP+lzqsgo9Ws=;
 b=cT5ZH/qnWb6EPhRdF9yBEZvN6H+A3OuDkcBDhsuXgpGILt8mPG9MGt46T6nGBjKMfLuHY7q3Lf5D3O2nal1VSjxOLz14nv246TM4hoir1+soeS/toq08ZmfrfuxZ3SebAnd1gvJgkZUn+TVcZjWqh7TwaAmlPKL/dmIfcoO3W3xnG30NQUFb4oh4QEfiUu0Ms66WtxBU4mi2u7wL1n984BbP7U1uFE44T+9g0+/19K+J2ex8HxdP840JWUeIFBzDO8MKq7h6mslHjFUDn9NHIC245+LqPvjioevXJK3guJmezR5UbWt1AGbuOxpKlByC9srGsYoodmG5vRvPGa34XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XX6rQoA1lTBhDk4FjDB4FSe50W3PswKrP+lzqsgo9Ws=;
 b=kQwISLOm5N+mP5MB07oVM+2aBveU7O2Bv/04+yoMLYDqROzhOzKLq2b+SysSxAWXKvfINinO26qgs3vf9dASeHAEILPrEc2SQf09lwa7JJi6hf39XMQqAo6CTR1OiroaHbO/3/5CB0/oN63tYvnnXqE59sOCNN8OxoCZVOONYamzvQL23553iy0JhAM0J/FO1Q89VPDPuWtfQojHeb1+Ht/uPMj873MZNl9hB3Hwzrqrzoy89wu0cGgpieXPDAXnrk/Z6PYDbwP7hixfmGGN6qehF0JiYjJeXYg3DzBwrjN+XZhkHJoQvsH6k7YGrnsbvkj8Y+Q6SNdj5J1WH1yYEQ==
Received: from PH1PEPF00013302.namprd07.prod.outlook.com (2603:10b6:518:1::11)
 by SJ0PR10MB4735.namprd10.prod.outlook.com (2603:10b6:a03:2d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 01:50:54 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH1PEPF00013302.outlook.office365.com
 (2603:1036:903:47::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 01:50:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 01:50:51 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 20:50:49 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 20:50:49 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 20:50:49 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62P1ontC3624200;
	Tue, 24 Mar 2026 20:50:49 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3D8B49ACF4; Tue, 24 Mar 2026 20:50:49 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603241800
Date: Tue, 24 Mar 2026 20:50:49 -0500
Message-ID: <20260325015049.1129280-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260325013729.3326901-1-lcpdbld@list.ti.com>
References: <20260325013729.3326901-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|SJ0PR10MB4735:EE_
X-MS-Office365-Filtering-Correlation-Id: 38869fdf-eabd-45f8-3771-08de8a10f22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	NvmM96CT2pFoyyDbo/vUwYsdo2BVGZzIgkAE2G5yg2GVUtxbfV34COjbSagTP/XczjwSlIAzcvg+oxZJ2PTNOy8+7kZ35ZWjqn74hhfIkHPEzFzOaS+zKrvLWKYOf51V9dZzYrCH3WljRfbBTQn076gBMefue3T2fV8bwbKdXpz8DvyPiFLIz0AtAGjIF3ew7EDR2zzD3PrTToVyikJ7zRIZhbaCzf96pV4gq45O8nworLz1XXRJ8PxHCPP7WQuxsSvV0Hb7kUMismDwZyZ0pwSpqsXUB8KmEAFTOsElrjj3h49axTULQajyidPkCtz669OuXfCFSx+YSvS3dV81RQm7+4wysdmY+kTHxAwuxfZfriGCtgheeuWHcRJhqIB4aMUA0YtM+E6b7kkCByxcJI1ELaVCdzRcitxoCWJjvX5licsGlWIl4HAUzDvPlntzyINvGzkMhLbuP4pPdrhz3dk9LFi0GvnQ4WAdKvy2/tVaU3KxPCr4gRdRHgAXLQKkMdUji+6t7l9ac3i9JKn/NzvXXZqO+3J5m8c9rr2SkjscjYxmChws/nfCwZu6swEHbHC0v/l02SiSYbg62VyS7lVbQwj1RFsI2ZyejxBLUI44zZpXulT8hrB0GNZQLhQKg1twLIrgcYzIUL6YPop/FrddVx30vYaLInbUl/FOp+1f95qJuqQMJYqA6OaMahvxNrq2ZVttTQJ6RMGk++nI9DsrF4VOGwqy1qfBk7WiyYO/GVSg6QA6eiSoqhBuGjxSTEejfStska6l+cOKv17qDg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VCMS0tPFYHbxoA4XPWwWB/m9727kh3Dxb848AwEsT+1h/gOHD4VjIpRuahp+r6aTfFz7jjDSybl/eo/1sTp/MdWPfGxaUYh0hMj4eFYtuH/Bd8VWTdcubSRuxHjZkLxJKZA1aS/w3RKVMaLmo7b6NdLCffdzs5CA+mr8KAGUY2RrOYyJanhiM5unnUaod963PRQI/MrrHBi6C4TUxWxX3uHtOwhodSCXUsOXSqv53tihXycoRgJeUYrxn3qqInm0DXxOcoN9VD/CG/VJIY0am4qbdz6hs9gglLW7UHUBkuSGAKdx0r633j5VJ+znhXbeBZWveNfPVRgD73248ajMBb2EllAc4kBxdG1/HAVQ8RyFsCoCyZJkTVFgXeleOz2pxJ+r6ekh6dkgCC7pg+vEmAHC8PEOi/pLqKxbU17+jJUK4WVnTBWqucEfcplLvFK7
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 01:50:51.9627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38869fdf-eabd-45f8-3771-08de8a10f22d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4735
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Mar 2026 01:51:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19812

meta-ti / na / 20260325013729.3326901-1-lcpdbld

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
603241800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 24 Mar 2026 20:37:29 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e0b5bc5347c6422be6d60deae9d399d83=
7ba9bda

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Shiva Tripathi <s-tripathi1@ti.com>
- Commit Subject: conf: Enable dynamic tpm-layer support for LUKS
- Commit SHA: 9e86280d686586ae0328a44cbcc2ff45e71fdfca

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




