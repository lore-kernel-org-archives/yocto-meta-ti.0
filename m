Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3F52CCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 05:00:34 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.19])
 by mx.groups.io with SMTP id smtpd.web11.1096.1761714026364160670
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 22:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=agAoHRHO;
 spf=pass (domain: list.ti.com, ip: 52.101.193.19, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pbqF9StzYeqbFKyPV/upYZ0KL4+alOKChBdorDwErX+gfuKmcvz3TRf/H9GY/cCsfxdWLm6C2+VJ9pXVMbKz7AHSPZ2QQLC3pQ1j5Yy4GfBUnRawp0y6pnyEW+vSipiohc3Spk4GpJ+E3dBzs0J/GrRWjJDY1ntSKVcfJTAY4oRObr/Pe9yNPdIb66hloUcR9d5nAie4Pmzpj4wiPXYFC43G8gYKduIqXjxFVI4HALoA4C342BEQgzJNhsfMYC/FPq1r6lD7b8vQ9+hH3/qdi8l0lt1v3wSWIhA0UjZcZWrArrrLCFvjOAF9oyFwm4w0sCV9VxSruxvjJdVo2QPtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Yvowdtac2sc0NHlZVcJoc8z23bUAjE9AxKb2jZX6ug=;
 b=Jnscy52zGLKOCTDs0YbfYwF0Ng8VmeOT9kxoamA49ObxqUulhA3niY8APIN6JOFJ0SFLiCH71UKMbknqvbfLm5kYt9inqLbgjd2XoL8A2Cugd/fhqyvOCG+J6ea43DCfTyZEkeRftUyvLqM6rrKeaTQSLjIxhMbAVpRZ9Wew3xNgVRFSY61SkswJJTrpxY5MTI6BIct5VJey9aKCyRipSLf413dF69HhYn9sJBHUKTwDOEtkVrhLacIm8ijobMb83fO73hgV2WsrBaDQbYpEgiTLNhT6qKHu9GG/WHfNQfvczVRSmWZjOKuiDJXufF+5CV4HZpaxy1jYj8yPNH6LNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Yvowdtac2sc0NHlZVcJoc8z23bUAjE9AxKb2jZX6ug=;
 b=agAoHRHOv/DSRlbPznDqpolfVFSBzo11b3DLZAUIZTJrWM6LVffKXJYo2UbIflgsIYLc6kz8cBWHIdW+Fs4pk5bkdjHKdmDE7hjPByf52wlzKwNTttHsBk2beXqW4Yv4sVDOB0UU9bW09SdVuXCJmb1e6+H/PrudjD8rwz2TyH5HqIUZYYyL8MrB8msYiXp8t1RO0cpmHJjejwpdJ6X8DpEOWMaOwDaHHexgcSW1jhkdAyNFb4drgUZjA/Y43ulxrD6KizFmBXflZQVxI6Phr2HXwAGMz35tD8yQCNM3ZclN8iwiNqnxIg9zUwXGF+Qjs4bnBRuSDfU5z5zNTW/qDw==
Received: from PH8PR07CA0045.namprd07.prod.outlook.com (2603:10b6:510:2cf::14)
 by PH7PR10MB7086.namprd10.prod.outlook.com (2603:10b6:510:269::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 05:00:22 +0000
Received: from CY4PEPF0000EE3D.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::c7) by PH8PR07CA0045.outlook.office365.com
 (2603:10b6:510:2cf::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 05:00:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EE3D.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 05:00:21 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:00:18 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 00:00:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 29 Oct 2025 00:00:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T50IgV3454267;
	Wed, 29 Oct 2025 00:00:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6B56A13F52E; Wed, 29 Oct 2025 00:00:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Vishnu Singh <v-singh1@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denis@denix.org>
Subject: Re: [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
Date: Wed, 29 Oct 2025 00:00:18 -0500
Message-ID: <20251029050018.1934443-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251029045922.1528945-1-v-singh1@ti.com>
References: <20251029045922.1528945-1-v-singh1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3D:EE_|PH7PR10MB7086:EE_
X-MS-Office365-Filtering-Correlation-Id: e324f17f-8084-40e2-453b-08de16a81069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pwxIRQ0hDQvH+CDrDHzztUnRRxXPuGi8fVJIXZuzU02VXv0/JEPUArl430DZ?=
 =?us-ascii?Q?xYhLOs8f36P1QmKu7wxV+XdeUsBe8MxdVlBCDaERsi+UlUOki4UR4IlAt1jy?=
 =?us-ascii?Q?ptl8lrlWRsA4GIDBrvuEWqIO/x6SksMXklbj9cuRz2bcze6HejIwIr6wD9AW?=
 =?us-ascii?Q?xAo3dBnnQpMh4YGXInLNINxiAwjPFCJwMq2wb6oyZc/eGalj5KD/NEvqBkyh?=
 =?us-ascii?Q?IzfpuZshARQEli2HuNppTwLNu7vNwwwGgXh39bMA1miLguF5EvKyClWZ2SPD?=
 =?us-ascii?Q?0W2BSz+qnYQtJ7ycqhq+Vt1yLHT4QLmSTFk5XI09NS307NmO8bYBlMHOkEzs?=
 =?us-ascii?Q?Lo5FAApQGSavG5X749cuWR7HCxW3vCJ5gFnLkeATHXJNTFSLaVzMwCHVnOyZ?=
 =?us-ascii?Q?jJs6RQE+yO3iq6iuNHV/1ABQCIaayDSwE70b5ljSdpqmXNpdKiMZjJOrw85r?=
 =?us-ascii?Q?Ft3vp9H/KKb0GPZtcx7SRd0TxipHvfMkkyR6azParVK3N8GmQjosgPMysHHU?=
 =?us-ascii?Q?jj0o2pHtoK+0AcH+WKeHyFurL7btdXqlmrZ3SFxGD1vjM0tF0IVMPL1/G1vk?=
 =?us-ascii?Q?Kz8XpaC3YNQ8A97pykmyLgI1B76UPdpapEa19MDdeYF3F/5AvE4+fpOSFLKt?=
 =?us-ascii?Q?wj9lJbdA0cVoDWVBTcSgx324ZmPs/CknH6BjwCDpebITLx3Mc+UBnKgjmREV?=
 =?us-ascii?Q?56g7TKXMzZJLZWq7Cc01nLyu+UTPdJHcLVDdzLIUJ6O4essFHXgjx6aDitC+?=
 =?us-ascii?Q?G8zO/ObGD6cBGuZsEdbbMPyyyJUvcC8Mi/t9ySdhoOC2bHQvxatbViLtblj4?=
 =?us-ascii?Q?r3sJlmXQBHnpns+9erVPt0/fZ8gGrvS5QTpK6BkZMr0C1wh+IA2ErXIhFcDz?=
 =?us-ascii?Q?WXsPl9k7EkKJnuSokvHuqdEcjiJ/l8CnwUDvSH3jx2hzv1z1SZ4utCs8ioR3?=
 =?us-ascii?Q?BzQV8o3jCXfmVdP8nMAJ3qW2Pm3B2sVvTVvjDqNgRbjqPZ6Ab+zwY0tw7AJ4?=
 =?us-ascii?Q?jB88vjb1tz/Xt11+v4roJQDWGRQ1WXjLvhGk/djTC2VqHGG3RAz+8xfiJLv2?=
 =?us-ascii?Q?LKCR+iIB2dtbmobvrkpu6JKPlTkyHr8XTy6WOAF6BMQuFhtePV/Y0mKsGQkL?=
 =?us-ascii?Q?G3/zeYD8WboYDLeBAdPsvmiLSvJl+FSJZ01RpesBiyhpssiCZacK3eXOwdZS?=
 =?us-ascii?Q?LwXBG+kz7H1owiMahHoJlWg73NNDQkD/w4GQX4XHvjORB3xCytZIDUXGEeqN?=
 =?us-ascii?Q?WtNHSJu2Kr1eRsdYOODMiML1Z5jGH/rpyOGCzSiK5ni2KllTAY9cdGgjopf5?=
 =?us-ascii?Q?WuOwjtRALWzyv3kNxQwaoAbp7LZyVq3L7Td9t63iSizB3HomNUDV7/AYf5PV?=
 =?us-ascii?Q?hpGNh3zJoBLyXb9PSB6Mzeysnz3RZxVVYx+B2KRiWQ//fWThLDuOx8ShSju/?=
 =?us-ascii?Q?XGqjY0nx1scSTUpi1VZYWpykRvI+EDoqFCRwNrw1hWp1zHSPn46pdfjn8gNw?=
 =?us-ascii?Q?ugYZ6El8LtlLed3TZeR3o//uXcHHquldpNYWfLSbFzh3cq+UL8XGYCkZ7QZ6?=
 =?us-ascii?Q?tDx1N65Aslexvok2V6Q=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 05:00:21.8599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e324f17f-8084-40e2-453b-08de16a81069
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7086
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 05:00:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19194

meta-ti / na / 20251029045922.1528945-1-v-singh1

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
WARN - [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:66
            Subject: [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV=
 & LICENSE



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
- Patch Series: [PATCH] ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LI=
CENSE
- Submitter: From: vishnu singh <v-singh1@ti.com>
From: Vishnu Singh <v-singh1@ti.com>
- Date: Date: Wed, 29 Oct 2025 10:29:22 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a07034dc1bc202b2bb1a9984d71481523=
1ad2776

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: j784s4: Add k3_bist tie-test-builds config
- Commit SHA: 91a018116239c12c5d57da646fbcfd6f4af12c2b

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




