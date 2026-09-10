Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3733EC79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 02:01:29 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4385.1789005686695030766
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 19:01:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Fap5voNa;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=PbcL7j8Y;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A1jHgc1830679;
	Wed, 9 Sep 2026 21:01:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZJkDk/yeDypa69eyUVjQ6oQQXkL1iXeepBruekGVr
	ro=; b=Fap5voNaKxmODet9bGlLmE9pddbq5vpfzmiv9PT07NtXCDMf0dSvxO6qu
	PKbFklzR/kW63Q8CnRL+HQ2/jwa+EWQnZfYAi+Jg7Y4htNRHalJTr+1SwwSZSBpC
	OLBRFhDbJIoaZoBOO/MnD3Z/69JMd2womDzmoqw0eZzxFQSpMOS1qyeNcE9AOMhA
	jsY3391BmezjPPzNT/YPQzXYGErjFZu7f0jiahPIQzHV2Sn5XQrBJxzXFHMJNO4K
	Oeahou0msD6f4evr1g1lIENskqRB3njgGPALFQv9gbawzRVIwUgq8GdFcFyDbn0c
	pmYKSt/LWK1Mlp2nMdM6PG6mNw3Bw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013038.outbound.protection.outlook.com [40.107.201.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxftjcm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:01:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcV/vhg0k0w+p03/AWuJcfywU31dUdQOTbAKER9z9zIsBd8q+dDH4gbkP6FNVTf8Ei1qEK8RMMXbskhJDykKcaofA8cj8MFoYT6Q+h91Uid++zAn9wXzpGraGGs/NQXsB0jBWHoeTAJMALb25phiFbBK43tRHd9fEHA5cM7b8YHS80uf8XIMeFgrOEa2FEMhpPRAbtNCZKBHt6vh1YPPeK94GDNxA9j4PRq5kkUlxsRyx0hErqMRHC3imfH8/Uo4eMNdESUdwh62w4lS6n9M/lP1215TK00PeggpkncH58I5i4NfLUaUfSainnxny94c3nGK6HxofDbz4Alo761jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJkDk/yeDypa69eyUVjQ6oQQXkL1iXeepBruekGVrro=;
 b=Tx6vQIYmJTl+0mCnAaV0oTXrR+GWski2PgyyNOKbE184PeT4iDO40Mb6m+UaS0V1mZW1Otmn75HeOhfk2hb2Ay1Bzlmk7zeRiP1HsFYEOO7b/mPUlmLkpct7rlhNnZbnI4lDL2RDrnu31dCosdKDwinVm5ygFz20uO/0PLIacV3RQ3e4PQ72c6hbGwdPnn4fVY3lKA72gTQ+skdUQ2lCdQjMFGzyZ8Oz0sVNHd+8FXzhyUQ3BeekoRdCY2K+BlFgRvrfgehiVN/5XBP0A6gMU/yQgikWmo6lbdykjC4URshU4Wv4CcXC3VlEgfk2memTkGHdBzZyYOC0m7VXEFf5JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJkDk/yeDypa69eyUVjQ6oQQXkL1iXeepBruekGVrro=;
 b=PbcL7j8YRY2ngKRetKnsd84lSWK47TU7x+78wWlbJZ98FVvDgwaKwtfbwuf8yN188wktzOW7NsceeiQ6oYvxS2i4PWslpU2wtOi0trGl/BPJC6ADRLS0WVHxpOycZJYTA5oQjpTlPOhemxaQa4UUtb+8gZeBERmpXzLaMWc8DBAk9hSv7ImZ015Zsj4oGeYzQJFCqIgHZQSavhdP+T/HMVL3fTsICes1Ghy2RLkX+LemKbzNHlfWYPzWPNOO5XoU1oZ83OrlBiwbgdN0pAbhdOxbMXr4QDJS8zcL5uuBj7yfCpWryTmrfiO6Q/ZJkDS3J+LF+L+ZP+OugggxlrdrxA==
Received: from BY3PR05CA0009.namprd05.prod.outlook.com (2603:10b6:a03:254::14)
 by IA0PR10MB7383.namprd10.prod.outlook.com (2603:10b6:208:43e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.5; Thu, 10 Sep
 2026 02:01:19 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::30) by BY3PR05CA0009.outlook.office365.com
 (2603:10b6:a03:254::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.5 via Frontend Transport; Thu, 10
 Sep 2026 02:01:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 02:01:17 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:00:28 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:00:28 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 21:00:28 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A20Sbo2389985;
	Wed, 9 Sep 2026 21:00:28 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 832C79A9C2; Wed,  9 Sep 2026 21:00:27 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 1/5] u-boot-ti-staging: Fixes for OpenSSL 4.0
Date: Wed, 9 Sep 2026 21:00:27 -0500
Message-ID: <20260910020027.1241494-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260910015454.2933250-1-reatmon@ti.com>
References: <20260910015454.2933250-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|IA0PR10MB7383:EE_
X-MS-Office365-Filtering-Correlation-Id: 741b4951-7d62-4364-16c1-08df0edf670a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|376014|36860700016|1800799024|10067099003|56012099006|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	G9vCHXVF4SfCujMXCa2ZKCSKYiaDPFcFdufq36S195cEBqBJCuYHCog1SNQ1bZtmdvmm9doGFFxAKucBFFJZE9skyIvd0Mh/fFDZbE1yMQg6LTbkv8NkltK/+Uc2Mz49D2j1A1UH6sq0tAsAR928wpf/LzUzv0Fkx7T3zVjcUy9yxhnJVeQm/91x2KGMb8E8ECvuHsNgokBMem9841hm6Icasd+Vymy3rA/vw9Smq5pS60MTVTx/eE5k1RJcP5ZcGI5CprV2tv6RKPruWbT3lOFl9knEy69uiRrUZyH+zQPYhpJVY+9MULiq21jLv3bvr9WQZymJP5GRAmfoJkf9JHj/WLDu3y1OI6gLue3IeVpW7TLmxia0Z4fcyEdP/0Bt+yUlIoPCWnNcFUyl3bgZSFIRsNF1ZL8jB4lZnxegpOV8LdEIOjhQeIs9JcpryeZDdw80Zc0W3GLRSx15Yyhjx4g6es7jfGMWJjMyJDBM7NqLwQimi5DNjyuXCJ5RoKcmc4VbSpTK70HkaWU8Ol72BneKupB2OBzx4jACsIyCAlb9ZGvULJUYXJJr98yAj2tl38G9vJ/QUrLDqTcSfkUirYaVwXaDDeZquKHlYlEc/VooOJ2fb/ZwhVCQCO8MbATG641hrj1wxEazbx5JngAk8Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(36860700016)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w6TaHBg6DOJB4AGYiUyHojYGYzUJYaiREeQrR1yVzdQxs49RP5ySDDciC1prDBaH7JhJqTkIFzvs0FogVslQrtZdDyYSEn6jCgwprNdOEsqXri91krbZNvxSMZbjmkRNkPLGbyRhMAjEKYsEgiDZtLiDieHcl0IP2rOlkpWyWNA4glXwYusa4HaxdHSACh0hOh07oBXUDHVBf4z4DjUoRZeWmbVtBspoJrBYoZb6PA8MBFIXysMPUBxfka6Apbfl02HEY3tVutr1Bp08ziC2BQjEtCQ1kKGgkStJIjIQfioo26EtU2fJf1T9JTuPRSGbux0uPfAy90Yt8Bf+BBudqcVbYj1QGDDm1uU0HnJoPmWOJBtlx2met5I5LUin4NYI0sYBc9glBcsmE0VvZjk5SPmoFTiDZQzoFm0eFaoZjt8c+bL/6Y5u1RtnWGgLoafl
X-Exchange-RoutingPolicyChecked: 
	1anyUkN1x5ijexyWaVsskojGBx9E+YhhJoQFkeeRLtGGvbIjoxVNw/7WIYfwopVIOD3AjWEBG2vtnXIewsPK8l1PsdfNxwfJ/zqlYO6q0kKCkTt9k1oJXnN9vcUtiBE5pUcFtcrvcX7rx4ChxaTcOZCQ22Np7GpxxM9MihX/lGO5yHC1RRd9Z6fjS6jCGU2+vrKjzqswZRn/gA9csuzkIN9HMLFSqgxATHNvlKG+zdfPNMuQQp2264dZuB3ufQ68i+rIFAYiX63bphDPT5ZGiUb36gWPzA2enhQYLbMoPMKc1uS5Dpq1ZYWNZACuljik02fX3qAleV6fzjuSZloggw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:01:17.7742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 741b4951-7d62-4364-16c1-08df0edf670a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB7383
X-Proofpoint-ORIG-GUID: Y9EsuwXYBbYlVGQOfUvbXmnBCzkwwqg8
X-Authority-Analysis: v=2.4 cv=SoAFe/O0 c=1 sm=1 tr=0 ts=6aa20f74 cx=c_pps
 a=ZmKEHIpmlwdLtedhitE7eQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=ptNznvi-AAAA:8 a=2iam8ScTpphQnFUfo5wA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=__MQohX_fo54y4GeBRKl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAxOSBTYWx0ZWRfX5AuO+YNueZA4
 m6JnHSkM/hlOEOj9lcbDzZzAUTW7fiaBW/VF4NSQJOaMk1acZFd3HCHcZkNn1a1evEi12Lcn2Cf
 BoCoPEs7c4YrBQ1YWj6HzxeTM1w0CmXn8El8JNqmYBQM1wxFAVQTP+MUuiqnLJhA/WYBaV8RXg+
 7oSWc75XhmR5jkCGAyYy7hfn4cajKlIxPH93lJoAkrcbjVn04jC49fSQuQd+MjTqk5kRZwxZbt1
 33wipRRS0JPUBbmL6vEJSLQswsk/6VI+IZ+g7z7GZlmstCRnHSQGYsfSRPZo50ZTk8QFRLOhJ13
 TtbnqVQKJcCSoBYpFKop16f8+bePAMmIJTwszTg+jO0EVcl4njU6QaUHCY4XxPtMDdaUSW36FF8
 sY3JLqoikuknnfWP04v6l94z40v8FB+y9iWlQoHMJFNbvdeC5blLToPaarG2rkzLkmq4wYZah9f
 SEZk+0UMeW94/+5SMVQ==
X-Proofpoint-GUID: Y9EsuwXYBbYlVGQOfUvbXmnBCzkwwqg8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAxOSBTYWx0ZWRfXzvMVWNnACYDI
 CgZxgXslGHxNYCbacacz8heWYMm2+5yQfRh5AQHrCg0WkKGhM+eUUyf9K+9lxJj7RLqR192NoWZ
 AjPtLYtdVIg4kbR0fuReljGQoNFW2t4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100019
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 02:01:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20361

meta-ti / na / 20260910015454.2933250-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v2 1/5] u-boot-ti-staging: Fixes for OpenSSL 4.0
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 2/5] linux-ti-staging_6.6: Backport OpenSSL 4.0 patches
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 3/5] mesa-pvr: Remove makedepend dependency
    WARN: Commit message does not include file/recipe name: mesa-pvr: Remove makedepend dependency. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 4/5] libclc: Rollback to 22.1.8
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 5/5] mesa-pvr: Fix for building with new LLVM version
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v2 1/5] u-boot-ti-staging: Fixes for OpenSSL 4.0
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
+From: Ryan Eatmon <reatmon@ti.com>
+From: Eddie Kovsky <ewk@edkovsky.org>
- Date: Date: Wed, 9 Sep 2026 20:54:48 -0500
+Date: Wed, 9 Sep 2026 10:04:50 -0500
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+Date: Wed, 9 Sep 2026 10:04:50 -0500
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+Date: Mon, 23 Feb 2026 09:43:22 -0700
+    Date:   Fri Sep 20 19:52:48 2024 +0300
- Num Patches: 5
- Mailing List (public inbox) Commit SHA: aa0658289984ef6e2cfa1aad5d36661d41fb74cb

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
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




