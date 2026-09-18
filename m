Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF17BC982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 06:01:37 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5091.1789711285044853267
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 23:01:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=TP6iQbNt;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=txdr+pBD;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68I5vU8q799366
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 01:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QCx1PdT/k/EGaeAfJRKLbij8vDColmxROZTPVCGP1
	PQ=; b=TP6iQbNtCA3CraTIa1bSr1gz6mDzdw0ltVu34tGFIr1TD4a+jVXYKzBpo
	oDJiYTOgjaRELEjZwNFe0Nh4kkMb72LyLkUxvp/GUUd4mSs14+P1k4zscpF2JOu9
	jnPFvUEfWEelb9NakawMN/s9V2BkG+8jDxCFzTc/9opbvE93V8jf+ldTdSjQqoqB
	pbYIbRxoZHlVkv4q/ZTTsQUa3Ygdj6hZCa35CZ9u9yS2s3ncAtoQcl4p4Nhkz8id
	UCCIG2tC3GLN9bBuCi4bWSVN4He5T94ZmAAoxjDH4Sy8pqan/kEhJzaueUGypy1/
	Ajk4v91z6S9S0XMvvmP1j59flLvzA==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011047.outbound.protection.outlook.com [40.93.194.47])
	by m0384305.ppops.net (PPS) with ESMTPS id 4grr9haps3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 01:01:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Opp7BLUn/rGAGdAFFQC7qBPJhl4KZBDJ/ssZtcv6G/HEhl8kfILjOaoZn9Q9H6sZEhUEA3QUsQ0tVWaPaFW3yFuhBIeaP4i5jivAKRd3w/5ndU/Cnr7S56wEUDBwp5VISaBnZk2CgmJPp0WRxYJ5LWohV469IeXadNfNcNI/gDmOFVL6Yv/4yuaM6vsinXqOzuABma6eJ77KnvDf1mjYHt6b3DbiMc976ShX0Oh42PKfg0YWrfAIIGeONN1xnGY8rS/5mLA3rfyN4V3VOovjTd6k9JagWXUQhgdpY6+Mta6cgQrpB/MehCJy3ityFvVZNQq0BX68/BmJOwM7iF1Urw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCx1PdT/k/EGaeAfJRKLbij8vDColmxROZTPVCGP1PQ=;
 b=eAcMqV8jfN6jRHhdSCC1DOsewY+BfQqDWo7a6dXJAPT3LArLyZKtTYUubW28JvFAvXT7n8jDsvL5inC9E4c+PUZ/pU2uPHYsJrRefgokwX1iMHjUxx4oglVumHbF73kgxhGvvWFMHcvRuCbaSLZuE2JFssmEtxSN/00YcKpaYlwbVYmFPeShjbYWTI3AdMpipJ2+sWmQuSxc+UZhmWS+oK1XMkS8JUgkoR1tHf8l74l4tqPmk9pb8nlKYcdBkOGTmDIb5ubp1TLb+tlwbLmEzg4zNGDXPcFgswCHiGyHkdHM5GKOqlOx8MWUZDsdT0NgC4pBsDnLbun6fSKvwBkTwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCx1PdT/k/EGaeAfJRKLbij8vDColmxROZTPVCGP1PQ=;
 b=txdr+pBDpqEJLte1szjQteIBH7n3wQD1gLLwVdeJXg/hKMkCJ5l2C8foIvNCUGbYS2KwDd/mtla+fZztRwZERueuVucAxUHC5+a+3AcEdEo010TwAGRjs7uFWVMWuH8jZZSIVCyzoSKPsamXYLl63cg8cXbH5UyKsBPx/ImsxofM8Wc60V0mwGAU7ZXRue0IsELmyhTrApxeVLWiVjOgrO69QewyrT88TyMD1/VpYjgZWgiK+GiJ8xET3Tgkn9cEUETnQSXfhWnCTf2DzvAH44RrdHmY7haBvhvsQQvv7+/1LYkQABpeo3Vzv4exh3FtTJu5MHRT0FkU+Q7s9a7nlw==
Received: from CH0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:610:b3::14)
 by DS7PR10MB5135.namprd10.prod.outlook.com (2603:10b6:5:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Fri, 18 Sep
 2026 06:01:20 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::99) by CH0PR03CA0039.outlook.office365.com
 (2603:10b6:610:b3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Fri,
 18 Sep 2026 06:01:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 06:01:20 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 01:01:01 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 01:01:01 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 01:01:01 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68I611G1800223;
	Fri, 18 Sep 2026 01:01:01 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8E4C89A9C3; Fri, 18 Sep 2026 01:01:00 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aksh Garg <a-garg7@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <c-shilwant@ti.com>,
        <danishanwar@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package iwlwifi-ty linux firmware images
Date: Fri, 18 Sep 2026 01:01:00 -0500
Message-ID: <20260918060100.1592617-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260918055654.180727-1-a-garg7@ti.com>
References: <20260918055654.180727-1-a-garg7@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|DS7PR10MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bd1f794-cc8f-40e2-07c6-08df154a4308
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|56012099006|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vKQ425PLkCyCXLMrhJ9NiNhmKP3we2gKLiI65tK+TNLJ7bkdwuN4U+KLvy05dfqDRlh7DqoYLYp49TVALt37Up/f3ubNOq+Fq1ZrcvtxgHW3NRJq8tBvCLRe2OlYUL+nQVp6s3d/YVdNrCkROyw+GtODHyrbbhUg+Y1FmxqcgtA1pYgJ1V8bHa9z4tdOUUGLiJYW5T6Me+kNs0PGzuUxwPvHAQKXR1Gwia8piNHxfxDRBDG4WQfpMllGwUakTH2lOKXD+e96X4LROIJrNIhctfrZY4HKhoHksJJkOn3Z4qeuRY7u1l8TgkOw6UBRGyf9TZlh/jGbgi3IozLGUiZA3VE7hnDSczCUMiEajyDF6VKXsgXUS5s0nQcPuv6Hdp+urGxiXRyn3HtBEQpotZzfBa3VXc+nxY+6kcEkJj8xzHF0CHNHWduXOCwyVo6ihFNnncCxDN/9qQINqkruiGaBH9ojJ/HKZnMiTcpLLNQGxqT/DWCA5Egwjv3yeE4xiOYDBAyI0CnNuighUP2aWBGiehnXxdyG94D8OOoZVECTIEB2gh+S/mM1JzZADRuc8Pi1FTY5AhNipSGwaI1rmNZMrs+G+JyLb1COgCdsCGAorjpbQmG8A480hqOodjTrEmF47P+5FPJqM8rPE1pCPS4yqA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(56012099006)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	gaOg1QK128Q8V/VdNevgRq4qVPQYFXnZstaxH3p9Ln6e9IxxcBvETr4Ec/EDNukQ1dt5qjYMUTFFWKpIMKCSMZiu5cfwHtU2pcqX+NymeqdvEVAPItfRV/a9QIiG/ODvdBB50WhbKCz8nRcpTP3WOuK/TT5/UFks7N9dTg7Td628F4prMJoXo8PXjuNjzkYL/pGgb2NoNR1itxRB1aCvMZYHnHVfvL0rQZU9wBqHmivfn8bM4QhyHV3bY/a2XRPWyiBbmF9MMhSGeVZKmhTx62uZnaOcfa3MhxoXEW6MTA9zbhv3qmqih36xXy9FarPE/jCBuaI0BWwhPDvtjpHZusixdpI59x6fYDop19vE1XJw/kUYpRIt78JNo4pbLopkz4jqRmr5DfE7gpDoxhAZljR2m9Rp5ttzZfTVegIbJpIz89w1FNfZqgEgvWXX+ZHO
X-Exchange-RoutingPolicyChecked: 
	w4aQMnKfg7KAsOeM1j0z/jRRaOAbf99C76Yz3VOK6dtgp8plIIJVXtKDeJZFRNbdwLQpkjZx2Z1ikojn1YuKmgDQRqD1I1CDXt0UhN+RXD3wDlxpJzyhoSTHEBJe8AzSi+0SCnWRMrHM2gFnOpdwxHcG1V7thjeym1/OCuKbk0MBF/3qfk8Is8g5HeDE5Pq+DLlJ+CIjsj/prXJu68X2ChyBODLdfkXSv5OvQNOB5IOhHd8tLRacODvoGv/UGSYxG0ZbBxdjn/wsFIeAhhm2CRPESfOoGm+N5ij2AIphgWnMCWHV2mogl8Asepxj0Vc/3GaNFnaVa9gN9KpTnBhJUA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 06:01:20.5210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bd1f794-cc8f-40e2-07c6-08df154a4308
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5135
X-Proofpoint-ORIG-GUID: N22wZfRwEv34AsRCSM8J8IS_W7pIN-YF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA3OSBTYWx0ZWRfXwvpiOZcGf6E4
 gMCy1DWYkcUBJMDsa1iNUlcBLBEBcCj+tAndRousdSEwIJwgiBOKXe7hM1CtK53d4gk0iXPEbOF
 UZmDWri/+FPHD0YicQ11bDwXECF9cfhm0lP8jd0IJc3tX/CDbNMod9TDOYrXhN7EXyXirqzOtLv
 t5zZitVgducRBfafYtaFvtxfNsw5q7Wca45UcVWnkp8m2tx3ctBu3og8HGA91QpR0vnXXqIv0Z9
 qUWm24ChJFoWzGUnAb8RaXliph8RYX0NMfoHu/3uDlUxMSz30FQzD5vVbro6Ah5Ds2zaoJnfjhN
 xGCDaN7t4enKs9Yy4bgNZkbySEVBULIhfos5gLlmS7AOPCaQaWfBNFC3db2Xgtq157uHyf0GO8n
 SsXI1wTLi6bXqY+cKCq/QfwZU7XybN817CXeY/fHcGSIIyMGICAersb0MqCnEJaKsvHeXIqji7L
 PIn2zplzWjNxdSwy6Hw==
X-Proofpoint-GUID: N22wZfRwEv34AsRCSM8J8IS_W7pIN-YF
X-Authority-Analysis: v=2.4 cv=eeCo7LEH c=1 sm=1 tr=0 ts=6aacd3b3 cx=c_pps
 a=bw0VQspFR1l10E3Rz9sV8Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=slO_zZtqbVZj-wm_tPAA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA3OSBTYWx0ZWRfX2GCwwCn2b/Tx
 sJKCfFocaOhkJCb4uN4icYvXyqVxWcwZucIdJU/fJox4BisVUrwcbHJzyKUk8KdKIuu4DYuDkep
 wuuNm6UngIS74y5ftWCiV7TjFj5kotw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180079
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 06:01:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20385

meta-ti / na / 20260918055654.180727-1-a-garg7

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package iwlwifi-ty linux firmware images
    WARN: Commit message should not include directory path to recipe: packagegroups: ti-test: package iwlwifi-ty linux firmware images.
              packagegroups (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package iwlwifi-ty linux firmware images
- Submitter: From: Aksh Garg <a-garg7@ti.com>
- Date: Date: Fri, 18 Sep 2026 11:26:54 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ae3dfc765516c835aaf70c511c3741884a7d86a1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609142200
- Commit SHA: 7034712771a19a5dfa13a0356e28c9770c226eaf

Patches
----------------------------------------
FAIL - [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package iwlwifi-ty linux firmware images
    error: patch failed: meta-ti-test/recipes-core/packagegroups/ti-test.bb:117
    error: meta-ti-test/recipes-core/packagegroups/ti-test.bb: patch does not apply
    Applying: packagegroups: ti-test: package iwlwifi-ty linux firmware images
    Patch failed at 0001 packagegroups: ti-test: package iwlwifi-ty linux firmware images

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package iwlwifi-ty linux firmware images
- Submitter: From: Aksh Garg <a-garg7@ti.com>
- Date: Date: Fri, 18 Sep 2026 11:26:54 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ae3dfc765516c835aaf70c511c3741884a7d86a1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202608280716
- Commit SHA: 018a5e2bc1da78e198ea57900b993ea91795a5d0

Patches
----------------------------------------
All patches applied




