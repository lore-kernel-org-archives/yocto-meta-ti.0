Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34EBECD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:53:14 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76861.1781002391042047097
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 03:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=Gpbz3rIs;
 spf=pass (domain: list.ti.com, ip: 52.101.43.45, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evK7MMTW/u1nwHIxgDVz8k9YooqsmJY+B4IjC+RTlne8rfO4cMpO3k+A19Swiwz3cKE1/ZMs9opgGNWkwJirifFUo2p57HZsTbY8eZXCZeUAFeYUqXXG9QZ9Sra1IoUaFtO2zIcg3mPKTDuxZzlCZB23uky1CGWbhpFJslBjN9pNK0qvhOqx1Rpymjr62e4OG4NsR3Fso7tBDnqaDUjtLEJdhEwyd9N/cqRHiyiFadPUfBxvEWf2HnGah2tzxJ5dPTM0FmNTAQJk5/19PyrTznkg+fXgQhVdCqghxgIpbccRTnA5WyJp+YG8DaVt7WsQXNz0BzWbGFpoTcPzqr8ccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tlQsLNFWtB7M7wXp2oxjO9E9etjAwi5Fuj9c+sSAU7I=;
 b=Mjn2b4XShmHDPFOE/R7skGcea5qRfK4Xn2TAV+XJmZmDGp0DCtrkDj8WZBz7bWi9bvVXYsF+T8Piy/5ml8iWoyssTcZEyJSnzt5Bl5QU+ahj5XPV0R75gyBL5SCLOr5alCDkCO/0/emVLp4gj4ijsgDDgSFiIFZnjer8+bNTwFvDkEXmFB7+AJkDA1x3tl1Pv/47FALwn7YvDu+tS4Tf0P/d6d567AyVtQmqbMTAtoSPTwi5wgUYMqaH0YAhb7HjkGt+LO+KUBy1dg5fomHu4nAPd9BMeRo5BMIrubBKiNfksUx/A1Ziqrkjl8cKpbqXY9opVv25NkwMYbwmMuy8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlQsLNFWtB7M7wXp2oxjO9E9etjAwi5Fuj9c+sSAU7I=;
 b=Gpbz3rIsp9rsXOCXOxqWtuw2IFEy/2h8xqc9JwcqFbT/vDzhO3V3f6Bg4fTP8H26gNZkVDkb3Tkom20L3VvL2lr+fDt44yePOgdetSs4Pliol72UrWNpPZatHTNoK28JWUUaVMnb7e3pPQhcVffkGmnOoIhwgiKEzd3Q5J2KE+A09pcBs666YavIaNX2fvZShCiHDq6vZPpjnLYa1sMpuipCfJfLGPZYh/89b1v0BpewAY2CbDnAJIcLB4k4IF3AT1js/azXmqLDTnuyWsH8572d0POnRtGyu0/N/F25m2zy6V5BUzIwBNk63Ui6cayLoDOTzzYEqjwIbmydpQiItg==
Received: from BLAPR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:335::7)
 by PH3PPF18C4487EB.namprd10.prod.outlook.com (2603:10b6:518:1::78b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 10:53:08 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::5b) by BLAPR05CA0027.outlook.office365.com
 (2603:10b6:208:335::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.10 via Frontend Transport; Tue, 9
 Jun 2026 10:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Tue, 9 Jun 2026 10:53:06 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 05:52:57 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 05:52:57 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 05:52:57 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659AqvXF1333957;
	Tue, 9 Jun 2026 05:52:57 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7F0499ACF4; Tue,  9 Jun 2026 05:52:57 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
	<prudhvi@ti.com>
Subject: Re: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubifs and ubi for beaglebadge by default
Date: Tue, 9 Jun 2026 05:52:57 -0500
Message-ID: <20260609105257.4136302-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260609103052.2451227-1-y-hegde@ti.com>
References: <20260609103052.2451227-1-y-hegde@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|PH3PPF18C4487EB:EE_
X-MS-Office365-Filtering-Correlation-Id: aee17f64-2118-42b2-d4b4-08dec6154979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZomUgTDcw5Boe0Mg617/vimI0Tsgskm9cjNeHd6hmCUbbMcFBNBrgAIo6a8dGk9w8uTohD6Wzstm5i/3LgAoTsOusEXjIb9mtSdzpIAQ2GvqrHaB0EwsBJ1bfXYgSMBPuSA4CWvCzTnKnPt1l/YNt69BPbRdsLQVDkeipEKxS0RYCRg+zaW7RGTeIwfJHF9a/1SiiSnn4Dj73Hcg7JVbCQM65ncXJ4skSynJG3iPRSl7jXSNgPIvRPOVZsCo0oHNC4CSN5Bbq0pkqAr7Tx9P1LoxeqyvAhFBd3rutFhXXknCwZsAhQ+xREjTR7hgTRR5EnbqnZ82GIiCTXcA+MfqTjjPCCfufll4vOLCcRG3h/c+b/TeAr9IrqVZUj5Nd3E7qvy4/sA0K3Rs7iTJr2G45oVQhDD4/Zjt4X/hxzshopb3QYukULczxH7APS4Bqgr1yqpf4ReaabDUw+43BbojEGFul8Wc1p0CMIHfPKFV5INAYoZnNu4NAk3DlTt5QOnBNNL6pOqWQ5nKpQ/Pv4DfetLP32jkUClK5iWJ9UdMkwsiWUKS4IZDowCDwahxFUBgFoyWaeb/ar5amnw9lAQ+7UKrb8/FW0M/R6xEBwJ8mdy70AJd4RMh0nJo4FBvqkpkoAAjZoVfDHsRCLHgUp0tscwHzkkUrvvyTOgE+9mJehiRnLl19uMQ93ZB25r45JMQeroZGIQBcAMSPeg1hR74wKAmzyJoYcj7rPoilU2r3CM=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	WTc6VIxdvGFbhOsONly0fGQbQJ3l95x7vDqPJ7L7t3BJwh5/YkC45B9UszOhHq/aaq5Us3HR1KgeV8+qaLitqa3/dD6ZTOvRkbulRfew612oNFMgnLICOn1Us6+5/Ml2H44V5FohPAvUgNShQzLPDWupQB/FjhoxGduRmn5nY8eeRUe+2R4L15zJOsvlHvz/BRIrROUovV7BZoRdT/Sx+aq6hvjT1wY4JLeGrD7sQn+l6963TTElOFK8uNuzSiqL7Wczr5isvPIlsvtqxjhV0GDR+MCCKsTfd+9qcqEMNn1t36D7up25hrdMUHFIb0SroKITj5TfqxwedQtuqfMJ6XeiqggObklaz3jQC8UHz954C3+az4jV0L62eWLx9/DXztGzkG+yimejfw7FlInU5SY/2fJ+FoWE4w+gneWHvdc4oAUw3oM9gP4nwtM8O9oG
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 10:53:06.1280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aee17f64-2118-42b2-d4b4-08dec6154979
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF18C4487EB
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 10:53:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19987

meta-ti / na / 20260609103052.2451227-1-y-hegde

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
- Patch Series: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubif=
s and ubi for beaglebadge by default
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Tue, 9 Jun 2026 16:00:52 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2fca49ee3fb8f3af34b73b5321a3925dc=
4c01b61

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: 4b25eecdcd7470f2be754c0d4f0e00ceba002773

Patches
----------------------------------------
All patches applied

wrynose
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [master/wrynose][PATCH] beaglebadge-ti: avoid building ubif=
s and ubi for beaglebadge by default
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Tue, 9 Jun 2026 16:00:52 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2fca49ee3fb8f3af34b73b5321a3925dc=
4c01b61

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Moteen Shah <m-shah@ti.com>
- Commit Subject: initramfs: Add initramfs-module-netsetup recipe for NFS b=
oot
- Commit SHA: 5eec934c3f0cd03cefa870bce9db4fffec8b19f6

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

wrynose
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

wrynose - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




