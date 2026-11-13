Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10359.1794574900316085530
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 05:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ea2x6YiB;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=E8N41wQ9;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCVpx41245497;
	Fri, 13 Nov 2026 07:01:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ZiuJainTrFbbgbCUhymZobSOFIB6514Nv1kuxfQlu
	RA=; b=ea2x6YiBZtjoAhZXgox865/bmNdy2zKMzUTerBKGwQi+wawN6R7FK6wBV
	DFy6nHIALtP+WHsstTvPMLersww/BHJSJ0IFxgSNOCiE4ehwPPa9dHCpByQs89io
	TSwev3DclQ7rpF9aQx2c/NaqZttJogO7vlTywrGxuQRuUaIv+GGuvEpSmiIGaO1I
	5KDcTbVG6f9BycwLcqA7U01yLSwd4HtCpPg3Xfso2eeodDk/kA6F9/gMsZPrYcpj
	EOq0wPjpt03qYwd6O/C8MAwcpdiklAkn0m2GzyPlzCOCKPXmp8Yim9Y6KzAzZ00h
	F2sUdjjNUl4Y1rBlkUJXweV7mxbbw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwym3932c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 07:01:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOrDORRY05rGOw8VRfH/uy4JU4AG9RDmIWi0V1qf7h/Ki9Ss5ycgMyPHWMKO3fjRA/fRsIdMgMpW2h+c3xBrYfux6+oaFEx0kRi8KQJVJRl1dWVwsRV6PfaxkgogvcDg39l6mBNcmbMN2A3oAIQuWj2xQiDnp37BdHI9wZNZHq+w8RmGtqBqbKqqmS1LF+a+5vsucH1IEIlE/9b5N3dqbI1cNtVfrVQZ8VGWrxH6NENwhYwTV4kD7MZ7QzR2xddM7Z9lr6GFqkkiDj9L+2V/+x5rGZ+6Xu3T4d8vV6uj1Hz38u9KIdPGF4Yq9zhxLIXPynph/hSRHX3xI7Dp+2Of1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZiuJainTrFbbgbCUhymZobSOFIB6514Nv1kuxfQluRA=;
 b=bA2BlNhEUnFJGvrd3R27vMHCspnBwtVfo1lDVON7Al2/34NoRSA9WI+PRGfAWmZA5nzeJhFQuQCSULgt46YprGtXQ2oqr9ydu/GqlRQdsK2EX6o63gItHKNhJqgLFQS53hsVyOaljStphfJdVpMLnphZO3QI/ZXsv5lR66Ms7XR9ZFr0luPxes1IRKUK1Z1SB2UTLFTmxEKTVUKrv5ytrvgKafNynTlYHal05fmZKbDiI2oD9Qd+Hc5VUAThqCVOlIHlcIySOs8Qmg5HY5XF6f3PsXgTzoXfk1nFBdFhaET+dVZyuXz3RP4vqKndnABP7JgwMLZSlzHsdgoKVZ/YCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZiuJainTrFbbgbCUhymZobSOFIB6514Nv1kuxfQluRA=;
 b=E8N41wQ9ff9MopXZRAsHFdOW2/88MoClkTM+8SdLqqipgQd0uM6tPB6+Ryb9lgt47N/9du85ki+/OaWPB4ju1ZE9xG2ndIGz/L/slSBaLkTguCJ6N6+EXTtyHJ8HPdi3dCsDlOXUIzQad6p3s+ywwFAonYm/q/AjvuXEJHO7c1CY8BrHT2iKLjgtLhRoAXpXMqe/RmcN9hljX+BKa0eOCYdp0vWaOCicSuZGrOjqSuaFRYBaRzhQiFbN73UXsTDqOF4kT0jlbDtwA+ubVi5ZJ1fb1uCgiacIO+LNUWyyWfw6pFVAYRSUhF0STe6Ggd7JFa3a2CgCA60df/FRz8K9zA==
Received: from DS7PR05CA0083.namprd05.prod.outlook.com (2603:10b6:8:57::29) by
 SN7PR10MB6329.namprd10.prod.outlook.com (2603:10b6:806:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Fri, 13 Nov
 2026 13:01:35 +0000
Received: from CY6PEPF00000049.namprd03.prod.outlook.com
 (2603:10b6:8:57:cafe::7a) by DS7PR05CA0083.outlook.office365.com
 (2603:10b6:8:57::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Fri, 13
 Nov 2026 13:01:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY6PEPF00000049.mail.protection.outlook.com (10.167.247.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 13:01:34 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 06:28:16 -0600
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 06:28:16 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 06:28:15 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADCSFe7954685;
	Fri, 13 Nov 2026 06:28:15 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 2632A9A9C3; Fri, 13 Nov 2026 06:28:15 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>, <afd@ti.com>,
        <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-*: version bump to support wrynose
Date: Fri, 13 Nov 2026 06:28:15 -0600
Message-ID: <20261113122815.1881070-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261112223746.1226911-1-rs@ti.com>
References: <20261112223746.1226911-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000049:EE_|SN7PR10MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: f374d9c5-0c3d-465f-ddd4-08df41863ea9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|18002099003|22082099003|56012099006|261022105027099003|261028144727099003|261026121527099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 38j9wb1kKW9SSYrULzAjXHrfVDbM0BnYaZHNbKhyQCedum6HqvChiQTKLDx0t586l5n3QjLD2xGFFyHrPIDHPfvCjak+fET4BLgDhu5Vv/F2zLtvYthC9MeO+hw8ZYF8aFP7RO5yg8cy+bmbNkbUeIA0gcyxwbNdxS60n1px0WuyUtJqWYn0b2VXpx0H9FNclDwpTslps92flYDMd6O0SwWikSJ2+pHYh/YJU6ZwrLAuMlTAoQNd0ByKVWQ6bo0g77FLSyStW8BBSgn3rzTesMNn9jfQ1fIKQ+JJbk3wzjpvpzuyed+GZtZAvFbVs9M5KW/yWH16P3eF880/dw2hgvBA68AP3773d8yNC+dtvU8TQ0TGI1GIudjxF9TgVRiByEHbfCj6kab6oSZOavyyA0aprsa6QwgcFWISCl+KXpwRKMHMR0/U948v/pXBnjWAuS9xd/4E9Dhg339Ruatg1CExV3bkpuQXtIHNJJ/JV3NcGRujqX3kGciAW7xhQa/egUhqhnUli3qZHO74z1GHAyLKezIvjJAv7XZKp6smRbybOz7+wgFLvdRdmdSJwuR3zqZV9uUMbv+LkoAJtb5aii9HS71m93GTVftWlQBwG/6sROzF6r2HD2ELnUQC20TF4x3yZHfUPjZsx8tLp/8xMsxNwW4V+VL6sZfQRZfJ23VQHLkez7lKDtwNhrFSM9UHfFAQns8ZnTJferR8/UhOOw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(22082099003)(56012099006)(261022105027099003)(261028144727099003)(261026121527099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: el5fhH4eaUaD8bty+bdsNAByK6/Ptk0swFwxf5TPiBDpUd1IBpPyAcZ/qqGfG9k99sC2tJ9/k3gSl30zyxklkeyXZkOzD9UcnbSvA2p2UWjMxbT5kiKcDuoP6t50nTKzDKzZe8Ac2yGeEi8qWLgRYiu/TLuGCz4qIAtE9n5m/274q+uYPFa4Tmo+Z2Ag9njxoqfaoamo9FBuNEsdhwJQS89Z38cC2ozyfnqzAeeIomr1w65qKUSQqgj7PNl0IhuAjatmA4GQzHEP7eYxPdyS3U4D58QzV57EwsmyQ+oIiNz8eJ0UGX9Ejh27ftu7YIwCC0DKfVH/zRVcXLbAJszx7SXObtGFrnbqsUez2dPvocrfEpV8+DXu5o81SZf1nAsPGvCJgb/POfp9GAW5Fsq3wZBr4euUObx4lAHpC00Ebsm+/IpYZUWrXT0AiQDy+wt4
X-Exchange-RoutingPolicyChecked: J/J0izb0T5TUSJk7iL+TLg3FwXsUBo4X7npuOV/rWjJvJ7IOF2dmUF7OInLTW+fjBvBpBycRJ925InwV/nSo/nCsLjQIlmwYbUyPqMQEU0rELiC0I8bmTIcNfeX35JMSAdOYPUam/Y5zamMIf80ezHQv2YH1YXXnSIejIOrPl1ACR0hALctmtbThID2wy32xPu+xi4I8Z7O7ogTIfNzOPLzW+89mutY/xsp8tQRCX2MrOjLDxCoiwUcQSNoeE5Leo4ox1nejrSxZpWjw03n4QqJrDl8glsMNHpQoIWam94FaRlwGKaAj2lM03+EVfcA/ayhgKNc592ppamw3sDfLYg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 13:01:34.2226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f374d9c5-0c3d-465f-ddd4-08df41863ea9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY6PEPF00000049.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6329
X-Authority-Analysis: v=2.4 cv=cpgOAF4i c=1 sm=1 tr=0 ts=6af70a31 cx=c_pps
 a=TAA+lrqbVY7ItQ3T6C2wEw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8
 a=8ohrPUo4q2dYewhEpL4A:9 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: rwhnndjNlwZXq8DEieAer1DKWESKp9_i
X-Proofpoint-GUID: rwhnndjNlwZXq8DEieAer1DKWESKp9_i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MSBTYWx0ZWRfX/te51z24hpAE
 LyVirF966q1daBEE41dPkrKAnRltO5P4Y1UFXojryZPPbqVGngznBGtVACvxhzkf/oUPWjfE4sb
 r5zbIkCN/N5EopRkr4ahcZpSZlmy83g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MSBTYWx0ZWRfX7hWP6xhZgu1Z
 +uKzLa7Q2QCD7ji09SqkB17Yp6On2IivxYx+UqhOPPqVG+6KX9BypBLMERjHSYO7JUg51MywREq
 pckNYtkVW3PNaEBfGJlF9jHe3zm66RyMp9kCzoHp6BoqWJoqaEfceGKhFfIcfIYhV2KMxe9e7Gf
 YgM/HFUiflv6iOlyG7J4obpjDIcef0y9Ylommatr2vxnVtx+75yCVd2fUnTO5Egpn41Boa70ng8
 OQN2XSei/zuh5HtB7n5p1kt4japCkeD5Ht9hBiaEdNqSGXbvk2mWOMpKNyUm1UX2ST9Tqfv2fnl
 dKLF0OOk8/6O0fgLZZD80vXCnmntJO85fTWfkQwyF4d05uT1ZVTct5Nz7MCTI7p5uDDqfGNuLyx
 hnXZ5YJg0fq2v7x0rmOPCQcEq7lwTeFBpU0xdgS4j28ItT6N0n44lCmPjhkWL4CSmcI2CLOPU6V
 BBahHFy1AyU3kdFSJQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130051
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 13:01:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20536
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261112223746.1226911-1-rs

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
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-*: version bump to support wrynose
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 12 Nov 2026 16:37:46 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0eeb8dc55907312fe93da7b7505ac38c47ae41e5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: ti-sci-fw: Allow empty SPDX deploy artifacts
- Commit SHA: b3e4f2c6efcc4cca09550f4dfa8d4b87ef5f98f8

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-*: version bump to support wrynose
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Thu, 12 Nov 2026 16:37:46 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0eeb8dc55907312fe93da7b7505ac38c47ae41e5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202611051452
- Commit SHA: 1e80335cb1f082e67f11f342e7dd8de5b4b84d98

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS

wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed

wrynose - PASS
=====================
All checks passed



