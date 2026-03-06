Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2002AFCB61E
	for <webhook@archiver.kernel.org>; Fri,  6 Mar 2026 16:04:21 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.11])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.72648.1772813057310244262
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 06 Mar 2026 08:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=kibqZ2Io;
 spf=pass (domain: list.ti.com, ip: 52.101.52.11, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WjLPiWG/xwxncwR72pC6ZKoqpLGrWneOIJZqc0Dfcf4VowLi9lKOHgF5GeSBoN1MHvoGmRuaEUkz82ZOJocXCiJRhQt42dykq0+kL7eGmgMXf/7u6EuT0dFabicvoYL8zHHScy25gN9lmr0e+Sf9PNGVJ0qYTOGW51SLBuzjgNkdO9SrPINW7eBYorwhjMksIBei7vugMcs0srOkzNIPl66RfFmeim1Cx6Zl0BLpw8m9BrV4sZiT0AQRX6g0hfBhLAmsBBYajHQhDmCRYVbg+1pm4gnThVqoYV5dMLHb+ijUfOK11DN+BNF3CBKGi0nEhtY5hkCiDSn+/uHrEo3MlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JogMIGoRXMzTuUkXItcU1GNNP4JbWDvRv3lRvNMoKgc=;
 b=dgavjcWVGMSNmHkAM4XflDbr4fueoPKFvBTAuGz/6knO9cHibVceeuFyC+p8IJcmDqbiwQIOAnQbQV8tjIQ7N1VpAS2Ai1GJj5L1KvENxLIN48k3AQz+uNRx1yiFuZCM6rOlWrbUm6dc+VlwCCvJveAPQ3zHZYc/sQQE2EJmXblbyBTLu689MVYDU70cJZms0hcxS+MLdUmtxHOkw0DA7DtlAX3a66rOV11uQbLx5x9x/ApliNqi3LeR89XWGarYUrkAzIEFHwtcjA3wDcdQDKZgOiFz5rUBzsmUBr/tYzkeWFlLHESEQRKl3EWm9cV96kUxUj06BgD44b5GJdl9gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JogMIGoRXMzTuUkXItcU1GNNP4JbWDvRv3lRvNMoKgc=;
 b=kibqZ2IoyYzBU+1bnwxzSkGvCZ/P/x5WVLXIJrXB3KeRsPO0HXswqfzTA3l1eyWeUu1ZS6xlp//BVAFZLY8fJGuuHnvwbM+rP99W1X1z1SIc77tuYDwhISt6ciTwtzwTXGfCkZ203sgjG9Ddqm0wgA+8p3cvi7nyo2An0tXdGMgdYkdni3eS3fmC0NG53wrK+Da2L5jYyyM5uGzLQjxtxHZdJJr2arV/f7gqRXzddgR0oRccA8/EAB5iIFY/tl2HFK1QOUqHC0tb0UWKwHXQ2pvHgSm5sUkrV7CqDHR9RBc+iAG8jtBKMiNkv9of4xK+6UUfeNWd4DKqyODO8rKg2Q==
Received: from BN9PR03CA0403.namprd03.prod.outlook.com (2603:10b6:408:111::18)
 by IA4PR10MB8421.namprd10.prod.outlook.com (2603:10b6:208:563::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Fri, 6 Mar
 2026 16:04:12 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:111:cafe::b0) by BN9PR03CA0403.outlook.office365.com
 (2603:10b6:408:111::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Fri,
 6 Mar 2026 16:04:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 16:04:11 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:04:06 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 10:04:05 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 10:04:05 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 626G45lj3134255;
	Fri, 6 Mar 2026 10:04:05 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id BCF139ACF4; Fri,  6 Mar 2026 10:04:05 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603060742
Date: Fri, 6 Mar 2026 10:04:05 -0600
Message-ID: <20260306160405.604153-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260306155503.3089905-1-lcpdbld@list.ti.com>
References: <20260306155503.3089905-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|IA4PR10MB8421:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c992508-c04d-424e-a047-08de7b9a01ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|376014|1800799024|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 
	A+wALLXe4Wh9ZC3QFqEc1fqd7oJeCM7lCG7MN/2w3uTPeSqaahrqPuOLFvAJsKSeOMSiWr3pWacgIlaVOsadW9P94f7YvIB+VHV4vUhoIuOaCMTJWqm+3YGBGPIZ7G8LUegE7dF3wrbHBgUOruuOrOjj1u4JAX9r01fMK+IihcVx7mBmqWHp0DzcDACwB3bY0TSpp0jaZ6fPWIUm91J6A2M25BdY3hsrISNpP6i+L4BiXdPPV601gsWt1ZLoIEmKtBvhlTtlwya+SkgNXMxMHikQnLccIoZ9g15Z0SO0GH4K2wUg/hJ7/9jN11Fk9Ple8AdKeSFsW/cANHg5f2EmTBDhTA9L2Kn4/SeEFnXgb13zfhmGWLIGRMRMsYnciBEV2kISf6LDkjofS9WmUK7t1i7JravztiMIoH7pYKOpte05cBE+zv0bqQISWnGYwAIAUqfZ8qkaZlaxLyLjcJiEOM1cMylIMyIREYLDYE8pFEeygdiIEwQwiz1SDfuC33BS9cKydzMFBhm/WISoDFOIO1grLdQQgZvLQWmreh5ht4uCHI01hXK1wtfwCFTZ8nxeLZqBfTJt7EHnVE6vZ/DPXvKOVb18xYdOZBMLJXUajoqvv/fdgUAtEEj7EdBvg068R626eVNJYRul71ru49BC++bhFH6XYySptrfxot6YwtApXFJhUU1JsffFnVIWtmknXUK6QYz1X7RrdE1FHZsCPLAbx2DV4cYWKNuQg8vhJ2FUtg3v0uy7KLzDedER8LVQXbbtpZN3rda+8q+hwFUKIg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(376014)(1800799024)(82310400026)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VGgpYN7gKVmoAkw7tRymou0AojsfgcOxdGczUqzjN3HaTAHk1sVKbiDaNfBcnEk+bCJ8sPStB6bpyHwcH8sNYUGhzV/eoE/TrmBBhiZMdqivearCOZEFAYQbW97XM+P4Tj7o4SO76Zh/xmlEh+5dgYJvWE28mGB8fjY+JuD17TJ3jiizJFVe36p5xrfJ7YfuXE2gw4yvnXI2kA7QMRm7THwv5Op07wQemE27CM4GLan2s7+/XTmoU+mxcxfaAGu2JKu76j05BwiPdYomiAz+ucZICjuhGVipyJ7fH90IzgF9soVOStWDEyBA5gg+guojJvfep8Mdh6p2MqUma5Poso6K6BJ4U3YE+eWXTtw25SjQGK83dvC6UH+1CynuzuglEdlZHKoFToW7gtGDVpJVZcllycIh9MsadDWBbUQE7HuZGcCvENrXDZWPqgm+iW16
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 16:04:11.7314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c992508-c04d-424e-a047-08de7b9a01ca
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8421
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Mar 2026 16:04:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19668

meta-ti / na / 20260306155503.3089905-1-lcpdbld

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
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
603060742
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 6 Mar 2026 09:55:03 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 3464fc4074448865cb63b620a8b96ef81=
12ebd1b

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603060742
- Commit SHA: db4353bc7e93027602939bdb7b52910b676d3108

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603060742
    error: patch failed: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.in=
c:21
    error: meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc: patch does =
not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-ti.inc:10
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti=
.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2=
026.01.bb:4
    error: meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb: pat=
ch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.18.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb: patch=
 does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202603060742
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202603060742




