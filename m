Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F725C61DB9
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:53:10 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25164.1787673181426905782
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 08:53:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=oQjq/CDQ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=QawpbHm1;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEVC441690296;
	Tue, 25 Aug 2026 10:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=D4VN2LmvqN8n8GFAzvvVxyXHNeo5gkMGz0e1ZqlrU
	m0=; b=oQjq/CDQOa34f4CHUm/ucZ9Fkfl4aPyvThfBh2hEM2evM/J35W5Ko4pjs
	Gt60m4WsyGjs4xhL16VLBXpmaLQRnzsqSjn+kNMXYPiU64NmRrqpAx504nUuqyxG
	bT0KnAOAkIhy9ZQul74tPyyH36nHedDnxVYoUrHseH/8Oso2vLIDwNNDbq5t6FE3
	xxf/6Kmn/6NVCmwq88El4kbHJXGTYTZtrHwE5lO9aZICl9oegnD5ncQN4KXsPRg/
	tzewq2sH3LZIqZlSKdWJCRg2Zf04pXOrhWp7dtgANcEgJU7+Pt2F5eApWWbMKeOv
	KwpvaCwrrOuQbxawfQvFKnjFjXNsQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012034.outbound.protection.outlook.com [40.93.195.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g8xf0cx5c-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 10:52:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gpv1RLJIdKs5iqT+pz3IU6cvD3huGQwtsUyjn413gU4TvMh5ZKevK9P5uM5joRY03+KsfwZ+04icj9mDSQ9Hk0ZxE4vmRsrybDMNvpPEUfY64foeFU98KLw5z/jefIbcctcbpVwmZxQXwmzltnUaDZPSVFNDpq9fNvNTnQEuY2aZVmlzbG+I9deKhB2CXTnVqCprFZ1Ns02FaCSmnsmItodj0gh9pZ914UsCohDxwVYhc6hYSlhxCiH7gxucTh9jyuC5OsE72XZWyPCPplrRmDYxhm8rBOaSxk8sz93Jfp+Qm+Yqzk5vGvgB17ZE9NcQ1lvcfv//HQqud25Yq9Mn5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4VN2LmvqN8n8GFAzvvVxyXHNeo5gkMGz0e1ZqlrUm0=;
 b=laS4Q0ziQQKJ5jggsJwJCJQA9ekMK5cVn+4E4VXbj8LhcydBvjpsI71+x4xFbTg62NdAKlT38SDSkAIvdsOeOvh6VZnRB0O7IcZKMQu4j5HTf6RRTQbnN13weufKAeir8m5siFh/4fkEWHYq/usqIevj4v22bZ+qst1+6+S7dONKyxAcBh7wXL85FwWxIO/5dWYd1p9dMNdSYv2YlAOEO1v/IBTKHsT34eiaSkvcXDukD8ZURiVDuLueRMiefUpDG7ZfdRRuRmBd+igUF5FCxcJuZXPCFjZ2O/VMRxqIOXmhKW1hbqCypk9sjlZdN4pdLEy6ZgO9CFYgQavtRpa5Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D4VN2LmvqN8n8GFAzvvVxyXHNeo5gkMGz0e1ZqlrUm0=;
 b=QawpbHm17jnAgP/GlyF41VS/wpnNHHJjpci4uFklSLnYpuInynKOiVu4xLsCmDAz0KAo7VxcLlsJmOnB27QwT5ysNOvxFupRDYtd17GvU9huZlpRjyX2Vy0dOpRtRegyx26/UAPN27lzfV8t21U3G/EQR5SvsoyPrYoDc0H0ps5DfYVRyA9xXcYixAYZizVKhJPtEt63L0Ahv9TrZQB06qC6VOGrIt300cKsMsA82Mm6bFFNuKiZ3RxpATiPhM8qefxWDasDez11oK5TNFrqlgtWhurTXdCvNycNlO1w7r7enDcThLPfX48+DIKeRgMKlVfbyzeAchUhesJvHHXFZw==
Received: from BL1PR13CA0207.namprd13.prod.outlook.com (2603:10b6:208:2be::32)
 by SA1PR10MB6541.namprd10.prod.outlook.com (2603:10b6:806:2bd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.7; Tue, 25 Aug
 2026 15:52:27 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::1c) by BL1PR13CA0207.outlook.office365.com
 (2603:10b6:208:2be::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 15:52:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 15:52:22 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:51:51 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:51:51 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 10:51:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PFppuS2331747;
	Tue, 25 Aug 2026 10:51:51 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A436F9A9C2; Tue, 25 Aug 2026 10:51:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] check_yocto_rules: Add skip rules for libclc
Date: Tue, 25 Aug 2026 10:51:51 -0500
Message-ID: <20260825155151.679665-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260825152919.1829637-1-reatmon@ti.com>
References: <20260825152919.1829637-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|SA1PR10MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: ef1103b9-7a7a-4394-06c2-08df02c0da1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	A3BgBdqgzqX6yjODCHzITV4V4rEcSwZDzOCdhaq3yngrA/nLFqy9u3taiTd7YzRdF25IGPnZJmwIYXNCTF9ac/gSoQX4jxhhry2UfFipBJEKiSdTkLptActHq/vM7LBnrrK5cpWqz+l7kGrPPnMIeZ1a0GjEnkcLROOYOuTyp53d2/s60B5efy5RiRWLKzh30BiEJLnugKzx4O/SJGKWhgmeWWzGvf/ZUI2qs3OkyTyJCHvWMS+UIvyQIjW9Vc81zdNu6LeoiaXjynY0zevZZ6e30H11MnrJkTtZjdVP6nxaTnpudwik16dc4rGmVw2xugDSU9OXkzpVzYrZAt7p3flQdJ+97Jd8iLqcMgAYhGbgNLfT1DbQ5UTMDybmyzFNwT9piAOdEKeRbZEdoQAZlZcV/5DDeVaWMF+iQK99LONjgX7DrojaAFa6Wbp2uN7YSvhBmkIXaKI/+8udTs/VkuRMXOvIj1rv3PK0vfE9w3pjd7QZqAm/In/k/OxXx8xCUGi8MN3SZl7El+VsWO4RXMXtu+7ogtK1WHckYCTEyvlACqrvCEZpvKsndaPyaY5P//9n0qX5BsMRZdlQ5iau2w7pwLEnBDR7vUgktU7fYGeqhUuCg1Gj7go+1W8FgQB62O//fkK8I9xG6JsXbPpcbpY3RrTHpjDUQbgwyUdmqMC1qaSMF132Fi9fOJvw9FBFCp4aalPYS9/iGcT5BUl08Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	T+QjFr5un9fi8RswiqWQ5KBXRX8JUJlFxzCdafLNLnfIFdC+FkR91EQAKln4OPIXrP1hvilFqBWXjO628nAsp7eeyHFMmZMHiJLQFW4/4EZAf5jQ+78spyFXt1dhpXSq/4l/c543Fw/SxX0/N8QeK6nEEHav+ouajPQS4qxiYW6X37KkusQm5TTAdaEpQt3DrNdtzGABzBDlGbqBdMDZ7n3fCC6BHB4Zl7AEEnOS0EfYPLR+9bZl0LXFwKliphMdjvTOBQTBu57akxUQP1sLxb5l7tALEBns0sesnXDiZB5OiZFvBhYHqrQ9sTOf9fyUHgybNS24yJElBd7ieLseAYZeVMr7Qscgp8m8OO4mRLKvuXNRFU+9KjJhEIH2/PeKA4lw8HKBRveMfm5NijQGCqaECkEJK6gLfmQOYPz9cnEhXP1Ech/Pz6yLmbdODesZ
X-Exchange-RoutingPolicyChecked: 
	F05fIpBpHL/bHeX6a4EOUNdgkQCvN/u4WZvI05aW5GGUih9r020se8CJxcTKBikvLWn2YNe2KidGX6ZZxVV7kZhWiqVKMbiJxj/NhSNWSkyz4npA6mklchyFc+UI2W9WwS+YzWNJIMpfGsQ+wUv002A2x4vwh/dM/xqQsUrOtODb1QT06x98GQL2opTEZAlKjDwV4Dl1Tr6xTsJIOgkaiiBEvw4sWA2SLrvyNaRsY9hEkOioVeA+Wi67J/yMiiHElY6Bp6UHHsOtnyMiV5YVsdXChF7E9cGtLRs3peefIFZ3AhJ/oixuIRB+4HLdOuaWTubs6yXMRM/+9jOf+WsmPQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:52:22.5349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1103b9-7a7a-4394-06c2-08df02c0da1a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6541
X-Proofpoint-ORIG-GUID: Ft4terjUofMtxxGCmQ6-fky6M-5lEol8
X-Authority-Analysis: v=2.4 cv=Fow1OWrq c=1 sm=1 tr=0 ts=6a8dba41 cx=c_pps
 a=WlJYEohHt+uacJFhuK6UDg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzNSBTYWx0ZWRfX+0ay6R20nnal
 QARpXNBeKauYFQDch8IYnQrQdRStFmREXcioO8KJoFI5yZhKNa/nRXsCVAEHXTB3jOc/ZyTM8Lr
 IyLuvREWLUFVWvaM7Ctmhr8y5SOCI5I=
X-Proofpoint-GUID: Ft4terjUofMtxxGCmQ6-fky6M-5lEol8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzNSBTYWx0ZWRfX1B4YV9inb20d
 5ePHy/zjcYofa6Gc9HXAsWfrzs4OanWDDdKmG3nqBPjdh3E8bsP/UnGdA+WDjJdS51eSlK0hr1v
 EBceyZh8pOLLKtEzOOToIDK6zPDpeo9zHPVZJI9BLWnI8ZMXDjldwCuqatOE6yfhWq4XaEjdPmJ
 HRfem3X0wB70xDvKw9IF/f2CPe4PYt2w4XfF1yQXFAsxAw2P7LE1ZjqwICNBLbGoJOkSGb+N42o
 elWk9NmGPiyxsooYXxkDZeP0UyrfvWza9y2gezlVIMGNo95FWEelyE2H/f2OCfu69WYUHrn9l1j
 mrnCB1ScoiV5kZla7chEY97ju2JH2RYKNQF9ju27LtMGVT1Gmc32qSNCvczP8LcXqlt+h/FD6T/
 xIEJ8lp2tcK4EaGyMaAxaTbi0p+xb04iyB0axDy0i8V/UgD0Z8Np8o0x1gtkvVNUiS7dUriIFhf
 1Ko6XMjwhu9XTwgt8yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 phishscore=0 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250135
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 15:53:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20291

meta-ti / na / 20260825152919.1829637-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] check_yocto_rules: Add skip rules for libclc
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 25 Aug 2026 10:29:19 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6165f5c82caab5c7707e0d64b1edd1a45bdc09b6

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 2c7ab98a1c62600909a376074a4fb12dfbf683de

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




