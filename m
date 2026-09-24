Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 604CFC98314
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 06:58:00 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2116.1790233077666383972
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 23:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=i8/0xfhs;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=YrG+8H/Y;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68O5cN0r2915712
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 01:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=EqYlSud7sWUjZFgh8LXJwaKmRoB8mbVcHPJE2KmfC
	9M=; b=i8/0xfhsnjAHjoDO2H+TldR8AAeQppqNZVyLJkv2NDI+ATgkUtj7x369e
	SalEBoCd/Byr1AeRKvLwLuOz+wkGz6Ri/0BFXEk/HfnX4ko4RccW+i8+StF7HejU
	B4hC5B9DmKvGTI/H1w19PKupLtmOXVNxHNbg0j5hENfRpDAKWHcwH3kI37Hg6yV6
	H47n4X/Q2ojhM/0Y3QCqF3r2qclO5BFKlV1zzw3yJJbkyPYtM/UTT1FA8zPD51bN
	b3kOkggcwUF846PWn+ywi/VOoBLZuW+Pns4gQhjRal/bmfErlckfzOrCuuc+tO11
	k82xsKCJclSNKxfmZ2caZho/2l3JQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012058.outbound.protection.outlook.com [40.107.200.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gvsbvhv6y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 01:57:56 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=girfGfMdRCb61urEHOuQacNYfx+jJf1XsaiBxt/kjRT7fUAonTqgFhXcGRP3uVNqp4cg28yYs0mlfGJmSLUta3Wb7zHKw2p9DAiBGk9wV3whsoTXiN/7+4W8UPJ1Whfp/VXYNGVe4YPE7ZfFa/ioWdDWxDbxQJA6ukrPqfc+O5s4Cbh4kjt4wmxxVac0S2R4x7dTaMI6xtmjxTHNzH/LeDCQH2DNrgok8pqQLCYwtF/cVelf5bsn7QKmhkFLVmKrtC0UW3I96mM3XTEjgj3cvuPIm0ShknMwHQtWgS+aKnACcKYnmTLijVW1S1K1PVkcdpG9x2EmOANtBAyy0oMpNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqYlSud7sWUjZFgh8LXJwaKmRoB8mbVcHPJE2KmfC9M=;
 b=Ib8e6GHB6/BZkq7rtIzUjXKIc/LtbypGCep37qCdAVYp1iqXGKhJvdmE3zajDT8Svm1cy/InHBICAqC/gS5UHQPL0p8G3NQmmTXk0nJvvu+VO7c3VZpNxS11axFsOxYSQWm16jN/0NqM2aRtQRTg359N/JGJoJY2cWArgz2IBVOralks/bGR1ET7ASNQldJ1ROhZMLZwAqIJMKNWrKBC5thUztLPCcMb4/mbw/s4H0hts5sj/CjpH/c6cTHPU02DuUBV6uCWCg9AD4rkBODoveKheTOvMdutFCvUZzc2EgmfyWTSPLh1N1ZYpEdfASsnm2zK+zeZUHHCBM69yK4E8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqYlSud7sWUjZFgh8LXJwaKmRoB8mbVcHPJE2KmfC9M=;
 b=YrG+8H/Y/IzdC3IOlHCZFxMf9FefhKZmE7OSqD3k5vakoqBPkWmsN71MkV9lr7Z3OnVEHYMbK1l2x5Fh4t9Rgv3BAWPL3lCT+FZ5SJlKTjZ8uUYB20G2MjtqUsKg0v2BDgjbK4dfZK8+lk/w2Q+0QYI97Bdy8ZztalIqi1VzGkT24dKMUeA1hBinBwFXuLoySJqwa1XuOmzSWPK9FaLJ3WXz+7cZHikpvSWUyogo5aLpjmbaUmSFGliUtX61fl2Tl17QxaW1Lmllgf1t9Jlora9breTGRSbMfqPTQO7V8uc6gpQNiHKqZ2raQKUt8kwymhtYmGrshKwT3zLbVkoKBA==
Received: from SJ0PR05CA0208.namprd05.prod.outlook.com (2603:10b6:a03:330::33)
 by SJ0PR10MB5787.namprd10.prod.outlook.com (2603:10b6:a03:3dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Thu, 24 Sep
 2026 06:57:51 +0000
Received: from SJ1PEPF000037AD.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::77) by SJ0PR05CA0208.outlook.office365.com
 (2603:10b6:a03:330::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Thu, 24
 Sep 2026 06:57:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037AD.mail.protection.outlook.com (10.167.244.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 06:57:50 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 01:57:21 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 01:57:21 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 01:57:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68O6vKLG2636526;
	Thu, 24 Sep 2026 01:57:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 451989A9C3; Thu, 24 Sep 2026 01:57:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Mahammed Sadik Shaik <s-sadik@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan eatmon <reatmon@ti.com>
Subject: Re: [PATCH] conf: am335x-evm : Bump up max_leb_cnt
Date: Thu, 24 Sep 2026 01:57:20 -0500
Message-ID: <20260924065720.355919-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260924063910.789534-1-s-sadik@ti.com>
References: <20260924063910.789534-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AD:EE_|SJ0PR10MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cbf1e4e-cac4-4900-d2a7-08df1a09265c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|56012099006|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	CvFIxLVU9oWsmywBMqrayua/RCOfVlw7qlgXJET19/PZ8TXO9X3f+zWTjuJTl7PA1i7AZgKbZtBsT70KKQOMgG4p01khXKSQeod6FIZTAlnn4WPH2L1kRZ8b3po1OvgNp8tu/Us6AMCS85w7JkOAJIG/HsJ4j9yGTwsgI0SpZsG7PcXrhOaSrFYimBx7ysygkRz7FQozzWtmYJw26xB2X0qV2YMzI32t1yWCi4VbPY0aFh6m/mGUxIqyNufzjOD8Cvu+r9sNb+TK813Dlg2JKcTAgW/vpZMSg9nCsbA4GU3lIl9+SCTNtko9rJBk7ko1vhu5lwLqJ/G0NGh/L9ewSQfpZihWajfuoDIAX1mdYgA6IMZeIz3aW3oiruyVps4h8tTHZMlDeWLv6GqlkJAclq21zphhpJAOL/hkjc1G7aiw+0tYOw6UR8myUdA0S3bL8zRgA5gyVuW4q9PHyCwQGH0wEbqbLJgQnEW/qiGwnlwuDZxoSRZrFQnPmAt37KuP3mXfCkvaa6wvOa826yo/afaGgd1BuymeeqKEL7o/awB7FhDwQdoHs98XWGYC+niun8ZGbrk6UoyWRq6v5AmoMZqhc8Tby8NdL4WjQuaeGwJVakmYP+XJ6MojUvIb47mqo0Z4ysCyvI3Y4rS34z75qg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sNwuvBlVD06ccceyBB/gtAEF7zr2CnZP/qEhN9d4T+Pg7Xp0oqOL9vjQg2wkuGDGw+BIS6hiMOcjmJNYte/O/gGlybVzQA4WkORAvZjcjwGL5zKc64CgFIo3srH1lwodlvm5YNNcCAqKTY6kwsJ+oqY4suDyh2h67dTZOGXOwu4WMh/NbSxTNNKmuSSE9rXzu4K/cYV0b06YKcrtUBk0bxC5I3Bg3PONW3xFZ+mGsvi8EybPa81s8FJSe9mBpiCOLWHVhmeZIubbmtnoyEw7DjtRZK3W6rk5ZEpu2EmOW7mPaRBLi3hmRBE/wZF6esrZxibWJV3GKurbq6o2XiQ97IlsqmDaJsq8FUNAqqIoJzZP+T4Fqnc67MP6i8ihrA/v0Kdd18JkVujloyTJf0uHa8zXinFmWhgYHsPKrK21aJ7M79j7nwezpAA/SpocZ8Z6
X-Exchange-RoutingPolicyChecked: 
	JP47gHSo2R3VzeOd7dGsdbM+K6P6vGli5o512cE+JnXoYey19sZQoFqFsI/CyObcZT6H6lkqPsg11x06CGgnLAV7I2D0IMJ3L9kgOVDN1ooOvajWC9WLB6KWlTETKUZxPiSykdHa2gCvOcyBI035wywZtSG7XRO6rVs7AUiEB3pbIFGAQU79sz6T4qXaRWU2pp7W5EAnhI0wEzp+3zAuDfgXIv1TYwNiymSueE5n6qhcAahdK8l/lI+v7clqEB10oCLlMh+E/9B7z7eB5c1/UB9pyzn4rC/Lr6WTCQlc8Wc4COAnjnYjA//NA6pa38frysDMWAHsEQUZYrq9enmc6A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 06:57:50.9234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cbf1e4e-cac4-4900-d2a7-08df1a09265c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000037AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5787
X-Proofpoint-GUID: ICRVEMcaxSXw3fB1fNZplL5HLHCXuEoM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyOSBTYWx0ZWRfX8+5j9nTv/S/1
 ZA4s727OggjgBLx9emZBiFx8iF6ODeXnlvXW64mBCSnyh0zmmaeIdEMzrB/9W4c5jTdDHGqCI4Z
 aJcGUtWyewBhfooEVXe5YSNBIU6U7rQ=
X-Proofpoint-ORIG-GUID: ICRVEMcaxSXw3fB1fNZplL5HLHCXuEoM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyOSBTYWx0ZWRfXw2NilIxyXjmZ
 HWXpb2+LT82z2/JeD1adlf+xR08YAIC/TraOnCkoVzBtfF2egNplF/3hX6dmahJ5xnvr1qTWyKo
 yjwmikUz9RAhTStYKfF+PwvJJPMSrA24FCdBCLPMEEny06noiTGqmCvqaEYqKRKviB656ywUdWv
 Qzd5IH+lltns+eR3QB5BOTiGm/a9cCcBOxdi+BtPLCP61x5uHH+2tQkoHyBl1B0xZ2+7eSNbGfC
 HKYbh4+rQSrb5aXjtTmoOdASJjdZO43zpISP4BQONCSg6aIXVshEzp+ik4GdPmuECZR3ugf/Jtt
 XA6NpN9TgBtRNeps3oD+uS2iKcabci0ykG4wlkYkaoiY0pDcynhPSMdM5pc+7qhZEp0YcbTkmg2
 sGz6AGdvG+8I+QIBCWA+oqtoR874+4obZCg01Q+cn2wXRhuC2I6O9qSUWRVoMN4q8YJuzO1PuFh
 akUxjcxWnqjHBA6OMMg==
X-Authority-Analysis: v=2.4 cv=QonLTlyd c=1 sm=1 tr=0 ts=6ab4c9f4 cx=c_pps
 a=UC1wTn8whqDYkpYF2DSMwg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=SkSd_mCoyxFkZUk80M4A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240029
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 06:58:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20410

meta-ti / na / 20260924063910.789534-1-s-sadik

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [PATCH] conf: am335x-evm : Bump up max_leb_cnt
    WARN: Missing branches specifier [master/scarthgap/XXXXX]. (META-2)
        patch:84
            Subject: [PATCH] conf: am335x-evm : Bump up max_leb_cnt
    
    WARN: Commit message does not include file/recipe name: conf: am335x-evm : Bump up max_leb_cnt. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: conf: am335x-evm : Bump up max_leb_cnt.
              conf (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [PATCH] conf: am335x-evm : Bump up max_leb_cnt
- Submitter: From: Mahammed Sadik Shaik <s-sadik@ti.com>
- Date: Date: Thu, 24 Sep 2026 12:09:10 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 303efbf7a33a3e7315f88105f069feaa2364ae4e

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: 345798758183d19076a1afb7ae71be570d06bece

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




