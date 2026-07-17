Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A27C4451B
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 20:51:03 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50.1784321452948784350
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 17 Jul 2026 13:50:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mw5YeNbP;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=OW/JkjHk;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HK5Bad3376325;
	Fri, 17 Jul 2026 15:50:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=tJcVftn4QWT+V
	BA56l77y1T1uUOOKJYRRUH5O1PIhHI=; b=mw5YeNbPuphoc0W7cBapYzKPznzup
	05LV37qSFRdIzEu1PQbqxurZ8W+ScBBZ+yAwKfM+qywFLllkGhuGQHS91ekFr6iU
	a3zgYUw9yjk5pRIfhaPHf6QFk6SKok1PLxdU5WG6r7lsIUEWOYpDh/sgneoApas6
	fWQIqV03dIYyCV538In7wbNVnR6Uk+yLKUDgj4SL3sFilvTMPUMEZS3DNY5W/aNf
	akDTnttcNVlK6qufTANHM/O4EfZtW/xXcOPao6IhBxLF85GLnycx4EtAihPwxG5M
	s9M3Sf85XVzIi/pPf/dUaiBU1Bc+iRhmBgjS9R/cQBxXVX3EPrANI/gjA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011016.outbound.protection.outlook.com [52.101.57.16])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ffkc3ke45-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 15:50:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBU22ujvKKE+hGJ/Jmsn8WdtFaejwPQPz2yQoo/jiQc27gun3q3+/4jc2xSh+76xtEZaRM84rA/6KEpv/MB/0Tyw81/Vo7hFzLFlosSB1U2lUPn8M3ZS4gDfgK3UxJ+tSyKgEU2kRPKz5ch20MMRfISnZP0nrPGRobgcOVViMHOYfHWBmTjkDxAasDq9zyRygubqef4QVlvvEJyv0j/Kcjhtrs6p/salT4ODEEGeVMpwrN+Z3E8oe1c+GGd9yBGDesmqGsffJDhtBYX3Q55uKlIkLGRi4/evLYCpkJGi0Ta6j6dgl1q5/OYFzfe1/+1G9BDs44R1HB3U+CFeyFhLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tJcVftn4QWT+VBA56l77y1T1uUOOKJYRRUH5O1PIhHI=;
 b=gNxaJbsBOGM/nUFRpMb9JGbIJhFhZ9TiPN4/6LSoiKSssvme0qMoW2O9q8jBwmJYkEC9Yg53zfRTBcFM0vu+LfqqyVoiHQVxrNqbi+WRdO0HKiPKwGc/+bkc+CS63vBmG+rmlqhUMGfohxy8Lr/5M9hZB1OmxJtXlx+dNsjKMj+M6ecA/ZuZtfieB9LgVJNo7mbUMs1hwzrmxzIpRwpLkOBY2wfgLTIurce+9hFp8BsRrwV1jGV154DixSrPleB4pfO1sdPYIpCG4cntu6m1BcEDiglH5ls6gSHW6jqS+Jfd1ii019OchqZji7HK2pyQ1yHtZBtj3MXX4PinayEyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tJcVftn4QWT+VBA56l77y1T1uUOOKJYRRUH5O1PIhHI=;
 b=OW/JkjHkY79csPM4jk10snfjb04pWGBfVtMUu9sjp0qvDhIKZQj5TzxAsDIPaDvLh3cmssgt7o7hb5EkQ4K80ujNUxnewHWyoar2o1uhvisJGUtTFhv2TH3nmbPxNUg2YOr0+1XOtRSFi+bEDTzabH9kH15EGHJQjdrrNTLkNB1dMrY41c1fquPPlskeWkngA268EoSTYR8QoSi3DqebAlEiptSMx9oLZ912uzd0EthWYml6ukr3We5k+y/B4mdURMLEkDrOvNynPOqrnKD2iRUbdiU4TWjecRmdr1P8F8wOwDChHmVS3zdt78s42rJ3gMhN4hRJr4UPyU+B7CcQQQ==
Received: from BN9PR03CA0545.namprd03.prod.outlook.com (2603:10b6:408:138::10)
 by PH0PR10MB5780.namprd10.prod.outlook.com (2603:10b6:510:149::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 17 Jul
 2026 20:50:47 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:138:cafe::45) by BN9PR03CA0545.outlook.office365.com
 (2603:10b6:408:138::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Fri,
 17 Jul 2026 20:50:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 20:50:46 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 15:50:45 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 17 Jul
 2026 15:50:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 17 Jul 2026 15:50:45 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66HKoj13432717;
	Fri, 17 Jul 2026 15:50:45 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <lcpdbld@list.ti.com>)
	id 1wkpW9-000000082g1-16Jl;
	Fri, 17 Jul 2026 15:50:45 -0500
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot-ti-mainline: Update to version: v2026.07
Date: Fri, 17 Jul 2026 15:50:45 -0500
Message-ID: <20260717205045.1916878-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|PH0PR10MB5780:EE_
X-MS-Office365-Filtering-Correlation-Id: 2225cf69-b8f1-4f62-928c-08dee44513e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	epUQcxR3/gHziXyK4LQExmGud3S1AhMkPkeyj44OZTl4QtYfKIrTf9CWrMa5RUFjZN4GsA6jh7z08vEdXJXz5nIWJ0kp4CqgYViICtzDSTQOiMms7jUMjxFNHOHkAaR/CuAYFEsGhigBipdyu5SNCkJF1Li0mk1w2x3JDBqLBRKUDRlFZR3orUGsJhzhgIbgIPvO30dkTj4dj3k3K8a0lLr9YRlHhUp+cCBE/Fnt9x7zgQtb5gv9F6OSysW/zD1OdWbjhQuTIDqEWVRenO8f6zBg5iv8/j0bkNs7x6mBfpBm3UEscAMsOurnozR77D9nrpkZin7BFgOqKS5wvUBX/bbgat2nDhlPadXxSbmeVVyNcT+3OckgMZ6K31S+NksGf6Hk44nqlcK4OI+Rmn0V9JvgMvElf38BZD9vwuZas45GTe7qeWQLaYoi/J5t+oNG8ogzeksQkjquGbUmqgqGcrYTFMiqpX/rLVuPZhohtcur/mgbNKwO0EXZHHWeAb3NjLNQK2e95lzW13qIg42J+6B7k3USRPAZb7Bd/m2CepHmvXvoLFvS43oIBWANWiaO6uoLAtr/ZOZZXdjEXuYJqNzdLWP7STv1XtH7Z11JpGFOFMOVdKY3mR0HQCae0ttjsUmz63DF6mr647u0U5Kdy3qSAaN1TuXpcCdYs5ml1VyGDllZGJZ2w0LuggCmt2SO0IJKTLvOj12tby6Ym+824A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U5H3X8LPRMK+E8u2jWVRD4iZw84dDKa2SW0Fht55kXa1Y9BLvgZ2U9isovIYg5N8j0M84h/tvokR/Ft40cSCsFEaMmirg/1WqGueF77XekfDmwXIm04qcgSMShdAybRpNccYkdkUnpqmZZrxEDEDKqqqSge8MIU+TWBlLMpJQl16j4hNBxxp6NX/idz5NEQaktLG63x2K6vTj7DtvaaZM6ln9rhxb6j+BbpBbatjS3t8r1eB12n+N0/1BA3pQZRWEYTDRICAQh9qIvuSRpT7V8BuMtbROFCdfEe65cY8r1HwPj5Tg4JwbjZGIAf77GoWWKOtH2ot89siLwJtVyv5v9xtfJw07kAGX0+URdhDdLgYa1f0wdalPOIwm9ODTElDKPS4XqwQOMusRDNl36bsjCOsdzWlNMM/ZvdKpVuaxZwc0dkkEf7MEoC36bKfxnvc
X-Exchange-RoutingPolicyChecked: 
	LFk6O0JDVqVszg9FZqwv5lDsJ+viTCA5LkbxSWZsBi1SURLrv11G+u4IPMr56XQFrGnbeKiXU1ajewjTJ8gH9HWQo2Q3kxAYfSPYedm+0xP4JMDKO/kh2slHeYv51HhooLTlO1fEZsEa8plVSezXa73/GkW0yGWuWFWmkCRvd6opXcmxq8+UxXdVLQ0vDHS9GvpiihDatDnzjUG1qttJV7rXrLGLSvndrENpS3QAt7RkiKVla/yaizDJsVcQIgISgxK3VdC+KEngP49RNE9qAZxGwd1BOGlTTgZyOB30mRf5vUDMDSrawITxDVCKnAzSVvo5RNw29o+DijLrJrSFMQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 20:50:46.9596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2225cf69-b8f1-4f62-928c-08dee44513e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5780
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfX0ozMMPe5srxJ
 rPH8Ex3T1abp9SyG3nqLZmN+z9jJxj3x8Df17FXFuIxxYIVzuA57MVs0Qgca1v2bxqNb2ElsulQ
 hv/AybrhsSrTiOQZhzWmaUVl5EbRIyc=
X-Proofpoint-GUID: AM58r_7hr70vWeW86bLrsv2iuBql1bIC
X-Authority-Analysis: v=2.4 cv=M7F97Sws c=1 sm=1 tr=0 ts=6a5a95ab cx=c_pps
 a=TofqhMGnQVwdh0HkHXulOg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=1VxDqnHFAAAA:8 a=U0T6FScvYC5zaxGiDpMA:9 a=aZ5uHUMKh6B-zo3GvD48:22
X-Proofpoint-ORIG-GUID: AM58r_7hr70vWeW86bLrsv2iuBql1bIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxNCBTYWx0ZWRfXyJaB4JLlKUQU
 G2NEAuLNKZ/RR2EsDRk1etsj1DbMYkgn2Bc9UiKRAuF+77j1RZOu+MHN1dNN4uDuUL7Y+Ggn2T0
 AHK8D7LRmr82QhUOcvFRMDUB7XemSDw3jetFWZLBUCtXSwFUu2bYu4Ud7FmQU1sPR0Z+1nwOUeG
 TN9wv16vyrYkZ4V+t1zRb67spOOai0CcDTzuFj5zWnknr0vwEUlFk86IQ9RZpnAcLWFXGKmal2B
 C3+YqsjQMzQo2BOX5DT4fKVXnqsrZETAfaF9ZXnHuEv9UNVbRa0eqcQhgAzHU0Wwya9KB7FEOra
 L78olgpo45XSACzvfA7vpKtZY/GJqeFuGqK0lgqt+aSiX3rZGWkC/b/vEZvIdtQygMmhSIyzE6G
 O79L4gDI08Yv4HQIHoqfbA/9T68hvSTTCUXhAsMMPuAYn/RAbM5g8MwWkQPOf+y5w4PQKFVS5eQ
 GfDuKDMrqSAYo12Inuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170214
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 17 Jul 2026 20:51:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20165

From: Ryan Eatmon <reatmon@ti.com>

Updated the value(s) for:
  u-boot-ti-mainline: PV,SRCREV_uboot

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 2daf86f9..9bec7c90 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,8 +2,8 @@ require u-boot-ti.inc
 
 SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2026.04"
+PV = "2026.07"
 
 UBOOT_GIT_URI = "git://git.u-boot-project.org/u-boot/u-boot.git"
 
-SRCREV_uboot = "88dc2788777babfd6322fa655df549a019aa1e69"
+SRCREV_uboot = "ece349ade2973e220f524ce59e59711cc919263f"
-- 
2.43.0


