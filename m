Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B79F33A6F
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 14:05:53 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44803.1772719546114352192
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 06:05:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=RQ38UheP;
 spf=pass (domain: list.ti.com, ip: 52.101.46.41, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K9NAL6Mtjh/9cNzMIcOK6qRVElHLouO7gNZ2T253Aq6j188uGddv1xKOYSS/NWOl9IvAYPidEle8BekSYNL4zX7/BkUPG2eYzDHqpUS+4eRhPY7Zfqu5hxr8VE9gmGn3hurDLF7BPGKEbI3uYMzM4yjwyyN4ZbBqUDlWt5iLJLJyv/jO94kZDHW8bOm6/MHIHC+wCZfALPncoDBINRxTD0kxnOrV/OHZnjRz+44wtJlpRiX0l6VPodMsJqJ9xnyLNarenBTgvUNqtXNld1ff0bhnFfXYAVCkML0y84dKd3g89Ms4xqDNbQtN6YtJSm57B2Z42a7CWIywIJG5k39ccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2WH0kxr8h6ZTMAK4gGFwsjEYQU7CpaJZs2HI3UIE3Og=;
 b=ZWoY4XAzvpltdqa1RN4+ZvlGVW4a8heSTgB4z+siG+tlo5T7JQWus3XbvDWRTDzxw6GLvXXpCImF0fQewgqFOxWqjldEIUGDB9UdOOkUjZesBLM/f/egVnapdUlgsrHdF8ob01NlJK1oxMItl/2BPJQX0Ih1HZIH6WNg9KEtvnnyGZMuAUNqKBw6q2wR++dRJVVk6zB+FYmkPWWTvZtP8pxxlSLxNVPN7IgkMiAgo595n+b88sv9ggY6xpgoYOF9BI0fkVukCT7aW4TaEndVJnFtGtMikqaty3/omDL4bTw9nC6kRlC775j9ztJNxNsyH4MLv6VYq3InFy06P15wHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2WH0kxr8h6ZTMAK4gGFwsjEYQU7CpaJZs2HI3UIE3Og=;
 b=RQ38UhePfkVFFurnAkTHuxik/CltLaXRHktb0wWFTyLgp4y5C+SNoFEHf2AkvTWhh/IgJFANYl9RkjZ6+jLXhmm+Lrk6DWU7qJdG+NNcVBh1pciC3RZAAFbiGixs5KLke1FZLRi7x/FU7tkqIV+yOvKSZWxz7UvaFekC3jxOO7ZMLsvTt0xHRj9oBTTmi31keSrURYdyamARFOJWscxgNd0PsAUKgOzTMtGAKK2rZcIMSui8t6ZoEj+xhKOpl7b1jObYLe/JPKRBkdBFIeK9WY1lfJc35bcLVWqun5DKO5kvf6eTJdjLcQAmsiVRlDTkZIGl+4bf+HDsciUb9JFFtg==
Received: from PH8PR02CA0011.namprd02.prod.outlook.com (2603:10b6:510:2d0::10)
 by PH8PR10MB6387.namprd10.prod.outlook.com (2603:10b6:510:1c2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 14:05:44 +0000
Received: from CY4PEPF0000EE31.namprd05.prod.outlook.com
 (2603:10b6:510:2d0:cafe::dd) by PH8PR02CA0011.outlook.office365.com
 (2603:10b6:510:2d0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Thu,
 5 Mar 2026 14:05:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EE31.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 14:05:43 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 08:05:42 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 08:05:42 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 08:05:42 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625E5gvl1836536;
	Thu, 5 Mar 2026 08:05:42 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9633F9ACF4; Thu,  5 Mar 2026 08:05:42 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603050509
Date: Thu, 5 Mar 2026 08:05:42 -0600
Message-ID: <20260305140542.206727-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260305140347.808953-1-lcpdbld@list.ti.com>
References: <20260305140347.808953-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE31:EE_|PH8PR10MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: 616cb863-6d45-4695-3a87-08de7ac04a45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|34020700016;
X-Microsoft-Antispam-Message-Info: 
	VoUgP5t59ujYmCA6Jcx6+2QXrjcG8ib/LYKELGoIP7YOjRfrZhIP54vSLNx7+RlDGJwnCUMWvlzP5aCxLDnKlpNHwnoXw05JgyJJgdPaDN7AhA3w9/jxqfKHaD91Av0YAsoj/3FE84Kwr/8x9xgFR8gvfcOdLSqhHPIFVy/BgHB4ImcbBzbjV+V2UCmPepf6EPZZ61QRCHXkPiGYB5nMqwU6J0xP59zJ67ASogH5RJsfxIE2EDxLbXwHaJ8znFvXdj20rfukCgCXrz7T/iAgu9B8nMHiW9YckLy/M7B3MY3LNtaDJdnCf2j7PfHI/Me6lAqdGHntla8qydvaRlwUzkx3mTisSFjoK7bjulb8xKIOAcWYaY39NjymLQjwlFTW3ImCBOZulenPxniYAZnamOD2OE6YOaoVocrFNJbT24dGbmIIbZbzzbOBmY4gHu0MU4vwvTGwTUJcXqX44gC1UXU9YPSWA+AkzJ9o5VkHXgAiBajGMXOaLGGUMPIHwrFYjsA0cf19OxTrvQkH9UG7in2Omiazn8YRN+DW8CvetTCF6nIdj4Sb339/gauUQldFtPUKdS2cjYqLBdcbr8scBQu3peysaYENn+Zbk+DUgZXoTAUimewqHOy2JsUFImFEXN81x9YER1zYAf1lOsgKIyvUZRJSZNKCRaxKG6lspoJHccS/CZHSvZXIT+Sct6fwGOud2C+N5u7M+f/4qrZJqpife7LGMoT2zR17KLv+5BwK3T8e9qZxr5Vhh84qZjtU6W/jz9WRWNhm2T2/P3fdrQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(34020700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	u5N+OjPud/mY1gayYQYQIPSVbD5sXdmbEuqow/2TsLnYIELYabQyKkRL/hLzaQDjqOiSNff+PngV1M6KLexsNLO0NnE6960rOlPPwSSvYzu7NLoARgGHGfruXiAR7fH+mCkx3PqHd3V5F5gLGCmJx8+zkmxre5Ab/mxC+eiETaJkbY+6gSxQruwIMK9nZf9X8nh9owYutwCSSn7NN2FXc/xvq7gw9yyVEg/QcF2LzU3wGgDRpctSBK5YMsUrTj99Xf/XdK7XgmY7KRzZquu9nimxKG4qW8OvjakZ7sx6FQ+RSGPWxDp5MHFQ65nFpag8KWBNCzcgEGhQSNZOO59sKjJgND0BtKn70Xpw4pGfHR7uomzcGmJUU9pxIQPnr1nDXzFpabKmLw2qQoJu8ylFdMohaOrZaBOOvdTwrJl4O3FJioHNw8WsxvNeSALnIWo2
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 14:05:43.0710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 616cb863-6d45-4695-3a87-08de7ac04a45
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE31.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6387
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 14:05:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19651

meta-ti / na / 20260305140347.808953-1-lcpdbld

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
603050509
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 5 Mar 2026 08:03:47 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9752d4f17718137b85dd066477a58ee17=
1a5b5af

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202603050509
- Commit SHA: de85a85c0c7534a95273447f90fcff70de01aa7b

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202603050509
    error: patch failed: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-ti.inc:10
    error: meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti=
.inc: patch does not apply
    error: patch failed: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_=
6.18.bb:22
    error: meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb: patch=
 does not apply
    Applying: CI/CD Auto-Merger: cicd.master.202603050509
    Patch failed at 0001 CI/CD Auto-Merger: cicd.master.202603050509




