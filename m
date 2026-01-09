Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958CBD26D94
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 18:39:51 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.22])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17092.1767983983519079820
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 09 Jan 2026 10:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=azhyzfE9;
 spf=pass (domain: list.ti.com, ip: 52.101.43.22, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ocxi0gfTAgE3Tfss54cP9yUL1S3z3SfL6k1IidIGEfHOPlk6TpwZZX15K74UNFYXgC4R8MhkxS6e+pwSEM0YZs1JrgoqSucJjwN7hd+6BWsoe8qvIOJVid/HgX+/faeIy7Lfter3NhJvYT1/2W/L9EyLIdKkXQ2hM/VrabaGlabFPGlgKe55/09GVanuD2bRv6xhLbuxSafvm2tS0mxnLyHWcyEnsyqZBUgiSpqapBuLrK8HKR791NNRqaY1kcnpugcC2jyZ+GCcmYrYdYHw4UoEr0j8bBBslrvwQPqxtKwlFOogZIUI7eD0X+Txddo0dDeHuirwOTGIXqSPR+2thg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=De4308jJIgjYY+Vf7ZdnJvZeFgbtX2pfrJDW6EUBQ5I=;
 b=dBnJAOeO8p0CYMJNjuS5SndHtcawc56lmx3VkPGerQTuS0LWk6mfcKmPpuHe9MQxjtV+I88B48vDb0T43qg5w++Q1CxSqVtEblHnKyipovC0aHrL45ih4VGslb+CfPm01soZa4zFsKS4EsuqCnCx6C+JtUajNx9Kjzee/uS3DEc45udzZdwDo6xita516OwCtnxWKjIST6eug4bd9iioogD4NRw6Sr1jk3eUCCKrSrSnEsjn6payqFU42ZaEv01pL1fdikgy47zsacvgrCCof5Y1c67pF6yHgQSSNla1CDwXA8opzjglr1p0tajGbMMgndQ1AHGEVz/M87dU6FmVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=De4308jJIgjYY+Vf7ZdnJvZeFgbtX2pfrJDW6EUBQ5I=;
 b=azhyzfE9skkjIDCpfvGoJ4jLE/KGJkhPTbibDkhLsYHjZcv9fbN08e1G1QysXv2HFdmvfyUkYd3T3SJvA8mQrsHLkqaHOw6hrjfyCheUBkhHeyduHuxfc1cxnUbt5Vqd3EhEJuOi5GJeIXpqi7/X0YDL7LnvAt2uYVXBgUwINu9YqqzOk5DB+0oA29VQLiwFNrvoQlEESTbPxSyaGjmA7mWKikJi/hSRlQKD6j7IMmMTuR7CYIswQMkXXw6LY+QoqVZa2oLmn7I5XtmJ4wvX/CM/c7nao+kN7MRf1pFlcRz4MDr6OG7gzXhV3+YgTjkQFNi4dL7rqG62XcDYhZ1k/Q==
Received: from BYAPR01CA0037.prod.exchangelabs.com (2603:10b6:a03:94::14) by
 CH3PR10MB8216.namprd10.prod.outlook.com (2603:10b6:610:1f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 18:39:40 +0000
Received: from MWH0EPF000989E7.namprd02.prod.outlook.com
 (2603:10b6:a03:94:cafe::3d) by BYAPR01CA0037.outlook.office365.com
 (2603:10b6:a03:94::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 18:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000989E7.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 18:39:39 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:39:33 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 12:39:33 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 12:39:33 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609IdXFe2301327;
	Fri, 9 Jan 2026 12:39:33 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 9716B142E2F; Fri,  9 Jan 2026 12:39:33 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] conf: Add support for bsp-ti-6_18 to ti-core-initramfs
Date: Fri, 9 Jan 2026 12:39:33 -0600
Message-ID: <20260109183933.2069201-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260109182809.2975063-1-reatmon@ti.com>
References: <20260109182809.2975063-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E7:EE_|CH3PR10MB8216:EE_
X-MS-Office365-Filtering-Correlation-Id: 745d16c6-43bb-4128-90cf-08de4fae724a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34020700016|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lE9abLHY20eFXG5D5S3gRVS+4jpI8pS2smuLn3cBtaJ/86yGyvjqe9/0IVb5?=
 =?us-ascii?Q?2c5rnxEDlaBsOUlbg8rTlh4O1+LRxCU+YNc+RdYzajVB7aeR9VyT+gMWx544?=
 =?us-ascii?Q?L4VSaHdajQCg0EaGdjFl0xxa2gzYn7UZBuv3w3UsJquFA3gOYYYzYUvp6xg5?=
 =?us-ascii?Q?peTp6QMiDpy+3/9l77IdTpJxulN4if6BrFweXnEuZ/MkSfPj+N6d0r4qcBkG?=
 =?us-ascii?Q?1LEzXvEYrji09sCvcsss1SQc6fLUQ7uENV1Db2ARCLda/iz8JUUZczDUbpuh?=
 =?us-ascii?Q?MpxeIXVbtNbUgBUIrZEIh9Y5yYQgCH4MtvV2yyIl0I1JKGkQgjyD9Htyc8w5?=
 =?us-ascii?Q?GelHSWTj1Pwd17cgE0Pl/EjM68nW0V+ZZ1qDpg1+0P3no0J2gdWggCMWzJMn?=
 =?us-ascii?Q?1VmX/6xwxsp3gc0nxFYmROIjvwoAhmm+qAUvciUC8j8y8YgqbusORAGTclvr?=
 =?us-ascii?Q?1tj1V6DV41vMeUdIDpaU8OjXjLXj+sDwbnVWVoRbz0LOvZarCI0HkKEI+ZR4?=
 =?us-ascii?Q?WkgL6x3sqWjCnM77Kq7Q9OdOeFxoYItLDtC3jUAcwteOKLtQ/ktCiLIePATO?=
 =?us-ascii?Q?g+0KakHAxo09ox8O8E4tEBm856HgT3yj0e+6RvITj9TfIUiSx8IiH/63A2uu?=
 =?us-ascii?Q?c3giyX+Nb3fD/NL1ngSzU0+vqNP2w/RTTJ/O8nnDpub9ZAoT03N7Yn5PxhXH?=
 =?us-ascii?Q?yY3/YSGAZhZQjf32qaawLBn7HSmj035zRQdbDziNXvtya4OUheNhiCHggRD0?=
 =?us-ascii?Q?ejiSszs/iJ54/TuI3dtVR97zvOCb7cDOY40RC3DDprbPCbHzj6Xq7DBbatiJ?=
 =?us-ascii?Q?Qe08Y7gQdLNFRJG73hDE4oS/gqsvR16ogGL2cfUMOBWCLRyO0IMOlF24gDbE?=
 =?us-ascii?Q?hzxf78DBZ0MrMLDkRiqK9C83/MLNriU1ZqfWySmQFcLzc7yKsiYpryS9ksxL?=
 =?us-ascii?Q?yoWoWHsyzut25BCMaJzpIYzJscaoIeuHU3/yKT0x9YEn8HUBj5up/BZNFohe?=
 =?us-ascii?Q?OU46sPnRrb7XSAg0QeT6l2JG9Ftg6sw+VPFCBTliETbFMs4MsV7KUDIhaYBV?=
 =?us-ascii?Q?BriBtMhIMgBxdQIzRp9N9OFZO5rh9JiiPzcU/JZUeH4aisGE+8kRwTaiDsOa?=
 =?us-ascii?Q?tfwnC14o3sBXH4N2CQ/RzXvr5wqtzP4ZcAEe59E8n2k3EV43t+GOMuAu+2um?=
 =?us-ascii?Q?e/1mNsfltbMQBFTl/3j9b0kntXoVcyfBH6vAFI6Pwx8QVhnnLZcG3YZibDXk?=
 =?us-ascii?Q?SmvfY5HnB60cdwsFiKRryBMlsatVEapOtRtVAi0FEflmdfFkyGbfoo+5Nq9d?=
 =?us-ascii?Q?doZY/1Eq59sLoIA+5Lu5QeYKgyLBzfBJ4uFkZxwmZuQVE3PuAPl6FqC6b3zP?=
 =?us-ascii?Q?ThqH2ePK2v8ZwOZQ9msVhTyr+Rw6f9F2IjIaV8+6Sin60bYjorgSW1T9ewKS?=
 =?us-ascii?Q?FvNNnyesm0o3HSvY9tPRjOYAULsiITYQNuwCCJ1SBXGEtrazxSItLIyPFLCp?=
 =?us-ascii?Q?TbzWQjw+Rqe1hhmp2VOselBvO/KzYsOzYUq3gle9WREpBwZS8u58BxP65yah?=
 =?us-ascii?Q?Oc3nKdU8z3oSAXpHaUE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 18:39:39.2226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 745d16c6-43bb-4128-90cf-08de4fae724a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000989E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB8216
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 09 Jan 2026 18:39:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19403

meta-ti / na / 20260109182809.2975063-1-reatmon

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
WARN - [meta-ti][master][PATCH] conf: Add support for bsp-ti-6_18 to ti-cor=
e-initramfs
    WARN: Commit message does not include file/recipe name: conf: Add suppo=
rt for bsp-ti-6_18 to ti-core-initramfs. (COMMIT-MESSAGE-2)
        patch
   =20
    WARN: Commit message should not include directory path to recipe: conf:=
 Add support for bsp-ti-6_18 to ti-core-initramfs.
              conf (COMMIT-MESSAGE-3)
        patch
   =20
    For details on the above errors/warnings visit: https://lists.yoctoproj=
ect.org/g/meta-ti/wiki/40887



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
- Patch Series: [meta-ti][master][PATCH] conf: Add support for bsp-ti-6_18 =
to ti-core-initramfs
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Fri, 9 Jan 2026 12:28:09 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d855889da50bb4541dd18d8169717880c=
1badd53

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202601090507
- Commit SHA: d32e0f2c335999ef512db67ca7674511b9fead41

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




