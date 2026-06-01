Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354C5CD6E55
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 17:38:29 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4912.1780335504867176491
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 10:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=khBIu6f5;
 spf=pass (domain: list.ti.com, ip: 40.93.201.42, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AO05wjMvMTF9qmBw9/1FsHH7BE34hq9osVF0ND9sK9IOf193UAk0ZZ73LB9QoNjaasw2nwqdL+py6nahl3JTEMO4cU3Hybqjfee+KHXCCd64UbxNX089bksgJpz0Jqt8pS+hyqJ3t2pxglOyWLLOMkbHXXwmOF0hQ3mAaYqc7/irRchiqishOltU2tC+37+4R4e6UYoRcUEXCq7LsO07mqR0vPWZwjXt1077Xziw6LcjtbvAqvfSokr2xpYEgMJ/fTtTKr96+E4LZmcz9dPsjmhiUMPLwV/UBeIKZR7NoOJChWrtlYhgKHICYP6rsXUR/UDju/xRy9yzAKRUMWsxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NGK4gim9Whs6BdD/gAzr1U3vHQpDR8kZgiOMQfGCvA=;
 b=CCtpYhkvuPk8+LJE8rU46FSpv9H2vlyqIDPjXZWGwAF7NyGgkOvLadAH7tLLinCscpgVTK4z5PMLRjRqExfLVu06xudc6v1BIYki2p/L6McLZm00gUm0k2ZoiVnbhLSMhlN2IYq60Zwf9cQWVKIABVMorH7o9krtETiDKTCzct2XximgiCk6UcsIACdmefvZd/tH/Rxr1UCImY5kcIGeeolKynybOtT4ZM2b4R9+bcHh/JFqq5afDtmmFWnSJriHSiNL2TWapuSA5TMB178eTTETxnAz2F4Wxnqg0hUVuSuVDDKx8LDJ4efr2BGpCg2WhHUbA3I0VxIfUAy/vG2IYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NGK4gim9Whs6BdD/gAzr1U3vHQpDR8kZgiOMQfGCvA=;
 b=khBIu6f5YChgCaI48r9Ef7NA9H5OW1hdYtnbQcITIS3TfYUyd2rFNWeDhebqCXrAIky7jWMJWGrdqB0EOBaU13uq9Rjpp/uW5TVGFpFDj96Q3+D++ioAiHNbzGcXNI3DGh5H047BkbXd6v8tI9piAcK3/oHfTQ/M7vp1gG4iFuXaLT1q+OM69oNQrCh4+RNXHBnyqOwWM62vzL5M7Y08X+qlPtkW30gfbDJAef161cHKSaAaeo2SqigMeG0xNc4k3zKAaYKcYQUkZEhq1SPNbhWaxeJ1vvlnL4VCUFEmrnwmQWy83IY5EXiSdSs8LVA8VKJiiI8W/0N4t3WH4ZGkwA==
Received: from BN0PR04CA0020.namprd04.prod.outlook.com (2603:10b6:408:ee::25)
 by LV3PR10MB7793.namprd10.prod.outlook.com (2603:10b6:408:1b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 17:38:22 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:ee:cafe::4b) by BN0PR04CA0020.outlook.office365.com
 (2603:10b6:408:ee::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 17:38:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 17:38:21 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:38:02 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 12:38:01 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 12:38:01 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651Hc1G81738427;
	Mon, 1 Jun 2026 12:38:01 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DDDF79ACF4; Mon,  1 Jun 2026 12:38:01 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
	<b-brnich@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] weston: fix assert firing when subsurfaces have no views
Date: Mon, 1 Jun 2026 12:38:01 -0500
Message-ID: <20260601173801.2305283-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260601171923.1728139-1-t-lannynd@ti.com>
References: <20260601171923.1728139-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|LV3PR10MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: e77d3e39-e9e9-4ec5-1a14-08dec0049320
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	gKDZ+idIzr/HbK+uIVIJ7e3YW3N8hMM7R5GKiaPrTohtxR842CZP/rlsBOaDTAT+B98ksYxSGFcmgZqy/Pm/eS0DViJx22VIPvz71Wbc5cDVaXju5nHmwgQbIWzqvcRAuAKhuPKWQGPnlcK5f8XoFqAW/SDqOWjuupWSLpiTGzbyJv0+RO4DeAKlKasLePSZx7UPUBBEUOW+fa2mVHhWzRjenWt7BXCXP+4jbVVjE6JqURXwmmxsaD6UBdkfY91weHV/fyJCDqq5/O3K5l6FPN65FFer2tbKzA4hLkdLH2p4pjgcGUB0yK6F4FoN/xSRuWbelVVhF5lISzhy3FMqyugmcNJVQNdpn+KyMO1oNmXaTgW0tzaYc7SGTAuKCudJt4/UCELsb+AE1VLPfRW7dXBoOpixPa+cLGnaODzXp5rivxvavm+eu6GmMWBJzFIYXUuHN2DYQnnHqfqYF4vYwvcyDB9UtG8QxYo0C2ltY6x7Rj+t4F3B229UAKfPVEL+le1zcpCXDp2uT4REAG4WT+Vc9bhXrABma0D8ievI84p6sWNkyr9yrD2gslQYKNQkhWIeWKwrk9sR5+n3I2OmnO+w//K29nExQlfa6A70gFVZKlREVIyhROxLyHbdIxXk32v8YDsMegb+LUEMz866Rjv94KLy+hg5izmQioNEZ6lTtC1nzIZdGti6eQO7EoxV1s/YyzpAIDSq8q1bmGPaW2auuTFfdDf7HAYEPP/1kn4=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5wLFwLUPNNao7TSga4uswpe04ddXNFSltYZegO5FCDpeHTayDpFSjKzbEu5h6TG0Af0ZzasTHmGlaD+3L64hI/NuyC7QmmngkSQucLG16uf+FezhE3b5vxeZWAfMSKzBndZjRfdcON7gwks+s6Wr872NkdABLSmtikpoIVlYp5GRRrNjRHd9zz8TBy4dhrwl9uVrDm27j2gNDHgeQFZG9/WaIVVLDayG/dnx/1l/0WUw6Nsxxnkw0b8CR0wG04GxTcb/S55+b684DoX7/KjsBYoc7L/4yAnbhZl7DF4LQOnS8v6lognfT6xldhqoT1gbDn2fU/qGIq3MAhTPpwjFi6iiq9c8cf/A0tZMp9/FZsJdTINHj6wdHWf4wv3Bv+znTlWJ6Fjpo7JoFLVBm8p+CBRtjsUrkvqjPjasosMkEoDQCkXq9F+QdubZ4skOsKj+
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:38:21.2749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e77d3e39-e9e9-4ec5-1a14-08dec0049320
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7793
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Jun 2026 17:38:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19944

meta-ti / na / 20260601171923.1728139-1-t-lannynd

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
- Patch Series: [meta-ti][master/wrynose][PATCH] weston: fix assert firing =
when subsurfaces have no views
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Derek Foreman <derek.foreman@collabora.com>
- Date: Date: Mon, 1 Jun 2026 12:19:23 -0500
+Date: Wed, 27 May 2026 14:12:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b3ac98dce1b250a52a616aa49e52b977d=
ae0fff9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: bdc0a2cee531b4320110a6a39467f1b7cf1a9969

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] weston: fix assert firing =
when subsurfaces have no views
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Derek Foreman <derek.foreman@collabora.com>
- Date: Date: Mon, 1 Jun 2026 12:19:23 -0500
+Date: Wed, 27 May 2026 14:12:36 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b3ac98dce1b250a52a616aa49e52b977d=
ae0fff9

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Suhaas Joshi <s-joshi@ti.com>
- Commit Subject: meta-ti: optee: Update to 4.10.0 tag
- Commit SHA: 42558bf1f1b1ec3224a957e6ac51c7e7ec83b427

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




