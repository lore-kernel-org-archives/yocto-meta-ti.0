Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07492C4450A
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 17:18:38 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1620.1784049510405712919
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 10:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=gGgZaoVf;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eaEIIhME;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66EGAVaP1255498;
	Tue, 14 Jul 2026 12:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=jKNrLtJNXKHhIs6wmI5dz2o/PkDCdYGoTFUPYDw+a
	Sw=; b=gGgZaoVfZBEdP1EujtJFumhZWVkiRc9uQwbu2ZS/V/S8iF2CP7nKpdH64
	5RUwxJO2BLF0XEoX6qasBaKCP0+P7ZlREN5x5YaEV/W7etIySI6wN2fCke7kXT8p
	zOzonaW7pk2r07/OP8/h8iRVjBNHPiXK5iWGB9fdCsqMNhx8pfaSKPU/MLDG8Xc5
	DS4U7mhBq4v0puVvJl16Hxf2fyd2NRGiFwIngY7rPFBey9xjUSWcYDy4n7ABH2m8
	alXbU0MxKgEwEdc2hi8ao20TCtXXg9lXtO7fnTgFViZokfvQeV4+FxIFtJMadYz3
	cv8bXmF8FEIOVAXTsnYwbRM4ei3MQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010017.outbound.protection.outlook.com [40.93.198.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fdm2dj45u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 12:18:28 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9auok/BlGefc1vGV+sqiaioOqBiuo8JpZX02aC/augn2h8PMe9ckhxBsTi2lha6q9ceo0ICa4/Nf+WMuMhYArgTqTD+4YJ9FESAzeMDCWNwrSOdWEY+zkxTAK3yuY1M7f690+pLc4E1coKIkr5kmTobpC+o9oTaFfFRk/tsLBC6upsME+mnn4ENrDgVKuyPkReEGocKaBcv0dpsz3qfu2G+CBcTy0VlFVvN0kbMIW/WyT26UKblp09S8DZ1/r+mC8Kbdzbha+gY5PUd0rnK7pNd/5Mnc6lD4dDTbs+Ypmqrs6ds9OOrtD9nKVKRDXF9+oL89+kGtHj5MorRubQnAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKNrLtJNXKHhIs6wmI5dz2o/PkDCdYGoTFUPYDw+aSw=;
 b=yKWtmIsYVbf/I0eNL2F+dkc+0MxULT/Ln16DHTcpNnoUV20qjOmVjI0n4HKpFdaqmnD0qZdwPnJsyFBqtd/UVhStT3nbs33FkLFRqYxKQ4zBe5vlYivNyp6A+9+vK9BFgtgrRJHaoT7iG/7jgsecvXchInHqSylxTmn86ZDN9tfBEHfngAlgX1QLkXbpzlVD5ala75qiqC1bmZ1VPUM41EuqvhKjMePHjWiqgAd3bbtk7EJPPfFdPVH3GzhZa8zfxdx7ZPDUaBv2F2pABFOM4r3E4tI4+GTuJiiZdO9p2bmBlWebP7kjv0KKw24D456DIdGMDxCR//DS6dFbcrm9ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKNrLtJNXKHhIs6wmI5dz2o/PkDCdYGoTFUPYDw+aSw=;
 b=eaEIIhMEEBUhiY+Hd5/RqAmSs8INTYBVeA7MxMeZjZ4MkNFuXlna+Se8avGDKvJlJtKq3jziFci/T4w2w6rABHBXPIF+Z+I97uWdoCkvMDZeoYXRWFaf2lsdTnHpFGYLV0m8Vf2oslf0iwHovL0wsV13leUTfmblpcivxe3OX7dY5kGWexD3nQB3/0KhRDJfl7I7oxVBwhRo843ChQDyK4K81O7FPEJYpjMJZbFy8OEsh/4V09nMfzEnOlsJ9dS5+ClGavcsoSdwGrzlblTS0iE1BYer7+XOk1+6kYQteLHhtwDARK1uaCG1qVoJXI2BGvjwfBDgPsSUACJXPhDabg==
Received: from MW4PR04CA0219.namprd04.prod.outlook.com (2603:10b6:303:87::14)
 by IA0PR10MB6796.namprd10.prod.outlook.com (2603:10b6:208:438::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 17:18:24 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:303:87:cafe::49) by MW4PR04CA0219.outlook.office365.com
 (2603:10b6:303:87::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 17:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 17:18:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 12:18:20 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 12:18:20 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 12:18:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66EHIKuP3130343;
	Tue, 14 Jul 2026 12:18:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6992113F529; Tue, 14 Jul 2026 12:18:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] mesa-pvr-24: Fix llvm-config handling
Date: Tue, 14 Jul 2026 12:18:20 -0500
Message-ID: <20260714171820.4014119-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260714165610.3591270-1-reatmon@ti.com>
References: <20260714165610.3591270-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|IA0PR10MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d7eb0e6-ad50-455a-9dc1-08dee1cbe791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	CI7PFrwu4IErjvooWBeOhh7Ml0AEtmmHjbKJYpsXmnJuRgT3w/n9CPXJ2E/9fY8eoszsyAe/CwETCcWkzTZO/juWIoGllUGGSRJih7q3lqyujnVPt6d25cgdgimrOvMDeL4xCtLt7pWuzT4JLN+GXssepD/AJZjrdQWpFWKL5Qpo/ViQM3lC8F0pKwv5gc2//AE2JnQnpDlfRpExrmzevvm50OFsr+CKmJK7l5eOWD9hwmOFQ1Q49c0tyO20QDA9uOenoEK1Ofmbw5RJyGQ1wmFzYoOHNVz3lvgxSk0xtTrDcOgtjWgI7aIW97rJj7aWfLul+xgvKRF4EXxYIxxRlIBEaEwkjWQXubhFCzrXcp4MuKRxOxArWYuQz+JLmjwxNISDmZ4HYBGnIqK3FLq6NlEiawzD5pwq83sYYmEXVrXBwgFkxv7CiFmAbir27LSM4z9oefcRKX2kthTNCHtDU5wsCBotZ19y52RyBXOfql/UJPN6X2nmGPBhxP9td+7O5+SWgUe4/YrZW5HKlwBmqzOIrr1UICIdCOi5D4d3+7AxN8Me9brFSmqR01SUg8u3z4q7GfxsfcXKGlfAWnaI9zGtJm+LIF37tCoP3tImWUWwQnEy5isNFz085o2KhmnqYpzUN6SkhxKbXi99mwVU+35k6/V+v980nL4TKkY2GK4p55h/lTwdxVCRKwR5bNyvmeMXqBwxfkP8c9+02O5UAg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sQGz97CLxqcpM+/9Rdt7zXHbkS3HPNT7hdgzYC/n28NoYcSHVy3otlxGIDSv2bwas8skEUqH6d9J8jlMXkrGgQlY9xD5oIKt4qNxxWUismnbQTpIfyaaypTQtA1KdkvSRzCCCpogxxeFVhng+18ZSxmfinxf6tOlOyRtD/BwqGjbMayW3kbEmqsAS5PAkbz4oimqL2EPZtQ9/jSPHByRP0ApjKDCP8KAa251q3UdnSWGBWOy3x74+r7/pZm0yPrrMZ8slXPDWm2NIvPv1T15YW9ArBSyJ1ykmEaNbRVDY2pA4JGd3TH17rfZQkOXZHv19WKsEiWNVmLsjJ5jQCQPfTLrkF69HqYGO/uwvYsJ+q+86CZzXbr8DMcp1byyHiZ+Mi6432dH6qqrbfeE7iFhCJc31CJ/KFHky9ZbRaDEo0dEQz1AMVD3i75z1Wo0tSVs
X-Exchange-RoutingPolicyChecked: 
	Z/qVH4Z51lPmoA/XCOGCOYk5Os6fGHSaU4DKJNNPXeBLkESsWpr3V59zJ/V3Jwy7Ts0y3OMA9ViST8o4mRkRU/9/5YpLmvvVKTx+G5efHNdXa9dFXwzUhtGitodBWdveKgvbWUJzNZkpV8k+EbvFZTeacepu07vKFC2YtBlgGxRThehmUVFLWIkxbCJvqnPEdn/ml/tcp4Mz9b7rudNzbkZr+377nCsyjCeh6USIuHxdWe/8i8vkasnHeLoJqAF2Aeisbr8HiRmXFxESj3678QEzG5OmAhiOcmtjHFKAZuFkwjWjbPBvYKvGnCf2l4DOu0wsItOVKb1xs9USgC+hVg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 17:18:21.1483
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d7eb0e6-ad50-455a-9dc1-08dee1cbe791
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6796
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX19o89iRhR2Rb
 wuC77OSls5PwgajovuULQzgMox3cb1GSzCm87Hyc1IdwwIHJB+XWVgrPtp3bAo9TH1xWFeC1uEJ
 2Og9U4NkwHb78Y1ZWI4g7prx59yUYZ8=
X-Proofpoint-ORIG-GUID: VfGawG7bOyzT2RDNwuA8_OTLUIGUl-ig
X-Authority-Analysis: v=2.4 cv=f+N4wuyM c=1 sm=1 tr=0 ts=6a566f64 cx=c_pps
 a=gXOkrB+iIAMM2YfcT1gRiQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=Bw6pbIrbi57O39buqnAA:9
X-Proofpoint-GUID: VfGawG7bOyzT2RDNwuA8_OTLUIGUl-ig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3OSBTYWx0ZWRfX3U9Bmbp4O49e
 4HQKixSoR59SrUSMQSCxfldg8X/3lVz+uENjvm8E3CMEngiTmMHGQ73m6e/+ZM4z6xaC+P9i9LU
 ElyqHxO7WuF8YNFFcJEnEYVtdRB5o3Rf5+3NnhxQoLwAmwnLdAONAGCIK8uMUWZR4LUR8H1V81n
 o1dGvmWXNx5faSVynOMN+++qBkWnWkQOmL+GEkRAhiSG/+m/h4LowfqqJsNaU9ERZ15I1sgWztR
 i01pONBsRpSF/1/Zz/4e5JKAfxU5/Kj4qYzo2RlerI55G+KtYzOCQ9nePQsppTYi08X8La91PJ6
 57smlg+EGtjUyIa8TeoGXYIfdQEATERadxj1J+sExlFCfYbGdeax5am629X4Coua9qEj9Q5Zk5+
 /m6IcTAEJeF5I0sWVPBLNIGHavQ80gaHTuNONlI7b8+Doezd01LMqUdWv7pUPRKVEYChIRBCJFP
 v+N+8A9yFrISqztKGlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140179
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jul 2026 17:18:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20141

meta-ti / na / 20260714165610.3591270-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] mesa-pvr-24: Fix llvm-config handling
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 14 Jul 2026 11:56:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0390f31b85cb7873e83b7e6527bdbb1f17b1ee37

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: mesa-pvr-24: Fix llvm-config handling
- Commit SHA: 5b13db24d8acd1d07a0eca3fbf888eceb111e33e

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




