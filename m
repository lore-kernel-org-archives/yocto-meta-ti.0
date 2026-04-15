Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A8FF419AB
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 13:20:25 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18767.1776259220060582110
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 06:20:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=JPhdIF3v;
 spf=pass (domain: list.ti.com, ip: 40.107.201.47, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDAywfo0xi5HkaQoUZsCpWrQ6IEm+XhwjbVl4nk6tH1HE+6Y1cgz2I2azOod5T4VeP3lcec3x5+Xvskv+B8y9cMrrmcrNLI5EmIDKigkZUAzD4PKibyuhDHxyDGOOUwlsQGy8xsf6boS+NiKndCRloEz5OwdyWhb0mwyeyEpZnnBDfDEoEKQiqB7F/1/w2YTUun7in/P/7i6HrrP+TaIBXed+YV7epAd8tirSJjayM+eFz5AOg7AwhXK/hv6Nj9pBRCU0kSefc2dkjrX+LkGbXgfhRoMgBxy5m20+N9RvdwmuUaRHW2ts1sQKjnLR+9mtsGHBVf04ZAclX3/tMDRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izWsJN3CMn7pl5QmRBkO/1FfcNjTuEIYZIgKfzauZYc=;
 b=QUMjV+zNgs1uEXRe/BL2haQcSJrsClAew2D/mrKZrGKsNK9mdgoOR8aDB2GNPDDZgkxTQDJQhhCBWAnGnsbV5JbsqXBE+kginUL+xeez5csG9YQek2xmJlIyfAyHzMsCvz+SP680jhwJzKZuo0EKUsTf7qGKIGCATi3OJhbmfU4LxAAG4UAQbtP/WDVPMYhNiPC6y0nedjDkUrpsO63dKmwMeX3FJTGgyRT5NQ5vHQBfQA2f+F9M1qnk+asuNVftDJu8mueyjKDdvqrPVySspABYuu8RDhY26ARD6Z7/C0/uiemb5NOhoNxsjsw8KUIRaTOzdtqpcfIb6a4ebET46Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izWsJN3CMn7pl5QmRBkO/1FfcNjTuEIYZIgKfzauZYc=;
 b=JPhdIF3vU36q9bzvDaslUg/hvtPYT/HkOAhbqpr0ww550JW1RF5lt8m/SolcwOFBoqAuhTnpUi/ida/Sv9zpWjvnQ1Sj58uzBbLHvk52t3y3TQpg4scZZARtNNy6Ko2gZws2ZDDmHrS6Q7qsSNJBX7kYs+CJDBP/7kjaFrq0XQ60HiTpH6oXSwiiVLpLZlUWx3u7oxLzA3y8TyyEIpHB4gpHkzVDnNu1wWsjv4OlN2lmadP4lB1qc8oHh6n/ZA1ChBIfw3TyE2OoO3wbiG4jcFpkJ9NEYNo0hrgZl9f/LzgccHup2QOXDjaDX6+WNffyKjFJ+Te3tOVNfKin0R9VMg==
Received: from CH0PR07CA0025.namprd07.prod.outlook.com (2603:10b6:610:32::30)
 by LV3PR10MB7865.namprd10.prod.outlook.com (2603:10b6:408:1b8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Wed, 15 Apr
 2026 13:20:16 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:32:cafe::93) by CH0PR07CA0025.outlook.office365.com
 (2603:10b6:610:32::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 13:20:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 13:20:14 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 08:20:02 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 08:20:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 08:20:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FDK2dh2054326;
	Wed, 15 Apr 2026 08:20:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 538E661B; Wed, 15 Apr 2026 08:20:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Franz Schnyder
	<franz.schnyder@toradex.com>, Ryan Eatmon <reatmon@ti.com>, Andrew Davis
	<afd@ti.com>, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [meta-ti][master][RESEND PATCH v1] conf: machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf
Date: Wed, 15 Apr 2026 08:20:02 -0500
Message-ID: <20260415132002.1158635-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260415130514.1660759-1-fra.schnyder@gmail.com>
References: <20260415130514.1660759-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|LV3PR10MB7865:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e1925f-cccd-4992-4ed0-08de9af1bae2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	hUS6bNoruQEvNmpbnNBoJ2olge9pwUCg0nZ4U3e5V4luG/teJhjrJFACn2nx7R12zvixklYfSljOWMqj4+qCJM0e+iP0OvpEFh5OvENRPVZ2XhXnOkuL5vPBDILOddexZW73QnAzAfwJf5+KAe7Che0KwZ1wli3/xIDbHdykJlpyZIh9yay2Ivl4dqsqbDaKlzz4K586yiFKj8z0OxeQo4HxYiRQ3wc8t0w/O2pt8Tm5so5Xp4wV8zuVPwE8XjiZPGWirTLHDAqWvILliC7ffN4jJspMs3BggtKzA+8HGTYdzYVKFFdRu0EqvpXulngIBFT7I0t3EcKejLg+Ym+yTuAKKhvqQbDrMNhupmBZYbpIdtWxcGR05JXkXi2t2qrEqfGqJGvYx3s1eMG8oePVkJ5UNwIQuZ0hiqJ+9a5ntcYaTnzv6RPfQRG5VgObA4CyTVyKg+YcYrZ1vAjlpJuIDiRYcFHafrlSm2Z+DY1UskoLxK9eLvjvSDPhqNtQ1MBNvSgVIhYWHuHDE9PGhWYBX4p+i7pUPZtT4afhbqj/YwZ/XpDjiD2lAxD3OvoupW1w8I/d8/Gyj0mXU9/mGxbWrxx3i09bAieIfvn6xUmtl6WTZQfk72ItimBHDcS9hlqyGEkozgC27AJxhFBp8flqea6T1NruD+fr5JKkUEgtthWNPmH46jd3vQQM2ycu8dSrBmYfITo/TFEQsPL2w2XITg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mN9m2Afve5Uy8S+7iGqIUQr78+RZ3+x0ccZMs0DQhdvkQ2Rh929CbrVM202P4N1wsG3kWa0ABucth1Yy5kVPJTFYdiyqGl6DVkEF/2FMZniDkOqmPNW4cuTLsQn/U/T4nasZYgGHtqDTlrdO0tEXXInKi8Zb2lKafOF/fszqsulsQTJFoxt7j5BGtn/w6ig5D/qZUBMWqn7+UVe7Iy7WcWrCqRCtCiGbs5Lp6oSeQVOf748bFlSj1w2I58+Fm08fOF7WLKh9hX4X6QeIRpJgRvIcOZUPO8UosIuheaOtjymZtChW2ZJhfpl5qu6H+FIw9lgWt82v0q98LlnjVhTgjDxWQFgkoO4cWyvGQRf9RXp2JswBH96Rhco1IqqNCAEafBM9cGdjkEGPSN6fcQ/HS1URMPZm/HUXXpgAwIczwmODSEFZ32MHRZZD3RpcOezm
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 13:20:14.5411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e1925f-cccd-4992-4ed0-08de9af1bae2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7865
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 13:20:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19847

meta-ti / na / 20260415130514.1660759-1-fra.schnyder

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
WARN - [meta-ti][master][RESEND PATCH v1] conf: machine: j784s4: Move ti-et=
h-fw-j784s4 to EVM conf
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
- Patch Series: [meta-ti][master][RESEND PATCH v1] conf: machine: j784s4: M=
ove ti-eth-fw-j784s4 to EVM conf
- Submitter: From: Franz Schnyder <fra.schnyder@gmail.com>
From: Franz Schnyder <franz.schnyder@toradex.com>
- Date: Date: Wed, 15 Apr 2026 15:05:11 +0200
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3a1ef60eec6258a6ba20835a9937f0a4e=
3140a1e

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




