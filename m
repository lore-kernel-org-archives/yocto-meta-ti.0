Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38291103E302
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 15:25:35 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.0])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18481.1773415531605940674
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 08:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=jl/VE1st;
 spf=pass (domain: list.ti.com, ip: 40.107.208.0, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CI0dp/jyq4qEXS+F4/Q1AoJdRNtpjZ+jaLzoGCxx7XOsr4sOuLQlHJ0bYkQcOcLvsK4gcJsevCwowE+HhHQjc117IW9IMzX8oybkkBgjZpCDwHj89Q1I0fae52LJuBuRGmdc9VYh7dMxelaSYwzYzukvvcW58ydlye+Y3xc5jlGh4abkabj/+4u3gdWiCZaFIlK6mB5U07CZRlyE14SToCyXGdytF3PZTeizoY3yzdy8fN2ZJ+JSpAHCaouz+t5ofRnG3Cb+x83Tot7o3Lh/bJojVrflKqO7L6lRPk9nabIo5L+LGr4HS3xibyS/kJZh50U5CN55XwpyYO/KJYNWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1Nguyjj08pRfGF0PTqCHvkMNFRVPXNXV8OzdcdcBmk=;
 b=e8nJPEmbzxeZh/DjAPxuieZlos30ltXl6fYV3XpIv0vBE2BytsruBT7TubMlqeBCCpiAh1AOSfW7b8lIK0PtE03plRGcyFF1yVAydBMgTX+QYnNn5yMbnfGn3ktuvJrKyVHmBrR3l5nKVp/W1B9WaEct6fCe6ACY+3uGJbnI9LsWr9GVWIiapJw6CI6BasVreMLxzxhIgeh4p8DFN2mpb1Cuq+PgVY7Luax4dM+38Dqzq0WKtcYV/HtG5J0RkZgEsi7pMD1LA92rKwDdvCmQGwQ/xU+hl2ukaoj15ylX54W6deku7TFlzPL5OfHLr5Vi4VnG3DecOGTPhZfYzIWOWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1Nguyjj08pRfGF0PTqCHvkMNFRVPXNXV8OzdcdcBmk=;
 b=jl/VE1stArtv+BggevJqEyyB5ESoi5XkFotBaFcbdH62EyCvBLlXByUPKo/HeVK9Qwv0YWqZihcfVnZHGAG1tu/ufpUA54vleZ8k3sxGFaCPf8Tal1qZyE5yZUApyuHdgjg08oVAnA34aZj+O9PsPgiaF/a5km+3KNLLNgSk3/KY/cJ6pakCNsClnlk/Trr5lfv0LWIxbSLTk5jOVhn497e9nwS22p4B1QQKeqxF1K5tLy6t8U9D5VdpzMQ8PZCxddfdNWYyoHaBLecUpHpwOlgvoDB+8taMwDMlxNYZoaAipZrwMKbM48p0Lw3N1mfMaoOsF/bOSzMfbY8B4qupEg==
Received: from BN0PR04CA0157.namprd04.prod.outlook.com (2603:10b6:408:eb::12)
 by SJ0PR10MB5835.namprd10.prod.outlook.com (2603:10b6:a03:3ef::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 15:25:29 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:eb:cafe::5) by BN0PR04CA0157.outlook.office365.com
 (2603:10b6:408:eb::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 15:25:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.1 via Frontend Transport; Fri, 13 Mar 2026 15:25:28 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:25:28 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 10:25:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 10:25:27 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DFPR1R251607;
	Fri, 13 Mar 2026 10:25:27 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B3B1B2A53; Fri, 13 Mar 2026 10:25:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] ti-linux-fw: Update BRANCH
Date: Fri, 13 Mar 2026 10:25:27 -0500
Message-ID: <20260313152527.3349652-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260313152355.3720509-1-reatmon@ti.com>
References: <20260313152355.3720509-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SJ0PR10MB5835:EE_
X-MS-Office365-Filtering-Correlation-Id: c1c8016e-a056-4636-6154-08de8114c1e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	DAsZTLUfnOG4tGyBNzmy7qZcFL2x1rB7qaZyd1BXFdGIqj0Qx6ZFIpo8yniQ+5x6HDQ9W2AP/8GRyMc/jJwJZWkuCnYU3hEoM5toWukUf7VxsDA33KPNVLFBR5Cgpm6aT2fX14Jgy5st74mS7aarvJo3A4lXMhUjURj7/YA65LTeg6EfeUTjm9Vk1b3bs4KoaH1JYs/WzTjlIIJ5jVQwghxMi51jYjKAiXdb5kke3mvgSUyYTwbTC8uvthSXtet+skXgAg+wFoH42/1ZNxDnFtnYVjxD5jXJbvSpksLDc2S44sh1JGKUNVWR7BprIfSBchpLwG5ixS6pDEG9hLCMGIQ55ONPIYIy11e0riuGdxbMebbXl8O3vbAsFp25YVl00Yh3YDNrQlJF5zF4EuzFcSXJHRKRnN0CHrGp9pR8neozKJwPc9be095xUtcP3VMO/BsR/xyll/nzOs+7KQSYUDv5jBrIRrOM8xQ68QrZcfJbHVo0+TXD8AlDR0IIpyEnlCvFeXbpAjlTOcFyx/Lu2J6MwhnxzupFpOegFjYwnBmjmuhZqfG4VQix4RAiNWRsAxsyQZRDg/3Lqqk3v/bHuKMzY0Wei80wszIcMPL2bVvTSCviS72tk52g9J1/HkM6eH1mOTLKzot7NBGNcAY5LgK5m6oGb8QoS2HZApekmJdVKCxm7OqbdcDvLlceu+U/fvAXYh1pjWX2mAbR2sNLvhJwbiljnm/TTEFLRVEgUh0qjsypXce6rUhffS2RIVAZK+aklLxQffRod48LNHDuIQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FTDl0c1A2UTTr9LwVM4hZ5k9DGeaaPoU9iG2CX28XpdCROcQAeyJGu6BN69npt6GVFcypT360SyjLmJi7bJgsub/x5fEiBQoDD6C1vxTVSAgx6BnIqtInhLi/xqdkeZi7sf/QX9MyIaA/yybW0a+BPrhkXi+Lvo1wI6sRJTuFemWlqc91YeknY6JYAzV1ybX3Oi0u60uzPAHglb6FaPNs0qKuEqNz1tuXzUEyI51lyLvLKLEifHgZz2Lj8/BaxrqR4tsLXrtdz23kKNAHklIJVIKllvS1PDh/88M9zGaycNrP9zXjz5ed8vsEbEavh01BTlJc4t/nQJV4qVVvz3KFZG/j6BXh+eLNAkSDpJnfBupzD4Ca5idNF2qSvm+ILOde17xl7pKgKzB7Lq9et1c06tc34hI6A8dGf/bY5c0AlX94uEIpxgLwpF3l2wpWwsI
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:25:28.4398
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1c8016e-a056-4636-6154-08de8114c1e4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5835
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Mar 2026 15:25:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19713

meta-ti / na / 20260313152355.3720509-1-reatmon

PRC Results: FAIL

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] ti-linux-fw: Update BRANCH
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 13 Mar 2026 10:23:55 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 54c72c98a50449d7477706c51f41e0bf2=
5611757

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-linux-fw: Update BRANCH
- Commit SHA: 87e3c1f22024b055507ab4afe5999455de59f00e

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
FAIL
    ERROR: Patch is not referenced in any recipe. (REPO-1)
        meta-ti-bsp/recipes-kernel/linux/files/0001-vt-conmakehash-improve-=
reproducibility-for-v6.10.patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




