Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2442C79FA1
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 15:50:50 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38488.1788796242305247271
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Sep 2026 08:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=RlH3l4G1;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=XROjiEfs;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687DeimJ3567919;
	Mon, 7 Sep 2026 10:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=duFVT5WQBfAlX6jRdy20w8zl9c3LewbEIpdlch3aK
	70=; b=RlH3l4G1fQpxvDqZXsMyDx0LyGS6u87TV+Vg7NPb3qfyVFd5/NPBXqDZI
	eJHOQ8jSRpANYwA42Mu425uLFN9fo7Q/WGSrblgJMLHBZw8Cki25ZFJl/JkBsLMd
	mgKugkB1Pw1ijxhGbtqxXrg/47i9kh31oszBeAnMga9D9bGagZD8VmEUAMWqM764
	VekyZaGcz7ppwJQgOFcrCrjR6ISSGje50MXqVSU9bSAM+fi3Z65/zfvNqYCaiDTq
	lCkQFpoQOokMm8YD6HZXW94KZCHFtA3WsmjpSKdAYH89GF25+QFk7vs6eYYfNyyk
	vrmNyr2mvBUT28n9sEuEe7FmCfatA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011043.outbound.protection.outlook.com [52.101.57.43])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gh2f6f1me-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 10:50:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BTFQa4av5rb/ojMV2WpzkykyZcoFoM93D+cZ3zb8ng34NtYMW8MLGoAWXWIs0u3Nw8U6LNZlMC6zypyeI1XKtMHE9UpZ2ngFUG8581gUfb6oBJtgWR1q034ZZm9vDgldQWq94mDkBg9JnNXJ+z12m4/8et8xPlBJrISO7K/ufIS7vaRgy6apJiJzunrf3SY4jRy5oWA1qjMohnjrW15/E6iqfNqAsYx59sehy62Dd3NeWdCzJ471kSZjzywJoAmsb200I8m9OAg6yy/CXV9vZx1wo32VaPk6q8S8JDiu3QsXlB/bsxISIW14ZJxju7Mpn++iaNlc9oT+4ZofyBO3tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duFVT5WQBfAlX6jRdy20w8zl9c3LewbEIpdlch3aK70=;
 b=O+igoHTztL5OLCpZcE2GX5v662fjP8TJn/MPeYCcA7IgPo10uHMakG4G2UYyW+z5VIdlQkzgIys+V5vYsG9LrHp1G8MXf6PRMdw5HJiYxYV6HeOnd7oHCKyEKljXIdpxQl49VBsbJCx1pRrP9lQ7Vpbbz8v50m/yehrwh200vjOq10rIkaSUVbP8H0BLE46L7Pdf0OPDSY0m7cjVZJ0BM1Le740oGFa7V0e4HfXuYq8VpeKfANJSd9UIU6E0BeFkXs6t+HSMAdBdMd7iepW+I6aV46WiIMFZtewdamft5m6DzOOH503anH9ati68hDcjvkyHve6lNrhVV+Mhe2JP0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duFVT5WQBfAlX6jRdy20w8zl9c3LewbEIpdlch3aK70=;
 b=XROjiEfsyJDGqLQ5ZLGYkEBr2sh77hLSHUAdCmVSA41tuL2XEUB6PEMg8cxhS7pL1ITyvFf4VlMZ8IXm2iqO0/F5EhJ4fjSzG+EPl9om3byCRUB9sO0UerympuMnRp+8XJNcdpIex9PI8ORCru/9hf2pOVYmOXJ1zX0g6GVQ6wNlh9BNfmez/AdQmyOAPnEmKgMRlz7ri8hloL0uyyFjJrn7qMSShrILwJ7fQ+yIeHRnM6SUosEG7Zeiph2RdwNbj4LOv7KT5NS5hEnunb+s0vcmn7bN+I7JVqN/zuKFdgtLHUBItoP/FBW96dIiLnuyRXSLcvlJB5lyec0Mdv7g8g==
Received: from CH2PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:59::33)
 by DS7PR10MB4880.namprd10.prod.outlook.com (2603:10b6:5:3ac::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 7 Sep
 2026 15:50:35 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::a6) by CH2PR03CA0023.outlook.office365.com
 (2603:10b6:610:59::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 15:50:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 15:50:34 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 10:50:27 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 7 Sep
 2026 10:50:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 7 Sep 2026 10:50:27 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 687FoRGf789091;
	Mon, 7 Sep 2026 10:50:27 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D504B2A81; Mon,  7 Sep 2026 10:50:26 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Franz Schnyder <fra.schnyder@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        "Francesco
 Dolcini" <francesco@dolcini.it>
Subject: Re: [master] mesa-pvr/libclc broken after LLVM 23.1.0 upgrade in oe-core
Date: Mon, 7 Sep 2026 10:50:26 -0500
Message-ID: <20260907155026.2956271-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <pyqpmssd7hwfvotynswv3mhg5bqkaa3fdvctg2yvuydurvegvi@n2gbtvs6wn6h>
References: <pyqpmssd7hwfvotynswv3mhg5bqkaa3fdvctg2yvuydurvegvi@n2gbtvs6wn6h>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|DS7PR10MB4880:EE_
X-MS-Office365-Filtering-Correlation-Id: abcb00e4-673e-4c93-1565-08df0cf7c159
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|10067099003|22082099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	270Y4iQV2tuC4uQ0Hjtq1uH9O4Ua+pnKvKhGNiaIEEnZMONs107bCCk432czfkEU+41WmFVz2V2m5CSdIQctGTIy3fRF30wF47NVNx2G214k34/RFtDN1jiAnQTVxMfLLXSK+JqJPDl465CNXybGBNwyG5zUxoSFn1yHzdf2vpkIakPug8eoXdt8PddnyWy4JMhQ0G3eaC0aZmSDaxtmLtj5kzrWF4ucPXJ8InLLFgWsCNZPPbm3b05gpL5B3oflvEcTY9u8iUqqy6L5ryn8rVpgRILQysY/mp1A6ZyKN/I6Y4AU4Z1SNIAyCr6xOh0aZdyvgsLvq4WDKmhIS61A9xwPWH8ty2kplA0UUe4zBVymG4w3JG5roDVzOLiv+Q/JB53PJCy/ovxilth3sTxdUXWtN81nZKkdQsTQ83WWXEMnrUzFnRKCXwICcyovp47TynvvWCc6gheHDHE6qu8MAtH4Aze1tUU/z0JHzcCrHz3MxE3CmufmngZIJfcMx8vBkI0zB8Kru2mz5L7EoKNJT8Nv7RK5x8bUcR8kNBWCTdEgi9mmw0sONhQ9HezjBRjqgcUJWtX2yO9Xx+R/l/fxzkKR1sfVsKT9BNmM2DRFjvAd65h7RYVwM7aeu+mQNDiaGo028TRd2PCRiTp/XvJQeQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(10067099003)(22082099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LHrvV/Q6j+/tdpv0YKi4yQlue/rcLU5vnar9D3Ew44H0K3LwgMGItYnABM7UdKv1sO1fmPZo9PvNiytOOi5bjx9wLms1/wiBBbBdmjsCq0+Ccej3VKsp76dyXuvip83gIMDFgpwYcyArCk5vU3A0PINJXrjfuZEoQihXvhqR9fp2aIJvgRdglMcaNW/sLePlCsB9AfmiEibgXzbwYcPjYRc2NLIsnrfeh06BhLG6TdNSL18T2sWtbFbpWL1+AX1fTe0FVooXnV0it8qAF9ZDn0J5YHkUmFIIadViKTuukROOg29TwKn7v+7A6yizCxGVDfDAUHg4BHT/hGiis2Qw2PVAW5lTC7KLoslDa5i2emgRvEKR4vf9rB+3v4zZ2PRU5dlsSIU4Y1f8ma90dKU0Moy4KeKsFwnBJTWu2HGdpZR+PUNcrzgseXgj6qResvFQ
X-Exchange-RoutingPolicyChecked: 
	de7SIcX0EtagaZSBkElyX4SBn1nTDmFZbkFgYVk3Fi78It+pc+iT9Qk5ByN37W9MiNqeLIx99V0MVoVebfDRKOniBcCKR2+4RRrnJCIWypW2efeLjwHKYVdTSqtnxjeln+tSUklxKZbOfe2XLYJz+okH+g4lxSn8LHlbrRfQIwfoZw9YkBD3y8YMqSA9Z3n38icdMghW8EN8XnWdzGjO7Y23A2cPJ7gY9k69rRYX3IvDZm8g/Sa6bEwROsPkTVD+A8cjsrOB0E588SiUh7AaAH4A7tp1hpzcgMkxUaltwd+mHmxj4PZqg7b7M1IAUHCtNSwf842Ph2UbWbGI0BrOGg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 15:50:34.9226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abcb00e4-673e-4c93-1565-08df0cf7c159
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4880
X-Proofpoint-GUID: nZkTZpEXBfsUBq7IxeBpYD9rF10ONp7f
X-Authority-Analysis: v=2.4 cv=Wqkb99fv c=1 sm=1 tr=0 ts=6a9edd4d cx=c_pps
 a=OVDEU4yRZFO0l3mlJ/t01g==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=VSd9Nm3Xx_KdD6WjCekA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: nZkTZpEXBfsUBq7IxeBpYD9rF10ONp7f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE3NSBTYWx0ZWRfX3D/BcnMlztai
 dnPIw9fWyOnAh2egrJL6ZEoew4R+QAbS8o6ARkHjxLWi7syUevYobJun+Mh7Gh5r2ddE+LM/ZS5
 4BSj/49tajr9Alz5Qy+EKYvhoZtu8DYyC1A8S6RlVhbknfDbDN4ou6wWAZIxnwDa3KOUyHy92OX
 sUS249+qa1KAePfzyyEQnZ6HMSE4cbNH2IDWLDXnU0IFCp0K+rGbvoSxAjF3I4VQW6M7EK1Q2Lq
 loPgdb1hUKQVexyUAsdqEM7i1/ONbUZw4y+95YWRd8HMFxzPNbSLECpuBCGtc0xRdGxg2M68Df+
 2CKBF+JkFgjnmRJ47Rz4srS1xkPJ1VHrjDXmDXS3/91wKhjzqr1KhO/PNnGyJOUmQWj/NucmJ1q
 DkdMpuPYep58BAHj2SlWmVuuCWGPQHUaRTA3KnWufgvhugu3tyTSg/7Eg8deC+MzCQYHD1y0FCa
 i3FHGweWi6Q6N20b92Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE3NSBTYWx0ZWRfX/5sTpJ0VRwaa
 9bw37p8K7mKD4ZVIHXTmSKMN4EibMT1XAw/mtMmJyJe5RMcc5mGhvIgDq12WbGxBXyHEtb9sciS
 yJhaMZvXun0n+VYcoxbBnekF2sW8cYg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_04,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070175
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 07 Sep 2026 15:50:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20342

meta-ti / na / pyqpmssd7hwfvotynswv3mhg5bqkaa3fdvctg2yvuydurvegvi

PRC Results: FAIL

=========================================================
  check-yocto-patches: FAIL
=========================================================
Patches
----------------------------------------
FAIL - [master] mesa-pvr/libclc broken after LLVM 23.1.0 upgrade in oe-core
    WARN: Commit message does not include file/recipe name: mesa-pvr/libclc broken after LLVM 23.1.0 upgrade in oe-core. (COMMIT-MESSAGE-2)
        patch
    
    ERROR: Missing Signed-off-by in commit message. (SIGNED-OFF-BY-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




