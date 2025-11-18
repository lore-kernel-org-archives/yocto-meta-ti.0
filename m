Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52111CED24E
	for <webhook@archiver.kernel.org>; Tue, 18 Nov 2025 09:23:29 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8584.1763457802574294960
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Nov 2025 01:23:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=eLp1u6sv;
 spf=pass (domain: list.ti.com, ip: 52.101.46.31, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XD7fqJ/k4TomiGVxZF335SxZ5yMuTkFxOjaWTkGPYvWyiTNnMQi20N+dN78ILloYhcN6zAPSrSuR49/fDc3/r/vl/OlMyxYYbGq8kYwOFhz0qvQbvkwYBTZv9OzT18GvEFbtdF9f9OjgK4Ghf6e54jDioC5shq87jRKmYVhcAooO2+pRc90dgIjQ2Eb9bENujzTlCmxLUriSuuLpvrGFNFkDi6VxVmZ5wR4lmOAl0kzKJco7gXkBWdi3n1Z8wPNisEyIRYA/jsXI5jIp5GFFc9qKwrIk0wi3lJ3wHFbh8TpitrtZIKtfp6Vguo6XCZVRMGzkuqccmG/NYzH7+HifBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8r4+zrJ2F1WCRXGR6s24JdSFlsx6X/qOL8IniyfJrMs=;
 b=FOzCnyZ97SFI2AKb76j/eWaOFNUpMXPUkG+4us1G6hqnwyc3XMl1hFI+DyQwbuGuoRFPrTXByb09Hpqe2r3L+HGW1nMMU+MaVVxrWDhjEa9zOKdO4yRnTbe7y/qQY13TjzJ3HNnzB3CLh7d9spFmh6tsROJYMyCPuV8vfmrrjwFOPpznQidrD5YaSb0qn8rqmHQSRdlV0UCgc5rIP21iV6UYkqhk0Z0YfF0YhHVLHrkfL7zv8ndVXA6aoz283sUi9XQlhJrKXKzq3bZ9qKEX6SA/p7gxMs1zfq+1Nm2VyrSXXlLe3McPMe23391P4elYfyFbPZPXmpbsIWhxPQkHEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8r4+zrJ2F1WCRXGR6s24JdSFlsx6X/qOL8IniyfJrMs=;
 b=eLp1u6svdc3DcOJ4jOQ0x6fPau7lKi/Eq9bioaPNLMoqQebNSaCZlulllUk3vWlYzTST/2uQ11YOjDMuEATlB4s/SdubuLV//0F1fDB73rqhYDMH0VJcXV/Vtey/4uiB8WBhDtK0PdSnN0H7tBtti0jEO21sxBV8/CJiT46BFm1RNNHGXlsrbOVdvArQCdI1Gndm6aYFP2gGIAa+PrWlWYiGk0B+9/VQhxeYDP79L1RHKbAesf4Y4hKSpuyxFRS3uoXgTmAWcfp4U/VgMYE75wFvzqnMPhJ/WyTn6Ay2NYuW62hJN0TmvSTDyPeXgxyHPiwXPfQg878Lc9RShTT3hg==
Received: from BY5PR17CA0019.namprd17.prod.outlook.com (2603:10b6:a03:1b8::32)
 by BLAPR10MB4819.namprd10.prod.outlook.com (2603:10b6:208:307::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.23; Tue, 18 Nov
 2025 09:23:20 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::f4) by BY5PR17CA0019.outlook.office365.com
 (2603:10b6:a03:1b8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Tue,
 18 Nov 2025 09:23:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Tue, 18 Nov 2025 09:23:18 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:23:15 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 18 Nov
 2025 03:23:15 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 18 Nov 2025 03:23:15 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AI9NFhu4013704;
	Tue, 18 Nov 2025 03:23:15 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 0E172142E29; Tue, 18 Nov 2025 03:23:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511180100
Date: Tue, 18 Nov 2025 03:23:15 -0600
Message-ID: <20251118092315.3660561-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251118091328.3260970-1-lcpdbld@list.ti.com>
References: <20251118091328.3260970-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|BLAPR10MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: 20afa9e3-6ebb-4eec-da19-08de26841c5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OXWnHN+JYGGXo6ZA+YnWZjYsZRvgly2Q5AXY4K3pBJbXByOqfFPshfStsKzx?=
 =?us-ascii?Q?Rp1SvVFLI823Qu4c3RFB1N6KE0M1OEOYfqmCX0/8vD2A9SEUvfvRXuCvOtUs?=
 =?us-ascii?Q?HIw9G0OcFlM88uVu36oTFkJpMi24r409Q0GK3HrS2q8hm5Dm1TpuH2EAjwAs?=
 =?us-ascii?Q?lZAheEilONTLSDPdwF6Htj9a1Sq2W0mzaRpZ+R+OLR/2LSXoPUUo28NpJuAk?=
 =?us-ascii?Q?lIrWv/bOFk7trLn/2Zuq9LxSPaS8RyBtV4KVd5jHlfUfAcUEjHLU1Oja2ZCF?=
 =?us-ascii?Q?wuPfkmoh4379xrdWa7dJcynqwCr8MfGYnFU/qyOrApDDoXhSkP0v2nryETcE?=
 =?us-ascii?Q?YWdFUqsw6Tg76mRl+OeOmOHBrZa5kBurqW3hjR73+hRSN3TM4zbNUZEqmuuO?=
 =?us-ascii?Q?SRjXkx9ryzHothWlHwgtR9LQ9VuTtgJi78U2ULnFTS8CI4CW3ciV/YgEGOcH?=
 =?us-ascii?Q?XDBBOUX8lE2k34TSvFKfxH1KIB0YP7VKjhiHiSsiYLhtsLuL3UwVrr5q75ly?=
 =?us-ascii?Q?kdwApwzeU+RIQIZcZL5fUtQnmZVcZPL2JZnT5v/V5DK8URfivVfiq6kZFutC?=
 =?us-ascii?Q?eTown7BjJSU8i3vASe7crE5YNKav1meKcUuAxmwbwyQA6tTBg1iZ3ytSXOGL?=
 =?us-ascii?Q?xSeV3EBTkZIl0AKWYb/+QqkHQ6py6TPT4n/H7gZQW9rczp3Z56U2iYRjUlwR?=
 =?us-ascii?Q?rBYQMltZnE3DA9YJa6rSjCn3PJl/kyYIFKfG4X50Bp/MLOmMEwyzBpAS/zFB?=
 =?us-ascii?Q?jyslAHLspnl0s4k4ZRNh7o0nJxH4CIT4UqguBKASYtWZU0wtoviglWgBHIWS?=
 =?us-ascii?Q?9j8FhrwmBvt1U0QuJeyA1aNn3RiJWSzoRCAWRidhfPYoXuLadezJmEOkhrfy?=
 =?us-ascii?Q?10hCFJEp4Dj7x/A7lOYb5s2wG8hfOG4dyzrk2O7C4XJagRoMsdOMHWCWSgq/?=
 =?us-ascii?Q?76dc8Fji46HCRRg2aqhwTqzLdxyVdF98PuI+TQnBM45xPKJbuhsYoEi7SLBi?=
 =?us-ascii?Q?NOBoFXCgwpe/VFvPI60iKGMgMJAFjDf/gLEk9ECr9UkPPC9odrPGvCdpYBkA?=
 =?us-ascii?Q?a5o+lS3E2DqELT5FHMtXdnrsP86wEF20QE7mXWVXcahpixUBhsOK1ZAvn6Oo?=
 =?us-ascii?Q?LqKq8dvRas1HPsu7Q0pU8ANpyR92k4PJGlvZvNIzRuHsqkf3Q4BzrHTkey1g?=
 =?us-ascii?Q?wayziVaPsLJP5DxXRMaQcxSQTt9AYZtx4K78OCuXWrd843GYCMPe3WXQssMW?=
 =?us-ascii?Q?z4B9Qq+cTmYztB2otHCYxYfS/coGJ1BlCL2G8jqUQ7NJLW01yuBVTMWEKY4N?=
 =?us-ascii?Q?O1WYTgJ4sIhscKcy/y+EBQO4VGRJj6qiW4CgfQECZaAnI+cm4+yRcePFdZIH?=
 =?us-ascii?Q?ERA9cJEs7zPSFZ1/Pyi172hYKMNLeKNJEIaQd0Ace7WA9x94uSsOBn7rRL5N?=
 =?us-ascii?Q?s+8j/FBnAzwa860xi0VCBI7KoxYfNaDVF06bmTh05XoF8Lz+ZwmTXaJle2Fj?=
 =?us-ascii?Q?Z1cF4f+ZYoyzXfiiwtWoX2eo0J1EHd03ZvCWNNOvlyXlOCQsxi2OVmJx+ltC?=
 =?us-ascii?Q?mhT5P0RXg1zi0XiIoMo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 09:23:18.5174
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20afa9e3-6ebb-4eec-da19-08de26841c5b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4819
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Nov 2025 09:23:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19287

meta-ti / na / 20251118091328.3260970-1-lcpdbld

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
WARN - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202511180100
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merg=
er: cicd.master.202511180100. (COMMIT-MESSAGE-2)
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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202=
511180100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Tue, 18 Nov 2025 03:13:28 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 28436643a7ef5148ebc7193ced0ec0e22=
8cc2995

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 886e6a0587b1964665138f2173144f694d92c5c6

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




