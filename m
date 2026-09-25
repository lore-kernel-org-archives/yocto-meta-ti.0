Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF352C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 21:13:49 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8321.1790370828083776278
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2026 14:13:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kdFrPS9l;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=i1HyoxQ5;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIp6qX2801809;
	Fri, 25 Sep 2026 16:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=vS+zlnSDpBUDIn8lhhTpgiz0rJWRAdjQCOe5k7/0F
	co=; b=kdFrPS9l/PN7RcRhlLorkrrNTeNAKYnpivHCUw47oGIAJ7lPtr/fxfWTT
	K6adPcguoE2ltLiaPm5arQBenxdjt+eZm+8JN0i4J7SY/DAIj0QMwxt1ZB0u+9t2
	Ar/YY8lGK25jxmOST3E5H9H7WEOO8RdIYr+SL5qZPC+NfWU+2jTTAsfWa2fP+ja4
	Jc7SJrVveeTgOO+LkKPrUB3stjtRfgAJctLX/WCN9RassPrunmlSAVHUKSqSG5Tu
	aqdXi4Re2A2YvhLT6lvOUKUdgGKLy6PIVYNo11N335AETQ/VspMrgo0/HOIb3aT1
	nwjPnQ7qwnXBuQer3p86jpVOSs9FA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013069.outbound.protection.outlook.com [40.107.201.69])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gwtcnteff-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 25 Sep 2026 16:13:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vB8JA3yztdKAcjKCC6oEi4rEwBFte0L8WAOrAT9uJfqWXEdFTwOnOATYrG/RE7mU6xjt2YgWKI9EPxY5E2B61GKKC7rHFMmHsO2SN2fHFLe4S8n+vaQX85ylNIyLTxuvMtpXb9ehwoONcw84q+pXwItj61vY7/+dXR1OT93AXcXDTbBvvfWkfJry/aYKLpwAYBdsDwwnfNA4liyWQ2+3Dv2V/+IFIEnPXgg+Dboe4AN3m9jLe58UgZKxt1ep1uHiLwYwlzXAVmoWsSkkjst+5io9E3K5BdFBdMvFgonbEXZX/JfjiIYTtkfm9XWJ/IQo2gfivGHLqReYhyZBFTVKxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vS+zlnSDpBUDIn8lhhTpgiz0rJWRAdjQCOe5k7/0Fco=;
 b=y9LZvN9Sr8A3Rxx9BgYCvf1br5bVUfq652IIn1pHHYY/Q5AphvqJqMvm6rU4MNK9jLXqpjzyZ6A6S8T1bmy7Btt6m5RHGsXFKFLVN4cv1T98+Wx288uUZXPPi1xBbBlnbgaoj2wkwEA6DjokHm69n1zFSREvFUEO2PhsW+1hBhukpGOEeFCDM/1BqqVIZXH4hgXho04D0iZ/TzLcsY+h5UxGo7pKYBJPUC0CYTKY9KDlCNYh0ApyCxrktvBxWS0yvDXYtn0qTB9pjF83io5wvd6H3yid0x2R+5rKJmmy5wgGeVObQQfJXKk9J3DuDMSgCliV7cPZcMq20weOzSW1WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vS+zlnSDpBUDIn8lhhTpgiz0rJWRAdjQCOe5k7/0Fco=;
 b=i1HyoxQ5x2aGg7pudOVsrdftXeQTgmp3fAAI73YAEq9iT2+ZqwjKoKGppMQZ5+L+bGffeC8yTv1WAlpqQeafgf+sfZyif8Pq/NjEUTb8qMRd2ZFy8rIFX3vsbdklKn+uf8Q/g8Vv+88cKA/ErwfdlsfrECxvfmEkjzbRMGZ6o0rHItvPDfs+Ff3dbASMAEE9OlStJBz6Z0VxCQdhP4a5hHqu3N0tVEI1UY17wvxkhUv8qq5n9eu4i6jJtqg2iFDCeM87FcXzdfqHzFKO+qFOLh2iV240VY5f7lktYAOgyD33tlclmiOKRjDT6ISNI6rcNjeEoCoQ8r9JS5HEBdHJCA==
Received: from SJ0PR13CA0137.namprd13.prod.outlook.com (2603:10b6:a03:2c6::22)
 by CY8PR10MB6780.namprd10.prod.outlook.com (2603:10b6:930:9b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Fri, 25 Sep
 2026 21:13:43 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::12) by SJ0PR13CA0137.outlook.office365.com
 (2603:10b6:a03:2c6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Fri,
 25 Sep 2026 21:13:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 21:13:43 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 16:13:30 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 16:13:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 16:13:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PLDUNN3465092;
	Fri, 25 Sep 2026 16:13:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C83C19A9C4; Fri, 25 Sep 2026 16:13:29 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609251030
Date: Fri, 25 Sep 2026 16:13:29 -0500
Message-ID: <20260925211329.3751026-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260925205219.1830878-1-lcpdbld@list.ti.com>
References: <20260925205219.1830878-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|CY8PR10MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: d68c8ffe-70b6-49dd-2717-08df1b49e133
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	oA0xB8RVKaeQQAIdVJw7mzUhYuXwPJKP3dZrOVUwvrIA0s4Hi7CFRYur91o01Ym/VmDI4j4QLng7ITh9L9dlR+h7ckjD51juIXqM8ZxXeM/9BF47qPbhV73UQdvD1jihqBKwHjD/U8oyAa3caytTcaimyHPmTxR5sgeAEIoqOKmxPhPXLtl+/GhVLBopzJL2hEg1Q+ZKVMhIISEIsWNbQMD9Oa6KyKAujJ4/BSWqZ1jP3ukyvtRUhpppKYbAVkUnQCH68N0xHiWFlMi8gKENyq/z+1qE5OMRm3V1MZwAMbsq8+hEMbZDMKYvIaQHXtYufK3XBrO2K0vH2Te1WeuazYcmtUjFv9C4izaWFvEXbEqhxzqwsBNTnv9U/bUJt5NW22w9i4ZnOjKJyLrGc+CShUHSqE4nc2d3gO2hicbgYq3PprQEQdfjdToY3eX5fgWCZ9G2qTANVzNgpbJMR1EyZpA+f1SXmmGMRePzuZPqMqqAW3wEkPDZ4pdwRKOHbplGUqoXe/dTB5fo2xNxzBCPARvmPEWzAiEE/Kjed5rVzvb9vIq/QJOUbaIWuzKwEkEWh7AShiUh6B74U4RodEwvwjWrJflEaNoKCcyTIk6Jl5F49GX0pKaRhRyWhq3FJ6yMGYJPbGP0V7X+B8zlosNOuEWDson/QgTJ1l16LlwCthUHVT2/EHt4CILv7TLzyFWPiChdenOJUcfZH2yu8/gb2Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	6jx/nGwI+H4UF6ryImhVDdsuaUY+PsTgJiqIK59V297+wvlA/v3+AJddcKTcHHTz7q0L8Zvhfsn5V/nJ6ncoq1myn8Y8ITIW2B44xctbUhGY0B/cFz4o/Tny3C12wwakDDyZL5KptKMNkZlh/jTMNWQe19PmjJ+4ow6ES/GUu9QgUPWVeFrmDT0KRvQVVum8xAUqQnmusMXYwwqDkQ/5DgWoB6FNr0LzeCvVZzc43DTh1Hv1UgVlq4PHBkF8o0inL+pS3xkqejyQdmRGHpthhrgq8fo0t6wUWfyNNRG/RdM7EWatrm3Zv9WnALptmEJQnIx0EMSAiqAnItLwKxIejvjLcv++I9exaVbtSwujUXgbSSR8Q2iBOxwn1hCI0gyzSveYeIsKJrJE7h40BUWTrE2SjNL9imFXHhYjssVVWKCXeYED41nS4TugWQ4JhuAn
X-Exchange-RoutingPolicyChecked: 
	R+DbndxtCkLiWdxK6uxKwlu5DQoOZ8lv1XA7syUmtSER2M6zXd1BCBHcSb1hRqyJL/4G6iYqSpLI25FF7TWxNm9XFP4v9m5Efiavhq5FGx4+Qjd9CL7UOaqZ+Rhasg2lsK/NtWBKzPUADlBPsOvcDC6ppyjKBskh7akcKbaL+RLdcW/IfqyWEn6x07b0cUwKscY4x7sYZVpTug1yYLJNPE0D/MJYT0INaL6T7SyepvR1Y21KMXyKcmFGsc4Kbztqqt2VNEyhRIznot35PRoCxwLu5JcUmBNflIVrDXfTkkcIWv3cwKbzypFtIhT5QR0SwvKUt3BuA5arXeQDUTcn8A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 21:13:43.3348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d68c8ffe-70b6-49dd-2717-08df1b49e133
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6780
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4NCBTYWx0ZWRfX1pYGOW1F0BtR
 2xkH3u25mS6Ofli6ETpm1pHz64cCY/hFnhZ1eofTCQBVdhP/GApN3BLO/fwXAfeu64NtDhlbhdB
 +7rk7E/cmPEc8GE14kGfY4357nfLKEU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4NCBTYWx0ZWRfX+dZoCx3NjTfh
 9P5BfLJc1yyZXMkn2EfXy+nY2MDTZCyW01txVCCmVgDwYXpWkGg5nJQ/ZfkhnW/ufV0mtmWuZLD
 gFQqfstoDyih4fb22cGVS7q/jch3FsZl4aRXcE2MxFjJ7YYEA9zx7uVC56g8slJ8dDa+KlTdMxy
 ZFrr3EReofvpru3Q8On2tuI14c6S6xU5rwg4eqQpSPMK5/s48dpLWhPwCXEVXNtHwWjQ1lKA/AD
 3aRg9GwuEhYZrnOLkpM1VlsT6wp2M/L54gEJ1zUvHX9BVL2IA+acVsvFC4cFvWdNqKnxw1z2aKQ
 UMZjI9IHT2enRXF3xh07RXj35Tzu/9C3bZIS1VyxWC2orbuRKnZJIr7s3l0chsqx2E8oYhRJDKy
 eLBbzs5oo7v/CpmryBgESlyUG2fxs60X13voJLRrQSiKWRNym83nI/lje283F+KTH2qmTQrHXvb
 gN0g5vRChGWe0F55XBQ==
X-Proofpoint-ORIG-GUID: 6su0ik122oQivgx6xGZWOSTLQetw2xLs
X-Authority-Analysis: v=2.4 cv=P6evFSAu c=1 sm=1 tr=0 ts=6ab6e40a cx=c_pps
 a=x8MjW6KKBoBq+i/1BMmcjA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=0X1bhWsLoCszwO9y6AwA:9
X-Proofpoint-GUID: 6su0ik122oQivgx6xGZWOSTLQetw2xLs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250084
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 21:13:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20421

meta-ti / na / 20260925205219.1830878-1-lcpdbld

PRC Results: PASS

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
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609251030
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 25 Sep 2026 15:52:19 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 05d247252263269f83d7790a4f8657695e94c93a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: b3289ac57108fa7bb1748daf79950cebd6f1bd17

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




