Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E618BCD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 20:48:02 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5837.1781038081170705116
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 13:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=tlPC9d/g;
 spf=pass (domain: list.ti.com, ip: 52.101.56.39, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TOZX7ac8zg++LkmHRNMw3kbzANR60lKmeT9lpbsGQeSYA7NCfl7MhB8R+OsNDeqP/aDQAQpQyzYuXngj4vWp83oVnBMfN4jVz2WW0vD+AsGd4BhaYYxU+FsvKgxZjXo8swn28E9zhK2Ey0wNNqlf2Ua6lpPOUC8zT1+R4fq4Y5jz+yauioTW7VUG+GuY4wDBDcMAhEdC17ThlRvnHDrs23qGAxwiiTDFM3VpKh1w0JG8cxrpByauf5ZTrA+ATJf1PTBYyYjxdwy8+rhqvn+2Moa8HZKuFJArPznZAE4fVww5K/XunDnc/3Xpa5+nA2i96aMO4XVWDvu5IWNMESGknA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tiTTSxMQgiEE5Fku3Gt/hA4X6fff3v6GRd3n/kaI4+A=;
 b=EjpMe6iIrLqk7wHoWoXgbTNrofq/Iy1/HTpQ+SmHPGsHJKyMRwVzKztEeJj+FrlmUqIq3C3lwt1VFQpKa/dYrVqewSo7N5LNnfpHus6savO+5sEGJi1Ka+3/uBRrM7a1g9zP9Yi764nthxh8x+OMDd0Ju9+niymzoM+DVORiiwBXKg8UO64LoAArhu9mnI0nvzhrd69ja2WnIn1QRBvpPXp5W5ROImaMnw+e+V5HiGDdlEam7KVgx8/m7IXV/jhziXuyeYfRo8EmyotZmu1L33SPlUSuysPNiOE0ls1pc5hp+GniJX4oavkiirH3nIMUPP5acQsr+J05CuazTZl4iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tiTTSxMQgiEE5Fku3Gt/hA4X6fff3v6GRd3n/kaI4+A=;
 b=tlPC9d/g9jOVWRjlx3yhdYhIYZ3fztLY9K8GG4Wa2xbtAE8pn25zMJD6xj9fu2/OUk8U9LCKkaptmILsnqLZWcVUJBMM03DnZ0TA/UaPXw/LCjPuOQdHuwlgeC4U+CqHSEBvoJk9sgJ+6YkxwM8UUDmfTvuOtOi/6rRiX8ES4Fmkg3BVlZ7H0tYPdlBaX46OK+9bXt6qzPINN9fqrlpFylyqjfKBsycgRsFaBgQMHdqT3FO1i74szOAdvF4LLP26e1b1KeKVTUqN41nxhb5RgkE6rXZoSrQlis95dmekPZQtkeMpV2Au+T4n2GupV2CO7Hi1PHiUa6i6XCvm25vqwg==
Received: from DS1P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:8:453::7) by
 MW4PR10MB5728.namprd10.prod.outlook.com (2603:10b6:303:18e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Tue, 9 Jun 2026 20:47:56 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:8:453:cafe::11) by DS1P223CA0010.outlook.office365.com
 (2603:10b6:8:453::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 20:47:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 20:47:56 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:47:55 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 15:47:55 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 15:47:55 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659KltnM1022587;
	Tue, 9 Jun 2026 15:47:55 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8939A9ACF4; Tue,  9 Jun 2026 15:47:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged overlay list
Date: Tue, 9 Jun 2026 15:47:55 -0500
Message-ID: <20260609204755.3000112-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609202801.18252-1-jm@ti.com>
References: <20260609202801.18252-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|MW4PR10MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: 9450b868-84b3-4c19-4ff2-08dec6686275
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	p0X0+wdH3UGpB7iGLzzNnj1mhKTWwK/CIp112Vc2yDUjlQ82TbmjESCEl2hlkJnhwDMBUjInIBSoh9oM4KX5LxlshoKATJ/rCXB7LHal7BzdPYoV0a+/qUCnu1n4mqbvEjtara0zLGJCMKQ1Vl+dwnzoTeNU9ok4+iwb+3DRwNinUarjgFHzMrlfG4joEZBJZY+erY/x/qDQhxlSkXYbtjivvyCNx0jfJ90FpoijQKxsAQwPybnxG2Iq8UrpESKhSPJ269N2bIRHapX+GBQ4KownJPF5/kJb9e/96RTTs8b80bKaq5cEsAKCdRipLQdi9Ek6TKIAvWc3BhytwWNZ3nzR3RMKCgcTyySiJvaUHmE6kexEI8b0W2vDE72/AS/j15GvwolP6murL2kdqZUnpcx8xhEpe8uM0BTAgOgjfx+gOsBTVzlWrWxxr9FYptUwFQhTHfG/hAFGGy7+2dYzGGE6z76bDhcXXg7QPHgVTLbu+gRsQce4ArHMR9wS500oox98wKPJXKu/JLddUP37raucvFthLNOXztuXYyTbnBKsi4ol/OqjcjpdWYHJmZlI4GvfFGawjxZ/MWyY5Xtu+vohT/2VXI8cwhu0wN3d2WHHp3nixGZpXR1ibcCTdlaQvoxFu2AOlz00VhpsjZKxtOHlByng+TIg6Or2chX7o+a/p//zPU20BdiCIOAOpyO4PVZKTxBYHIYuyoI6ZWBOGXbmb83FyRgaBLrtJeBFaNg=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wIdhzqn69y720WA8iU4rUrRNR1mbxlhOenVR2kPF6dxKQEVxYAEZ69FfZdx16pEzV9lxYKj5v/iB2zBPUMnAZBuIDCzW2/dCY062MGCnnWC+Lk1A1aeZePKV4rXWY96/2eRg/6u0GMSUUqNOrkPJfV3Y/42LMJzm3v1BFMj5IjcYsjJlha88vXSoAq7/u7QNJsm9vlAbfTn8PG9jERIx/DPefshsN0h3De0xq1Ff1nyvRexgCWIKw7jUCL+D7QetMaEKT7As2MHKnWqt6kEK8STKNtrZ4V38qvwt6lLeyQauor4oD59VvrdTCp7DxYY8NGhYiyAStYPad27hWtEN6WVl85QB0A8Ifft9t57nnLYY0oafP9tKuI6O9Htt0pnlFQsBLgDYKwD2oBPdRw5fO/DCl3Snx2xkiBUZuzsGabsu/x4woGbRVw3NDljcno3g
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 20:47:56.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9450b868-84b3-4c19-4ff2-08dec6686275
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5728
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 20:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19995

meta-ti / na / 20260609202801.18252-1-jm

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
WARN - [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged overlay l=
ist
    WARN: Commit message should not include directory path to recipe: conf:=
 am62dxx-evm: Fixup packaged overlay list.
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
- Patch Series: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged =
overlay list
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Tue, 9 Jun 2026 15:28:01 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ea7759ee8759eb4fb2a8135e1212463e7=
417e614

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: README: update and clean up
- Commit SHA: d942c6acc0cc38d9c0abff27dabe40e68d41f584

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




