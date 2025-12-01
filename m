Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55338D116F1
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 10:15:29 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18711.1764584124830022094
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 02:15:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=hhcaLvmn;
 spf=pass (domain: list.ti.com, ip: 52.101.46.50, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PLxdjX+gtzAhq+Y1YdS73YoW6vUX42P4olhbgfOViHO9eBS5/oV9kZnfwLiF2HzoadxtIN1PqR4Vsoc5troQW1WvWsx6CDVok3jBAXMdrR2BoyJ/8O3wRV9/mdphlW+LXuc/i2jyDXtyBB21YTjCcaRLq+vmEdcUQg/rTaCQW3qNeSgC/BpILk726rQrcplNnmVMeDT1dZDJGI2HBPP0A2CgQmk/6UQT0BBNsWJFmtUeIxmOMjNzAXHsvtP36g1RQfRAP/5L7LR/Ch2/acbxjlAcEqGzTSpKttNkXQaHcIJDvOQEcvSVScqM1mRzw17qawFIUmUEQ1ca3AURN0W1sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1fNUsd1dfR79La/2Ihb3RpMusOSs30x1VeJgem+gzaA=;
 b=fqwevxIu/KvigBkiLrYHGHFeL8MuO7dNmrd8c/u1W3RIN9nm1H47OF6VhuzMOcAQqdEpo/iit96v+Z+GwbF8R2smWkQQ3MpGx2lBAAiw0r6X4m9DSrY1WQod257bVhOVxtTlHeTnxB/7oqWbo2beelG5X/aPjcQ84jTz1RyVGBYIpcTG6wPOIPsr4Q/JzZtJRYQOwpdL+nKENcQrwDx/2U8I+ypW+m4Iqs2cxWbICrULHVVmgepBv7SDrKoA/qoQMbRLtOtAT7IxKinjJme3VSo9kOPUggI/nS7QYwNNPJRwHcJxHMgESeyQR9tPBVWpLzm7r0pSulpI5Wl9iCPxaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1fNUsd1dfR79La/2Ihb3RpMusOSs30x1VeJgem+gzaA=;
 b=hhcaLvmnJRbL5nw5yCIsibrx1IklS+0ez4okSV4ST/PHDFbkfaE4vCxVeQRUrEDESiY/9YBuxBBfpQS6AFiUL2EntQd4x/A4R/M4EZoRqdf9R583aHEnnLu3C/uPU05k75mlQvi79qZrbH/LMR4mqzsRRkV5KoqTf2mWyKjQ14/BYpJSP8t6x02G+2veasrQp9vvrrxlDvH8OLaVhrXT/gwqcGCcP5M/Zy/nNQ04tb6ceJUttwqkUrq/9rvSsuMTD3RYzCcBMrne11F6GmDnTbvl82+prVUcvseVtvkSWP6gsn/ZjREEHd2Vn80nADGoVzk9yVUKZcqNPotnee/RGA==
Received: from CH0PR04CA0094.namprd04.prod.outlook.com (2603:10b6:610:75::9)
 by SJ0PR10MB4495.namprd10.prod.outlook.com (2603:10b6:a03:2d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 10:15:22 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:75:cafe::7b) by CH0PR04CA0094.outlook.office365.com
 (2603:10b6:610:75::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 10:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 10:15:21 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:15:20 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 04:15:20 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 1 Dec 2025 04:15:20 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B1AFKZl792789;
	Mon, 1 Dec 2025 04:15:20 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 0E4F19ACF4; Mon,  1 Dec 2025 04:15:20 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <vigneshr@ti.com>, <reatmon@ti.com>,
	<a-limaye@ti.com>, <gehariprasath@ti.com>, <praneeth@ti.com>, <jm@ti.com>,
	<denys@konsulko.com>
Subject: Re: [master][PATCH] meta-ti-bsp: include: am62axx.inc: Add TPS6594 regulator and core modules to initramfs image
Date: Mon, 1 Dec 2025 04:15:20 -0600
Message-ID: <20251201101520.2485325-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251201100941.95152-1-m-shah@ti.com>
References: <20251201100941.95152-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SJ0PR10MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: f34e2f69-3329-4f3a-a057-08de30c288f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|61400799027|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?L4p+/GeWd3ULlVv2xPsxH10ev3xO8pkt8MrTUqRMB5hedQrcUA0Gd4R38vNQ?=
 =?us-ascii?Q?6QfS0ifhoXG6FDSeGVX/idtdNgFzwwPqgD2Pr22pFUk2Aptgdxz7lbWzF0sW?=
 =?us-ascii?Q?QiJFRqPwEcVmXA4qOFV6F1i1B3muT5ji2wIeC1X1fd4PlnmQy6Am8DiG93oU?=
 =?us-ascii?Q?+R38e45DZLgPS9KlZUKQCqHzvNAiC/yZq1ZYBUksMmWTYV29/1T+VF7xDMlS?=
 =?us-ascii?Q?KC/gk4lTNROM2al+ZlKmOdJ3D1qbHu9JNQbedcEORjytIbwusJPpjtR1UG4C?=
 =?us-ascii?Q?67CX2aMUUeGiocT2Gb0oXNv3VgPPJzMGofn2pzq+LKZwhD/ocgyfxD8QP3yH?=
 =?us-ascii?Q?gNkY5RNhGr4H6udDTCXf4TdMQah5cpeAUrY8f0mMszyGsxkAn57fVAv4ExF7?=
 =?us-ascii?Q?R/30cRufYSC3VFTu6J7iNx33i8cFGMDePKCq01Qi6p5UL1CSXdbBPGGSfrvf?=
 =?us-ascii?Q?bUoSxEa5ni3ErVHGpYzRDoTDYu5QfLgkWSqE/xkRcyBXjd1A2Wewy9WJCiEH?=
 =?us-ascii?Q?EYvi+Q8LdQcTN3qhx7Tad44oQq11yMUd0RLdz/wNIW5gPyiQ4shEPUk6j5n4?=
 =?us-ascii?Q?vGgvjCLIin4uoHGQk3xRo9F9N1/RiRu/VraOD4G43x7U+0ly8JmJYqvZRKhK?=
 =?us-ascii?Q?y4zAnn5efBzDZoE+3/SJA8idv07pxona6EGbZw77FWrO4xczfmVs23BPjf+T?=
 =?us-ascii?Q?mRwKfHKf1l6jhxy7+peiUHE9f9IcDQIwzLeANDAXrk9ME2gpZW521mTTo2ma?=
 =?us-ascii?Q?84tfrDnZJxR6jHMd1mLHxlTPZqJDrWW9ztqcyrPp6xXl06SYNM0tu8X4Mqhb?=
 =?us-ascii?Q?Mlv6kOkhvXs6oPI2wE89rXaH95g2RAmety8aVm3ax5JgzrfdG+OPpXtrzmLV?=
 =?us-ascii?Q?0OE585qwhenkL+zzN+xxISxv/P5dbS1MraqGx/98wXzImJJpNsRUUE0JqNQ8?=
 =?us-ascii?Q?C0EUK+tvcA9aHdaYk9kHpODk5OgrCRKw9X1MUQ/bJSK9Q9oFNPh0RWPQyH7F?=
 =?us-ascii?Q?C/ECA6yRdaT/EXKxUZ+vpICSm+EApRDRhtm7u5lkfZJ7kMddyekCDRnJ4XU6?=
 =?us-ascii?Q?vJIH1aqSY4jAFDjgaNBLcJ7ZF+isIyIpRJr3wuZurZ5wkLHWxK77LamLlJG5?=
 =?us-ascii?Q?X2qiqfyPKtP0OKghX1QYtTSQ5gdI1OnwmyA6tJQkhTJ5UC31S+r2JoAHRVCt?=
 =?us-ascii?Q?v2hbGn3aq83Sxn1tLb9fa04VoUF9bK28J0KLSXUzJpECScVkUOYPWSskpsbp?=
 =?us-ascii?Q?Px3z7ltYhC5S5pHinnYJysXvxPRlY2REjpOKiY1gb42vVOLqDLa/ACuObSWL?=
 =?us-ascii?Q?JHoe9g/Rs0xKXAKB/gKNl/z0zGmTDzQCjqUNSTSEzFIWSKd6932YPTiKLGBq?=
 =?us-ascii?Q?KF/VmTi6TPXO7mhOczFZafoV9xnS37/78tbma3YN+9PLdlsFS9Az1wRj3Gqy?=
 =?us-ascii?Q?SDNEuIfq6BGnP0YzqMTJb1o2B+c6cs8RtzrofrO+gSJ3uyhQUL/FmbDKdgkH?=
 =?us-ascii?Q?8ZWrSPMqDpiTGNb4+56spL/aSBau0r9Jbs8rkcEQKlOhDu4jCQwD0zetjBWM?=
 =?us-ascii?Q?5+arnj6EXOIlSHa0Mv0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 10:15:21.1931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f34e2f69-3329-4f3a-a057-08de30c288f7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4495
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 Dec 2025 10:15:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19309

meta-ti / na / 20251201100941.95152-1-m-shah

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
FAIL - [master][PATCH] meta-ti-bsp: include: am62axx.inc: Add TPS6594 regul=
ator and core modules to initramfs image
    ERROR: Commit message too long (> 80 chars): meta-ti-bsp: include: am62=
axx.inc: Add TPS6594 regulator and core modules to initramfs image. (COMMIT=
-MESSAGE-1)
        patch:68
            Subject: [master][PATCH] meta-ti-bsp: include: am62axx.inc: Add=
 TPS6594 regulator and core modules to initramfs image
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: include: am62axx.inc: Add TPS6594 regulator and core modules to ini=
tramfs image.
              meta-ti-bsp
              include (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887




