Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82465CD6E6C
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 14:05:29 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24526.1763042720993434683
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Nov 2025 06:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=TZ2pPYd/;
 spf=pass (domain: list.ti.com, ip: 52.101.46.69, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w/a8/gE5FIzTRkHoizcjlGqcHB8SvHaD4C6iqPmhB/OUiWKIFNFaxSYVoDuWDI4vNLawsViq08WTfDdFdBcIZp9WHbu/rWlqb0x3vWNE/f1CDo6aTpdqm+u4S6yWWvfweEKvNayGZVeVCs+BxwTD3Idm5M7h0jarUgpq3BS3DwvJD09t2XesV/LmgiqqqTESOjGSMhkRhPTJDx0tc/7IiLndoTmGhtgJzR5B4DcNBNSu9cIv05ils71YOUNHVpN4KdSx4cM6vdcggjIaMFfthwXF2+TxJ0uVl2Gbq3MALqLfmsvEo1IuBK4fEp1H7IFrCok+ByPjiLTSlcqel4C8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxyxJRFdi6n2iCgztbeftXmGyibsPPTvwQtLYI/PpxM=;
 b=sFynORm2n6Ie5cP36UWBvPyiItXvXLaJAaarBB0T0NAFXLPFIVi+JRPIeHWy3DfaiiQQEJUThEDeoZpzM4Tc0SUvJ911jd7euTzfK4sO/IDnpfW5VfNwwTIMQJcWXenc0AeoITS0koWCa2LeJmHUBVKTbFPYipRRgWcYxjgIkWrW/NIZRxt9XaoK1/mxLQCy56xLJnbN4B4AzWJhNK8LkCsPg1e7AKqrT9RXDqs5phnNFdkPymdW+kgTuvdYHYX247YI9m33HyioKuFzJJHzbKutLC+JOYz29rdxChVmmOAi4TjMqAdcoWkRYgdJK2fvN1POdIMW+IpIMN77oQdMfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QxyxJRFdi6n2iCgztbeftXmGyibsPPTvwQtLYI/PpxM=;
 b=TZ2pPYd/d0yeW6ixu0Eiec5VVg1+cwlUsJUPV3sKMhH97bV4QDX69zsfHhgPrDknpCt6XxmBNKiyqYUfW4t2Sr9XZJcs8Ls82GZbR/7hTXk2L7Cx3R5wPDEl0jYKP9Rd9dQsZ9yco6HIjhQtm2YkFAdpaLKPHPnF3E3v2iYeWxPc+jn5auxjqJpslsBKe10uQv328TjJHDwhK+IYDW8jydjSARDoST3ufggAlRCG3GUSzew/IOIqwoh/1zeHQcjwCE9L/0QL+XE/HD9KE5Ma753z2CUISNvp02ZO39n7H7qrXyFRP+jrRN74txImuWrNoAyfRHige9eEYf126F6Bnw==
Received: from MN0PR05CA0011.namprd05.prod.outlook.com (2603:10b6:208:52c::17)
 by SJ0PR10MB4592.namprd10.prod.outlook.com (2603:10b6:a03:2d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 14:05:17 +0000
Received: from BL02EPF0001A0F9.namprd03.prod.outlook.com
 (2603:10b6:208:52c:cafe::ba) by MN0PR05CA0011.outlook.office365.com
 (2603:10b6:208:52c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Thu,
 13 Nov 2025 14:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF0001A0F9.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 14:05:17 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 08:05:13 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 13 Nov
 2025 08:05:13 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 13 Nov 2025 08:05:13 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ADE5Dmd3964882;
	Thu, 13 Nov 2025 08:05:13 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2AB019ACF4; Thu, 13 Nov 2025 08:05:13 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Hari Nagalla <hnagalla@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <nsaulnier@ti.com>,
	<b-padhi@ti.com>
Subject: Re: [master/scarthgap v3] ipc: ti-rpmsg-char: Update library to 0.6.10
Date: Thu, 13 Nov 2025 08:05:13 -0600
Message-ID: <20251113140513.1640461-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251113140155.20419-1-hnagalla@ti.com>
References: <20251113140155.20419-1-hnagalla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0F9:EE_|SJ0PR10MB4592:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c5969cd-fd3d-48fd-d5c4-08de22bdaca4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DrKNIgtSrTiwQttTtb5QY3C6JFVZfnAdcdXt5p15YWctnLoaTl5QVHaRlGWZ?=
 =?us-ascii?Q?RGcqEDziRbXnsVd/uYOrNMImB+M1Ul7oxNi0ORP4aeNESrSehpL3dThq4AtX?=
 =?us-ascii?Q?SOdzvVaCcZp4wW+BzdaVEWKNLErkmxfeiy8vVTWRlZgdliAIV+clsEdONit0?=
 =?us-ascii?Q?3CR7DNAqiRoaYqcS8MGjGr+ddHFPGnEkFgija1yNo0CHm9jmsn/1xyAqZtG/?=
 =?us-ascii?Q?y1u7RYsxUZvLuOzFxl08OercB1nHiW0Z9lz/D/tCp8mojyM/fjB19zozYQNA?=
 =?us-ascii?Q?52FJOhvtq88Y2RR11HCzR2rpSkPHqR36TL7jT8Mc9FAYij9E/PZr0ytiujpV?=
 =?us-ascii?Q?H7YhLwqqfYVCCn/aCGsjN3uB9vgvvCoDrILH/E+UCvjw36Z4Jd+D2Q10HwAA?=
 =?us-ascii?Q?FU/M4mTBo6SZbS7sBMrQpOARw0qOsab8D2DOU68gzw1/AyNiIKlz4wyE1zbv?=
 =?us-ascii?Q?TplzDsZusgYKqhBKESvw3mA1QlXfW1AeUWjD9Fts/AjcnEndzdPycQJVk/2R?=
 =?us-ascii?Q?z5menSvN1oPR5OwAnAPzjarrSPBiwPc3cgW85iPq2n/6BvctpSSc/5xjiifR?=
 =?us-ascii?Q?9+TvJ5iB66eSqOk1yf0YFDd37xBHv4FaYHeUsdIPx3uEFDCzgldLBjfofM6b?=
 =?us-ascii?Q?OnN5kob97fq2bEQdrqQpzR9zvwre9q6N5HE1+Ob1ov2elGE383wNUwOvKAOW?=
 =?us-ascii?Q?1vkYHdGc2VZctFHnJ9FzuKGpip1ZUGIVl4DGL3gu2CTrZe+vv7iy5+W42Jyi?=
 =?us-ascii?Q?PR1uG9GmocwLtXpo77Cdp2wIWqAUaLA491pbO8d/NCNVJtSXlw2OsFgAhCtq?=
 =?us-ascii?Q?Dj5PtK5Lmua4PSLsSCjtvD7iSTulVLvYBBiOaGsKMtYwaNwxeH8kLvpsQ+Er?=
 =?us-ascii?Q?YjTjQAZddzdy1XfXvCCH6mt8aLXFd8fQvGPyTUHaInVO8ZFFUtlOtdqYZOpC?=
 =?us-ascii?Q?3jvZGnMFc5PIoeGM6XaELDxBTNO1Ndz9A4sf/lXeKE7mhwTxpJWzAXFvCiCG?=
 =?us-ascii?Q?Am4S05KA5Cmo8eqde94jxkRfuBaXmtATCRP8skD7Z7CqAQWB2VvapTRqIitj?=
 =?us-ascii?Q?k3Ad3zsH0b5FmRtxO2siqg9ySGNB7rzhT9UMqJ+EEglXtQg7K/N+DRZpHx9s?=
 =?us-ascii?Q?4+7v68IWQKxxaa4BDDYieicI6hDygs7ZSfKp0DlkCtbFlG1OrtuoeFwHuEde?=
 =?us-ascii?Q?pbtD9m0MBG+bOnMCPdYqaSbvpTh/tjaOClGs29uAUIrQRZWgjMfkkK06a0lT?=
 =?us-ascii?Q?B99Gyj8Tb3frugF6jRUsxEJx/g8shJbS1IkFdEKLQg9jFqE9wuqflRlelvWW?=
 =?us-ascii?Q?tj7V83gaJpKoeq6LQwKxUH668IV97jq2HnfE5d123LVcJhnI7xps5N4q4pgK?=
 =?us-ascii?Q?dolDFf4M0BKr5MHkAPlTF8aRSDywZwRHtxGnZqPtXxm1B/cMagYJHXl7XPjh?=
 =?us-ascii?Q?fUqJucqwXaYImcwWtyv4jXL4nt5xds5LCqE6lpH6jWI7K2B6LJz39eMvVfgj?=
 =?us-ascii?Q?6xo7lzhub5uauwhSrm8N8l389UIP04nTp3dU/I+ysPlx6AbCiAhYhPvlPMCL?=
 =?us-ascii?Q?ez2z5y5JzlDmOXY+PGo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 14:05:17.2559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c5969cd-fd3d-48fd-d5c4-08de22bdaca4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A0F9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4592
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Nov 2025 14:05:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19271

meta-ti / na / 20251113140155.20419-1-hnagalla

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
WARN - [master/scarthgap v3] ipc: ti-rpmsg-char: Update library to 0.6.10
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:68
            Subject: [master/scarthgap v3] ipc: ti-rpmsg-char: Update libra=
ry to 0.6.10
   =20
    WARN: Commit message should not include directory path to recipe: ipc: =
ti-rpmsg-char: Update library to 0.6.10.
              ipc: (COMMIT-MESSAGE-3)
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
- Patch Series: [master/scarthgap v3] ipc: ti-rpmsg-char: Update library to=
 0.6.10
- Submitter: From: Hari Nagalla <hnagalla@ti.com>
- Date: Date: Thu, 13 Nov 2025 08:01:55 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c8de52b3e22fca6e0dedbf62497631d82=
05f043f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Anurag Dutta <a-dutta@ti.com>
- Commit Subject: conf: machine: j722s: Fix overlay name in KERNEL_DEVICETR=
EE_PREFIX
- Commit SHA: 8dbd05aa6098282577208ec7c6766d42d700a2ca

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




