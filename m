Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D18D1C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 00:40:33 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34735.1782866428504026124
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 17:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=k5ZZpXae;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=NJyjhuQi;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNL5EY2107884;
	Tue, 30 Jun 2026 19:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=IGFsUzqZ9cd2e+EvOpUgtg1aScaT/QGxHOlm87qSK
	28=; b=k5ZZpXaeG+AlH5+cgwZnp9AXWEarO2bzrhQ/gauzJEUnTRACJWjctZtMn
	01ksJE+c9gQTEa9LwDPCT+x953+eS6eerYpj+03lexZYqQtltGg8Szfv19Nsm9un
	jIbZypUf3SOumpup+0gLRK47X0cP5cR/4Ok24YkUqGu+7GVq3BarWACPNpfYWLcr
	is0mm4SoZLdMJeLTTZC8CY6VLNtlAJjMN4FAACW7ir9bVFjDSAiFuI/ikMw9fPBH
	Lrd7E6XVNpgxdQ+jktq7FTdh2w/oSbI4fEbCny3RWbAkCEPQ9A26arHfZHPTkGmV
	x+EgzIi5XuDSaflHCjAhXCJm0PLMg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013022.outbound.protection.outlook.com [40.93.196.22])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f4cpvv7sn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 19:40:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ij/bv+TwdMn6Yh5XH+MWsl0HpdCPYIzWpxzlk76bb733hvgyhRPshJiVhMR0xRUdD/UszZtovvsXszdZNl/Qoif5RHdxEVCGkz8srqqILid4AjHgI/za3auqnikx/aYnEgV4jQDAOIizbjZuQK39NpzG1WHVc99vLOcwfgwz4D8aRXlvci+kt1OGOboycox4Vp5Qz7g/3jqn0YJlCyuuvM//TFfhj/M4iQfuBe/0iFI/X8t5ykEbtPqIQAteHRrXmKJLm1yRJNGUMACFhu+dwzQPYVHpevyC9aYTJshDFNySkFRgfh9BNTPgQgvy5oXbkgvaVt/RdQJppF7Q43hgPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGFsUzqZ9cd2e+EvOpUgtg1aScaT/QGxHOlm87qSK28=;
 b=MIRXmKgKo/3xnR2jfD4UdGaKH54vEi1kg2gDC7Pu+F+0mz667CSSu0vOI981JeE34Jpl+88qVE2BfmysHFft5taGG9te7oLUuepDOettxuePJVsy8dH0ekjU6DVm4zRQ4M18oPn1nsfKIXoIqrfgx6pXEXYnjulWhiI/Osy4vkHx/JTlP8H/aCWSwt3krjbW20tfmJ5IjG5rJjFE6ech6JoGi02INX4P70bnxzGPSuuW04jeH4zpbwEiya22Dv2K0Z5DhpdztPlPxfblpcO0aa4D5cFxRjqd9nkAut/R+TKXeIDPhF25RNREX9Tf2MKD4bcJ1v3WwA2f8pIr1ev+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGFsUzqZ9cd2e+EvOpUgtg1aScaT/QGxHOlm87qSK28=;
 b=NJyjhuQicmlOtCAIL5n6sUOyqcoTB9qqweLG3qqAwVzmk/mGTImvuY9bGYBO24dNLUnGJaBsRKZspx8lnTggRuTiXOBqtmNjKOV/7ia0TgyLSn9we08lKsWvDrS2CtsP5JtedEHrB35z5jPThff+oxfsHT+7tmJb+9bBbXSgMv3AYpa8Ae0ivYqB0YzXWZS/LR4JqBJ/brYqAoNwNR/7e+R/PNDuSPvUFR6X2Br6vFmbFIMQVNUmtwrHnBe0Jv9BvKYnvYW3+JdQrLLY3R53yzV/3bQ4P54v+A4XIVnnAhggiw9/Ixg6lIS31fod5Pk598cEvRBSqsRYuc1BnAjGzw==
Received: from BL1P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::17)
 by CY5PR10MB5915.namprd10.prod.outlook.com (2603:10b6:930:2d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 00:40:23 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:5b5:cafe::84) by BL1P221CA0039.outlook.office365.com
 (2603:10b6:208:5b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Wed, 1
 Jul 2026 00:40:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 00:40:22 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 19:40:22 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 19:40:22 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 19:40:21 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6610eMGY754931;
	Tue, 30 Jun 2026 19:40:22 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 14FFB9ACF4; Tue, 30 Jun 2026 19:40:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>,
        Andrew Davis
	<afd@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH v2] meta-beagle: Fix BeagleBadge build
Date: Tue, 30 Jun 2026 19:40:22 -0500
Message-ID: <20260701004022.4113987-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260701003703.1702137-1-jm@ti.com>
References: <20260701003703.1702137-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|CY5PR10MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: a4cbba60-3cff-4308-3afc-08ded70955e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|13003099007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	x14lGI+vXvSTidDxcz/weWJnEJkfnvuXgkG2P4OMOc4YAfi5GC2jKOaGZDvej3uWMhoB/0B6QOGR4JyNKKcVk255D2tXulL7lswkcmFXvYg8LKxhcwJ/pI75yvGSaf5tgQjnfpp11zEzf85dy1gte2/xm8/4rs0j6b/lKclxSUgtbTEHpqUIICeqbOsEIQrzz/2RW/ycwSXHTMHHDE/4IrYZ6VajLTEUQwMHpjWRsu0r+oj1TzCLisRSvigKhLUOFVfsOsMCmlrBYvbgd1xmvBUe9qDCDa+2CJM+TFFsJtq1D55lc1+w+FmIx2LuoyfwChuiXYIgybUuvVezQPvhXDQEMFMD42DtIrtbUQ25ulN4ho0Ib/pIz0rvVigWkOXdjK+/SSQSmkuHj0Cf1t+V6dWtQ+KjmLhdd1wzTHzGei7BPwO/V92ypKTNZ3OXtcsB0mNsthqAAXzkHZvKNkYf6n+VTiJXNuPnnTuz3MM4NAhAhTj/9ON6QltywRdswwTmAy5fkDiSbNVTZyRdQI8G2w/2u45uxCD10Iu6LQKswjbJY+M/yfUWtSxWy82uDPpHDp3WZYbuUP0eEegx5PO6itB9u277I7KI2T7Kjywljbp3Q5uipBa1cqujbE3aRbF81JhVzb3MHEiWrI3yFy1RdI5uA9JrQxJVbgP/q1aTq0fyvLCu665eGQBZyHmpGTvSBu/t/jLNK/00CuCMw1hv0g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tUyxYQifUG+y+C/mUQo/CnDPPeOOdh1hm65V77mZQC/gtl8JPyZPmnDfp4CcjftIbkIHuVfFhAcd0cMDK8AM2+4YjtgB/heQvVV7rr7kdUdteNTR8dwEQyLPeh29wtbM5ec1D3fCFgsvvfzIjZrBd7BBVitCoYg1Urdj6e9MERXgaRD5lCV6hWcoLAjnSSYdE7iDO4aShxsXRCYa101uWmOasUbzI0QpmezzqVgQ8xuj3io7VpODaSGX1QBIrR96E7ky7baZ0JRkNgs8kt4JHfH1q44wlUNVuWUNYcgVbXpoQunvVFA50Dr1b/nnFZPG8vUKUQVcJo1/Unx1ljrtVQ3FbDAtsVCnNRM1m9aX2frdbcSl1FcID+XPcdwTIg9juXTH5NtkTqzVwj/RdV0G0TKB4aeAhBICxaR70EyglQB9ao5V9uOkTDLFhTDkSCCc
X-Exchange-RoutingPolicyChecked: 
	AgFGeMG50ySpkxyPMfwdvOzPWVQuFApNYwZV7tNLwoZ7iwY1op+qGWLw0RYDcdXnpPFqKxaLLxTzE62GyXYd52fa5wTjTDClr2lH1pdY8wwB3LxTCxcpxCrw4v8puovx+qSTGoYa6kfgmo/03bEHOiVH6abCmhZhehEVrRQ5llqphwV26ALL3DGnpHYcSx4eOfN9Lz57Smnjs3jfvmPDWoVVpMZVz9K+zzqGE1ctiwLX6M8iKOx1rTsP3NclRNVOy/WNIls/iwHAd6rdj2mv9Hu9OfWN4elm6m8zVtw1VpKzp+0mvvV5H7Soz8A6EVRQcNNCQyVxtF2Ylny/wagUDQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 00:40:22.7751
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4cbba60-3cff-4308-3afc-08ded70955e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB5915
X-Authority-Analysis: v=2.4 cv=c6abhx9l c=1 sm=1 tr=0 ts=6a4461fa cx=c_pps
 a=qsyMIk/BGg5Z0bsE9ajWQQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=F5I0a5icvDqUDrdtDowA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAwNCBTYWx0ZWRfXyRN6MzDSOH+k
 ds5Dorp/+7T71lZiKwJdaUGDDgVm6loWsD6yhalwR1xrIKRIZrp1ZgeFHgaMxMEfDCYnm/6L4F+
 xhT7ssWrrbrXAQi7aXoLm6hj1s6YzL0=
X-Proofpoint-GUID: ADnStuf_Qg5pH0RRZxsEENJ13b-JyEHM
X-Proofpoint-ORIG-GUID: ADnStuf_Qg5pH0RRZxsEENJ13b-JyEHM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAwNCBTYWx0ZWRfX8m8CFNznbj5x
 BP61bT7klH665hjh5/0tQUY/T/dRcWVKzfF4kYneNXA85QkUmLJqjVrFBQcnCc+Fkh4SD/Xl7Zu
 OKa7gn2m0iTC3MgeLOcIgsxtddEEkGCK1hyqX0KTQxKhDm5G4Obc7NOcIjbB798ADjhxfh14ezR
 gQIUH6Ehjl+UIrAm2Q//MA/ZqXf/X/cTd6Hh7/Gt0MU2U2qOwCO1ZwwETNJmMofq+OU15PQwP8D
 w3qy8tDImTeKNyGN089R7cDqAgMGcW5VV7DIbyKFxzRI07WKbeKNFnPENIm8FKSiMI0TpC9ZJAc
 mxwMgUcXvPj92zmvg6BT2iET/1Kh2+VFKdgIY8VVdf1r3awrTb/XMxwHW/9wfUX9brfFR9VP8Zn
 pZdU1H7AZsYZKwIFR4wnrqZWf5F91v5E43YfpEmakFwTjtd6VBTnWVnDYOwUCKxvA9wsdoYQVr/
 BOaWY9QS07RYSQlgIzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010004
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jul 2026 00:40:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20113

meta-ti / na / 20260701003703.1702137-1-jm

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH v2] meta-beagle: Fix BeagleBadge build
    WARN: Commit message does not include file/recipe name: meta-beagle: Fix BeagleBadge build. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-beagle: Fix BeagleBadge build.
              meta-beagle (COMMIT-MESSAGE-3)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] meta-beagle: Fix BeagleBadge build
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Tue, 30 Jun 2026 19:37:03 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f506bc5bb2492280bf15b4599604d41bae6f7bb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: libsdl2: Set runtime dependency for SDL2 tests
- Commit SHA: dc30b5847fcb72eb7d6e7d4461bd5b3a492fb66b

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH v2] meta-beagle: Fix BeagleBadge build
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Tue, 30 Jun 2026 19:37:03 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2f506bc5bb2492280bf15b4599604d41bae6f7bb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: libsdl2: Set runtime dependency for SDL2 tests
- Commit SHA: 77289b29557f8cd8d0e85eb2ef78ef333d45cf71

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
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887

wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




