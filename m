Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F94FB5EA5
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 01:55:26 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67186.1773712524466448700
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Mar 2026 18:55:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=E+kWyV7J;
 spf=pass (domain: list.ti.com, ip: 52.101.62.53, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JsW4dap+Uq40bVaXvqEIjkxRTaWd2zVMiqBdzmYe/zJVEZ60jxhFq8IH4ler47wfOagLgBq9kGDaWDZEyyOvwde4RNRpbZh1yf4tuaWU4rubgy/5sUy0FtvrsxKbcXOqWJzk0f0gpIgv/PgCFYxiUj2RDCv+H8OjUFnR4KS2z9TxjYuBiigon3Uv7Cq3BrdA8gBmt2sNNwPC9rU7PLS4TfS7ncW19S65HxGdq097frnfaAAIEVD3VPPF19S8wnMoFjWKr+4kPePAV8KhLYxq6InRrH6KVGU26yHwPKkCW0MEnFiHUifLQXf8B9WgcM96+oN7CWQEysBN9TTjpoRihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ngJPgu+IuMk6V6URENoEu4FNWIU7D1WMzASWCULq6ds=;
 b=Scmo6dsLxQHCteDgHyoSb4+rbDORfA5UmlAK8oouyTxRuy9bwT9JVP/ZPVjbyhnlcHP56Xesx2i2N0SeEJ+G3HOy2pG2Xru2XsI3jT07q6D87icjpNUoDDjY5zeu3+Nt/WkT8ZBCuddK6SOSGtsiAs+Tn1NhhLJvnGsw7DW0UMY5R4x6PmD5P0oLAMh73P89TKgFS5WD+6ApRqyvLHrUvASnZU8qQLPbe4m8rEPTzw7ATZE6HezdLrlQn7XMwVC1uCqz6YT5wK9iVoDJzR0E0viwWeX8Zd8igMzMiCCEmF9R2n9NeSHr428pFWxR05N5JGBMptj6fw2t7+olp75mlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ngJPgu+IuMk6V6URENoEu4FNWIU7D1WMzASWCULq6ds=;
 b=E+kWyV7JiC7RErXEywryfDp83cJEcm+9n2GWoPzxe/Ux1tW38sOha78jYKFWOGgVN13laERK6wXa4C8gPhFmzvzjpfV7MbeCnpVThqiendUKbYQ9yGqI3oeiMIjaHGBltSbQaDrBQEM6hr2dLMia1GCABwryS2OxEiGb+UKObzBIJlmrw44bb0KTzXTj04JDlk0EW/8o7HmgqsE4Czv+FJxAqUAtRus/5loIFyILtspaXNu9OcIqwbRSgR9whP1POud5YPybdib2g0/sqUrsKgcr+zggS/UJlU63VLEj/3CPozVFNFR4oZK4qjf1VR6ZME6f08p9jLHPtxGDFAO5CQ==
Received: from BYAPR05CA0079.namprd05.prod.outlook.com (2603:10b6:a03:e0::20)
 by PH3PPFE03343C9B.namprd10.prod.outlook.com (2603:10b6:518:1::7d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Tue, 17 Mar
 2026 01:55:21 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:e0:cafe::b5) by BYAPR05CA0079.outlook.office365.com
 (2603:10b6:a03:e0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Tue,
 17 Mar 2026 01:55:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 01:55:20 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 20:54:56 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Mar
 2026 20:54:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 16 Mar 2026 20:54:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62H1suH92289977;
	Mon, 16 Mar 2026 20:54:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3814E138B5B; Mon, 16 Mar 2026 20:54:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Prudhvi
 Veeramachaneni" <prudhvi@ti.com>
Subject: Re: [meta-ti][master][PATCH] ti-extras: Update SRCREV for Jailhouse
Date: Mon, 16 Mar 2026 20:54:56 -0500
Message-ID: <20260317015456.2450260-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260317014155.2776707-1-s-sadik@ti.com>
References: <20260317014155.2776707-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|PH3PPFE03343C9B:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fec5c9e-1862-49e0-3638-08de83c83eec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	5hMGqFfJDCqOWZzThJR0J9toxjIW0NtBpdIqtbDafloHTTJEcRhTOZeYnw44Gm7nVMbObPic+ydR7dzKz/av4JdGq6dU7mbLIm7E5xbHjnczMtKPV2NhL6wxEjP5gNJajTFmK/J0qwzV+i4CnaObMeT7kmrrBnFJULCATe7sRkWyYSmeU077ejz9mQ73LguQSbLIRrZuVWtMr0ea0DBRkn2iPGUaOneKdTCbixRyGRHTabyHajKOPdytGRjeEb6xCST4X6EEiuJfVr3x+C2SFL/Hyj11n/APv1fARcR3YRSkl62IBAUQTmRlAqexemTWMRysltfZNXuK75mPHNVWp0infHDhVHDZfy+eqqVZfCodUdcjlEF82FsAbj/D/dEwFcHkc0ed2HfNkwmB2fhvAiSW6eoSge7gKr4tWcr62oZhB7cKariojH7f/lqLmLE186A4NTLrOTMxNV0LHRbUSODCtkLTg6FKxU1c1YfImpSUZKh2IAxU+KxeLawaA/JJtixQ0agXD2KRdG+Os5rmShDskHArkwTQ+gVMCpkZ1BXPznNOHKMmI8p3fqV5pnBvyWga9OEO3iiBK7ON90lE5utgUvvNuwWX+lP4lYvtH+itD5dKB5h4iwVOuJ4G2CIPwMek6vaeMsO3ko0EOvlI5HE+O+sEzvQSz09DRF4xgFYAQIDlySISt22aCqC4KIkT+dW0Oi++WILZvWogd480jyrmFOPfTL7i5yM+gvnFJqpzdJhqImxqBCmPPb17XH+BDsjuOVWxvfCD5noZv9amcQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	KT/hmmbB3X3rTA9oRWvtR0RoGBjmCMUPvlIjxFQozhLHYo+fyuzs0JGJMeqsdIHcqfX7nYIG/whdH1NIh9lOpYSv9mv+PpNu1KYk1Rlkz/G4shpWOoTblagXFjH5/xGx1AWrEm8kbNXNnrAr2SBB3HwEudyg6o0aKN1tQg6m0G5d06K28+oILJvt8ceufdz3+I1nTKCzl8REuW3qNuk9MmamzfZ4u5OAK9UWOf+8Z+jgDNyy9P6s2nUzfsmQnCyGJBDBX1F6hB11NAauX2dslwmuhGmu1shlES8uDA3PZfLtYybyKoxiFQFL8Jutd8WaxwxdI8ExTlZx8QIDbQs8KS6VoIPsddUlItUvfV4vcVvZsp4Fj3O7OgfEhxFqqU9/EIPLD/zaEmYP6MqJLCPw6L9wilUXSSzWNAsI36AOPud582XMi5ShN8v0XvJYduzg
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 01:55:20.4200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fec5c9e-1862-49e0-3638-08de83c83eec
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFE03343C9B
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 Mar 2026 01:55:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19728

meta-ti / na / 20260317014155.2776707-1-s-sadik

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
- Patch Series: [meta-ti][master][PATCH] ti-extras: Update SRCREV for Jailh=
ouse
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Tue, 17 Mar 2026 07:11:55 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 21fc0f37991cb660b7c6f1cb9ed145cbe=
b8bd230

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 00d3d9ec970580d296870c0886bd6836c3caca0d

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




