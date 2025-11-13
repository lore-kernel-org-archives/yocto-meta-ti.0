Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E4ACD8CAE
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 17:20:27 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1491.1763054422807295232
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 09:20:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eqTeSb5H;
 spf=pass (domain: list.ti.com, ip: 40.107.200.60, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbQd/Eph+/rXNc5tbuXgI4n8iJLS9OKwv4zFrI2v+3Ia3vdpm1sKgYw0Wicj8PlmlOdhINalO/whi5UaFVmAsMuHEihgqWA4D8Vk+QuZ6waknNk1P983/9Ov7suz7+HQTr5fs6QhOG84Q5OnZyzY3BcsXNIo+0L4rTNyRAGmp0KPWTj3lOYtkT5sEiclIZG5hMewBVjsrd/cVnzU7fmB/LLYQWvzFryDh2w0vdSH4JgJs6KlHVZq0u5EY5puwlHWAaIWDh/sK7DI0pZfNtV2t2UY5fxDVH2GwtOZ6qc7Ui6bt9B2EsG+KauJRMAXSHAMgLRtZb7K0DElu/DQgtezzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DOO2rnHFRys/nNBryZTlKkpP3nOvxZkNgdGPcB9LtjE=;
 b=LB7aiC6qtfEgz+RUiRa4r8sMJN7/S5TNpT+n7KJD9hkRYqtIX8yteUadB/4Xkrk15zJy6mwJGZl6TKEk9NCJ0c+FTVjY24aPWHjRldAJCJakyN71MXBfV4i3sjQDai5A5Qr3QQODg1DCxN+KrI2UmThF8EsETzL9AKNbV2ccSEEG3LuyzgPr07/hD/RG1e6tjbjtmaTNOkL9AFcaWqu5wbtKj1StXXZGDFStyGJdXra3pL8TvkkK4dqNA2B2Qq7UdOnbeTxgK98JwAOCyjW0FDXIrZrmQ5qRfstNZOXnb6OeZ2tnMANC+IK3U+FzpxCQ19yNM+FUQ5JwbKhVvQy8IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DOO2rnHFRys/nNBryZTlKkpP3nOvxZkNgdGPcB9LtjE=;
 b=eqTeSb5HSyA3ceeUp5+cDSo6U0M9Olo6hIUItEp86xG1TUURIxoVAuqecyH09ojtIoiEmnutHLGjXFRNwZ8Crkn+S2lPxYry62FRLNgXGXmg4SuhWu6w20hWHm/PEg6fNFxptJGn3c7UGx1aqulq5+GaD63ZOvhu+Dri5N66ZQpaMJfgWCRFyWipyelyhzaxZpk7tozDKA+KEcnS8zoWmw7MBYf2c2XDpz6v4tcaBA9B7DDIO4Xg3OgjNCB9MqIqc2Ruae8jTxrIGhWyJ9G/0t5XetxBcF6s4s5E//tRRTcqnNUAJYQGFlNzpOt3j1odmgEvCSfoWpiYHZh6E6VNuw==
Received: from BN0PR10CA0016.namprd10.prod.outlook.com (2603:10b6:408:143::23)
 by DM6PR10MB4314.namprd10.prod.outlook.com (2603:10b6:5:216::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Thu, 13 Nov
 2025 17:20:20 +0000
Received: from BN2PEPF000044A5.namprd04.prod.outlook.com
 (2603:10b6:408:143:cafe::f) by BN0PR10CA0016.outlook.office365.com
 (2603:10b6:408:143::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 17:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF000044A5.mail.protection.outlook.com (10.167.243.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 17:20:19 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 11:20:17 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 11:20:17 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 11:20:17 -0600
Received: from fllvdckhpci032.itg.ti.com (fllvdckhpci032.itg.ti.com [10.64.72.43])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADHKHH54099085;
	Thu, 13 Nov 2025 11:20:17 -0600
Received: by fllvdckhpci032.itg.ti.com (Postfix, from userid 60899)
	id 5504418ECE9; Thu, 13 Nov 2025 11:20:17 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/scarthgap][PATCH] ti-rpmsg-char-examples: Fix patch
Date: Thu, 13 Nov 2025 11:20:17 -0600
Message-ID: <20251113172017.217625-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251113171619.7266-1-reatmon@ti.com>
References: <20251113171619.7266-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A5:EE_|DM6PR10MB4314:EE_
X-MS-Office365-Filtering-Correlation-Id: a0558d74-e23a-4dc4-6b06-08de22d8ebe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zYf5f7YHv6enEtMUDMJ4sH+oI+NHOBDwFnKGzkc4GFakZEmqG7UAO3yLfUna?=
 =?us-ascii?Q?nHTFZADWbV6bHupw1S1xj6yxu0iVNd4VeghzJevdbHC9u7wdfest9TGorxuk?=
 =?us-ascii?Q?Izqnis+qvGa/sdlwBN3pqgUndyfrOjIgfNqkrZLdt/iXgTVcwcv7EOh/uW/0?=
 =?us-ascii?Q?f3/CxXC5DzIeP9jPnACPmgrWEsJIInHya0+AHtDj+bJ7Q5yWlbr9wLcHUsfl?=
 =?us-ascii?Q?ouWdsEfbPQSlA8wt9MJFL7F5Co6kv4mcw5/SjwPDTeZGZB6HLL3F4e2JDcjF?=
 =?us-ascii?Q?E6xERn4hULix9dzP1v5bT0k2LQX8lt0x28UjFRSviyGcsk5b9g0tG9MOnGmW?=
 =?us-ascii?Q?NQK2IOIyARKGO9gK7Mw+gbLUuqUUjCfuCX7PVPDQSQ13vk7Ca4j0yeG5m+Ls?=
 =?us-ascii?Q?zzvumFarRYNy2tuLnNi68yo7Jn0SH6acakJ0o35XpEmjTq4ou6KrrHAYNT+R?=
 =?us-ascii?Q?vDTx6rTed40FaAn5YXMK5fxxLVKdaulCiUxavd3oKybXVNgeT/lIMcE5FUDr?=
 =?us-ascii?Q?imBKnSB/j9yXnWss0caeQdd8tOGkqIyFlJX1ylNx/ktpsh789a2LJOQdl2H2?=
 =?us-ascii?Q?lrFduSfIc3KptDtfwICGXVMsVrzyc5ibfefdlIPqpBzKLRyqpzy2Qg6d643M?=
 =?us-ascii?Q?AE+bXzoCVdx/UhwXEFQSGiWDtqT7pl8tOXKUfMNB6167+Z5cWdAoznAsiTuA?=
 =?us-ascii?Q?ERi0wehuKwlqkto7Ons7fn0mNBGOkiDqUGRMzLYtPpSR51DuJJEB90YdL36F?=
 =?us-ascii?Q?rPCCyDA0C9tIxaorkmKyD9R1ENoKQPzpdDT4MfPvzcoZcULySdJ2Og+mfGTC?=
 =?us-ascii?Q?r2J3C42rKL3qDKjuwyNUrK+b8nxsM8C3OnAxs6YoPjezOv69vPNV+CJVblcZ?=
 =?us-ascii?Q?pXizm0E03fURglqV8r2+7fHr4E99Q4Pg8++/YZbTUoqCnTAxOLbtRgeNZQYD?=
 =?us-ascii?Q?3lvznz6GDcQWhKjnllvaFo171sjcKqZ3IX5etT+ZnuFdBTUjPrKjbfaIcRFT?=
 =?us-ascii?Q?HZquPuim+A7hc7Y5SKf//WQ7eiPeoGjSEpVkTb/Ypq2bP1MFM8BIyQ/7Vxju?=
 =?us-ascii?Q?C0C9C7JOlkTBD3abIWcibr9wlWoqgNEmRIgMXRq9JfEUOjxm4O8mEHkYl1Vr?=
 =?us-ascii?Q?wOgqbAHHR7bICPi8fOF0OugRnKBXSIGrCzwCYI8ERRcK8JKMmTzP6kjNNXJn?=
 =?us-ascii?Q?UEudrQFNi43ih6XnB35kX2tTTvzHRA04y18pSymKrZRfauftpkgtG5QSZlXV?=
 =?us-ascii?Q?xX/G3VsuqO1TneiCdFfGlcuw+MkdzGgClEEBjXRWbK9EPhSK8Kjd9TB1uGFV?=
 =?us-ascii?Q?NufmTIDpMtaD/CLC6us9/ELnpxXKtzlw3RKfjiYtbCx4oNL36JwQ0Vsy73l/?=
 =?us-ascii?Q?R9vI/3fU9wGx4v4iJn7Rt5fVtPNCSSi2NQkhV9m2oPhWiKV/n7iobnoR2jGD?=
 =?us-ascii?Q?7rLX/JP6XvKLdKTOq1ng286ijUbdYOqem31nsZ7UQp0RTE/N3bxFv15qSyIB?=
 =?us-ascii?Q?oteUI/C47E9z5JeUyhs68YaLf7jx9zoZCz9Zf48JGU4QNlF4iHUi2C1DrXjM?=
 =?us-ascii?Q?u9n3O9nU66ry8QxYkg0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 17:20:19.8377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0558d74-e23a-4dc4-6b06-08de22d8ebe3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4314
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 17:20:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19275

meta-ti / na / 20251113171619.7266-1-reatmon

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
WARN - [meta-ti][master/scarthgap][PATCH] ti-rpmsg-char-examples: Fix patch
    WARN: Commit message does not include file/recipe name: ti-rpmsg-char-e=
xamples: Fix patch. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: ti-rp=
msg-char-examples: Fix patch.
              ti-rpmsg-char-examples: (COMMIT-MESSAGE-3)
        patch



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
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-rpmsg-char-examples: =
Fix patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 13 Nov 2025 11:16:19 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 982e8c46be820bee15b46fc66fa164511=
06cd914

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Hari Nagalla <hnagalla@ti.com>
- Commit Subject: ipc: ti-rpmsg-char: Update library to 0.6.10
- Commit SHA: 52eb73aa75338d74c50ae899d4626c695ee86002

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master/scarthgap][PATCH] ti-rpmsg-char-examples: =
Fix patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 13 Nov 2025 11:16:19 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 982e8c46be820bee15b46fc66fa164511=
06cd914

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511130400
- Commit SHA: 92f03e7522cd5b9ed0de58f503513d2f254d3f1c

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

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




