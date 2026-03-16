Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9FECF53D7F
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 17:25:39 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56521.1773681929012322559
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 10:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=plblY5pN;
 spf=pass (domain: list.ti.com, ip: 52.101.46.43, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twE8sdUMQpdUyqgb2vuj+V4WsG9pCm8Liu6Q6PJtnYeTHHv5M+peVVa2Hx/MPDp++xJUwLznRqMspFSuySrT/YlN1CR5WtCSxzX7yv/SytRLUgk3O4h5NU3cVX329Z5hU6juU+OJzW3cS5pdZk70QsK0A4arPGVJ9ue2uzrftNSs+DIEv/1S6n62iUw+pRF4ULJbRtAYcedoHkk1QskDFRZfa7Ai1mBu4/hlQKTXRsaM07zRLvlRMpOEyG/Qip1ZAKYoAKTEME5wJDDbmqDxEZiqvZ4TzYPF0CCsC4JAgWiGnSkD3ilqBT7DB9bQkQi7TNYHi3FdRX5AQCCicRsKXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cDtVMz0gYXbEpJNlx9LZ9RAau1zVhn9WGi9msuU2v4=;
 b=YWxnBH1ZcdaEuGEABQy6wWfNvGK6/7d8f2Tt271H+NYfZpUzIZ2bEippzDFP8zfQkNz1hcBm9AS5NFST8i4Ceo8no6u+OzNq3pJBhrn4Hz0HyoNg4b2aP/OxrcL60W5KA5LxGJL1xIhk8KhFb4VxvkS4lLFsOWjauM+Wp1j1vqr6z0/SwDQLtH48MuR+GOwiqABNJy7ElNvvN2XaNoBfDVSWI0BCbUJgQTNyBDQQv5zUOX6X67zzc/JpO9bTRoH0RQK0hDncBHkDTzwL0tKNhAv9YCg1wOoj6hAenbN7jYDj8SQvGt2BtqhPRgc3LrwMjM/v5f0vlDEsRXIJL6bnzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1cDtVMz0gYXbEpJNlx9LZ9RAau1zVhn9WGi9msuU2v4=;
 b=plblY5pN0+/Hww8SV7T+7zjgChrsA/fh833sxBIDrrAqu4IPDiia6bCxO1+xgMXHRxQ9TV8n/PEdTm06OWaiH/YxzdDnXZ0VdxXLoQwTyNQAoIzOERk7p39uqVzEJEtblarKiYMbRCtouqAQe+fkY9K6qYOB1foKq1jueWMPriy+2Gzvth6kQPhN2xAq/hNdAlP/10yWDjl383zW5KStpi7dPTqunZKZD0grahibG8GucLzm0wi0Tvxo57NaUytpJdQYrgaMlZKu9h9UNwDCXLgxFiUiQ2udZlmA8SM483TOczZSc1Fq/gUhFuCCcTJkh2Ba0ixVo+fUqYZxPaRQJw==
Received: from PH8P221CA0043.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::23)
 by IA4PR10MB8255.namprd10.prod.outlook.com (2603:10b6:208:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.21; Mon, 16 Mar
 2026 17:25:26 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::18) by PH8P221CA0043.outlook.office365.com
 (2603:10b6:510:346::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.25 via Frontend Transport; Mon,
 16 Mar 2026 17:25:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Mon, 16 Mar 2026 17:25:26 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:25:11 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 12:25:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 12:25:11 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62GHPAY21191680;
	Mon, 16 Mar 2026 12:25:10 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E9BD69ACF4; Mon, 16 Mar 2026 12:25:10 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] linux-ti-staging_6.12: Backport C23 compile fix from linux-stable
Date: Mon, 16 Mar 2026 12:25:10 -0500
Message-ID: <20260316172510.2119350-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260316171305.3378319-1-reatmon@ti.com>
References: <20260316171305.3378319-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|IA4PR10MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b16ed9e-6eca-40f2-1f79-08de83810335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	o0tbAcs6cqYCOOOHFHWjmdMbz7Fci1A2aCeJlHOP/UGPG+Bcjo4alxd7gUt1IotFzekJ2lhRHpwBTAqLruI7y8uhIr6INwUAoJq7XyJMj4Q7nz7T5hwVjS60biAUqEk94+q71jVCKY3uVO/ZgDaMtxtQW0tGAixhUxoScvdPEcUOTF+acYph8KGxMVugYbcood//hvYAha3bhtS10V3RlZ3vNWgc9vxZcT7G+rsQ4QF1eZmt+PPZsNn5FRE0IzTjpj3HwYVOhpkwId+MmYhoJBV+yPdgbTgSt0g8ICL2yy5uNhDUbMh0CB/F334jNlNPwWs88xo/6pI+ZCU6yXYl86+VDuyjJMqUSXjRxfBov38mdKx2ilVhspa4+qD3IOOE0EAqjmm7Bs7BoVrEoZ8hYBVpQ+gcwq0nX0UXvFPOSSY9tIlHRpc+1Ow6uJKyh9sBzfGSvdNIF3S4Wb9rqUzMjHjj4bvSfCv1OGuSvzGK6Yl5DH6zPx7JQZBiP7GiVsDFkgv0oI3Q7DQ5MJA5mDkWCcly6BlsFzWUUYlXXAjJCd+gypq+VVymUEg3j6DYULFwnCzi1mU5fLD87jumAWuwNUW3FTJHv3KiywPuSI2b0sO37g58TKRjSin0ryKiqNyM0+KDALeaSo8gVMhDawCCV2klnEWgFmulkjqs6B0OG9B+XBBFR2D0ff4U2jcTDIl/Hnf1MkvLtqutFpcugKLSp/WqC02Jv1rY3yyhgion1CNbOk2uO+vwikt5/Pw6r2u9YgkygJrXIxTxWP+QIrG/Ow==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wi/kBcCcrv+jB/QFPsa1UEWqzxrc07jCbofyvvmctFgcz4yNknKCMsBcGKiCmimQl79Yjm1QLgWoZo8vGMQwmle5MPiM1XG5Cr5zS/evZXIP3EPwdYyWtPEufJWxkiRtfafNGi9WUYQgGSqv3I2Cddjmvdq3aEQAh2fJFdZWhuVsGBOITOqNF5Gk6bXFaTc2sjmXhEVqRh6u2U+0Lz6qH6Ps5MeKg1liQl/uIBXT1ZdqeFrzGbfbgREBCcBb7FBnGxjcOwX8G6MEpKtCC2BJFshufzTSFAuP3gWvGmej82IU9p1lnM9gL1V/Wa3jQpIOpuPEKwyXC0Q/7Y2nWPrR/PY9gvVmY/OeDI5YGmdSgZMeWjrAL4EFzzKP8GqtIJRaLqUyqVGVw9k52o5YyHP0gjQ27H7cor5xSRNZVkzHA6pCafje2QY7iNGa6UGo+cCs
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 17:25:26.0244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b16ed9e-6eca-40f2-1f79-08de83810335
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8255
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Mar 2026 17:25:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19720

meta-ti / na / 20260316171305.3378319-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH 1/2] linux-ti-staging_6.12: Backpor=
t C23 compile fix from linux-stable
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
- Date: Date: Mon, 16 Mar 2026 12:13:01 -0500
+Date: Sat, 6 Dec 2025 14:28:25 +0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 749689a70459855e66496a35ce68485f5=
b88a276

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603160400
- Commit SHA: dccc25fd429c27516a2cc0cba3a0ef03b2826d82

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




