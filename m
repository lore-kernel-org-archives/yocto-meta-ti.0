Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DCEF419BC
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:00:16 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19677.1776261610254023130
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Apr 2026 07:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=sqhPYQhh;
 spf=pass (domain: list.ti.com, ip: 52.101.193.63, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7+2nm8u6CV+kIA/xjERNukqxStIb86GiD1ja6FygLjlXuj2P5q9H8SSahejSeVY0SWXvTbpg3TCyKJHdiDI/hOFO+2wkXid9LmCNVEtNiYSHY0gAQQ2AzmNMyA0GTLL6jCOeJ7WspJKz7Dx2REBk93XuVr/7ogS/RUbXcChrqgIiWTBXW4A9BiQTsCqCbbv83+aPhb6o41cwJJhWg8QdqKAofvk+vklTDeoQu8o4z1OjJfxHIFlSUYHNsAl0NuWtOSo80Sixw/MqyCs9jIWI3ppaY0Jr2aQ7/tE7EeEz9dyWpQwzkBEHxFDX4ozoyuV1TpLUqABLC3wj7oTZ8Ww2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4u7lKKlXcrRMstL4/IhLTMQVtXytEk4go3ka8qJvdg=;
 b=EBETiDqRoTK7RKJDtr5seDhAKRokYr0nc8cLTL8NMWV5YP9n/IoIrYpXdN9ddsbCXek7Q+FGaLMXlkF3CMj5ISidIcV+GEwKZjNUwN8K1tuwxYFXoj3dJadlIKD/yn7ObT7nVchOrdL+X+1w6dGqt1QcR4xs0kBfBDG9+3vEdcW6kEKPmy/a4PDY76cq1rd2IFzz1QHXpz38bHTwyMbaX2hNNIe/KXyirtr6QTai9lMu6xQTHuhwC+No1ywdmGkTWWdDXjhnUIyFfoBvXL02a0n72JXZ4GOcin+07Mrk86QlQK8S5gdLhrpBVQYP9rC4kJ0ZJX8R2pPr+SS8Fu1pUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=toradex.com smtp.mailfrom=list.ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none
 header.from=list.ti.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X4u7lKKlXcrRMstL4/IhLTMQVtXytEk4go3ka8qJvdg=;
 b=sqhPYQhhyP8h218T84soKduh1XFxLptYAqFO6ZlZraWKfsj45odk4BaZXFoTOeNJHw0YvanDvHXOiEqJih6Z5QtagIRuLiz0Rl5b8iC/AyIXiYaoCxTVtlH0WTrAAI0uH+mNl0h8S1B0ByX7HmjKmhW1aB9XObwLQYFEprrmoD3SfQVwSVL9zd9cznGTDy/LvtIGhCw6/ymEjKtpgwik9Yr0B5yEExMWSPJW4pJNbQh3sBFC/rYI2b5FDZcchubBlJXfoMWsPxwIygixdBXIsMnomh+pCpPTyK85gjIdRAccLPXmteiJ5cUEbcaPuaTeadoiKz/c7p5xeG3dLCjrWQ==
Received: from BN0PR04CA0065.namprd04.prod.outlook.com (2603:10b6:408:ea::10)
 by MN6PR10MB8069.namprd10.prod.outlook.com (2603:10b6:208:4f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 14:00:06 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:ea:cafe::3d) by BN0PR04CA0065.outlook.office365.com
 (2603:10b6:408:ea::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 14:00:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 14:00:06 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 09:00:04 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 15 Apr
 2026 09:00:04 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 15 Apr 2026 09:00:04 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63FE043u1212042;
	Wed, 15 Apr 2026 09:00:04 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 50B7261B; Wed, 15 Apr 2026 09:00:04 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Franz Schnyder
	<franz.schnyder@toradex.com>, Ryan Eatmon <reatmon@ti.com>, Francesco Dolcini
	<francesco@dolcini.it>
Subject: Re: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf
Date: Wed, 15 Apr 2026 09:00:04 -0500
Message-ID: <20260415140004.1171520-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260415114107.1643556-1-fra.schnyder@gmail.com>
References: <20260415114107.1643556-1-fra.schnyder@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|MN6PR10MB8069:EE_
X-MS-Office365-Filtering-Correlation-Id: fe54ad13-7b39-4305-c843-08de9af74c95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	b8txaK5Ao+O9mKd85QWdwBjvDe1So79wEG7QPuWPPdGekD3kMbqu+NmQPBNEbQjGbdOpOyn0zBEDW3KYMlyjWXtYHnp4IM0NETV2cKXPgXpc8ADpbvcf2QEjw/iNAnfSK82JJer8lS5GHBO+Zl5b6vhW3ZVg6w+/KjbvgFY4VMQNpM6U6PDqlZ63baTRWZ0bisjQgPm0M6wI17nDcqNDl1mqloAU20tH5fAOesnYkEdWuyZt4nHVEhILxE28gW2SIm6foCKedkCuBeYXY6XVcsPD89T+wIBDyNZdyEHeOlMvxM5aGtRxluiPztMIKlGbcXWNVvmIgeZG/GRKexI/saS9Gmfl82a0o4eioLTZJdtAYGuD6FQFG+jjkm6Mg1W3SdLG+9MtcT2UxC5F8T5IETg7q0aP6ojwMKOQcWKEVNMOYuLsVSyTmzlEeHKI+pilewyOjdIVIfwtE/31UWzaT9ZXuuItl63Zdu9tPB792ckI9pF476zFvXFY+6FlLUhR4kdhhJTeCtwNa+0AmU3/wf4V+HTgnj4WT8bv2JCElp7soSgUYK3Dmy4pZwMdbweUCO8gq9wKhCA7TM4Ih+42/SdDQgrcziFeuFEjTdPKADFR9EjhaaXaIfC6wMaf0l9c+BGJtW4d0HhbOr9MTuerI6gng2z1lKAvxodAUA6a6IDZn4W3GWUOhNQ21bunnKfHLV+aggw/EG+lad5JEzvM/9IL/pOzOtT2a+IzD69a6M8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QpUt/f2qdUcy6qBIGbQg/WAiF0sDA7++Mz18X1MFurHSEH4EGNhODRJO8CHTOr2Ur9aWiS1LEmRZYcgTj8rcZjEJ9JkMPjkA26eWaxvc0rcf8nzH2S5ejfM6bjzjYNrsC8YPuDXVfA7FkesOMZvxgFyNlvsVcfNOVYzl+V+rg9WUem38YmFyc8UShhf385jdbfhJRffWKXlleMgRb1IQnK4JUAlWGBUTEXOq+fWtUhcSg64tktHNLC/Dc5YwZT2xmDQuC0FG2NaQZY1e86NkFW/2RFFJDOvy5izv9aUpQDdldwuEq9QZgjCeorskMsXIurUSYTLn6Hu/uCx0rbpmZ3bETVNc6MV6riK6yd8KT+njrDPClAUEwmkR9caGcfUG25QFja1wTB/5gDwLUEa+E13AkMnW5ol9//56u6ITNM2oDu0JCmrqsW1EMo3JIMWG
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 14:00:06.4538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe54ad13-7b39-4305-c843-08de9af74c95
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8069
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 15 Apr 2026 14:00:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19849

meta-ti / na / 20260415114107.1643556-1-fra.schnyder

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
WARN - [meta-ti][master][PATCH v1] conf: machine: j784s4: Move ti-eth-fw-j7=
84s4 to EVM conf
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: j784s4: Move ti-eth-fw-j784s4 to EVM conf.
              machine
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
- Patch Series: [meta-ti][master][PATCH v1] conf: machine: j784s4: Move ti-=
eth-fw-j784s4 to EVM conf
- Submitter: From: Franz Schnyder <fra.schnyder@gmail.com>
From: Franz Schnyder <franz.schnyder@toradex.com>
- Date: Date: Wed, 15 Apr 2026 13:41:04 +0200
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: fa4660c3c90128f11e8092e18014ce11a=
d8fb0d3

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




