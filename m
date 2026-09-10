Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B4EC79FB6
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 01:01:48 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3489.1789002103751619310
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 18:01:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=lmc2sO2k;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=sOZ3cpHv;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689MA2Xn3700120;
	Wed, 9 Sep 2026 20:01:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yLed/7rcvVaJPocMUn5Me594HBbaKreK7Xnv75fVB
	Do=; b=lmc2sO2kHgDR5eci6Zsin8tXxgkg1dXcqtBz6IN9XkYnpYXry4GwHYh6M
	g3ZTHNyek6w7GyPYqTYC2b9E8WeZwYOJ9Ck4zgeVDXLCJDgztXnOWtfXjauc9m/x
	VU8mkgzdRhepfqaEEcd1g9sXVCOo0VRJSqQqYSu7ha4opFWSf/AhlpFZ1RNhQtUl
	IC+VtOJM/KkATIhjCYIkbMpiT5X61AbjQT3Foxxo7pVfBzcdAflhi8qyemrr1ke3
	TB6cQGCkhGRHrp7RuCgIzSBoNcDzJB5s9xjcmDCx6xX9dOzs9xLovIRmyeYHeoI7
	l3Z/wTaLjpKuWU7Rkve4hO5HRv1Dw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011022.outbound.protection.outlook.com [40.93.194.22])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg9ye3-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 20:01:41 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jzX4Cc7psRF2bTLP0NPlW7KEySi3892kAbhs93QAK+b/RGMlmz+yyLLzTMnT4IQjav9BLTozDwg3/adDZSmG07plUJG3y7Pm3ooms+vBBs8pYNbxQKQuPdG3OEm9Rr2DlseDUsDwazgZx0KrQNoGK1KMJSeXpGeDqOgTKxpSNMJZ+eMIJzxsbhEru7jFCV3byA8w3GTZB/LwTCiJUTCTuHWq4VxeY+dkOz2VxWkIONZQFjYbXSIilB9fp/0Ppenk9uSJRJET7m626vRAzYMrgjA3FYFhxQvfd+/id3hdhuCXDkxxT6drnkq6l3uutzCUEkPc1NyV6didu+UsFgO4Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yLed/7rcvVaJPocMUn5Me594HBbaKreK7Xnv75fVBDo=;
 b=B+x8ArPmeF2wAMni1OC63kWOtc0iqo4EEYB3YCmkVNP1fvPDswjeRYd6jJY6w547THtEAMYMRhuKk4ycY58gmQgh45fzMIChq8HbZrExGDu7gvIzXPNrDTImAaIUwtkXv3cs/P9FL1dllI8r7CBNkJDw2whQAtTAo9A4xi+bn7gUe9FJFj5fMDL98M5yL0MQrE9eFESoJGWW2uCN8MhXt9f0sZr4kcPkmlruZH5UFNzjzaG8ovlGkZIutvrm9vFo+BGIxoKLbuKK2XYOLdod7jnE851wH4z0de30XgCarz4Wr7NB/mp6hcGe0GbDiNfmFZ5RbzH98uAdMmNIjzMLFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yLed/7rcvVaJPocMUn5Me594HBbaKreK7Xnv75fVBDo=;
 b=sOZ3cpHvQRDbO3TLwCqjFfjgqVLkdIweGnpf60lzpkapFgak9pyYXG9NNGXMA0sYF84XSk+djNxpXp9QeAO128vj9IzFq6KBLS9ECyndLfZdOkKBb6YC0lB3zX7zJpdnJEYgf4FMk2J3B5B2b5gjLQeO64mduvE9MXuojWlS824mvFRRM/1fwYgoEzNfWR2T8dvMoVAsckEfm5Lh1eeF6Wkf2+1mlRrTConoxf6Zm3oSS0GMF60201vBnWo66yr1DWPVSq537lclHKTXr76rpNJopG7K+tMBqNB9R0mn9N/rL0sBjIs4oEeugWOje6vKMU/YZEnueDCwqWORm86ZXQ==
Received: from SJ0PR03CA0362.namprd03.prod.outlook.com (2603:10b6:a03:3a1::7)
 by MN0PR10MB5960.namprd10.prod.outlook.com (2603:10b6:208:3cc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Thu, 10 Sep
 2026 01:01:38 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::14) by SJ0PR03CA0362.outlook.office365.com
 (2603:10b6:a03:3a1::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 01:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 01:01:36 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:00:35 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 20:00:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 20:00:35 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A10YAZ2312018;
	Wed, 9 Sep 2026 20:00:34 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 60EED9A9C4; Wed,  9 Sep 2026 20:00:34 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH 1/5] u-boot-ti-staging: Fixes for OpenSSL 4.0
Date: Wed, 9 Sep 2026 20:00:34 -0500
Message-ID: <20260910010034.1217555-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260910005822.3867633-1-reatmon@ti.com>
References: <20260910005822.3867633-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|MN0PR10MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: b5edd979-8346-4b42-5925-08df0ed71093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|13003099007|6133799003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	CUpKmHjJxkkwvBDDAZQaGTV+LnYCzhHaQYsJ0LYljpUYaGZ18gFCoh/jd5FfRCCTbmRBV4KYXP0WZCVJbmHrvTsWKoY9AOrEnQ3CcMSfaeEJWQ58XOZMAChhYRSt4Hr2pJ7Xi985JhafJl/Zw8CS21Osem2rK8IPS6aHvjbLo/aE11PLc4Up4kb5Pl3VBF/b2zbjpz1eyk/1f60DR752wCfqAa5bzDHqwYOmqiIV1sZqS8dkJ/bu7QL6i5Fnr8TWTqTCXXiSH7Wj3Hwbj8rGq4HdZxJSKfim3PoLoQR5Xxw8W7s5e12EfmrFZBpwTwIoS3VIqdeCCnNpT2L9VTjesnEc5VXSHgCrNK6GuarqS3qi1fNBWeRdQriDZ5HY/L/B9E2AT6ha3Y9MjXK6lnAt1iENT6ia1siX7ku/Tk0xZzcgEbLkXa4hPTHWM36VdQvQRtQ7n0SCcDS2UTfpHGcGqTWcAi/wuexa5mtK1/O3NpFZ4wT9ZYE6pQoXXta8cVznm3JBr3QENKmbAKVZBr/RZowkaPwBa4h8/zE8EbYOTpPqZnwYlFgEW3wiS8dUKaa6L3DEHTgRxAn4ZUSHesSJcKIjlmO1cMhAAVkeMbL63LJ9o49s6C3oKBbI8Md8gxTZcbbDDrxT2NJIyO0oS2ySxg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(13003099007)(6133799003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uNMA15Ir+L0lY5JPJnzonKSWMmP8n/3k7Mqh08LNY1luE218UwTxk3FjW+R7uGt4e1QmB7tYuCo0utTZbMDMmYzxCtxGFOTb3cP51VvJY5Z3yL7URSz8fBAA0xqemkCBOyK+sz0I8n5PAivzJGLe4X0SnUBbuj1OBfpvC0lPRlEja6JGUpQdLlNB1jtbiM5wS4IDIi4Vih1+sbHmoZHig8whBOOJnd9HvwyUmwkXJFjgMxfWUpcsflYvAe56fLJSHy/ojjwnnZn/TG8Vl3AbLTvhTOlt6DzAadxn8QLw9H6FwPXDLKGH4FdiDh7ZQSu7JZx0os2JuywZGXNROBer+yyYyMG58G1Dbl05jtzOcFa+6GqC0Jwpz1pbzKaM/m9Ltc3MFFF3g2b74yocJqchSRNsCMDVUQPBlJ6E7PdcoIb+6emuZAUrZpgdf1sH/8uG
X-Exchange-RoutingPolicyChecked: 
	n4eYdYVAuT0R1/Xw2nm0GM3hPDfHV8rZxLMXFVk4aRc/MXcHyPXq3+hX0xgS8IlK3XQ6u6O/r2MBxLxg8x+yu8uiEd8nYUuxEvC1xMGtOy6LGooLaIYAsXwUp9tV8LsyC8/KNzVIIviBrpAy0FCgQjpynNdUn5TZgbBmq4kiSPAYF3/zYxp9NovpUH2HGv6dlwVXiYyuOcpxLT8VIsnvs4BOBGgVAoYW5XlH+eolHmZnUONjx5ttlepmmb+fG71Fz5J9w0znBdiT84vsgNN0fuPXAMWN7cXp1HaeM2duSex6rdNZxoEbkqyzpXZM2wWYIvhLXE/VAKRyxL3YkbFDVQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 01:01:36.7393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5edd979-8346-4b42-5925-08df0ed71093
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB5960
X-Proofpoint-ORIG-GUID: eeCFYkRaEU6V4mtJld55VWDTFQYd4zkq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX4DYV+nS3t4rj
 xO1Hkmldbncr+44oaI3WNAIP3cF1tVKVJncXPZvt8PVYONWgrs+iYNdQ6eMY1go9sOB/3daxjYM
 IboadMysedXuP8aJYRkJAcEBd3Aw7aQ=
X-Proofpoint-GUID: eeCFYkRaEU6V4mtJld55VWDTFQYd4zkq
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa20176 cx=c_pps
 a=nhquEFRPp8Cuo1IKRjcF3Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=iGHA9ds3AAAA:8 a=VqPiF_so_wze1znG8zAA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX4obQCKhf+Vv8
 XP/yvlUeu9lKuTy19M2u/l5H/PhZSsH+7q17aSGm4PUlyk8BFCyDC+p52oYqD4mm6EQydGCXpH8
 U8KerOkIjWZS/VWHQqtuwBCJKKSdHMSwkegD/3qoD2RGRABoMoF3HtTbvcUm3qpDkJ1/7ciPBsy
 DfE4Q/50R5QUJjxvKE4If36t/TmSZ4gK8Sb35uSEU2r6UK/eg/gQnDj7QRBH3ZFBc/iGYqpHc5p
 YqMkZb2ppe2ksIMGQYHMg7hAuJUMPMVqxrKrKFs1mgV53VepKqKyS+z3sRQgDk/Z4lERjFG5JS3
 SF0OYjT8Hm+viDYrA60m75s2+OlKUbrqICMOLFKAkvidQn+5BOvRv1SzViL8RuPRoieUCrqtEMu
 9BvwqruR68J1JN48di0BJMV27dKRKm5CSdmXnrjdCjOxPNtOYRX5pHWRyiSE3MDVFGIQt2PKII/
 uhNjQkYj2oeVSxF2WUg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 01:01:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20355

meta-ti / na / 20260910005822.3867633-1-reatmon

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH 2/5] linux-ti-staging_6.6: Backport OpenSSL 4.0 patches
    ERROR: Missing Upstream-Status in added patch file: hunk(1) meta-ti-bsp/recipes-kernel/linux/files/0001-move-common-SSL-helper-functions-to-a-header.patch (UPSTREAM-STATUS-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH 3/5] mesa-pvr: Remove makedepend dependency
    WARN: Commit message does not include file/recipe name: mesa-pvr: Remove makedepend dependency. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




