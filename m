Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A42C79FA0
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 09:31:41 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3194.1788859896493429684
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Sep 2026 02:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Eya2gbbh;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=JtptbGwH;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68898cN11384067
	for <meta-ti@lists.yoctoproject.org>; Tue, 8 Sep 2026 04:31:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=hyq3Cdi7XCRZhhRSRPI1QWQmrh7//XtUEflBgbpX0
	Ys=; b=Eya2gbbhxqLKkcuJimLExBqzSClD0KxbAiOOxotLogJsiMUyYNZX046jK
	o3XWnlUJ2dd/VUKDFRsE5C5o8LKuEW8v5qdJBBYCGao6nzA954TuVK+8X87CDK8z
	YNsBHgsTWVXWkNhVGH+M2PaITx1jBMw+Lco39NWHc+RKijZkY6PKXRWwz3EmM55h
	5v2lF3leDQu+ArWKH5FktnzP2GSb5tZUZrtAdHkWS9Ka56AV537ik1g+bsjwIZwX
	Qno9IQFCXFuU6crg06CQgRhwru/sW7fEhzJgstR59xhIL4ECRF4q4DY/moXmNSZo
	gYvaxy6I9QrKzhRO+TaTTBPgzJfOQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gjffmr3dn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 04:31:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fWMY1GtzBm05nS4c3EioCN1+9pHYFz3U5ywt4MzXZe5h6atwf7BJKGtBnWHeYqNnyRasdZy9vIrU8brTG/Y5YA5PAngMLmtAD5m5UEhLIlsgQIO/cSCji1ONy1PQVSfcN1NiFuQA2Oe/2Hxu/mWta6V4D2Raklb8Wo3wiOxa5J6F6+lJihb9KHHcKYKBsph9EVwGo1dxRdhAi/koJmE6j/ov3yiJIpoA0Holwo2Z9xpudFRu3PiX7IAhUOGhFezmamNfH0sM9zfRiwghmM65I2QN8keCX7Gsf+EBdvf5XUltTKiw/heVZ7FrbS+5N5cg8H6dQbPaqKJ4mmLoIuUogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyq3Cdi7XCRZhhRSRPI1QWQmrh7//XtUEflBgbpX0Ys=;
 b=tuxVQ5uFyLqk5Xnm5M4eiXINt2mT5JS0KYkO3CqKV8vSIRk9E143zjkOWMO9lRpbR6cbiP3ONzPBHmBMgJxokiK+5Sm41tmdfUfJLPOyFgXKaWgmw8AtRccUO09mefaa6Q3syvGtJ0+0g1DvPrJf1yAliLwQcjC/u72SyoXyGg5x+PQSAFnDiUWiUzZAGJWzhqWdC0f+A+tEi0GxAH+xgaNGyx/zVTOWBxWW/MSGDIHwk+ONAAm73u507T5IMXxoHmhsFQoFguxrLI091yo0kT92WJd1C7FWLfhWW40cmOB8haoPrw28PzK5FiLuzYSOfJfJJamcB5Xi8AkDpRETVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyq3Cdi7XCRZhhRSRPI1QWQmrh7//XtUEflBgbpX0Ys=;
 b=JtptbGwHQo8OgHFb20be1Zsltd3g1Nc+FTJo0tcCXf28UdHoAXIrPvve3NL67YDJWJ42nrJMsqizZt8tWhFQqa+yQ74s3ZyT+1plFUfbkxyQLmNJmrVkS0KH738EVh6ZB3ZdHyiOc+8PSlzE1/ZT05eEVhe5CQQEcXOnwc9ENCFP0GS7aATAAgzDT39VZMTLv2F7gbOEnPGSxDMGLMT/sRDckuJV3H2d/SHmiqSp51QqmcSBfdwmJWaPfrReGEMLOBVxeL6RcPaGb+KJ2jv/WwCS7UVcduJCrGGrYOKrArHkvTPCm1YDfAaXpkU5nZA3dDypNQI2VI7ZWOYZ9hhN/Q==
Received: from BN0PR04CA0168.namprd04.prod.outlook.com (2603:10b6:408:eb::23)
 by PH3PPF63308C95B.namprd10.prod.outlook.com (2603:10b6:518:1::7a8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Tue, 8 Sep 2026
 09:31:29 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:408:eb:cafe::5e) by BN0PR04CA0168.outlook.office365.com
 (2603:10b6:408:eb::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 09:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 09:31:28 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:31:19 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 04:31:19 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 04:31:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6889VINi1032085;
	Tue, 8 Sep 2026 04:31:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 3DB4B9A9C2; Tue,  8 Sep 2026 04:31:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Atharv Dubey <a-dubey@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <m-shah@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>
Subject: Re: [meta-ti][master][PATCH v3 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Tue, 8 Sep 2026 04:31:18 -0500
Message-ID: <20260908093118.676175-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260908092747.4047556-1-a-dubey@ti.com>
References: <20260908092747.4047556-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|PH3PPF63308C95B:EE_
X-MS-Office365-Filtering-Correlation-Id: abbb57aa-6803-4935-41a4-08df0d8bf5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|23010399003|82310400026|13003099007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ZDMJ8w9+PlkWbZQGlOUvyUMw0abKHolWagAcqm0fdoCa2mWqt/h+PSV+oKzzAVU5dpTaxOJLZkbn7hYd2vdJrVBvIqNPlqqNTrd41Kop5C/hhMwIwrcO5sIsrgBcDAI2znKWupB3QLbD0i0tl2Lz2CWu5ClwW91WBkGBMMqcTFSLcBDc18f0D2lBY7gZVG/Vo9TjE4OjbIyPPGvLXyStCek1jGbadoLQK2+1wyh3MGmR/3uZCIqqkwbJZhKmiGUX0Yw4YcYo/o58YJq3N6DVur0pfIXoo2YaV4e4QMrVSNyRgCxTXNJpKZlDrmkB8cOmdrVYwYGNKwLVWkhAJ83cWwDUpfTVWq5sWmS3jIF9xYwhmVOr7bi77qc+dOpd8Op/u2KhHxVCamyUZ5XDSAlEvqsZYYwkj0vQW3FusFJbBUX39NxVU0+3mbrcdEuFD68LCBmHmUQQd8R6iCO/kKpB9cDUhdffK84XlMNMKWuc+uyujtB9pThMCwzsyeO54bmgLzHIWhRmXQsuykFw1xk/pfKntclPZkq8/y8qPmx0B9D6WNcHb0d5ZSSlocYL6iwMrgVYJRnmfLAR6Cf+vxp5s8O6JO6GNdKwlvIYAsjhAAVqy1DqcnutLwRmpXnZoQYK47xGvd4ZTAB4D1zUp3Gw2A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(23010399003)(82310400026)(13003099007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	j7qyHVm4/NOv07EzKoL4L2rRgoPCXwWAQW2EtLCF8ej8Mc58qsrG1J7Rb6czup2tHI/5Zs3pKOKt1gtoNE8QItqqN+GFAv3vjmqcprNam3RwHTmgkTA8aJvjuFtkLViD1+hpsNBnsDQPEkM5e5PiXO213T3H13EWpC39L3mAzrkuVtNXvzEWI/s1SXpCUwTBY5n/mfvDjeUF3R1ZLib4yU31QMP8jLEMtaJ+wOSua3BIGu5Kan8m6ygNSgpeQYUO3EnzXhg4dYSNrR06ILG1MbfsKfO7Eb3mkVRyK8JpeDeq5nX65gYbyYPgA0XgisENeaYAKLDZ3RepRgVhN87iiuwj5MeD/qjFdK0yNDT9oIZHYQCuDBx3VKmM35Ifl2WLKdrV5OyWEu+jJwftyorjgG8EtjVJN17T1qaXNwZtgHgLsXG4IBRRZrxxnuCpcCGu
X-Exchange-RoutingPolicyChecked: 
	z5C2G2y+f9xFNPW+ze5cToUCa0oj25o06EWlA2KDkUQMZoELRCqJM+3hYCVf+x9vTEIh0mLyhmaOC1iL6WXlxTKAoQZtdnlbp5Q05gvQXXLqnzMjHC2lF4ClxSWFLwUN8y5nkHU2y5812fs6iL+dwe3zVjDE9/Zj8U9YrkSGhqFkiqQoyque+R5H5bRGRLqmI7INxnv5gzRrJSCFu8u8IXJOjUs9f4xK3j2uC9fa305WLcSkJNKfns0IceUPacQQvfpO5ZahmtETxye+9/bm5nJ2dCQ5p0yvRIbOfIc+PZgzZkgozjQKVUM5yRDIN2/aFOw7xWRSL0yFPt5XhJlw/A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 09:31:28.3295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abbb57aa-6803-4935-41a4-08df0d8bf5c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF63308C95B
X-Authority-Analysis: v=2.4 cv=FewHAp+6 c=1 sm=1 tr=0 ts=6a9fd5f8 cx=c_pps
 a=bquUzJqYOqw1EpBvECFzMQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=c8CNJWBKNYTIPt75JZMA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: y-YfZPgfRvxOmfwgVFTAM-u4dVf-SwvU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwMCBTYWx0ZWRfX3WNEy6cZzxfo
 Sviv05U9PXHeb2ufWVGr5dmUxmPFZQKh4IwYrZXgf2JaXWNJ7eEv7CR8aGvUJIbEWyEO07VLMwN
 gdzGwQ7CbH211sbuZEUMBLL9RWF3yl4EUgpbegeRs/YpPMOYikYBulaHGCwhb+pdTdGBi2GuT/H
 qpzrbYBYeWEim+SIK9S/ov4sF3eYk7PQldBMFhi5a9OSFWTfnEbk7w+461MUDoTGhkVuNsevJHU
 YxI2hc0y6RAvH9+pOZrVIWux5YbURBcDrJ+n5QtxIieVfquCaH8dvDSSf+QRWRcpVzVDMj883Pk
 ydoK2Sm79tyqie6btxMJn5AwdxptB59QjEcC07qih6xOG2ZO4G5Ec5f8zm8/cSoSpXwe+Na9WLV
 Fejb/jfB8jpbMAvz9EYlvFAHiPPKR82/85O1tIakMz5GyVWLl0EatDstcjKBYs8+vmCutL4EGzj
 8V1VgfD4YYCrqksjDKA==
X-Proofpoint-GUID: y-YfZPgfRvxOmfwgVFTAM-u4dVf-SwvU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwMCBTYWx0ZWRfX/43m45Pjo6Am
 9sHU9vw4T1n514CKA83sX1IRKKv6GR5B1Kg+mcMIg6INewUp+SwJHh7Gxg2V9w7nuJv4AnqrHRb
 M3HdA76cvS7R7gGx6KXM9VSSJ2+MdBQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080100
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Sep 2026 09:31:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20347

meta-ti / na / 20260908092747.4047556-1-a-dubey

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v3 2/3] linux-ti-staging: Add dm-verity kernel config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v3 3/3] tisdk-uenv: Load dm-verity initramfs from U-Boot boot script
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v3 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
- Submitter: From: Atharv Dubey <a-dubey@ti.com>
- Date: Date: Tue, 8 Sep 2026 14:57:45 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: a144a2ef70131579f1d453976dafc54f899ef6b8

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609011013
- Commit SHA: 0424eea6b0f3f37e57500b6a65a24cbe39427ad8

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
        meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-aragoconf_%.bbappend
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




