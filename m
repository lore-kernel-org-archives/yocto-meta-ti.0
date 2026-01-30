Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CE8E6BF37
	for <webhook@archiver.kernel.org>; Fri, 30 Jan 2026 19:37:46 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.61])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.594.1769801859329439256
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 30 Jan 2026 11:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=qCOyAkF1;
 spf=pass (domain: list.ti.com, ip: 52.101.46.61, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nr9NT3nynL2SklmKR1JQfQSrOrfrnhvRUTIUHhVNOwUVMWYW794rcoj0dSA8kgdzalwNlk+O7fH68NOBvJF849BxLqKPV7Wa0eK/rVqI5vOP5vIsM2KUKWSLmXn0K+BkfBdQuYOxi5udJg/hlIBla6YWIiPfWZ5bjBn5J24qrUdz+KzMmnNjyrPU3rLAOlE6t+IMI8DaIkwPudtg3ucFBKn+ZWShJmzyPFBSCHKreSw+JP06E9bFrtPMK2eLO+nRi0gxo4/qDqjtebxoyFr5YMNrWF7dbumMCK1Iu1N9D9UuQwUCjakTqwzZo7D/vVOlyc4tdlEesNmeUuuzMiT8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YfjP0gODCw3bKBDezaDGPG7AU7axuCKEOrNRyUrO2jw=;
 b=rNVrXa9IJ+VKwFREuKUCul1PK2drsj9q2AsTg//y3KjZTdyRHfusV7CCmMdrZJbGcDoiobp70rInkM+5IhBitT3BdrdDYV9zkLWZoKGqQZtxTNRmULQDkYHnfImpR6st1R4Kck4Vn9QtAAY+D90sF9P6sNIWNRAVNeN+i2fQmh4fJl34HU+EgebJKRPfLsGXi0rvv07iZzVlv4L1OqpVv4Pqrk8oSsxESEkfEqYVEbo5yDksZc74IsJGJiYx8lS3kQS3bmKGPf6AlAHOSFyT7xdrRjtS2iJT8/MxChM/gsqiGc6U70O8OG5CmhnzXwOH3zMyO3ckC4k/wVMJvP9dYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YfjP0gODCw3bKBDezaDGPG7AU7axuCKEOrNRyUrO2jw=;
 b=qCOyAkF1Pt82CdmHE942mmnQOj2IyzFjU7x8j+3Z7cVibL53su+7ZR5XCO44SxK3O3SsuCeBuoiWXmK1yUoxERJWToUn64Gk5idu42chpAP1fiuuZ+LXOgjusDatNDhhNhVAJJDY1R9uXSWY4j9j0jDMfTq+ao4pOmAtbkYNKbl4avWFY2VG1khja8qcjOcB8fSFJZjsTPoGuUyPyG0NV6NU+mfRR9v4s1s5MiXZVeANdDB4g60waHeWhOBAiB2w7wGsqwnqyzaECBsBD81368Yl6/U9lobhnEujFdGBxEUdceCAOuKGahBVpL2/bD247LDo97IKNlcw5S9RHj//tg==
Received: from PH7P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::21)
 by CH3PR10MB7210.namprd10.prod.outlook.com (2603:10b6:610:129::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 19:37:34 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:510:32a:cafe::ec) by PH7P221CA0026.outlook.office365.com
 (2603:10b6:510:32a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.12 via Frontend Transport; Fri,
 30 Jan 2026 19:37:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Fri, 30 Jan 2026 19:37:34 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:37:33 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 13:37:32 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 30 Jan 2026 13:37:32 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60UJbWH52970153;
	Fri, 30 Jan 2026 13:37:32 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AB50F9ACF4; Fri, 30 Jan 2026 13:37:32 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, "Denys
 Dmytriyenko" <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202601300920
Date: Fri, 30 Jan 2026 13:37:32 -0600
Message-ID: <20260130193732.840680-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260130192501.1648188-1-lcpdbld@list.ti.com>
References: <20260130192501.1648188-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|CH3PR10MB7210:EE_
X-MS-Office365-Filtering-Correlation-Id: fe92fb12-d1d6-4528-2dd6-08de6037042a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VapwNRVEDwWBTSPjCM/AWReDPpj7Y4mkvdVlzfRy6Tx7OGVBQ8L5KtZps687?=
 =?us-ascii?Q?PlB77Llix0Ial/Z5rjhMOl5djugrGXOY9aisGqitp1kniigfW4zL7e+i4cax?=
 =?us-ascii?Q?mnmhRWf2TcgyJBIDR+lCFcdgmOAiRTxnjGG08GrPrEc7HINjmdYEnuPKBNvQ?=
 =?us-ascii?Q?QBBuDyd/JUTkFVb+Aum56DR6hGGXF6mPNHdOaRIWLyFWM4UYZPrxrS9HWzw/?=
 =?us-ascii?Q?pem6DyZQWem9384STBcSCsYQZiwH5WRSo0pvZ4ryZP83gW4l8u3K6YteUJb1?=
 =?us-ascii?Q?eF/gPd1YG6YNGJfP/E6m0szr1VrEWgO9aDIDmyNxvUXK4Emhha+OLZcrW6tG?=
 =?us-ascii?Q?vlELSVhS4lAhqNwV2abK2MEqHTQmoNiwQ7SVh8PhtUaKDiffHsFXKiTMnHw+?=
 =?us-ascii?Q?pqslJCKr99kFIHknsK/JRdSW8vtpsYAcYqtZGs3CeFeJseNUr0yVjU0T65EZ?=
 =?us-ascii?Q?umG3A0zYYncCNeG6T1jEvBmYYf23pXy2Ek7hccJ/lKwAoQ0fm118uoyY0fbJ?=
 =?us-ascii?Q?plI1ZHAQaw0krj5hnE7t+ysj8krhBwOoHqAEFQdpMNNlhRrkLloxSQHnRf15?=
 =?us-ascii?Q?dGLtY+u+cPYHv+kM0Pw2jLh/39KSPTsszsFYpX70R7lN7Rm25E0zT/Hbg9D0?=
 =?us-ascii?Q?9gPPMRUQ+xgMLOCjP2HHl+7VKKijoKo6leUDRUlBHCkaDkGoaFgjZQwUHaGl?=
 =?us-ascii?Q?y8RzoOyrc0iSYxs0YwUpdoN/R8PqMPrs/dStabEwbKiB94HrDrDSdwT50K6p?=
 =?us-ascii?Q?zy3R3t8VPWauqZjKy4/2GhBWxNfktI9ZfxH7cAKpY8vspuYDrRG77O9qR9pf?=
 =?us-ascii?Q?cDeMeKG5Lf11Dl8HoWQVCNbBMLHPdeVyPkA9llG57byWR1kZEdW+TenETaLS?=
 =?us-ascii?Q?3SdI7bTy+8TCnAD0JDRkJw9ELdTQJxCmqYH2iqLtiYQzMUzYBB3oibtRkXiM?=
 =?us-ascii?Q?NRdGyVzZQm3QGPnlgFI8IWUR3bcftVsUsvaTQaqGOlLlVa09BZSCESVTjzH4?=
 =?us-ascii?Q?7FCOxKNzEAzfoySKuSzOL98O3TTg+MgrYSX7da/zXDLga+pHgrYDai1WIHsC?=
 =?us-ascii?Q?EuNwpft1x/aHF+GecT7ocj0ZTuF2uNOTp240TzMxxENS3jjtWz+qdWHjYho9?=
 =?us-ascii?Q?flaaKJykhMIvXHLKavSSblF6kR04R7KE+DlKR4h/WVrmyiclc89wQPzPfGfA?=
 =?us-ascii?Q?gyZyskG/q5RhUQSdx2yg7DR242KRYPWvYMAxPyvI+XZbJ0/ay2ERN0RU8mmc?=
 =?us-ascii?Q?m9kBVpCKFZZ+48uHEev59uCGRt4jol9QOR2dbX6JT+vcZ33a+F1UhXNi1/bP?=
 =?us-ascii?Q?0F2x4br2rAE13/MDLxWcjE7SejY0FnaXnVm/jEGZ63z6CZjwkCn3ggh+ZUeC?=
 =?us-ascii?Q?npDx+ShQLPIYQj1fgSlH8FtIncXawhptKqLsUJMFRJwZafA75XBK9/G5/m7D?=
 =?us-ascii?Q?vnAih23fjk89J7/aBanUhAdZo/NOYUCJ9hA2++PZpbPmY1VyFop+vLjJ+g4P?=
 =?us-ascii?Q?2EMmg4I1ZBk3Wfh/2sABbphR8fJwqtlLeIkcB86I5cuC06bk6QgXVSKB5Fx7?=
 =?us-ascii?Q?AA9++h3WjncnVu5GZxX7L501n030DwwOAWN+OHELVmW0ebFNbVH/BtOoRZeL?=
 =?us-ascii?Q?z5QO4GhHo2kis1K4GUMlIVkPPWOoqCQ6mctav3ZaWfQleATML8WvXmjxMYFc?=
 =?us-ascii?Q?JWx/zA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RbTzpytAddJs9q4fes6G1uW50rBADyWbkptNTfOFZiDPyLxzp4WXSyqqz6tAKwhdndrXjStKp+U8jXPZD9LgYL5615nRD81Xin/hpZtqp8Ml3rk94p/OexGJXJEGbeSakWylYVVe7odI22TzG5cc/MLFWTeSCZF5WaAmK2uMF4naVl1uHUIENmLYtaGmqsGHz9m9dbienWR9Kl0GYr+Dy33ow+WtgJiQQ9OZnHxdPLLVh915HpDx+uRvBzH/Dh+6IfPgXMGoVEqAIJxlQN5MfyCAMKZz/9gfFYD4KvwF5lrcBkhhmYW/jrJz5te9yOf7MD+hWZKGXYCbc0n/OMmAxC1PExIRZtPH5kkllgA/EO2jlGuTs3ccEm9vcKLvKlKgWMTuyU/g3/ZmRO/yLExP2LfME3NpdtnDKskvERO/39fMZ8Wxxzk/Uou0XOXc5Sqx
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 19:37:34.1240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe92fb12-d1d6-4528-2dd6-08de6037042a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7210
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 30 Jan 2026 19:37:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19450

meta-ti / na / 20260130192501.1648188-1-lcpdbld

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
scarthgap
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthg=
ap.202601300920
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 30 Jan 2026 13:25:01 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 8393e20660f34a09ad9e964339a663380=
6da79e1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202601151800
- Commit SHA: da28ae30cabd39ebce054ea2e230548d9b9c3322

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



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
scarthgap - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




