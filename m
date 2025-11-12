Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B878CCCF9F8
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 06:20:33 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7103.1762928426811976341
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Nov 2025 22:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Quj5iGbR;
 spf=pass (domain: list.ti.com, ip: 52.101.52.49, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6FfbtJhAbG2dpPrcLrnEIAYGA2DXvbIEWaLr2f2AbK5t2AZWy36ALW73ZaYJ6FwFQ8PaHqgfPI3PDNrXWCAAKbeLvmB9gYdqgohjU3+jTJnOYDi3HKzcp+P55qEevCWfE6dOhJmPjbJk1yktk4sZDjJFTXc5UF8D334ThvK9hWhaWlYAceIv6hzA0SqMmRJIwpgxdwMe2qzYCPD0QBVitdok3sy+T0H3UBMoWbX/8tUx/FGMVAfBcUkMCvIpxGMhCN4CQ5JUSQxnUg2GWmKKG1qnT9F0U2Rgk8Uo1DtkzDqKFZYg8BRQ/+IxhCX4obpW+Yu3zmikMerNnUpqhKxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dm5RRgiqBrHXuHZcFozPB3OnlE59IPJQDXKp6G5JsBw=;
 b=Voocbuft8Q9tB2ifjs88XD3G1Jf/wLD6t1keAX+Zc2YlOeWur3PfcWuvdHY0Xa4BS6w3P3ay5I3jBOjTHA//mC/ULKHe2VzHFD9P9WVE4T2lMnyHC7tpzLKnFZebP11/oO82UzgSQ7c5i6PZtA5pcCvyK+a/3NOgb91pFsW0cnhnztGM4QI0eowrPE5UrnMb1oFNVwJwzpaViuqRNuKgHH8IjV2VPGSCyyH/jrhUD1pYZXs6cx8QU2Bqx3YAiDbXtcpiMHbxuPaG1cZ0FZIj5q0kQDat10LKX9ZTUh9W7iCJp4S77GPhhbOothi1WGMDUGZ6lEH7aQCUXpO3cn5i+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dm5RRgiqBrHXuHZcFozPB3OnlE59IPJQDXKp6G5JsBw=;
 b=Quj5iGbRHcDbT9J1L3vd/+xHE46e+k6g11qelMuPJVAjZVc5IW0lejqUTTCQvweqRphZiP6OhpxDmgXg8KCkJpLbDJ6e7MobhbPjNwvzCSKPSN1LnBC1gkJX4bnK/gf2DAf01d7J5TdvDhNm21N1PmXyrJ5QTtmxHAbghJ/QCdMCerXQ6srLQAIT2kP+uxDWTVeLAiqR7BpBVWjQzGZPZyvHNJa03+Cc7KJDsAhjUb9g1+J0bkVEOd9XM+9q9KHrs+xFxsfeh1DNOxOgsF/CBWyx7xGVoVRhSfUxGgwsGVMpC1zSCsTrlS+8lKl/BEpmhyLgrjEWVfFeTxfYOSelcw==
Received: from DS7P222CA0001.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::7) by
 SN7PR10MB6381.namprd10.prod.outlook.com (2603:10b6:806:26f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 06:20:23 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:8:2e:cafe::b8) by DS7P222CA0001.outlook.office365.com
 (2603:10b6:8:2e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 06:20:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 06:20:21 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 00:20:18 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 00:20:18 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 00:20:18 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AC6KIpw2626523;
	Wed, 12 Nov 2025 00:20:18 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9AAD79ACF4; Wed, 12 Nov 2025 00:20:18 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Anurag Dutta <a-dutta@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <reatmon@ti.com>,
	<u-kumar1@ti.com>, <gehariprasath@ti.com>
Subject: Re: [meta-ti] [master/scarthgap][PATCH] conf: machine: j722s: Fix overlay name in KERNEL_DEVICETREE_PREFIX
Date: Wed, 12 Nov 2025 00:20:18 -0600
Message-ID: <20251112062018.3214131-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251112061742.2741418-1-a-dutta@ti.com>
References: <20251112061742.2741418-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|SN7PR10MB6381:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ddfc489-bc45-4e83-c660-08de21b38f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3nEgL30REYV43f0YOrrw0xhRdMB/CjPS+1HFISKC5MFqiJICWeu0dihesd2Y?=
 =?us-ascii?Q?wOF4yd0LOMrJJ05ZoDzdkch/99U8FajyskhRTZfmAm32g86sj6OI6l31O4a1?=
 =?us-ascii?Q?xRUyGrZDq8hRudM/7hlYXnky/O6H0kBNJECctDwSe5UYrggz249oIyaNxDi9?=
 =?us-ascii?Q?/fHJ0XUv4SahIHR7l7iU+0jskYbpf0zml8YB7n5EvC7HzMOI6X7SaGz0i+K8?=
 =?us-ascii?Q?VBuk/lB/UsSz5bYw1WzDlmNBPE4fEhJTvBUo0TArMXsURVYHIubmXUFAOC/3?=
 =?us-ascii?Q?3a9TihkdJNC2boplJIrRcVMaI4rq+uAX95D6goYmyHg+n4sUrlj2r4w70f9x?=
 =?us-ascii?Q?CywHzm4Gq6DdXBl7O2e2wX355ujPSUp6EVt4WOTLdbP2hbUoBYR5Z21V2RbN?=
 =?us-ascii?Q?qj9PFU7snIdon/9uCMgvfeBk5xuuaUHYHn1Vje6AcgtedSvGwNJsjiTEvLj4?=
 =?us-ascii?Q?jp+OYGgtdN8JjjsK+UKUkbTA8eYin7xJJVlUxCmdJ7MkCFIuhITwj3L1PsLY?=
 =?us-ascii?Q?LKIoLpW2nEavciMOF2NpIbgYLT61rUREFw7j3qnNV37KSOTzXaJ7ra+IJIFW?=
 =?us-ascii?Q?FZ3G+5rGBPJ/+zLbXb9Z1l4+uPZMndQKI+ib17Z/IhJMyexOlNhWzIss710E?=
 =?us-ascii?Q?Y6EMWFIZWEGwerQ08UM8UPgeAW7Lj2H9SeYhktkxD1PQ7WWkWF1Se8/qCxkB?=
 =?us-ascii?Q?t5oLnIP0EE7deRAB0h6kfZ7PNN/oOtiwEc10FMmUEtVl4o3+76iWxkbvYruC?=
 =?us-ascii?Q?B5uRNIerrBUq3/HaadHUqvWgz7XCuJbR35Sifo6nujfCoIW6ZLBnAfGAAH/h?=
 =?us-ascii?Q?IQMJ60Blv8XHsCaHqEhRUP7u9D+Z3bqUzky4d+dgd2gAqcuJYHe/G/NmgGIV?=
 =?us-ascii?Q?li/j548eWK7xgD/xOxCKWGpJvoogoL0W689XBNUb/hjYqdbGDg/Kts+ewbFf?=
 =?us-ascii?Q?eZ3x1Sw1oAYC+0h+O37juAxyytni+KsrdOyMAVA4SVQJI2JndYqEx05A22hn?=
 =?us-ascii?Q?l2hQ4JBUt7ObO1CzV8jXO6Ut2S/3Gri5+uWI7tQ2CxEb5ZOBIQz55WJ8iQc6?=
 =?us-ascii?Q?1y4GtfZGFJW+jcgZb+gIY+LLCox1Jp4yP8K9Nf0g4b/yR4JIeb7VG4XF7DGq?=
 =?us-ascii?Q?OsRw8VPcG2auF+OSwiTWHPAMSfYAaz0jEnZvNCiKhz9977eR4htwfmhjq3Gg?=
 =?us-ascii?Q?pFpX0oMXuNbaIDY2/qFd4c8dOV+1s8NWmKOyeI5eu6t9gme+6ntliVpJEQwb?=
 =?us-ascii?Q?5vmBMFnpV1C6yBOea5m45f2UZlq/j/C4cKrdDX4uDCnsB39bz+Gbh4ORjgpA?=
 =?us-ascii?Q?UzG/V0FXjtzZi83ZDCdnA89f1i9SRqVx46C/jpqR2TfwS3Aqf/buFr0AiZHe?=
 =?us-ascii?Q?t9hPkA1eLkAc5k+/duJ8IVS8YF9sH8YNIQd5qHLX3rugJuJ1ORrAVrmvaJUF?=
 =?us-ascii?Q?44Wwzrq7OijE6gNQytHdg8px8kKOVc/7CVmkBA5nBc923JqIZXYCMQqsJYvm?=
 =?us-ascii?Q?jYVtuATDl24EBLqSvUleUcvuteNt8jfHt8YCvc7a/9yyQ7X/OtH6bmYOa7Sh?=
 =?us-ascii?Q?/KsCzc0mFQsh72a3AC4=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(61400799027);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 06:20:21.7203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ddfc489-bc45-4e83-c660-08de21b38f2b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6381
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Nov 2025 06:20:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19246

meta-ti / na / 20251112061742.2741418-1-a-dutta

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
WARN - [meta-ti] [master/scarthgap][PATCH] conf: machine: j722s: Fix overla=
y name in KERNEL_DEVICETREE_PREFIX
    WARN: Commit message does not include file/recipe name: conf: machine: =
j722s: Fix overlay name in KERNEL_DEVICETREE_PREFIX. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 machine: j722s: Fix overlay name in KERNEL_DEVICETREE_PREFIX.
              conf:
              machine: (COMMIT-MESSAGE-3)
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
- Patch Series: [meta-ti] [master/scarthgap][PATCH] conf: machine: j722s: F=
ix overlay name in KERNEL_DEVICETREE_PREFIX
- Submitter: From: Anurag Dutta <a-dutta@ti.com>
- Date: Date: Wed, 12 Nov 2025 11:47:42 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: af223560400ec829df20cb10a61afe125=
7d0b9f3

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Add new exception for packagegroup-ti-=
core-initramfs.bbappend
- Commit SHA: 24fd5dc0935b9081280cbdae6fe0ed542c006039

Patches
----------------------------------------
All patches applied

scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti] [master/scarthgap][PATCH] conf: machine: j722s: F=
ix overlay name in KERNEL_DEVICETREE_PREFIX
- Submitter: From: Anurag Dutta <a-dutta@ti.com>
- Date: Date: Wed, 12 Nov 2025 11:47:42 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: af223560400ec829df20cb10a61afe125=
7d0b9f3

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202511070802
- Commit SHA: 5b095d968eb225b72e44dc164683aa9157ec2b93

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




