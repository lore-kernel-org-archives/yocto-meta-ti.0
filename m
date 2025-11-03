Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5D55CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 05:45:37 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com (PH0PR06CU001.outbound.protection.outlook.com [40.107.208.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14481.1762148728973840466
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 02 Nov 2025 21:45:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=n3GDGA5S;
 spf=pass (domain: list.ti.com, ip: 40.107.208.6, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBrOh1mterSkBCXAW98u6Qh80Jw8Oj6Yjd6rp7O6sdTV0NGCt4ZFXL+BRYUfaFiqry6msEMfGPFIwwARGdXWlWxHe0wSlAAm0S+7/lw2xBG7ZyF3Cepryjk9j/eR7AtLPRVKepvfYR9MgY1FqWHLgQjXC0pWl8ePmkrqO3UwYhK6yRbjWnFoav1+WUh/v/Uj4FgLuPYuN1VQ69AX2kAI/EuiG+RUd4iIGfIQFFVyTDoM0SNX1v+fOd3/lsghQ7MBUxyGkZgCArdCTLKUwQqUNDVcoFWFTvlSVAPZuASVYuM6ARDoOt1dHwH8elIaa/Fad/mbH2xa+49IyrTY7404yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1n5QunyW3kF9r9d+e6/qhTxXleweKViWL10C59lP+8=;
 b=vnryH6mHVHixVviqASrc9Cli+dYes+oaYP8fpcf+OQYsdSYqvNg6jMIvumjFjw/eFXWer0Lg+0EWa4sL0XLEwdj3amf7eZoQs2dTnsrN1no6gYTwjwa1f9PFWFgxvp4pxLuFBn+P5gzdkadZXEWS5BXdQDH1vG23Q1DD2Cq2N7VC5RhVWX33AOcgwKlAvoZvclBKrQ4X+Oh6vJQqJyowh4iVLJiOYVGlflVbo2sksmgj8WbsHXKIcL0GhmnxAV4CMAqu2qr+2iNo2OrvJHeAuOgDnU3g2ui8PYWPr8bo8RK/6GExmia8I3WSC/f8gCe8lkDWd+zR0Xsl6WtG/vV06g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1n5QunyW3kF9r9d+e6/qhTxXleweKViWL10C59lP+8=;
 b=n3GDGA5SHhUdUpEyLMULnpF/oiB26hUp/aubG/KKvT16TlWVu6iAZYAwmQ0bhkyQLQ+TmAMWe4Mpy4Ef2apE3fcB6nTlLX1H/8CS2YZyoU2GUCsgXVJj9qS6Q6L6QpNxxhQ0YDnRNgZywB5RUd8IrRr0tPhpIEqtoyr2v0dWu5QsZevWdoBMVGN7kx72UESE4QTacZzbThyHaLGbNVjgwJPVUHl3kaoUMA0KflpiCgS2WGcMDbo+L/PB2e0FFbpg7sWS525nYdzxQklUDwJG8KnONhRmQOI26Ik3IA6VrHDvIiDcJaShMBrxiw5IQKtSks6kaSmgh1Yb1PajAnI4dg==
Received: from SJ0PR13CA0233.namprd13.prod.outlook.com (2603:10b6:a03:2c1::28)
 by DS0PR10MB8079.namprd10.prod.outlook.com (2603:10b6:8:1f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 05:45:24 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::bd) by SJ0PR13CA0233.outlook.office365.com
 (2603:10b6:a03:2c1::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Mon, 3
 Nov 2025 05:44:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 05:45:23 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 23:45:21 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 2 Nov
 2025 23:45:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 2 Nov 2025 23:45:21 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A35jLtF3612355;
	Sun, 2 Nov 2025 23:45:21 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 1C07B13F52D; Sun,  2 Nov 2025 23:45:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Suhaas Joshi <s-joshi@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <kamlesh@ti.com>
Subject: Re: [meta-ti][scarthgap][PATCH] meta-ti-bsp: optee: Add flags to enable RPMB and PKCS#11
Date: Sun, 2 Nov 2025 23:45:21 -0600
Message-ID: <20251103054521.218991-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251103053940.555954-1-s-joshi@ti.com>
References: <20251103053940.555954-1-s-joshi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|DS0PR10MB8079:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6727f2-3d1d-4a58-af82-08de1a9c2ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|61400799027|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Y9o/2aLf9Ucq8abMLL+9GJdJWIO6K9X2hinVQKDv9tiU3ZSaWQhzLn0pNXZ5?=
 =?us-ascii?Q?NKH6yJKaAkiY2Y4148MtuqOK8Qjoe4Gv/XdaRZcsDbj4Q9by19jTYgAsY1t1?=
 =?us-ascii?Q?L5RYxseIP3Za/Mj85m9O6qo7QWOUu4hZmekmd4xXAWDoHYlwoJChriYsIOU5?=
 =?us-ascii?Q?cASA16DTyBixGDBBIjE1VOQk7wwGxJECWHKVEiIovFpwL1ZIJxcTiTHpuyn7?=
 =?us-ascii?Q?e/EKtLBo93LpD59oUUD3pKo4+SIsZsk/QbkNxTUC+YJRtoDjZaiwhruqPm+T?=
 =?us-ascii?Q?XYBMJOSD9LJOkZUTyiTjVlrevK8CgXgaB6pw0klGSkUBfoeaAtJWgg4DrmJX?=
 =?us-ascii?Q?dnUEetyPrONkhF7O2G3ptAbMDVjlRSmumgPpC3OiUENspHlzyN7Bx/+dbeK3?=
 =?us-ascii?Q?O3AHDDWSKUxsbfwjli7DonhWPh/2lrGGbyAfguRYFdOdFRxQNkV8ZXwJhk/o?=
 =?us-ascii?Q?pKag/tSrq+wh4nI4T+hdOfCi/M46IxjOhKZCQM5qN8N1Gex7otbcAx/n+qoD?=
 =?us-ascii?Q?WFa+Ay7Y+g2/EhXxt9B37MuAam7z7lqunH29PTaQKkvOEvcoQMXDp/XBdnri?=
 =?us-ascii?Q?FuCbo3ImerCRWH+NBaHV7ohJUCUE/EO8/jXsettVhQpzmiPtxTFvh2U9ifAo?=
 =?us-ascii?Q?g+37675Gqn8KahkIfp1Yw0WN3x5eLK4LUeh9ofHezlBHwmWN3GGEHRPv93Ug?=
 =?us-ascii?Q?c3uZATBZ+Lg+AXC4S2rJGp8ogydypycgBhmiRi+2PJcX859NqGv5sCk2mR5W?=
 =?us-ascii?Q?5AyENiu/CTcbu2sb5tFvexTfZ+vEzjyAcO7BOS/yFMB+t7EJtezHb9LfpBE3?=
 =?us-ascii?Q?R6b6Bv0oVxYYZn9Gwd7LFKTMa6+YPdxPsBMPAXRm6V5dXj7C3lJSPEH/wmmB?=
 =?us-ascii?Q?r6hZgqjgtxp9MaXXpwnFWoT/NL9gyYqqjfC2Zh+KCpiDVSNsZZUnQSwJtTHB?=
 =?us-ascii?Q?eSb4bgdEuHeRaNo7/SOyZvue7tL2ajbtTQT6NK+R341Da2NeBBGNO+ZBPzUC?=
 =?us-ascii?Q?ZS+YiKHO9OIhyIKJrMsb/N/uxRmS2bJSBo7QATmF20gpITn3KlOr63k8sQG8?=
 =?us-ascii?Q?5sqp4X8/Fp95jMWrKURXZP4HRXF7mjPLNdVykBPVC2vHScFGFgY3lFxt6WG1?=
 =?us-ascii?Q?C/AQLnTgpZ7vtYbJRsQhGYEzd+1yy/7jeq3X60X9wakaN1WuTf/i6Yy2CTjj?=
 =?us-ascii?Q?IN0vKrwZhgvDbDdQ5etIdfy9ba6mVRRPd3PIIkQTM/SlUvxj0vMSSKXhENqs?=
 =?us-ascii?Q?aoHU3XdiyqEDzTNUhn2q86UoEiE5QVu9sYk+e1Xt0qe/f0ohHtaAui84McLq?=
 =?us-ascii?Q?JaeHzyMruJaBnYpFJcdhOBBHV85wN4ihGF6yAllCSl7nLWfNEOVAKPPwLcMT?=
 =?us-ascii?Q?0apAZ1fWi+XXr9UeUWOyrvghPiX/y/gmLgPxifMP1Q2MmuVK1qXA6sczYSQN?=
 =?us-ascii?Q?ZMBMB+lBhKojML5WrghDxs4RDaXhvTKAWGPtjz9pCvLhoUHZjm2PE3A/UDIj?=
 =?us-ascii?Q?kZlydcH3EKOi6kefs2/ippfcVw372Ja9mLBDudVGlVGB8wfdYNnNNVTk+AqD?=
 =?us-ascii?Q?3NvJqqjtgFk1T1qf3qQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 05:45:23.4481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6727f2-3d1d-4a58-af82-08de1a9c2ecf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8079
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Nov 2025 05:45:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19217

meta-ti / na / 20251103053940.555954-1-s-joshi

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
WARN - [meta-ti][scarthgap][PATCH] meta-ti-bsp: optee: Add flags to enable =
RPMB and PKCS#11
    WARN: Commit message does not include file/recipe name: meta-ti-bsp: op=
tee: Add flags to enable RPMB and PKCS#11. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: meta-=
ti-bsp: optee: Add flags to enable RPMB and PKCS#11.
              meta-ti-bsp: (COMMIT-MESSAGE-3)
        patch



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] meta-ti-bsp: optee: Add flags t=
o enable RPMB and PKCS#11
- Submitter: From: Suhaas Joshi <s-joshi@ti.com>
- Date: Date: Mon, 3 Nov 2025 11:09:41 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 245c62f5b6c684a4a5c7b41394631b4b3=
d200ee1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Vishnu Singh <v-singh1@ti.com>
- Commit Subject: ti-librpmsg-dma: update ti-librpmsg-dma SRCREV & LICENSE
- Commit SHA: 879abf6914437e3a4da45fd515f33ac583bbddc5

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS




