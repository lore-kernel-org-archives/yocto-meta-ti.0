Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA4EC79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 02:56:11 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5141.1789008969045037671
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 19:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=UAzPS8jU;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Iyw5c+WQ;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68A1jAbY1892841;
	Wed, 9 Sep 2026 21:56:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=TlrEUOFEsg5rBlSn0A6kuUDDGqvvPq0NSrZFkMQ6c
	go=; b=UAzPS8jUfWYbsW+yj8Ha8XjioDBv19yNdC/moEzfZ+k4t8CToJHA5TrmW
	7r3UkP9Thcg24rNao0KdxC5iUH3WE8sE7O6wswUUWQv9yi3ldvmsH82QC+/CcfxN
	7YXwaNyey7t9jfFT+4y3dFidNNGpCmnoCb+Gv2TIWB5ZCW340yJDI17N9s/Ak4j0
	ERYrl5rdbyPsuG++lRlMAQuWvhoNk0JHS+JEJO0SV0O8e2ugUC2WlezX9gv0+OYV
	jVcCZl4egPPqeNaRecBxJ2QInKVUtYoc4PZKmtUzaCp4Lc0oq9GpVMRHL0QsczJc
	UVCOQYl1i2OUAnVwbNaX3mlFbGQFg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013039.outbound.protection.outlook.com [40.107.201.39])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gkcxetj9t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 21:56:07 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kzycM9/kICFKbg2wXkS4RtaxjzxTTRpTSO2VAgG4Vy1K1rP5dtLstuXP0+xcv0cgswXN5cJwwMzy7j7rXGB2UoTyD46UEyxgjxXMQnt4e0o+/AdW6+QYLc17qa3DI6NxognG2kro5Oj8tog7SRbOttol1L04QM/nmfvvKy/AISUouC6zgD4mx9PvTT9c3GeWgpFUC6Z9l1KEP8gs1wzlnf7cDtJJsYC7mUQlTeqWN1QUFnLLArzDJ4D5g22pM76X182vet5ITBJ7WKLSbm2FLNaeI1ZdQK1PAAQXncf7lv1b2VRVx0CFpZqcZhOvpONrYIW/u4X9bbTbFwd4rk1i/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TlrEUOFEsg5rBlSn0A6kuUDDGqvvPq0NSrZFkMQ6cgo=;
 b=NZAJE8SFY51oxz3mNPZlFUF9Fqicphj+w72NgPO+lQ8aaoyjcpxlgn4j1l3/9csMjGgas4MfYqqknm5wSF+tTMA/JFGf+Oaug0sDC4SSZREAAIeXtGD+VhxDgi+MyLNz17SBE6JUSwYUt1PZ0iuWS9LQzQ/+hgDBkZ0fmHwiNLIMaxgV7IVP6fXA+8e+JWaXJNEkCgc0ju7bRb8cBBhe7b/W3hgHeg7iPDEQcxYsMwEYVbyFD6TQMSoKKY8/uYSDtqd0GcENISc/LEehpJUh1zezt6HI3CiBWR0+uXEVXQ8wmf9Q5oMvtomZ70bhcI5ohGB0SXMjBOtAjt/u/fI3kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TlrEUOFEsg5rBlSn0A6kuUDDGqvvPq0NSrZFkMQ6cgo=;
 b=Iyw5c+WQLmVEtJI7OKXmpuazMW+tHdqhc42dSTq196iuVbmNj9WiUvA5mjyc2dnh3y7imLx+bSy+VNqy8ozFaD38Rev4yvrYj21aA1keswmchSdryuLvzkQ4L/5bOrSUe4fAT381hTbOvBBJqOqXVHUQdODtx/ODkQO0FiXJWHrcsSvuNvaQfJMq0+f+IQWV5mXH/CJGEZteNPb6NH6y+wcxOdPpd6gyd7r+Juoz4OLayaxbcBkfh3XsYpI4Is/fVAKr79+ES5RzpYqTer3Zdijt9AHE/V9Ko64wBwnFhZFQJGumyJodPqutbz+ESD4Rj5edYknrStb4PfgKnT7e0Q==
Received: from BY1P220CA0017.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::6)
 by LV8PR10MB7872.namprd10.prod.outlook.com (2603:10b6:408:1e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 02:56:00 +0000
Received: from BY1PEPF00026959.namprd05.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::77) by BY1P220CA0017.outlook.office365.com
 (2603:10b6:a03:5c3::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Thu,
 10 Sep 2026 02:56:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF00026959.mail.protection.outlook.com (10.167.244.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 02:55:59 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:55:53 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 21:55:53 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 21:55:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A2trcE3028899;
	Wed, 9 Sep 2026 21:55:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 865A39A9C2; Wed,  9 Sep 2026 21:55:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/2] u-boot-bb.org: Fixes for OpenSSL 4.0
Date: Wed, 9 Sep 2026 21:55:52 -0500
Message-ID: <20260910025552.1249015-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260910025416.3648241-1-reatmon@ti.com>
References: <20260910025416.3648241-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026959:EE_|LV8PR10MB7872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9172567b-3503-4796-33e9-08df0ee70b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|56012099006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	QeCWvNW8R5sHytWkrLpbpgzds5UUcajDa73k8+G30AfegfstfPNoo3aqCpwBfL7hVTOTArWu9cxRpJVi1ZKppBPugdmWpWUimNJnJ7RjmfvWmyPgWnk+ZG1wAyLHqwjsN1bK2+X4a5x4t1o4jhJzYtF85etq/PqNHmmKeTn3AxmN+1eGQVwE4gXb0q5PuZgoYbdsDs4JlcFTxPUFc0MHBFBd2ilbfVAXewWpt31li9eccJJ3KSFQMpc7BLCEsOpte/f4KvhNirSxj7DSIHRO19PG42Qyowl8F8s+5JilXiFCN36lHtEUsqqY+e5RXMiGDdCY7M64B4tjK9ZLiajNkrx2jwjq8hA5PVmaqiP7ASaQQQVTiK+rXdtROvLbSWUeQB/n8sk2MEhmPJvS0OlXFx9/5FlEuq8yvCnnOt2JjbYRh9X032NgARbmeriLib30mW5xJBb9jPuGTLtmfi2fFKfzp22CzsKUgB0me58LZRYQfKXrqTMapLERYElcBawKghHGU0zQgjCGT0DgKtjH4fpuMPb+o73AIZ2S/pnnHRA+bnx4NfV6ECJYDglM+7eb6H2yy2TbPVt9WDsXV162oRSyrCmZSXg8xHmhzFSqP7ZUK6tnrXggnuYgNUTLD+rtD1OddbG3QhpDDct/UC2p7arGBH5iypGo+iv+nM81GKaQQGvIEI4V+VXxVFgrENJRxohmYqYwIC62SVHvTmFiYQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(56012099006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P90vRHIDfW/SbYoy7orsLHflFk30NmQE1dgQHAY4LXODcOAN7seUOLdzTqvqe4kcduV2BZcsnSpnDs7Z32bq3pHxHzDt8yKPoPf+eW/Szwh9BANQL86y/FaJreLmVzKaqZxqvS8hq89a33wgP/8xsDTMwzSkZ0vy6P1ux27sW0N7J4ZYrEUWWz0PkbyJnRZ2WwGJqdIglcqthjuuTA/+Fm2lMSLSYbgJ8vu2DDpTTlOQlRtoVk+DL53Q69Ck7vdzOW57MJNnhcJGekiw6XgOPlXcWA9HSefG6aPRTUNs5qIKAC9gTHc4aiqQrtfX7OlRiZn8FNamD76fEKjCJ3alsCzID/jg/pgIKe4EH9Iy/CqfHjCEbytDKYf3RgBuI9mbnjjCkJy6Ul25NjkvgLLRNfGl7pnXvviX01bqEeB8hnoVMH3dqI8ZuxaiTAW2ceZB
X-Exchange-RoutingPolicyChecked: 
	RvYv7AxoEJw9X1MvH4pVvHqroff9g8KCWBWvnUtdaNQ/VJ1q0Jh4jyU/sAE6Mi5g9zDLPwJu2iwFYTdHJJu12lfVUcdo8nOKqfTFe+aNl4bme7Y7YwfZxIPHOGxCjcFHATffJiaflXy13xUY8r/NsU489sUnJ7YJncSYdHMkPRj75+f4V0m5rnzrKzK8nYUqM/Xtl6Ut/5vnbpYM//grd0hDslmJgjPm0DIfq91Z8EQ5oQ+r7U4A+uI4aEWJx92uOOvldzmpUw/8+GRvPlqdLCZ3rwBs5o+3ByQSSEYE7vPbDdJnOuo0WYBiOUqMHYse1b3iPHOmSktK1H6LLTqTag==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 02:55:59.7637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9172567b-3503-4796-33e9-08df0ee70b41
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF00026959.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7872
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAzMCBTYWx0ZWRfX9oVuftSk7mmh
 Dm17p9rSnkJjFtIIKqfZaDUe76stqDkfG2+UKWSrcu2I5kULdIjMzcnzG6hBO9MhF+Yhk/jtJJy
 KoIRZXj2vcMmZE90pyGe2xtM538Vjok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAzMCBTYWx0ZWRfX2sle2jC813Q6
 GQvWupsxDqCe96XGeshvJDNarvlzq6pffCCUk8jlbVUFV2mA33dW72hiOPg9BS6oYIPEYgjwXIC
 Wun0vkp4tCo0OzuJwAoeXAWUi4u3C9mr4dN7MIVfDbCOuAHrgOuyrHxXf+8bsY7tlH7PuV7yZrY
 kzhdX1Zg/aZtlcQCt5ma5sqMWGjAVoJhofoy+GL/Bs+zvlObiaqLUNKIyMdrUsvQMhvR4zgz3FX
 n/mhY9mSSg7zRbBuDzGRmj6bQhCOH2fb1Eng3Z1gTRQYlni5rOPDuKefgM3/C9jjrPnkXbEThAp
 8VgGBhB18eOqueAJ6NqgnEQG1m+jfyT6rTGb/HEg3Wmt5SB9vmVB3gMr+NRqJzIae71xZ2RyQU/
 mal85twlYsNiuCQMm6lmmkAFSEkMYPdNZlwNYIiBaOXQnZvVwOvuxqsXouFmSwJqsxwuKU0VlvA
 OY2hehKsmbBvfuwbeWA==
X-Proofpoint-GUID: oniXgA8b_iAmWJgnIy-TKWXgoKyYNcbV
X-Authority-Analysis: v=2.4 cv=F8fC5ahN c=1 sm=1 tr=0 ts=6aa21c47 cx=c_pps
 a=U/rLDH1MEKAiLKQqfACAEw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17 a=DYtVRx_rAAAA:8
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=sozttTNsAAAA:8 a=QZAWVI2EAdXTJUti6NEA:9
 a=K1xa12UCscBrvhdHlanD:22
X-Proofpoint-ORIG-GUID: oniXgA8b_iAmWJgnIy-TKWXgoKyYNcbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_01,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100030
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 02:56:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20364

meta-ti / na / 20260910025416.3648241-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH 1/2] u-boot-bb.org: Fixes for OpenSSL 4.0
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 9 Sep 2026 21:54:15 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e02872e0c4e7a86c648604cd0b5869bb83bbd45d

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609011013
- Commit SHA: 0424eea6b0f3f37e57500b6a65a24cbe39427ad8

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH 2/2] linux-bb.org_6.6: Backport OpenSSL 4.0 patches
    error: meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch: does not exist in index
    error: meta-ti-bsp/recipes-kernel/linux/files/0002-avoid-using-deprecated-ERR_get_error_line.patch: does not exist in index
    error: meta-ti-bsp/recipes-kernel/linux/files/0003-use-pkcs11-provider-for-OPENSSL-MAJOR-3.patch: does not exist in index
    Applying: linux-bb.org_6.6: Backport OpenSSL 4.0 patches
    Patch failed at 0001 linux-bb.org_6.6: Backport OpenSSL 4.0 patches




