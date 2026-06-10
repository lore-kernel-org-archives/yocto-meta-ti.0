Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C6BCD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 23:33:01 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com (DM5PR21CU001.outbound.protection.outlook.com [52.101.62.60])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34116.1781134376572887137
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 16:32:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fQjesxov;
 spf=pass (domain: ti.com, ip: 52.101.62.60, mailfrom: a-christidis@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H5gYNum+zYhsS1NqDJz0tdRM0fCk1xrR0HCshEFclgm5/iQra3wY8B8bdZroeMKc04owzPaJf0g2dMvg3FFPo/oaK1KAxT5VAWcBuV6oKVqaEnssOmB/xnnM+JNWvMjgzGplU3xNi3R2siaFRhyuaB1hhxx9chUw2I3GORs/fkzooVr4ZHSv4bPqL9uBf1QegBL6Bzvzh4kkkEjMKcVjgY/QBpjBNxMI8BpsrloJ2hQYzAqPujmrki0F1ceqhIBaFHrAOxNkC84wIvETMZoOK3xXoo+tRiwclDw5K7v1StRgGBg/67rBrz+vxmJrF7AS7ZvVtBOrCunp9hx5q0Wsfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6HUu224Ba03shop0cXtS3hhXIsoA14x8DGc/WUtlQE=;
 b=u0srOY5rp0wMKxVsh/FudYjy0UzFb5uFq3/9uIYtT7cUv3VO+Xz39FyVARCB3ZIppeaR8gEk64ItaQklSEZe/VAaqJ8bDO28a5MTgOmFXznORAeNqvXzmr4Lps/y9wCUbC70eiDZi+hIhxuAbbP+PF1Ax8nnvEqFcihj8eutF1GbMQT/6Q2m6hQsO4ctgiGOw/t3OAlWykd213sgE9+M4fTSE/i7dS0ErE3UbI4vOHhfJPSfIqq2SQBdPDgXLfYa89SxfhVZgUVruPG8LnKy3hxAI/I3rIBBw7vxjQA2HNv/kw78CZrLrKO1c1UcUi09aZWNO8mo2Hf2KuYbFtOamg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6HUu224Ba03shop0cXtS3hhXIsoA14x8DGc/WUtlQE=;
 b=fQjesxovrFAJPXLucuDDUhWAz525s52w9OdcteRrtK2kl94ntubYPVG7gQsdmiJ/Ijz9NFLN2lUm2rtSYNKY9eJPuf8v+kpzC361t0jQ8cHZ01iLP7X6MjauWGxq5gXxyTa7YxIef3MeANWn7Zo/wMtfku3KqLB5dOR6yCjEXo0=
Received: from MN2PR08CA0012.namprd08.prod.outlook.com (2603:10b6:208:239::17)
 by CH3PR10MB7561.namprd10.prod.outlook.com (2603:10b6:610:178::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 23:32:33 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:208:239:cafe::16) by MN2PR08CA0012.outlook.office365.com
 (2603:10b6:208:239::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.12 via Frontend Transport; Wed,
 10 Jun 2026 23:32:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 23:32:31 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 18:32:27 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 18:32:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 18:32:27 -0500
Received: from [128.247.81.216] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.216])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65ANWRa8106534;
	Wed, 10 Jun 2026 18:32:27 -0500
Message-ID: <61d26bbf-d344-4bc8-a154-101324478bdc@ti.com>
Date: Wed, 10 Jun 2026 18:32:27 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][wrynose/master][PATCH V2] mesa-pvr: Migration from
 v24.0.1 -> v25.2.8
To: Ryan Eatmon <reatmon@ti.com>
CC: <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260610225153.154945-1-a-christidis@ti.com>
 <20260610225547.1343744-1-prc@list.ti.com>
 <a84f838d-55a1-4bb0-8f98-acec3ceaa771@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <a84f838d-55a1-4bb0-8f98-acec3ceaa771@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|CH3PR10MB7561:EE_
X-MS-Office365-Filtering-Correlation-Id: b02aeff7-723d-4288-7d96-08dec7488afb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|22082099003|18002099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: 
	mEUZA3p29j+OK0WpYA7DSa+xDnnSdykpEidT/9Kn+KRd4ShPUgBdJHErD9tLxxXfDjkGb1G49uNGQ4OeV8Scq1rBNfek9ZxSkMmeCXEczjjcKl+3aSoGhH0K1AuRCEPLv8zxOCo0U2a1Ex/F+i1yWaezy/GTMTPwNVxUs8ppa7wyeVACGLczc6iX0Yf/peGTJIDS+btPk4DpWA+OEo3XrrLLmA4qIe+Xk6NzUoSjLCT4qQYdm7VW4MDPF8I66GVxWUxCIegLOHPrr1H+UJGR5IAGbA/m7fYxuhsvB+VK68XJkqIEeUTQsdwq/2euL+c7gxWF+V2UI8rF3jPidUGJ17c3srVkv7fbI4Qg1nZtEJ6DM/RHJiUYAytPCx5oynzcGU1XkNbGml0ilzF7AAa5ybkIDUag62R8uXctUj2qmpl9eNEo1/sbPL2Cz24DOZfnBcwEp9iRrvCDfzNrIUgFxL10CotMrg0R17SOtwoPif1o/UpJgZbzaeac+PWFBXcJ1Zu5kCU5bZ02LDRKMCrbBLqR2N3GQR6133e8aVYD67QRgMlFpC5OOUOjIOFVgG37V3njzeQnikoTCAZUFIvfm3rt76AQaScgu28C0dy+bOuuA7APTc/IpkJ58T0f8tXja4KId48ho0boz/6GvxQVBmfYXsWnEEtlxbbxQd0lqVErR86OLBcw1v0E4MjLbZ9qmnY/a/61rG3tQL6L5PeojtpBHp8DsISnVysX42+zUSw=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(22082099003)(18002099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b/zjQwyGBPeP6gsVSpqb+FXVhoQfibI5LZZew1Vsg3TvBhCd7zlJnEx1f7D47lgukXl+z7yFZK9qXYLIgSV1s/QxrjZaWXDJN4sWr6v/fKI/BSqiYozS64RxW++F9TYNf5zEHBusqd2gj7//0McZ62trsjKQSSkci+N3Nhcr+Txi1bVAKOSPH3K/0L2DnovmNvyn4M2nfYBBsXJRVaWlel2VjjkUNHTMW+XFmarppW/kDIO/z3icwJbA22lVGIFgJJo4GChyeEAYVwu76ktPLHF+aKUAnnpDiLQrsHjodLyE9ARoGhpPkKlwItxnX3zuflMoU0GtjEX0xvfce3P3jgeVH8+p+QmD/bSbZXqdaMScm3ymsK73SwS6GKooE290SuRwBV38RvA0p9mvh6r0cn3KJknuIRxnPqxscx5Rf3z0QgYM1BQ8oemVYWquD/Gt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 23:32:31.5241
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b02aeff7-723d-4288-7d96-08dec7488afb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7561
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 23:33:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20017

Dear Ryan,


On 6/10/26 6:28 PM, Ryan Eatmon wrote:
> You need to also update the meta-ti/check_yocto_rules.json file since=20
> you renamed the file that we were looking for.=C2=A0 That will help clear=
=20
> up these warnings if you did that as part of this patch.


Noted. Let me know if this is all the feedback on the patch, then I'll=20
send a v3.


Kind Regards,

Antonios


