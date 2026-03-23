Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BC3F483EF
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 20:02:18 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4290.1774296132319162142
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Mar 2026 13:02:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=ZWKA2T07;
 spf=pass (domain: list.ti.com, ip: 40.93.198.68, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tjx0jv1RhhflCa1dlO2TL9rd4avy/Mppoywv+n+1mg2uKR6h55WE8Aq4WQqlzvBkX0V7FuL2O3fLk5VCFOnZzzrA7gtrx93THmDjyAA5wfuiNxc/nNlJLXh6Pl647pKpiGaB6qoZfY3WK9xsVLbyGl17BtRO+Rl540F+2FmXMOqiL0AhkJTnY1Iso2C00Bwi8bT43E6jAciDMr6zkJQan8h4tcfHP6jP2URSuUJt+N1Norp5VYCDNPa3iyy7H8y0vrkESRf3/lGXDp5Zc3wQ6OLxg/2N5t1VgZbaKtbR5NnqeYf7XZq/UDMp+HbaQCEB/9yWERyx4W7p2R2b+SjQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPPZfeanSGBR72ddkFfthdCk6DAgnA9aPToYO+cDrD0=;
 b=Fhko9+KnFA0XXn81fdURptce7QVtZxpYXoxuBzc2xd2Nb+NYSUnii47W2U4Ymc9gdgkjVYQKqU4OD68IupDteoE4Zl6MY1ycMuwcyBVIErhmSYaY+ZPN0B864z8z3bhTaJgLnevGcZ0pxpMbwhHdaoDN12wI2pgJ9weeerXDIX1mt75+GODYuJwWox+jpH20RKEXP3++vunex1qLmMKo3wKL1PqexfVEEzs3yRmGzpSSPpj3kQR/mBSwfvsCJyOkAtwytn5S46zE4rwA06kp30nS/VARBGm76+K1298jUcraANksqKo5VTavsElfvTJ9VNwwdrG7vn68NWPHp81oFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPPZfeanSGBR72ddkFfthdCk6DAgnA9aPToYO+cDrD0=;
 b=ZWKA2T071uy4WVSOojEMF3aY8uH5nIQCn7LL4HN7e1Hgap/+YSXuac+gc5Kx94K5dqbCKXZJfwsOWVW6bwAAj4ZYkVr9bPql8MxpY4m8cbuXpJfmKpsYDUCeexxJ9X3jnap1H3ifefL4SVXTYvtR+JtCX9/j8HQCYv2oyBwXyFMB7m7yAR3jbr6dGBN/QtR4wx76VBNJ3e3VKhWpuu1wTyPN1QjnCnr+v/mkGvr5KsRJczgh3dRw+ElPTbGz8UXzPJO1bX3HBtk7536DRxm61nLWMnhZFJnpnedu0KamSOmgy6uuuTMMtxAujrGLSex23wiQgUKP9ESDg1CKT7aS8g==
Received: from CH0PR03CA0442.namprd03.prod.outlook.com (2603:10b6:610:10e::32)
 by SN7PR10MB6571.namprd10.prod.outlook.com (2603:10b6:806:2aa::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 20:02:09 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:10e:cafe::12) by CH0PR03CA0442.outlook.office365.com
 (2603:10b6:610:10e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Mon,
 23 Mar 2026 20:02:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.0 via Frontend Transport; Mon, 23 Mar 2026 20:02:08 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 15:01:39 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Mar
 2026 15:01:39 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Mar 2026 15:01:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62NK1doM862905;
	Mon, 23 Mar 2026 15:01:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9E0CB9ACF4; Mon, 23 Mar 2026 15:01:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202603231002
Date: Mon, 23 Mar 2026 15:01:39 -0500
Message-ID: <20260323200139.1073755-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260323195035.82648-1-lcpdbld@list.ti.com>
References: <20260323195035.82648-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|SN7PR10MB6571:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ac5bec2-e333-422b-0943-08de89171097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	aOkzvKDWitX9tvechzwEhEdCI58Ly9CDKlebGXxOyy0u02x1Xlri1yJw3ia+UJkgx1t18a5lNV9NBHujh3Me99VD0SBLX4PBYFf4LkClNWzV4im69fMYmXxSB9CaLIHt3n414DBElpIN698dm7nTdYRJBwtHotBodnfeXmEeuvwn/4caq4YaD0wIt/VDXkPD1HPk+RRvJgqo0FwZ85qLxeG9UjsroO9PgP0tV7+qrdoBKokGagrTunZrbH+n/6Nec5gS4MBOGl3oRH83xFirHt6XQ4kXJHMPcVKRJ7Ky+q5N58pTvhYzSBfA91h9kiE/Dh5V1EcjUAH4XtBsR+FBQIHYz6KLWP4zJ7IchGPxuNU1NLOKPR/FKT2aw7ovodBi8Ai0VP8M2AZJ6vNHtC7scEOHZFiqzLjQFzcvUTB0nelMnLPl0lquIKLQam2na3scX9wTiY8U6p3064dad8C4aaSB85RZQ6RE2f1wVuYsPgXwoJKVLHYXrK82cXKPnlGtIPpcvCoWewi5bZW6R2VQpqvbYilLAaMzphIZsZMCRD0o+1U64iFTn75pba8mc5r93jZEQx4GtXoaZQtt+pVkUak+PeGHlxucNZaZE8xQOfDchWfwPnYi16n/cEArLEb9vFbOqLlrevzuZdpe4Fsm2KaHmXpAwjAbdc6WQnNa4s8386FYEZdCVT9xxrT1Yysj/TI+Ay79JqL2vmCNCHdv5RODAEMK8abgwwYudG6KL+M/b11IrCBsPdV+xbviaw8kkho01V1GYWrNmaKHMbPqzw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	QDS0MtItrWNnt7puNA67BLoyVY5z2GLhGo6XBrgZQs+OIOVgCi0Xyyby64gwRGG/pvvjNi9XUMuZOgpq9L3XGkYlxa/FdfxnUtsprwsD/bId4EX3s/BslPg65Qq9ssDYUeJULLTOtGchx9DTLwTlV/kvd8oTJiccDum4DgK+36kW7AL0ciGvTiqMvZFllEgCVvqjOxKD3guo6l5c+O8wirVRS5DHJ2kzR61ttKiuNXtPQmU43aqtVdMIHW0162sjeB85dennzdWIHonuvR8IS+cwEgUCukrBwf0oW1Bs8YyWHavvhkKnd6PP6EIzZTpDQTUE3+5XqYypMrS8iVtosniTbc6ajQva06tJ19C8hB2gTWSuvtjYHM9yOyhrK41AkibiGKmtDjz0nIN/3mu9VHe0cLpzFiW8KbNQ0QIrnQ75/JsA6wnEOIUcAB3DZnhQ
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 20:02:08.7882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac5bec2-e333-422b-0943-08de89171097
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6571
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Mar 2026 20:02:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19803

meta-ti / na / 20260323195035.82648-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202603231002
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Mon, 23 Mar 2026 14:50:35 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3eef55388a254922c7080113fe1cf3d99=
7b695a4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: linux: Remove unreferenced patch
- Commit SHA: 1b499785681ca5eca247ff0eeeb9a44ebcbdbebd

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




