Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5311CFF6E8E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 22:26:12 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1534.1773786369265459426
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 15:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=LbXSI8mP;
 spf=pass (domain: list.ti.com, ip: 40.107.208.57, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Suv0VP7zOUzFqzdS4sdijwv/8qB1igyv/+zS+hYjgipbawyeRgwEKSA44xoGNsp/tU7mApVfZXcvf7QuE6EhlFQe2gCbro1de7KnegHoDEKderqol71cRKU0vb5U1NYDLrzC0/KMUlBVmSmtF/n0iBPxK/DteEg9cowR7ac9a/IiUExFqdc0vOED0TgTm4qLrkOMPxBG7dzEw9B7C6ILg/ttis5r98joGgDd3N+KDV4divC4qSd/1y9DxiTBrELIms6qxpkpXuyXr3BJPS2tOJBo52AePg9w+bdgLoewDM+9LuPR0GDm43zVoi5UI73U+dTcdE0028ranAiFUKUO3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSsE0WSLI6Jc0XZ/KUgBLvwa38ie7dfkQz25+nIkTnE=;
 b=kx57DOx2E6SFTbXUHgVKjj4Gr90+yGXvh6mURE7SoXOEsQQiEY4gmbpgiua4tMfJ66Qj7XDp7WA+CBXv7Bq5Q7S5bwo2lX3UD4jL7KyOV7V/3TkKzaZX9+oSvEi1512iCHrGh0gF0K4SYwWL6ehw1/MJMGXsSGWrgpL+G5+JwzNdFac0xMYdU1+16XBt8v63vN7GaftxjvNFAxKbhSd258b2g2sMwS3OI3teiFxYwPByKggKpgd/y34Lvzt5sUOFdLPdxMb+lI3DefPa0HslHQG4xClVHYdyIu0v+y6IxP05MJeyzFo+2pdFko5r369kYjXyqGtz6ZqEru113G/+og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSsE0WSLI6Jc0XZ/KUgBLvwa38ie7dfkQz25+nIkTnE=;
 b=LbXSI8mPJSkwOTcNcYIXH/wSGupLG9xf8OfQpgDiGr83jxo6pWDxG7RNYSLPTBNrvfZAMP8/r/udVQPpJ1WbzgrRRqwW3vI6I9wJCB3EGa5YerS7p+j+jiH0LsRjyrKUDpfoAHS6gEcnu/n+gTi+FbOb3QF1Q5tV98DlVCmT24HMP+FnLYXu/Jiqw93fiQi3JhUWQtHpwibMWn0VuP/FACxRHaXfy/ScpC1fc6H1J7ypg08goVRCIzM09KMVSfjB45Qk1a3wZZMzDvbcXDc4NuG5/Xqhj9+ibDTcaUHSO/gGlwkzmH8dvKzbCgvldBdd4HpTXqyYDokzRpz6yBpS1w==
Received: from BYAPR07CA0049.namprd07.prod.outlook.com (2603:10b6:a03:60::26)
 by LV8PR10MB7799.namprd10.prod.outlook.com (2603:10b6:408:1ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Tue, 17 Mar
 2026 22:26:07 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:60:cafe::9c) by BYAPR07CA0049.outlook.office365.com
 (2603:10b6:a03:60::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 22:26:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 22:26:05 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:25:58 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 17:25:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 17:25:58 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HMPwR03452972;
	Tue, 17 Mar 2026 17:25:58 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E8F4C9ACF4; Tue, 17 Mar 2026 17:25:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] linux-bb.org_6.12: Backport C23 compile fix from linux-stable
Date: Tue, 17 Mar 2026 17:25:57 -0500
Message-ID: <20260317222557.3882257-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317222406.1972700-1-reatmon@ti.com>
References: <20260317222406.1972700-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|LV8PR10MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f454007-fd39-45c4-e048-08de84742dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	sYFbXKlhLF09IgYiK6skxXq08HCAA9xR8WEx8zj2eIzLiXe66lUljavzpZwgPo4OJKKkFExDmGEaiXZwBMsxxGUdkUfpTK1Y5KCvdRxI9/BpwBP6KgWi1PLDNMpQpYE2ad7l/xNjjxEpQYZvXsWqoLAroHngMWyz84w1ob3ZBn28AheIc8V0ab908AmLpHeFOQME7PtJyTdDJhhz36+Vw5EtjjIhixe7wcbsN2QdCFFgb+Rabd7zpigX8kM2bauNvACmq7TS5c5RJFlgSs0CNBVXfpkmYoLGbdkIFkKzdcqcp1MUpWScNe5vjC6eYdeTZhB7JbqN1tpnsd95Xcr8eykB/GlGVhUS4J9u6IQu21wrtGoDdZWsI4nwDZVr+xzHLJRPvbZ9A7X4HJzW0ixxyRrC95Qcq8t9dHVu+sA4tonYfifoMqjL5PbYsNDSjnFSrgJdgukdCc9RabQU88F2yGpqgG/uyIfzY2A2Q0hZye3sihSo7wTwzNON4xWIjyeq+wi+2b7kGf7DiicldgSBGXjQvD2ytGsczDJHdANoYqGD6h1tlW8Tm9z4eflqJiL5sj/WhOmtHKqClrB9cZovXKILEO/FwKnDtBihcUy9abQn58ioJsHjG+dU5X7Dejve72N0IWYZclSAW7OQHWtSAjCD5+lw+Hrj3j1VctAon8JKTp+ODhdBFmITbCO5RL3FtT2q++t3DjI0qS2e8typ9uqwfgYO/bkMEbCmSwik3H9uH8ymmr+wjQ0ppGs/BMWcCqRiZTeFDj0UXufAKWjqbg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	B60/EYi+aC0xOyDP4PknuvConpFrftC0oBmDPId6mtOIwlIR6e2E/EF8SSkV5YJ9Ta4M3KvSGLeqdZA6ttJubCLpGGEUYWffAOPz3ZMNWJ6ItPqAS/hWJM0+Klzj8GCzK9fE9p3Eiq2pf5+ZykXBgtuMfn3CE20hZP02iVeXS6ciiXHJ8FjAhSIuTWf+bCXBs3u/5VGPEdjnMAnr+PerJVpHG/lo8ckecLsuNwcW1nbcA5CVNEehuA/HsS6WomFOXdm2zJEIoY+xobUNJ9uOjRzx8klOAODtvNN0PW4C7Yef1g/y+L/AUNrUPPRuFDgx7nJkjvPapvqH9fUEEZLCBbQb/8fyl+9bDbGhAYOOCILOjuxat4NKjIl1QYYsdRAqcSeQtr3kBVsxB4wN96mNCvwr2o8hWt5a3umKFUNBj2bMGdur/OFH018e6dtXaDPL
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 22:26:05.1147
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f454007-fd39-45c4-e048-08de84742dc9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7799
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 22:26:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19748

meta-ti / na / 20260317222406.1972700-1-reatmon

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] linux-bb.org_6.12: Backport C23 co=
mpile fix from linux-stable
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 17 Mar 2026 17:24:06 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: db4527709c8b125dc20eee0bb76a93d0a=
5351a97

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux-bb.org_6.12: Backport C23 compile fix from linux-st=
able
- Commit SHA: 9f6426914740d4aa5170bac2d1f7d5f0621135d9

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
  yocto-check-layers: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
ERROR: Layer meta-ti-bsp is not compatible with the core layer which only s=
upports these series: wrynose (layer is compatible with whinlatter)




