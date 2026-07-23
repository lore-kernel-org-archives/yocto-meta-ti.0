Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862A0C531D0
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 19:23:12 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4581.1784834590204815294
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 12:23:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=JaW8f2dm;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=jXZUzhkc;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NIoAkE3143643;
	Thu, 23 Jul 2026 14:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=XYm/lICgQxmHBjXLAlGx1TyY8916G2dQgg5L4afBH
	k4=; b=JaW8f2dmGhFcfNRcQXYbbYK3OszLt2UdQq37qa3hQFpZ4GmlTCzv8h4TJ
	VS10DAniJ6e73F481pEzLymdXo/ynYg/Ozs9bRWBzh0MNC+//IDDaZDKiLKjpPCN
	M1LM6iEG4Xdcg57dRHjK69qK4w1glVHn8F+Yfpn8oL+zNWhNLxKVCYwVfXv+nxVg
	XT+xG/fWhNaL9LkDu0Ph9Qc+5OCy9gPUvlVOT2PZhuKis53jJI7bpTFDmaSUFg92
	IatkCAHd6obMvi+puVWq2QhaV9icBTIJ0csuWtaYlaf/pTgUPIWG/SxYtU9C1a83
	r1yxET1CkMTq+hirtpRFR2zNzjJvQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010053.outbound.protection.outlook.com [52.101.56.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fkg7ukbx1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 14:23:08 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghIMW5TzkYsaFFv9tCNpzesUg2eibQzywp+uYIK0mWt4sZhH9QoXKKqUO6X355tP00QYj/FxWZMPbxQCsvUeqQDiuro+GAZ/+8V4BoD4PN8qs0Vu24o3sDf2T9E4pXOaal2+Qz84uEGcIL1I7wQcZO2/KL4jAXwwsi5aNBNTU5Rbsx7R7uk7kSOULT/tCZnC3EvAGcb0ASuUD9lC/IT4KFlEavavXaiEzGxn9vTSK8h72pNhprjFGz0VyPcAXFq0yIUUDHCuJidopdHg4J58u4vXF+V2AgzjcZrow9BZ3kXP/nM1PPt4d/ATgpzFwcRhG4kQUiE+KbYCrQn3FfJhDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYm/lICgQxmHBjXLAlGx1TyY8916G2dQgg5L4afBHk4=;
 b=Wz891iW2pZVlEh86j7hgsTWc/XbfxS0V2nIRq1w9eDKFzJwOc94XZMNCjvly5G/VNSSGK0hktnAn+y7bVS7uEN8quR64ZVxGe1K5t47u2PlftEloHYiAdwdGy5E7LtzCRgAk25MQuFdPA/KYihNRk1v77t9oDg7sVGwnN4UT4gkT02eg938HBkVtHHn0L4U0XBhQByMjk/fudFJVQWbDdQTJAd1QLZ6FO1SBqK5OUZ3BWSdH5H3jQqK28dNyVs1KUCGVLN9OOi8eflBxgC+saArY6WD0HsANUuJQSSrsIkKmTc4/DfG1+QOwj8EifI6LMiHpxlTkGxRougbkHCP8Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYm/lICgQxmHBjXLAlGx1TyY8916G2dQgg5L4afBHk4=;
 b=jXZUzhkcbgDulfnbSBHi9Jg/MDdx1+EK7ZMYuFhmsFWhifducHMQYs61Oxm9rW18OImTSyOqjVla3MkZdQedZe6z2+iTzuORI6EmZE5kboW6DJXh6Y0HZE5OWDzsEgUD0nHf+nd9y3dT+h50EB+UymjONRONv6YmKoFbhsr2ejN0cXeUwtLQWqC69+iTmbKtG6LUk5rpQMDhEvQjTceYXWXTs0MeXEVBD3FOcL7vLGFhTe0r0wbuPvDz5V1HAmvMffPGAlFt0IEOPmo/t0KrIKmvgcXLxANAN8CqK3OMqR9aJ2w0F7X17D421DuTtkV9H3MTkJejkDgVI9AKkCRzUg==
Received: from CH3P221CA0014.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::34)
 by DSVPR10MB997936.namprd10.prod.outlook.com (2603:10b6:8:3be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 19:23:06 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::39) by CH3P221CA0014.outlook.office365.com
 (2603:10b6:610:1e7::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11 via Frontend
 Transport; Thu, 23 Jul 2026 19:23:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 19:23:05 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 14:23:03 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 23 Jul
 2026 14:23:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 23 Jul 2026 14:23:02 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66NJN2p51712144;
	Thu, 23 Jul 2026 14:23:02 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A95D99ACF4; Thu, 23 Jul 2026 14:23:02 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: <a-christidis@ti.com>
CC: <reatmon@ti.com>, <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] mtd-utils-ti: Update SRC_URI:remove due to oe-core update
Date: Thu, 23 Jul 2026 14:23:02 -0500
Message-ID: <20260723192302.3907284-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260723190016.3180478-1-a-christidis@ti.com>
References: <20260723190016.3180478-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DSVPR10MB997936:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db5c80d-5795-4bfb-4e39-08dee8efd21f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	ANmCWLw2k/25owlrgapi/la7dpPBi0S3sgPNRhi/Igso8xw+qO8QknmekhWsv65YHlW/C+BEk8NwEfcCByl8tf0UlBFSq/foci+314EcMrB3oWE8ZT2d//qiD9ZhX5FNQ60VDexxmZmh49tw5FjRk/6+dYxYdBiBA2YNLu9B0s8gxxPuDfa8ILjlbO3TyeJjWVYgT0W+9ustdxw8asQFv/X1hKgn/uSp54wp1m4C0BUw8l7dMAR1Gi6sN//a2BxxpDdA7JE8L5/7DwK17Z9bKFcOt+HlzOHQCbIBM0ypBJI3KWIfq5bL891ax2P79lpygtmoCyLmXgp8fCvPi89RS6P9VBkgTl/Jpy2lGJRNgQ6z5DCdWwtJwByTGGouSjYhj/vPC5m5sPBzKHche3dddkmIgAxwgS745y8ySO8Vv2lTNWpBN/MBtGc5/aAk1ZsqSjrcul+//CTSJ41iqwgaxKV1FVlhE451+9x6fI1oWLOluujrCuPBS/6z+JCrGr57M8gwyLGxQlyTM72n+//UXAgR8ipd/4AgeoAElVhtRXmx6sOT1RcRjn8lNlOHKaSG7IAMOG2VgICmtc7TWc69UG33bKONTpSqD0ieYN3wqNO8YBXD6w/8TgAOiDZYKtUx5e09J7zKbkHz/xCULfPDV+mv4xKr4LAoQWhEbV/m71DqceUK8OwOmRlGINMH8unw
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FFkdAbYD2KeyRZUjc9bidcDwkov5M5byq1eRbgb4Tcf0OKuC/a5fJYj9iECK2ylZ4/gboa9R4EuOwcbQ5dPUqAjgkIeBA3UhNrp+hpxDgjrvQ3LZPwoctEjSUbO3kjhfUdvuZdMBwaN1sYgOV0G91wq22g/EiBRf7U/Gi1qodo9/FXQNrhCziKqBygZWMur4f8E4yDrYMX8atwzYhv6yD/6VCVMaoz8zKMPuaER94A5uJ8+oMD4gACElJGSbbXmGB7LDDxukE+qqYgcig0Qw9yc9f9EW5lBa1IJUrfs2deu+9QiFaST4GnNXlb/0KVrUc240Hjjg0mr6rQEYRLz+/1ZYAD+5oFnpfCHUUaa4AjuwuoTduWRTrZO2JJtXf/y1j3rhy01CAFWZhiqvhkGwZn6mdVaSO8WBzJL0mMbbavlRuDZJrfrs98Yo7mEzM5Ak
X-Exchange-RoutingPolicyChecked: 
	d7DbhIQ+iZRhYv6+TlBYw2WVEr5lN6797yEYk1N/je5cEBrSGgEA1PhT3paHXIfaFsu5n7IO8q6lWullaeOT3dLj68rafL7UT1vrBEGyX4auEBBb8OzQoLKL1ahdxoRZDhFFsxE2EoqDhN1zPCgSFfL7DWtMipUp3gtqx2H+FRP3Vf2FaOfnw2cwd0o8eOtbek4iEg3evThzo/DPuOC+9T0ERk0sXABd9MyHXJgPrl46/F/XF3y5v2dunFSUAWXtZPJNFIDSAqx7S1yiIZwJyhjqMIgxUbtJEEyuUYmGBJrVir7g3nD3QP5Gb5V/tXZKjRYgFpK8cJc4h88hOmpnkg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 19:23:05.2238
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db5c80d-5795-4bfb-4e39-08dee8efd21f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997936
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfX1Xmm0vkYUN4v
 vlYJnGe3MQOb5NrYxq0SKs/lPipeyUdlGbQvjp3D1ZiWqy1nr/9LovE1FNJfRq6+1keRm60jY9p
 G6EWSPYGjLn0id+sxD+hY8ojnbsXQ54unW8nt9DCF/6MTSdqYq+zjGkeOR3wTgDv68pM7F0wFoB
 HYQYP/CBQbWebPoz23mtzhQykET/a2bFJxA8lxGKQ2658GpSHhu6BZZo+pIoHrSVqCNudAWyeEh
 rQHLc6Myi73i5kVKFXzej3qZB0dgno15K34YwrfS4A35pAsgA8YEkGffmo5WAuKaLcpnYSxILel
 Z5yCEoUP0ucn4sNQbVlal/XP6FCZxpsNyiJhDc282K6fAf3Fv7OQN5g+cJMJiKGeNSIMaVQJHWv
 TWhEMprdlQbibqXM0FWJUQZN1kjcK3CmMNlzACtOe5WGIVEpuelUrXO/wrifjLrFbPtdICG/UhU
 MWUggT0OzhlD+SACimg==
X-Proofpoint-ORIG-GUID: OBdWoTGpSBAZSyy4aQZVy5cJsqA87mAA
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a626a1c cx=c_pps
 a=PQms4psfS+nBHIg3Mxsk7g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=ef_xxL1EtnS6UrlDfdMA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE4OCBTYWx0ZWRfX1iD0YMd3ESoO
 Z/AJM7Lt3WQa6BB85QxqlFxlJLqDDyyVxd+AhRcDWEVhvDs1mX71XMM/v/9FMHAQe2pi6Zi7vIw
 //6koKAnzRF2IWb+dtDGyWGF086OoZI=
X-Proofpoint-GUID: OBdWoTGpSBAZSyy4aQZVy5cJsqA87mAA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230188
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Jul 2026 19:23:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20190

meta-ti / na / 20260723190016.3180478-1-a-christidis

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
- Patch Series: [meta-ti][master][PATCH] mtd-utils-ti: Update SRC_URI:remove due to oe-core update
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Thu, 23 Jul 2026 14:00:16 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 0d772278ae6263fd7e0d9f7712402aea916eb4d7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: f7bb41bca2b7adbe56255abeeccd80fc6cd9fbd9

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




