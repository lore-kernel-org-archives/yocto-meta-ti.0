Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D23FC5909
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 07:54:08 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65886.1772092443743418831
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Feb 2026 23:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=WVgL/BP9;
 spf=pass (domain: list.ti.com, ip: 52.101.85.53, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQvbUPnu1iajdbutKJcDSkdFzFgbMuYwrKk+9kyecW2zKV5qP1UAypH0n6m+q1MqAYR8TWF41Vk51sQDleNekJF4UwbgqgDHKLSoUgqO41yv/5lBfyhhagEz0+y6YLUCpW6OpmAqpibBRA2TLBkRD5/vK+IxdqmSAnL4qasQUv8U0y/vhNSJHHvb+1AImjpqCzSEvGgrtSMVjRVpkezF8oCRM+B6x8PwKfny1Kc/lbaYqBOnWWhnAFn8S/E0F1ibIRGB2xzie6MVmX/Se0CvwhjeDlDvUSB4MJ1f4yxr/FeVOde7jk3WHEG7G6bQ3R8BBB6PgHFJmWssrdGiP4Pmgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiPLiD5DuDhmm7gbeZGqTZPx/QeUY3sY7dPMsEaOVuk=;
 b=ZCnNBlzqJaG4qe11WEzcypK1FEwdgzJK/0DrdHMIIUw3BwfcoTzdc+0p9jg4iwn0EKdYMK0jnCHbSAHPY9pKnnrR4nKysI+Mm3BJL3Ag51n6B9U2k1RQMhOWIuelnqEa33O/YXmm1gOd6zupqtJF7I3SZI93pPeX7xShf2IigWi9Ec9nax/GjH1gPQ88BIf0G4RGbThr8i1rG2crNGS2p0tXKnaCC4bgelO8HW3yMCLvWMaeAnayamvgVYq/szE1eM9YFnJKRbyALvj4IYImt+ZRMWhF0ceWz7kDEwjq2sJXqmNiYbhCXEZYiuSKfczRvppFLJn4lW2+V6PKOSaMBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qiPLiD5DuDhmm7gbeZGqTZPx/QeUY3sY7dPMsEaOVuk=;
 b=WVgL/BP9hVZ4loWkreilHo2yaKxbeQJCfIIC1w97OJnXfRhYfCSAn7v2MtpgaSgR990FH7IKJtJUJGPWcG1EnWc1kst+BLehIOTOjfo9GK4kxIphGBJvNO8L0zUoON3SIEziCCVJvYbJ/iDkbmKPlbDdBnDwcll/8Uvn7RZJtmRIZvPSa1e/BUuryhRg5FzCTFM3TNjBQziJJdU1DA+tKjm7fzW48tDbeOzmDuZ1eKIHeEJ7eXki1yIOCQAKphz04/LYWS9cXNYTi5Qs2mzGehtUsGICqRFOuv/Qodxuwa0iZiwrGnR7y9fbr1TfCv7xLR0QRJ3UVnmQCAnwjy0IaQ==
Received: from BN9PR03CA0295.namprd03.prod.outlook.com (2603:10b6:408:f5::30)
 by PH7PR10MB6178.namprd10.prod.outlook.com (2603:10b6:510:1f2::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Thu, 26 Feb
 2026 07:54:01 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:f5:cafe::df) by BN9PR03CA0295.outlook.office365.com
 (2603:10b6:408:f5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 07:53:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 07:53:58 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:53:56 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Feb
 2026 01:53:56 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Feb 2026 01:53:56 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61Q7ru7q2061910;
	Thu, 26 Feb 2026 01:53:56 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id A526A142E33; Thu, 26 Feb 2026 01:53:56 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Manorit Chawdhry <m-chawdhry@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>, "Aniket
 Limaye" <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@ti.com>, Udit Kumar <u-kumar1@ti.com>, Shiva Tripathi
	<s-tripathi1@ti.com>, Suhaas Joshi <s-joshi@ti.com>
Subject: Re: [meta-ti][master][PATCH] trusted-firmware-a: Update to 2.14+
Date: Thu, 26 Feb 2026 01:53:56 -0600
Message-ID: <20260226075356.2853394-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260226074139.183140-1-m-chawdhry@ti.com>
References: <20260226074139.183140-1-m-chawdhry@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|PH7PR10MB6178:EE_
X-MS-Office365-Filtering-Correlation-Id: ae94b067-3b74-44d5-c7fe-08de750c32f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	pUFu3O22eTst+Jk0O3UeRwpzP3Tod3MjF3urJzDqfBb+Zv2ZtYE3/YrFcVT5OO++9CktY0bnSEiA+wnVS/ky04Yp/0qGqBvabAU+AwM+8pY9RGcFJ0TJTRIdjGKnCm1hRWvvGpnrxn23OrGYc6KqOOBGopsk2mdKvGcr6jvgsxrknCecz8Rl808xbIeoUD+S08DWRi40GOnUqfaBMILXD7iAXnKG76qHtYECSPaKhd7M53OZjzneIlBXre9I43m1i6RwEVNLw/cGX7hei1YEihrUyMpqQSOgUby3y/GIhpqgfPUUKNL5heZOSnp3vefT+VJd0NQofoFbNTn1eeO5IXnDHmrEKT/sHsE6tUComTE6riJWotZXnhGpI466XcV6ofnmFCaA2M/Q56EmuJhbLVvMhCHIe2/htpDfEGwgaPFktR5usVCvN8H2Ld647UtbCRGgM4h0sFJRzYcCF+1qJ5QaBSoNWgSCs30ZGrrRJGMcrguIQMb7czs//QfRMa0c/BEAPKa20gCQRJWk/xGQ4kJ9roJq5mOpaJwnZY5LK5vGwxi7/KviWfqqnIa9t16yg3vdLCgxJUCJ9oLiNYonrqrZpSMmePAjmuwvCJBVT8OhGAndXUArykQJKfmaHk/81K8yCvIvYeoQufxvSDl2RA0d9slSJXq5FyQV/6jupGsOjukdB2ckbtHz9RejclyeofYkB+8DNVz4eH1uZl5AdFnuAIyC4U6iTRIEHKjk8FJd02aKy0k8KLD8bHRjUQrFUSlZdRcdfqS0NcXgq2fGv9CKg6ycJOCekCyMJuzW+XaWmjS33D0OoZQh+0F+sdEMyd3cnpfmTTQneVNQo9//rw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CurdymmF8rpwKSsKGeUNQYGe9C3sBT5UaIyKcyRv65OQchSkA73b5O++2bUTtldYUIX+NFKUiu/g6c21m3lN9WkhhpepXP/djif5oApQfpDtoQs/f/nFSh3W6BIKfT7lAcTNdZBxldwGYaUO5y9Cw9bBCxWHF0ViXYN57qFMF6lulfZOTfNArLbCi985UqrKHpibAeXLluRh09aAMYibjPsIGFu9+MgPNULWCDSxfgMXJsw/Aj6CxU78CBo901GkAvIWgkm2LcSqNyQlYu5D4y4pvTQHzK0J4wC+d/vemX6A6NZg7/1jwNbc2xq7fBooPvXsJ5fCNEJMSkjC1TSVr4ZLZuKFzA74xoN68HCawumihsUccYC/nJTYTDoyO7icOiD+EqDrdcMTBUuRKro6BAM0PMfSlI/qkhtH+b5BwcEGqKhV+TWOF3xcGmEyFn/H
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 07:53:58.6856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae94b067-3b74-44d5-c7fe-08de750c32f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6178
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Feb 2026 07:54:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19614

meta-ti / na / 20260226074139.183140-1-m-chawdhry

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
- Patch Series: [meta-ti][master][PATCH] trusted-firmware-a: Update to 2.14=
+
- Submitter: From: Manorit Chawdhry <m-chawdhry@ti.com>
-From: Abhash Kumar Jha <a-kumar2@ti.com>
-From: Richard Genoud <richard.genoud@bootlin.com>
-From: Abhash Kumar Jha <a-kumar2@ti.com>
- Date: Date: Thu, 26 Feb 2026 13:11:39 +0530
-Date: Mon, 20 Oct 2025 11:26:17 +0530
-Date: Tue, 11 Feb 2025 18:20:17 +0100
-Date: Tue, 28 Oct 2025 23:24:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c123682e199d41c80af4c99703ea9d8a7=
2bee102

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202602251842
- Commit SHA: 3f21c4b216fb7b14e9121d5510782191eea11727

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




