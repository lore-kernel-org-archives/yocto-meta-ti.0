Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 536E1C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 22:00:43 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8714.1782770434732438836
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 29 Jun 2026 15:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Ef/+3Oj5;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=chOJScG1;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65TKfEog3071593;
	Mon, 29 Jun 2026 17:00:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=AzQhRNcJE3IrJ69x7QgwzGA28QHCJLQ5vAHSlIILv
	7o=; b=Ef/+3Oj5dzbkmbHVa5G5RysViNHyyjVVzL3b5yynqrbIgMKWvmZ3dLeQG
	AQ6vN3mz5qjzMDsUfa/eZDSmCF6TIq9dx+1nqMplUTE1AW4b5WWsPx6T405bzq/e
	7vOty9UVg8tfhJ4XOzQXQxsEGRil1j1I+s7O6Oc+VsK9TZ4PV/fBqu88hRWJDiXI
	S9XT5GHaCOlug17nhVUY/8f8nxzDyCSH/Dzy4d0Gtmfw0JwgNQMxhZsa6iAgzneg
	fvvj4yNNB/QwMzpkK5Aq5h/FxAoOAQJ6S6JT4bZBUJzF7EqUwJPgVyZnbR3szIK2
	0wZNCLciHX718OHISAyWfo5EE9d1Q==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011011.outbound.protection.outlook.com [52.101.57.11])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f3p9uwtu5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 29 Jun 2026 17:00:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJWnPNf57CQ0wEBxpdUeUi4c4uNrqtEo+OgatslxribTa3UiDPeTF5h7/yu6BHbSjkHD0mHSlvn3wR+ryxuD4kTNxieKVPfE/5Cotp5UqFjsYQtUCM63RHnccdcmUFOUvLdI/zjc1tYKmhreSdZnp/mhV4YVpDDkvKYqLmnRsAAq5JUBOh50qoGI5hWW6j2Fm8CL46PWbbT8ZFl8CpuqnNzJtRL6DcR70c2jSdPwmym6T6CP9OZNNXw3Me7UZGHNXyDtJcqp98kFO/zHgfxGcp2A0BLldOTFMM4IUM7bpeTe0sCwY5IWKsZWmYm/yAE0h0jGcqx35rHU4RR0b0hNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzQhRNcJE3IrJ69x7QgwzGA28QHCJLQ5vAHSlIILv7o=;
 b=IVLJslTl/0/0o2w9M3rlS/CSCiJqLHuQDBuNQ1izFfXRGqexZLSzeAhpVrDc3Jo6/kYOaEUayiGVXhSf3j075unlMrnS+AF5RFcAwRBlk1rhpxfu9rQBrEnPTIE4clua6emLBAxCfUvWa3/pLPPNofswJ6UJ/skwFGABa0YwAplGaZgmlWTYhI/AoMnka6Xx2yCTkdqBqzm4F3BLLGRiU4E4JenkfXH/nhEnFJLt95MzOSNztwFoFaD8Pq414kHYSCHJLMp0ZYKhEmzDogroSEQP8tlJ9Zv8WDMSqUaRSPxpfccgfRk1zO9y4ClZkxhv89mEuMJZNKpSGDERMf9evA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzQhRNcJE3IrJ69x7QgwzGA28QHCJLQ5vAHSlIILv7o=;
 b=chOJScG1y0ZNR38dJnLrBQMBJVSFM4p0Dg1JjkyH+YrrjI6GzW0uTj29TgNMqOqZR5B7YqSA9Lp2/YFmPsCj8tblZfGQPatONiO0lt6aqYlsw9byKHu3HoQGe/MxvGbbBPU3QXAjMKGgryw6ISopv7BG8gC+j39HeTMulHKhsbYk05xa6gZbhRLnj+xwYQ7yTrOtbgRaBDFJcfQ+2xB0eu0MmV7ENOTbHuBUm64zWWfOR41hjJUmRJ1ku/FWVKzHFdZ6fXAayAf0jU+UcEv6kcX92WHpjiKr1oDfS6KDbMx5NbnuBfYYNWDqXxy5wyuGdel5gCEqMnJ6ZjKu+N2URg==
Received: from MW3PR06CA0017.namprd06.prod.outlook.com (2603:10b6:303:2a::22)
 by PH0PR10MB5756.namprd10.prod.outlook.com (2603:10b6:510:146::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 22:00:28 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::ac) by MW3PR06CA0017.outlook.office365.com
 (2603:10b6:303:2a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Mon,
 29 Jun 2026 22:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 29 Jun 2026 22:00:26 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 17:00:19 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 29 Jun
 2026 17:00:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 29 Jun 2026 17:00:19 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65TM0Jux962454;
	Mon, 29 Jun 2026 17:00:19 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 809109ACF4; Mon, 29 Jun 2026 17:00:19 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Judith Mendez <jm@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>,
        Andrew Davis
	<afd@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge build
Date: Mon, 29 Jun 2026 17:00:19 -0500
Message-ID: <20260629220019.1965155-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260629215512.88924-1-jm@ti.com>
References: <20260629215512.88924-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|PH0PR10MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e3ec20-6190-4807-c822-08ded629d372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|13003099007|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	9bYkuPXE6BL1vJ7NJwhffAVk1H4CPFxa6bWqDSalulxyJ9wHIlWbyPkUOfmz/3e612xFhk04yf2lCbWqq5izRwXJtMkuHn4hHTCxOMPvnmUmf5lO77HYm4YyEEXIzy6isdwHTVEcN2gYk7NYgSR5XvSVwvq3TLW1OI1mNECP96WwI69bxO/6EpuQsZamk2T8K/jsvEGGsyRRFtIDNnsIWihOnmIePPaeZVtCs4osyLpxH+doH0APY8n2gT+1yb5oO7Jp1ZQXipFgkWfnJRn/+/mmrBmzrc99QP03A7Z9/hCyPoWUk7y8UEd27yqTX7F4y+nyaZyWAUe0iWAnShYZhxQ86/K+KBcoFsIXHdD1ZTzjD4bMzbHQIRLtdN76Pa2QdYWwv2Z4hshKLcqbxhXLTSe1mMf37l/xysxQqT800pdLKsVCdQWqAgmiou6cdRux3hjjSm5asWnmYt+19wb4oS88MWV4eexkFhEkJIUCvhvg8l2lom6YvIq/WpfSkvSkoo8gkYrKS64HJ5Zriquk/Epc3VePfx8cbgKY8rDXdaKlwDOxW8Nn5UQI84/+PduJ83zqOhv3kSnxoSl8pYduWtpNoGw/8QBlD+ALNNAI9/0uE6U1oEBqCEzjIuxBYSICZTpf1cku7ETsjBzng5QXcMIGP+WqC1kFudRfmfOfJpMybqh4cvfBQSTOEpmrvxvG
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ADPr+HZNbhImKuWC2z8682396ykjn0VHQO/3OCcAlMAWYUOxz5JIzerTUhqvK2UNrNPVCDucoeq75Dizo7L9Epqhd2V13wcnCAHo1d9PknaaSjKph9qYgeRRwlHU3zfgaa1o/SDClypS88RluLm/1hsLv/6QH1VBAGOUZ1pmQ2JQtpSG4W1x17eBI3LNYL60opFcl699ECEv2BLDyRaMf4UwKqcJvNQYnoLLSFxnyUJMjuuH+GCaVd92jDm1qJgGrX3MUjAJVF7n0O1TLprCKzfTSzA6Zvk2yEoa7TeCKStvRSdsGtjtbD1EKKzSxAGl+Jq2adFyurEy8ZMaT0juAEkRA8JdP6o/QAPjoUQGG6R1XaX7tfanNCGGsfxVAx739wLCjWRCyMx5osRF3ONx02YOJegZpxAAL9lSvNFQ2U3XP1nnFepoqcLaD4/9z9k2
X-Exchange-RoutingPolicyChecked: 
	YyneTmRISzaX/+mUIspEh33kkUxC/v6gmRu64heZdl61x2d9blsoW758fShzwkrNEdHgy58nXA6XOsmHtFq7G6Hrepv3iqRMEqIEX+ylGEuOwX4BUpNuwLzYzUKQysSrcbiYLeiWvIuRrwuZBw9hXQ9w3tSH9XA8AL0ePWFNalb4sbiKSbVAwxVw05HYSyVBXtfmKmMO1wnYFxHqgcpvZDoX0hN/BXvY89FmUj6we8LqDN+B49T/7mhWI3eSRjpetNbVsmBOyMMl6R/mJ9On2I6OCCHhIhdm8a1ns599vi3Px7SevCL7vfcBBRkQoR07iv8dxEr25cNy6325eWg9RA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 22:00:26.1395
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8e3ec20-6190-4807-c822-08ded629d372
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5756
X-Authority-Analysis: v=2.4 cv=L7ktheT8 c=1 sm=1 tr=0 ts=6a42eb01 cx=c_pps
 a=XMRsWg75SVOZ480bTkGGOg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=BSS6PdWxz7x8cb43tGcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: Qqer-mjAZMisTySpjJIP1ase08klGi4o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE4NyBTYWx0ZWRfX44i9RonAF0MT
 n2rGqRIb+A+Gg1PqPPJY6zBRt142Ss7ksc98G6FOETxLgxHvNk8+kid8CZnCxGiqgVMDq/L0TTs
 GA0yGEkUmiSleuQ5349XCJXyVQZbDgnv04kUa1B/oRx7rH+K3JFN6wspwazH9/wTNkToiGvdrqO
 06hVnkrkX6jX4vmgOFnLQmEqe3/CThCaHqbGhy4Sf3PEnyAnV4uSkccXzSSbK4wwxjjg8ioAHdF
 UvpV4UYsukEPscKrMwSlcKLqLF5ZcMyGxO+y/WjIauwdAXzWcsqZ04oeIhSeDfKQ0UWAsMrtgaQ
 QbKxz4zggFZh839pEjkZWJ36zeEVROT8BnWxHyi0InmWmPuoEUmyjBno/wVGx9AaMJR2zEj4Phg
 96gEldcAhvR9U2mcxl/BqymG5CtjbeAXOwCOHXAW1KAKS5h+FG0cwv9ivgvRMDy6Aemj+Gv3CD8
 l4UPPKM2iyZVcnrzuug==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE4NyBTYWx0ZWRfXxmNl891McpKE
 mYuMybc9JcM2i7p69EjHb6i5TGiXa3T/ORuDizifKflHTEsIZEGLjZY4btmOcbzsxkf4EmAT/wJ
 KHP0Kj7XcOnFc6qLpYbMbm5lSPQIQeg=
X-Proofpoint-ORIG-GUID: Qqer-mjAZMisTySpjJIP1ase08klGi4o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290187
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 29 Jun 2026 22:00:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20106

meta-ti / na / 20260629215512.88924-1-jm

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge build
    WARN: Commit message does not include file/recipe name: meta-beagle: Fix BeagleBadge build. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-beagle: Fix BeagleBadge build.
              meta-beagle (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge build
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Mon, 29 Jun 2026 16:55:12 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 617a17e5c6cd1d08290046446bb61cbcb214037c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202606162200
- Commit SHA: 8b9b4854295491a0272722fe4fb2e0aa773d0a6d

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge build
- Submitter: From: Judith Mendez <jm@ti.com>
- Date: Date: Mon, 29 Jun 2026 16:55:12 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 617a17e5c6cd1d08290046446bb61cbcb214037c

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202606241800
- Commit SHA: 937a0b45728e16c279a7dad65585da061526936a

Patches
----------------------------------------
FAIL - [meta-ti][master/wrynose][PATCH] meta-beagle: Fix BeagleBadge build
    error: patch failed: meta-beagle/conf/machine/beaglebadge-ti.conf:11
    error: meta-beagle/conf/machine/beaglebadge-ti.conf: patch does not apply
    Applying: meta-beagle: Fix BeagleBadge build
    Patch failed at 0001 meta-beagle: Fix BeagleBadge build




