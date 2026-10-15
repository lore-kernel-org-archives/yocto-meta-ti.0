Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC6ECC6B33
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 13:11:19 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39342.1792069867064850268
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Oct 2026 06:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=erWXbEwF;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ATnh6mSx;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9mCEF1359842
	for <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:11:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QY5H5ar7MK1mXTi1E6A1xDq8xVBlWQNHh+Sd25fsK
	YA=; b=erWXbEwFWJwUbrODdeTNnZiaqQ7sHIVUSXa2ukHhQkFSWZOZycGecMmvx
	tm66O08lO5SnO1uiAIdKuBkVwKjv9GaXuB2gza3P5jFs9yRSYLGXYCJyAFr+if2U
	hIJ0Lst4OQr3LTMR8qqQllrGZVGuKm2eVC1wGy1otUw2bxdmIbzgAaXTxaXHWot8
	9BVKRpTMKhUZF/PsI3MUZoIdYif9TLtA5r0Zmmt5wV8KGTW6EEqI1or6Rff0K8oV
	Eo4kef2rslAKw6w3HkseHsT+uJypS45z5ruuC7nFujnk70uS5aUjcPCEfMU8Dvlk
	CDrLiGEh/o6NntsqOp0bugdtsYFFQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4haf68dkb6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 08:11:05 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiIBFFkS583BKPicMhYNNyZGbXAlDB/fxhts9BCKCpkg++L52ZiiSVr/eZ19cZ2pZFAHW68tRi67ozoucLm2Tb8VKeT1OzV+xZOuPs+GBZVe3NPAtFqYRAGrybM7iZyBEXHWfW37GBKMV60KZPTWoHsZQ7Qxp+GduF4ADBaWwqJDOMJRcfGU8R65BEsKM1juM4hOywv7Ah3xOHaC8w21ZCeDJB6jG9tC/+FP8ylWI/iKnAu51+kieLkYwFj7VEcfcXdTL3R02KcJeEf4jVt/dGbnSCRxvrhXXOQUycz9j940VLj45RK1yQ3al7zd+Qq+loGCBTSccI3vnGVL+IIX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY5H5ar7MK1mXTi1E6A1xDq8xVBlWQNHh+Sd25fsKYA=;
 b=gKbUxA5XxP8rx+PQrtB4DysWXexHDt2tMhSZ7E9YwfJMGh8CtNx8JS6TLJRwDzIMt2GOIwErhrOcIYi+vLJvIpdO/deTLeWj0Q5r++d69rodnnTq3+ZhhTWAgaT7hfrLeDZEKC9q3sWzsxMeALZj+30r6xD+8N1A4nwzkC9zYmWilJeuUYOFfi/RnZRk7HiVxKO4Q+HrIzDRVWoSEuMyUOKetkHFMAv9jrTKJ/XtBg4nBDg+UyqUHLYHoKy58QGW2V4URHOcLeGytyNL9pfMJT9MmKQG5jbke8hCVPQGRr4nD+GZlmLS2QlO3amLCZSB/pPATaSKiKwXIswkm2CDDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY5H5ar7MK1mXTi1E6A1xDq8xVBlWQNHh+Sd25fsKYA=;
 b=ATnh6mSx7+Kthvqm72X/ltcp+khlBULuJa1rVfFirHazOaFheZi097EFFpUX7fLnMcfuFpMhTycnbrJAj+fYb76u1Agb6V1xQ4QSzVFZyaTtvQJHXcILnD7BNYC1lDahrVsiJOeFnClP0t4OLFLmZbJYIQ8CLsgqb6bnuOAVFNoJNFTp+3Snqk/IzKww3p3FL4x7+u7S1bkJ4Rco2efFHWTcIX8Q//OnoaOsKUvgUGMSzEu6w07bSUTCiRfN+LNiDiLbHMPAXhFnI0OuoRqy5XtXgvR34YrCl3npY56cNyuOmAQJceqOzCoV+i1Y5zg3zrBTwnXZ3adwBtrYBnvmrQ==
Received: from DM6PR04CA0001.namprd04.prod.outlook.com (2603:10b6:5:334::6) by
 SA2PR10MB4796.namprd10.prod.outlook.com (2603:10b6:806:115::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.11; Thu, 15 Oct
 2026 13:10:57 +0000
Received: from CY5PEPF00000E76.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::69) by DM6PR04CA0001.outlook.office365.com
 (2603:10b6:5:334::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Thu, 15
 Oct 2026 13:10:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY5PEPF00000E76.mail.protection.outlook.com (10.167.247.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 13:10:57 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 08:10:39 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 15 Oct
 2026 08:10:40 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 15 Oct 2026 08:10:40 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69FDAdDL3316843;
	Thu, 15 Oct 2026 08:10:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 025A89A9C2; Thu, 15 Oct 2026 08:10:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-bsp: enable legacy SGX driver for ti-6_18 BSP
Date: Thu, 15 Oct 2026 08:10:38 -0500
Message-ID: <20261015131038.2920611-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261015130618.1811556-1-j-sahu@ti.com>
References: <20261015130618.1811556-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PEPF00000E76:EE_|SA2PR10MB4796:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a22319a-f306-4b4c-c274-08df2abdc050
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|23010399003|1800799024|18002099003|10067099003|22082099003|13003099007|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	pOJK4m+Kbmzem/TnzklC2iw6qyAMvjcJ9aaZgO5q1E8NohPmwJArT1CeN5FbYji42G2Q6uTVqfB1ZfmrQQnvpGYk5em+kPBwZfMNrcuqgvAlpGBwzPo7II4GPNNcmlOt8dtHopOeFo3wGqvGGSBRYW+oG4wVef+M3AMyqA1rRMxAw641fRxcEbZTWIgEPZG5k34EWP6wYWQz7YW8/CIsQyrLeUeRzkDwCsMm+lFTKj0q862B0t/F32D/s6THKXSRSjqPmwONMEQ0uhgJdXRhA+RIRGibxylTMTLS+i3WoszohYHuAaqgS3Zk+o/GlgtPUqOqJuNngYl3ed0fSZJCjwWb/1AcD6Wg5TRE7hwN501s71nl3T4EGrY2J+IshWHUEW//qcnL1HhVb+mk+hsDUGgYFhYAq5jttuzrLge+qApMuqSvWdzpMd8X33hPIb4E6vUAsA3DyomFy8Z4ln41nKE0xCXrwidLemywWrIfgSQSVsEImtK/iB/XyWBMi8chcW28XcBdigLNTyhpCGS+6gpbTUDayr9JBVLstLw5SpnJnCUQbFPife2jFA4KNsd96jgvZRwyErAKc1kOLhz183S0F/T4Ns6UmHmoSMHvoznUdUwyHZ1oC4nixC7RPbqlixnV/QDKMEWnnkcxUp7A2g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(23010399003)(1800799024)(18002099003)(10067099003)(22082099003)(13003099007)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U7oiEGCzPtjwQbbXCm6KhL+SjMIx+ZzzE4AdmHa5YVAJxL4JXSMvpTpn0lCJJnvgEehETReMAVGRaO9O5EcUuJtk2pq9S8KqWzcA6EQkwaLLwco9rzz2WmZ4YtbtmrJxpkDWTpdGmC/TfXFKGR0OsxJnCdWlb+OIPKORZiK/La4Th86mzj8MZ9QnY+TDhRauiTF4h/tpWX+KWaN9rv6v9oXUjvgWj/+zZsxwmadFZ7aygeOC0OmTzLk6Q3mCN370O8soDnKSfWDKVxlutqUMg30IdpIgVluXC+1H3RXLIEccveT4NR8vl5Ru4gHWA/An/jpyStc4rVKW/R/GGNm6N7KoA6PgwRlIOvWa/LPQQK5lWag+AvD7DymwUj0QDlBRCzn5S/vKEzYUXZZWf9kDGmLBQUvcV/EiAOtqTjs/nABcr4u1E5ll+zuzzlodQ2Rc
X-Exchange-RoutingPolicyChecked: 
	MesXjW0jESZmaG93hEjoqoJHg4HzmepFzxxzC7OP1DfK9G0RQ2PE5/KXw/1ZG5xetqHReihBee9r9qWnpHM0eOWizd73xSdciso628rXeUKz4S+iM0YZvonEd1Z9kH0oI7vdNbeVuifzYOm58xBnWoHk/lGR0YGM7JiJxI68EzG72opc8h4AdW7AEjzpyMOgDw3FqimQofCjC9A/ZEsZIkIYTQkDfdT4DqIJPNWy9AMu54fNSDShuQ/tgOuPzm4JX/wX0EqDoaJlKDH/UW5n2Pf9+zHmG0MhzHToyr02cTotnI/LwhXI0+HOqorkCqBC7oqbDfi9xrEWfP27GxpOcg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 13:10:57.2677
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a22319a-f306-4b4c-c274-08df2abdc050
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY5PEPF00000E76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4796
X-Authority-Analysis: v=2.4 cv=ZIlCCn7b c=1 sm=1 tr=0 ts=6ad0d0e9 cx=c_pps
 a=UcHwULevSueSKPp+kiqIJg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=77vJ8pVne6LCljxRU9cA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX0vbT4XnGwDvs
 OT+riqEhNPBteKvgoJmRgsiqXyjg9zeTcB3FGfLYiG0fLc80s5QqrlB60YnCh6lRNnGnLyFfCmT
 22CgQXp2ASc/lsfbyXZDIB0VjgyVrHW2tbrlIZHWb16XBA4F8Ed/Vt3PPQqZ7SgvZLEnPoDT1ye
 F4aQ54mhS8BwZnXywQ5n+Tqt8+eJgmFErq7V3AR3TzaiShqCgwDH+Q1ift+IVqnmhFPzAb7wf08
 KdzidAIwx648LSPC8gApN0Drx58puHSANXxJCshXmun6vk6xVdl2V9JtGVbL6/Lmf17k+qjD/s/
 h3FM7XgI9W2typsS3ObYpxSBzLgD01WKUsOMc651h7skDTpeKbfofzMprLIYtwWSsbCK4b0qy9a
 rEfMaCsHBT29VxGT0kftI/kkHdbhzL0OuhMs3auxbkQ57pHSU2tMQ91MPzQkIQkOyhADJNsEQGF
 Pzxpi+pi1mG534k5Dbg==
X-Proofpoint-ORIG-GUID: FPOJ2b0unLOOlvZXMtaDmGGvOSMNT3Zd
X-Proofpoint-GUID: FPOJ2b0unLOOlvZXMtaDmGGvOSMNT3Zd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MiBTYWx0ZWRfX7qxh6RntG5Us
 w8eCX/p6N5gBDI4qhO3ODLCkeb4LD3xDcJ5wCAaopEX26TGwmsI9s2nE+DzvL3gyhsNJADnWZcz
 rVi7FmkjNexp8XQLhasKBdRVtJ5fQi8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150052
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Oct 2026 13:11:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20462

meta-ti / na / 20261015130618.1811556-1-j-sahu

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-bsp: enable legacy SGX driver for ti-6_18 BSP
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Thu, 15 Oct 2026 18:36:18 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c22b865238fcf0640db2c936f128974d20a02e03

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Atharv Dubey <a-dubey@ti.com>
- Commit Subject: ti-core-initramfs: Extend with dm-verity support
- Commit SHA: 96b3182a4247d1e770d236da907b17cc44927f69

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-bsp: enable legacy SGX driver for ti-6_18 BSP
- Submitter: From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
- Date: Date: Thu, 15 Oct 2026 18:36:18 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: c22b865238fcf0640db2c936f128974d20a02e03

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Thorsten Lannynd <t-lannynd@ti.com>
- Commit Subject: flutter-wayland-client: remove unnecessary include cstdint header file
- Commit SHA: 03e3d09e35955c46c67d19577e210261efea4f27

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend:2
            TI_CORE_INITRAMFS_EXTRA_INSTALL:append = "${@' initramfs-module-dmverity cryptsetup util-linux-mount' if d.getVar('DM_VERITY_IMAGE') else ''}"
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-ti/initramfs/ti-core-initramfs.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
PASS




