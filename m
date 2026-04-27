Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67636FF8860
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 16:35:31 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.285.1777307728017990867
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 27 Apr 2026 09:35:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=WMN8Fzxu;
 spf=pass (domain: list.ti.com, ip: 52.101.57.57, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH2JbCFd67k26c/yB31ymjZ0zjUz7scDAEGaFTOb9lP9ECUAYSjEOv7l8sk9Iud682BrVWm7x19A3sqxw2JAzenCJkskg9ojS0DwV5S0tfotux1OokIPySmgSVG3xkHcqBuCB8SXVc20LDTupp8vJo/ptjbouncnb0F2xPp6ux8lkw/yfiiu1FAbC3eLDHSsfaVuWL1ih9BqZOm7Uz1HTjifMrVv7WmtFtRjciwL/fcfR5SWdLD2A2cjfRJIFgHXQBp1D7RFmIO4KT7kmK1Bt7HNskOwoJkRX+SU2ysKxZXwKUqP7FtRNEZuKpg8ZzCinLFbNebDpl3QCp3dmYfINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q1/zhgnDbbqTHswhXUuxvF89zvKdO/wn29qcJVtkkL4=;
 b=oMGJs9kBTIg5lrkFbNs07acJHzMMmyeQ1vzNWtJWp62qDYj2CySPa9urQu5kZ2zIrLfcq7kzTC0U9GrMXtQGJbOBhNWfMJBOaYQuJOpHuoO2M3rXhQRakA7wvCaRZl9E3ibec8L6FnlIpK0VuOdBdMy3nx9T2UwdODGOOcUHhgjZbOZ7d9yH9OGTjd1GhSwFb0o722lL5cW9P/gjGDFnFQbBfmAZyWOhWOWLwx+GnYr2YazBlozF7T1JUuA51FBZeP6TNGGK2sVY9LRY90tfGB0BHnGgfxxyrTMCfrLTlAiHqZgOSvfWEpEg5A9k2a+jN/Kq65aqtl+r0L9SSLhKow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q1/zhgnDbbqTHswhXUuxvF89zvKdO/wn29qcJVtkkL4=;
 b=WMN8FzxuPv4fRfqMlHoPPd9zxWcZ/NJvbw3vesM68I5SvEuTVilAo2oJOYc1VvO+3N12XaoZLNUbpsTHmhGnMYQ9PkYrPIFP6gVuqBs9lB5+koZgEozIXdCHwnDHKwgqXXwqIbPwSaVGQPiwoUE1/Y5sAgx0BYh/OqKLf6ztg99sBlvX2zU27dE4xdQHka7KFQ86rTqwW0fdJxwjcmcF1XjJq24t5jk/Nrm+/WNJ3RnRjPV8TfjQ3Af7PHiRH8uZnUFiInxNXWg0wlRNWh3iBFZHvDSGorVd206UZi9kdrpyaWW8w36VpY5TedsxZ575mcIbLTbT1bEb6fveN0itrQ==
Received: from DM6PR02CA0129.namprd02.prod.outlook.com (2603:10b6:5:1b4::31)
 by BL3PR10MB6260.namprd10.prod.outlook.com (2603:10b6:208:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Mon, 27 Apr
 2026 16:35:24 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:5:1b4:cafe::eb) by DM6PR02CA0129.outlook.office365.com
 (2603:10b6:5:1b4::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.26 via Frontend Transport; Mon,
 27 Apr 2026 16:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Mon, 27 Apr 2026 16:35:23 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 11:35:22 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 27 Apr
 2026 11:35:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 27 Apr 2026 11:35:21 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63RGZLma3664154;
	Mon, 27 Apr 2026 11:35:21 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C62652A57; Mon, 27 Apr 2026 11:35:21 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Franz Schnyder
	<franz.schnyder@toradex.com>, Ryan Eatmon <reatmon@ti.com>, Francesco Dolcini
	<francesco@dolcini.it>
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: Move ti-eth-fw-j784s4 to AM69-SK conf
Date: Mon, 27 Apr 2026 11:35:21 -0500
Message-ID: <20260427163521.3751099-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260427162430.24979-1-fra.schnyder@gmail.com>
References: <20260427162430.24979-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|BL3PR10MB6260:EE_
X-MS-Office365-Filtering-Correlation-Id: c5922b4d-3b98-4357-58a2-08dea47afaae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	htKH8+u1PgWZJpXxA+oUj91sgY5P+zPkjXdWzLjH4Y+njilbWS7pGBKGa0T00zAKwp1jm09Be1RnjugtLDn4pqsoEZbJPkH3O4+epCBT1weDtXQxlVcYJkZjFaEYSTmX58HLbJwqEz3D7u6hvfWDXQW8z5ONDSpBf4psfrSXWjq5QgAMOmr1YieVcIHhBBdocnZpg3C/xAH7tvn7FuZqi1bV4AeYy3M+dAJgY8jGayEKLHx6/sRx0T55gW0sKgBgwgGsTd3BkzWZ26Eej6FZK1hDGwllVCUzy3TXD5xQnbTnJOGygi2Ws5pLaXDwaniMkTEfUWVYy4ZPgU08mpxeMmg+neVqvtxvbNfSmHZ84B1L7g6egNKQiB8brz0n7sM20KakxFupaFtfpziRj409a/a94A6BNFMneZRoIne0vw7EbGxLus3l51yogbklL5PD+G/m+69x1yJgBUfkIbGjwzGinJkcVQlWLdoj4ciLx9BGZEwUSA6U8OPqXFv1Dm0UexP9ZhGVjpJS9pSuTFT55I+RyG0b6SwDO99OaGD0pD0+7lIPQ0xe2x0KKru5Iyfg0NW+082C6bCJ0z1qmCfFEYWfshyDVrn6EkCAeyLOrncvgb7oRjKr5kNuTTvIC0pB9HddO8LcMISOMS8unYvuGNlxbpj1UXAdsfszWzzUnIYeabybkSmXtKGxbAcjz6ES4PmIUD8IRxr1TLLW55DREOUys4YJoh74474otIIT+Bc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	63FNHWP8bYmxoHOB7LD6b2fIHZvm8Tjk9443QSexHuTxxdSTWKKrDuMoOTrqNcsqeaTRIIhSnwfF09Vl/MZ7W7ew28ap/mZ7Jv6D/3+5b3sHjFyQ8uOLxCkd1vdsGsTvv+KlHbLkovRLLCjNM6KXXkNYFgDnetS/P92jy/NdA9QffC6KooZyxy37Tecyt+L/CQl16i41eqgBhWMMtOEzbYywNjtiE+MFBcl6i5YhV8xz1cAVSG00o5GDn0stkn3OxB0RJ1pjo9BBs3HfBrYl+f+W2Rdnn1omox2151IZbz46+1E2QuJ4B/qCyAI9eCyJ3khGSIHYP5HqxSBuwPJEnCj2jcHv6PmeWKJnTI4HoU5fjskcl2h/ZiN0DlBiYbCFk9dxFddsknU5Mfs5e4qmTR3eDrCarX8nkEEddBeXbecPmb97NhrilN+slNwd8ES7
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2026 16:35:23.0879
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5922b4d-3b98-4357-58a2-08dea47afaae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6260
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 27 Apr 2026 16:35:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19878

meta-ti / na / 20260427162430.24979-1-fra.schnyder

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
WARN - [meta-ti][master][PATCH v1] conf: machine: Move ti-eth-fw-j784s4 to =
AM69-SK conf
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: Move ti-eth-fw-j784s4 to AM69-SK conf.
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
- Patch Series: [meta-ti][master][PATCH v1] conf: machine: Move ti-eth-fw-j=
784s4 to AM69-SK conf
- Submitter: From: Franz Schnyder <fra.schnyder@gmail.com>
From: Franz Schnyder <franz.schnyder@toradex.com>
- Date: Date: Mon, 27 Apr 2026 18:23:46 +0200
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 630c21806e347fdb92ef43f4a7e2fba23=
8dde30f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Yogesh Hegde <y-hegde@ti.com>
- Commit Subject: am62lxx: Override serial console to ttyS0 only
- Commit SHA: 9596245b1d9c904da596b9ae553c7ed3c132620d

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




