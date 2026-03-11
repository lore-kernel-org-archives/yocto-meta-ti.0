Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1744112586F
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 19:06:02 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4394.1773255954601440200
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 12:05:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=GlJFhKZb;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.31, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TQbgIdYiQ+TwpTcNugMUp2V2tHei973siR90yIc/1TcLHByG1QeR5+jMm4lC1M/iVN4I6XI3uA2UbFgTdfGx7dxF0pcUzPIBRHlaOZOoHsxbwjGqfpwjQAQnBdG6xKXZ1iXMPpq4/clcBzb4PfmMVxbJxNKzVapuX8wvveGGNglCTY2t+rs7KVLEOaLFowDoIrgk2pIMIWtjXDttTdzNMNCZtDH4OxlvxeizI2OpfHyIWZm4PECDr8a6mt4nQkeyA+PvRlkaqfb/9DTCCbp0kIxykNcp2NbtS8NsIRLiTuVzUfO3yCD/oZCj/Ze8vGkWtlDiIhl6pgcDUfe8x6LmnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fALODRd8Fle6USPPm1bh304qqGNlLHFb5DiWwi1b5BE=;
 b=xocoG1Elycn1zN/9VAPSQH7EBq7+f3Jx+Liya36Ove4vaWR8I7FWkImNCiPI9mzCLGHlyiC3IGppFrEZ4KVtSm57wz5k2pRb8mJhlTfaxl/WzdnfEVZ6v9R/FaM+OMT2s5iWP7DY+ExqLvSNR0E4s4/x/gtDI8RAc99nDYvOMx9drN4/Dsz8F7FQmnXoG8iUPNXSY4MoF+ox0nOUPPObN9HRod4Q6kWLcrm0B5sJuRw+QEQXm+pVoJRh1QfGNR7b0jQMoX1cbvoil0uPzV/5s6TjiuMb1TwO9STFKqd2U0WBk+I+m/GMbwKagfSQd/aGYGXCpXSNSOvREqRmhM3OpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fALODRd8Fle6USPPm1bh304qqGNlLHFb5DiWwi1b5BE=;
 b=GlJFhKZbMrKI6pAwo7Sn9INJJPmr8TlzQLQEz0b9WVUhUmC+gh9ltv9VpNPK6uUiyrm8ts84OpPOAS8y6znUfpQNfADQVeS6WMA6/I3TqfadwpQMUNWZxJyMNKa5tCtTxwO5CZLM15+3LIZ0UaY9D0Xia+m7ABV5QLuyTHpruf0=
Received: from MN0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::27)
 by SJ0PR10MB4750.namprd10.prod.outlook.com (2603:10b6:a03:2d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 19:05:51 +0000
Received: from BL6PEPF0001AB54.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::d6) by MN0P220CA0023.outlook.office365.com
 (2603:10b6:208:52e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.26 via Frontend Transport; Wed,
 11 Mar 2026 19:05:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB54.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 11 Mar 2026 19:05:49 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:05:48 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Mar
 2026 14:05:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Mar 2026 14:05:48 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62BJ5kpu896192;
	Wed, 11 Mar 2026 14:05:46 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v4 0/3] jailhouse: Fix build issues and QA warnings
Date: Thu, 12 Mar 2026 00:35:34 +0530
Message-ID: <20260311190537.3340422-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB54:EE_|SJ0PR10MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c05e61c-5547-4ea4-3440-08de7fa135a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	KyAOJi5y3Uc63QaFtmYrn0VSmbEo1zRWInyc7A+Blp54ZR67hDVhp0R3Va+W5wLp2YmWvDogkODIBQIlwQN5KLgZIFL5A9cXTJrTsB8xgfcJpOGvYTPugKQW9F89CFtLlE++lBKidCkai/jgzZ4fqmVGTUEAsyxtFmehuV1RkI2d6C1In9Mw16vxu+vCaCeYcc8DzCASLQ++vixv8GqRGLSkGIXJTA5EpqpXhICj/Kv0o7IZKXHtSLpuQNYo0fS9LOMrsRvsMVvnUgi3pvNOjeUUe2I2s+BzfftS9WkztYSO5SsDcMlOWF/oKMZ8/8i3BoXd7lfS/TCgwccioQQPBXSTX7QFus2lyPCigEEQu+2iIa6K0s0HifUdBdWc940U5X0jOU0NuAzG7fmeAQ3bvK3ro5DCs3mMO+2XYv/GdatOaFn0Cw0SyC4gUCo6ELKIK6FurdXQhMaS8T/d63FZQnCWoFHE8NXIwfFHqlhhYz48muwUE46cu+v9tv+3wnDIKzebplwjB1t0D2J5Xx9mmbrdXh0mDl7ZzF8mTVTeZjPoyGrif5wMkdk7Z+Ck2rJp1qY3D1buMkyhmk6fUjE3aw+4NT+BfYgy+V/ZLg8BeiiEQyWRDG0K+O84U9jVhZS9xIPPve0Z6ERtlV4OFis8KEpvIimclRK/Dwt4+6Mlx9ALqOLiDkPpHhuRvOjZ7AGI08RryQDDgvgzp4gyyMUgCSQcxf02eVH/5e2eRrycgiEXs2DxSp9srCHiEs5R1YyhBbR3BdXPfvr+ONm8GVJIaA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	SNxtEW6XSQ6M1BOKtxgDZwSY2fB2fvv0nQl+vDSQnbYirCSZVAoz2LcfX1tIPaASGoLbEy+tjt0bO9SEPrqTFAbyBiDHJ4gpq1/YnZ3xEtv8ac7k3OYdrhE1H17bzSqUVsky+EkKxUHsC7ifczPCs0wIILq1Ljhyo2UjqoaffoC+neWhPwkY2YZuH4rcbxe2lmHniqeFJ+aH9r+0ySTyVUhYbQuKCg1uNpNYHvw4VrwCf/4bf1pEHdpfLeRlwOEn5nKu9KiCjLe581vsWOht99rvFV8islJlLlxkaEd3AsSe8RFLs1d8+CAPSSUE20I0Nqpzs/y/8sa25GFUmjZPFjgGgSrWCGtTqC2VMSX6ygVSy1FmGtIyItHEbWXmzXB/Qxfq63GscUZLhS6n03vKbtM/5Ll7JcdgPZ+9sMWpbxVhvkIxybPf9Ijg4VWhKghL
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 19:05:49.8376
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c05e61c-5547-4ea4-3440-08de7fa135a2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB54.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4750
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Mar 2026 19:06:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19704

This series fixes build failures and QA warnings in the jailhouse recipes:

1. Fix JH_RAMFS image path to match current naming convention
2. Fix buildpaths QA warning and remove do_compile override
3. Inhibit debug package split for bare-metal inmate binaries

These changes resolve build failures when searching for initramfs images
and eliminate QA warnings related to buildpaths and debug packages.

v3 <-> v4:
  - Fix EXTRA_OEMAKE and USER_SPACE_CFLAGS formatting per Ryan's feedback

Link to V3-:https://lists.yoctoproject.org/g/meta-ti/message/19701

v2 <-> v3:
  - Move V=3D1 into EXTRA_OEMAKE as suggested by Denys
  - Switch from 'module' to 'module-base' + 'kernel-module-split' inheritan=
ce
  - Remove setuptools3 inherit (not needed)
  - Remove do_compile() override as suggested by Denys

Link to V2-:https://lists.yoctoproject.org/g/meta-ti/message/19680

v1 <-> v2:
  - Split buildpaths fix into separate commit
  - Improved commit message descriptions
  - Added KCFLAGS with -ffile-prefix-map for reproducible builds

Link to V1-:https://lists.yoctoproject.org/g/meta-ti/message/19674

Mahammed Sadik Shaik (3):
  jailhouse: Fix JH_RAMFS image path
  jailhouse-inmate: Inhibit debug package split
  ti-jailhouse: Fix buildpaths QA warning and cleanup

 .../recipes-ti/jailhouse/jailhouse-inmate.bb  |  3 ++
 .../recipes-ti/jailhouse/jailhouse_git.bb     |  8 ++---
 .../recipes-ti/jailhouse/ti-jailhouse.inc     | 36 +++++++++++--------
 3 files changed, 28 insertions(+), 19 deletions(-)

--=20
2.34.1


