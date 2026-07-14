Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E5EC44501
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 14:08:57 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10209.1784038136680844632
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 07:08:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=i/1IjYza;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=wTda8aHG;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EBQbMt2107166;
	Tue, 14 Jul 2026 09:08:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=f6FNhdg9yN0lt1bjHq64s+kNh1hjlSs2uX9Ti6+Vi
	20=; b=i/1IjYzacl2xxNpnTDqk6YUDmGPQMnmKaI5hW2hEOtRO+9D1ghKP29fH2
	Lweh29OzXnUQkydCPT2/8j1+zgoXS9a7XxxmJlCZnzUPFBlHaSbVbB26dnvLFaWM
	d5s3v7mps7l37Gju4hdxTcifztyyKADwh24kP8j3F3+mthyGEElUhi0RzBv4OJAr
	7JUPRhC0Nj+VvaAxnTuuQIKUtBuoahYyVe1KO7fcr0EBUx4r/snsymNDpx0unu/G
	IDFH9r02G/2+GIbiq3G9dVGIKeCEZbdbA1+BmPF5r3Sq+wN/WHogbSPTgoYAk184
	BHxnb8NBxmDoERw8veHkJVezG2LPA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010066.outbound.protection.outlook.com [52.101.61.66])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fdm2tgwvw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 14 Jul 2026 09:08:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZ8y3SDro46jtX9XXZ7DGwDkiui6NXU0t+4UYpX2Rdnq/2hexJDHHRf1w9X/iu8/MLtQAgu+tU8VpPyqoWaUEF30kWRpA05mtBOz7vLreYHwCDxWiEE6LyR+bVUCMv5nNlikmJOjKk1mpqybwW1LFr6ZLHSNe9zoPlXEBKaZ025H3OFNj1WanfKBE21wRDmOclk169m0X9VpardvzA2hLh7wEGObeaUmzi7mVS+j1TxCZNO9mj9lsqcxyGp04JC0Ld8oORUtWV7RoOqQ1h8VnKpyIVSrwZQxJuFdcsQIFjH4luxZWVViVMqK9ON190V4I5hP/zGcwgYB/2QKmAHtlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6FNhdg9yN0lt1bjHq64s+kNh1hjlSs2uX9Ti6+Vi20=;
 b=lcEYOhtYQkymKRGm7sSi3cwrw0jiV5B+QXqslOq8z82WAMbvaFVq1wo7j7N4Z2clLbtoKY4pXlb/62j4KNVs7ePmk8R617XBtQ3kLhJbqrcmROtwal0i6FmdooLbGcWSI6IEU2853cJbjkzrSUuz8CKutdrhwOjbhnhOTOTYyuG6P4G4i5NAIZXCQ14SiMMh5Tk+it7ksCyfpSDH4iXMd5dTjAbnRW1o9xwEkjbJKUBsu7HDHJdAff7FZoc2ptC+P9svZ8d1BcPq/ITTLFkbETWILZXOGvUn0R0AFLxJdWDUFyj9d/ixg9I+8TgE+DeKTXItEuE6BBg729iIU4jtug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6FNhdg9yN0lt1bjHq64s+kNh1hjlSs2uX9Ti6+Vi20=;
 b=wTda8aHGw2vgis+SfuSpEizyk+aSoMPhfi5xOI1GLT+m0coT0s2te79krhjVkz4JIFYsmbgtr2xsGvoJrUrFZf7y1qamb3zJWKoDGaQyq63n0K5fEL+Bra92Kz1IP1q4Awp6BUL38BUHdNLX3XHZvnxiEchC4KHAQFqaEFsZ+JQg0H5ny1pLJXnnMXtYmQMM1G8O4cBrPiavuCQfXLPDG0NdQXwgLxM2hEq2Ta6tM1wBrOdDXn8lCSso141znKeiIfdUYjM7ciQpcHo4160UxJai4ryiorFwiSPx1KWdCSV3fB/Msz8UQmBwMaeeF7MBvnM5danFXgG648HIx7ipzA==
Received: from CH2PR08CA0006.namprd08.prod.outlook.com (2603:10b6:610:5a::16)
 by SJ5PPF04D2D7FA7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::785) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Tue, 14 Jul
 2026 14:08:48 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:610:5a:cafe::69) by CH2PR08CA0006.outlook.office365.com
 (2603:10b6:610:5a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.10 via Frontend Transport; Tue,
 14 Jul 2026 14:08:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 14:08:46 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 09:08:46 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 14 Jul
 2026 09:08:46 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 14 Jul 2026 09:08:46 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66EE8kWs2900839;
	Tue, 14 Jul 2026 09:08:46 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D82E29ACF4; Tue, 14 Jul 2026 09:08:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] piglit: Remove upstreamed patch
Date: Tue, 14 Jul 2026 09:08:45 -0500
Message-ID: <20260714140845.2142361-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260714134937.2975042-1-reatmon@ti.com>
References: <20260714134937.2975042-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SJ5PPF04D2D7FA7:EE_
X-MS-Office365-Filtering-Correlation-Id: df7c84cd-c8f5-4642-37cb-08dee1b16be6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	vM3kqu3mKmtOpmN2PB4AKgg5I/Wjk9Iq9L9Ml2/K4V9qXKF24kSKB3o2lw1+iB33mXpoecJCUBd7jVfder7TJe3pfpzhm8qtRMRHsDRKUBpdCXUWH8oj3Tp9JhrdhB8IF9rkRiozEiMltC2z+E5lTmWms+Ge8p5tpuzwBVGLijI3rOqErZHsKzltwaPuzYGFBflMfTqDf65Sd8NsdWssX17NfDHfJ0NcUdy0lBtYa2e/XP4cjX+L9bg6ShFq4pzAw/T/D6gucz4SbSDN58rYwZgzX6Dhpi72IHSY6uiRAR5RAwozv58iHs4AJDB0yHVCYQ3N5VVsSGla+gfSHQ1JjgKwTjOpRND48xfhO0vDbZKeWiGYLQ1Q3qB9XKe2/Ti1lw+OI7dVmDhk482K9WC4ehDSfFfvQpc4o2pCUQ0ewMAmNc/cCemfPFz5J/v3UyK7PqryGdbpoXr78UUBVeHXCMCtSA1QWbP0jnX2YMNC3jRJNDMRFx8dxBK6pJD29uz+5JFW1/BjAaZVQXBhfRtBWXfankRHllJJtrOn3B2UFJ6i/K7mJmByf1eY1hiSZ7shsTB1QYNe0E/dZwk1B31mYvxwoRy8NFH9/CGkT8R4UbLKqeqFgKrTFQZGxwlw8FuHURbBwomlzFuR/IllxA5oJwNUF49mvgCWTXE/osuvOBl8oaojFVi3QBgzkbc1Kn68QTkN5W7iOW36E6HCDlJjWg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	rk9yzzGPWhhA1XYm9GwLp3klivFcm+g7YqTjAlMynFkdDHGExKVsrwefKZHyS2BJXo0dCrGxOjmy6iYsL7oaZBjW/Gy/eByVy4qkXc8T0n7HjqkT943U8e7Hx5ibYpQNsTVxxw9VNTJZpsaGwA4bRiCuPpRmEn5olc3t1DwfCqNU1qT/QHjqsmC09LMXi8AR3Z3l42F4iGLsp+q6u/7M/Ssti0NFDfXlEa6LM4e+d4k2FhIatfDc0ohCHPJYnG2U+I5u5zcexgY3spkIigWhc+2Aawx5hJEDOASBXg2xoFK/KafAFECQMAI+OaUR20EcUxNkyCpo2+KUBVnKkw9i2/lDtk8/Bb7qV74bE/mHnUg2DnA7P0FT0iXXseYvQdyKYCsMI502Y66RLLcvUPoPtoL96jt212RRXXWts+q1LD2vqy8qLWHNIam3leOkqFny
X-Exchange-RoutingPolicyChecked: 
	V62LMF+rMUNxSr6FPeqN6q8BfLQ5NZI2KsG2aOQb+iwrcsNd122pIqHjmTMOWOyBWpZ+h8RBqqw4AU1lwRobxIvscSaveS8n+eR572tc/NtJ3BbxqlrVuXgByNjtOwcgIeaHtmT/E40szI70/wctaZ3GpqX6jRCTAPzILsUvlFYhhKqbZLeAZYkzPgsujXipk5TxO18mCU5QzSeG5dvATFRL3Tsi1XfEdGZX9afrvLyRSEPwNFRlWaKfbJAk7inkatBTzkVx0OWhmv0+t1cLHUT8SDX4AmIOdR7dcBKByS2dFZFD6ipmfotBn7cum1tIfDGKtE3iTe0I9QnxYMX1Ow==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:08:46.7716
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7c84cd-c8f5-4642-37cb-08dee1b16be6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF04D2D7FA7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE0NyBTYWx0ZWRfXzN/Qa2hcor3S
 P7SVL5qF0fcM4wYwB7SU7SAM45LvXYLv7WxTozzVrI9pgHMMor/d70XU9r/WXtKFMBMtsFZ+KL6
 UjHgDnaAVQezkekFQf2koOCmFJLinfU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE0NyBTYWx0ZWRfXw/JRcVhZWH8T
 pztdWUchSmDSIaeHjnzANJDZGLpK85gNgnlsALCK25nlQR9ojHljgopeI9kgmDHk/WrY+P2+5Uc
 KyzdTkVRMt3qnwn+RKG1keaLlUDxq6ICGMAZzvmUrMUkAMyGoxqPJyZbCPL/RqL4Z+ewz2DGor3
 lYqKGqh8uVj9s/x+NL/hdPR9hJp8IbcJjerc5uX17qjt0+N+paJPZfhX3fjxVyxS+LwZacyJne+
 JLG8J5wmpF74YsHEjEL4oC+aXsUgcc8Kj+6pORhO9b57l1/j8DIlGH+3fLNhvNy1jyajZJIjs51
 PstcK61oymGhulSk+e67hcCzks1w39KAtGe4lC6NQXB2cP+NbmfMUXsDXjOTQANuvRAnAm5BAQQ
 tDNOTyhAcuz4LBSUbBofugP+pjYgi7E29wy51FrYqpUpg+Dc6wIY3AyiNwH4Z1ST27naImqQWiv
 2mI9wybl/SQFxom6yLw==
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a5642f7 cx=c_pps
 a=3Q3Nz7QybYLir9TwqGRfQw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=JhSTWvMM8ETRObTaR_EA:9
X-Proofpoint-ORIG-GUID: N5fipwvzCprzOod8ql05qST3EjgFXSku
X-Proofpoint-GUID: N5fipwvzCprzOod8ql05qST3EjgFXSku
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140147
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Jul 2026 14:08:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20139

meta-ti / na / 20260714134937.2975042-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] piglit: Remove upstreamed patch
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Randolph Sapp <rs@ti.com>
- Date: Date: Tue, 14 Jul 2026 08:49:37 -0500
-Date: Wed, 13 Aug 2025 17:52:42 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2a119d845b5e85f37b9cc0d341fd5eb611ac1dc4

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: XXX: Temp update to ti-linux-fw branch and SRCREV
- Commit SHA: f5cf3c62854d7ebba2d004780b8afffe311d0cb2

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




