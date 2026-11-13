Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.932.1794609348842555435
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 14:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=ZNuybrZb;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=wUMJg5tP;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6ADL1Wqq2675793;
	Fri, 13 Nov 2026 16:35:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ePSS6Ku5lOW2F+Amk69x8l6vlSR4+NIT/qx88iujV
	6g=; b=ZNuybrZbFxru00qY3q9o/FnQeBMAravSICsfZcV1/8qWxyVs0KxOwot0K
	8mce7TKKcBK/a6Et9jgvgjjEy8I9FJ7T4s9v6qtXUvaRgtmTrvaBP4Rm9U2UgkS+
	nI6uP5KrG/Tby0nMsqTr4N5Bd0YP63HknvQEP8lCRuKpAUyKmp5eiMi7EjBA4cOB
	Kv3GlzORaa+FqshcQ98cR9ZI8MPzPFpup8y2b+TwICSIi5aCFE4Qr6e5ZtBgY0nE
	I/ZTuagncokImfxLgl9S/T7Y8kdSjQWxPCrdi6fGdBM+8f6SwN2EFNb35UonynSG
	LvW0ofJbPEFUWYacbB3KdB88/aTqA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013054.outbound.protection.outlook.com [40.93.201.54])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hwytcmb09-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 16:35:44 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hPQN77rLNt9MEsYRVk0GHQn+Tbsyf7GqkN5sOElffmbiDE8UfS62z3UD4cwwlBL5Dx2wWyQdlyEQGlNK1h3l/boKp5jj15rI5d/SSib/EfWEbf5V+f6crhBl1aucM6j4rV1suAknPjiGlxCDxlIx0Dsb3A1UeSjQmnYdmuEa0oseEaJAMpUOpmnPEbpayNxtPIjpVF4LOnfSWxcEh4SFyxr0J65AEs2cRiAPM1ewvS1qsyuoDtQizjoxcXMeWiKtM4ADovyqrotp79u94y1D5IW7laOYsoatVpj8aX+w0GiF6iN/T9dxEXtzt1K3AT56Z64FHd+Wt/LYuOKADM+Ipw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ePSS6Ku5lOW2F+Amk69x8l6vlSR4+NIT/qx88iujV6g=;
 b=WGD3Q5R23pEF24sd5FSdhmvZy0IwsHQGYK0z7bJsYhnT+UX9gyoPbMIBq6yKb0H0S1CQU1tQw5G642xAJUKu9SGTiAOkfB8IpnQ5rld0jCpkfyIr70xVeTjL9err6kF6+m1vdljjZ8OOuXtX7BDVlJKbibn9P1xW5twWOY2Wh3Hngjuuu9Bed94oJLpnddCHXO2VrLtjbAIknc4v2AFrOgNhIlgLj57C2bGFstgjc7TKwoO5Hvq9Wqotn+jcUgPOWT2yvW3qfZIdly3qngKGXnhqwYHwgEVZ1QdbNaAFkK6IC4ZhbrPA1Z3A8iNluzxTZF7WR5KU9cMXh/XR5BRsqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ePSS6Ku5lOW2F+Amk69x8l6vlSR4+NIT/qx88iujV6g=;
 b=wUMJg5tP8zOljjZP6I7D+5e1zisXNGN37x8W6QQbFMU58xBc/9b379x0QjPmIpwBcpx9N8HsXV64EtKQkqLpeEhOpUIttipXdk5ndJrechDyIiHe13rWUqxPoj1XqjbvWPvSzlx5IIVJ/yk83cjNvxYIzKPtVLH1T3Jw0KMyOjGdQcGSBQPK1zSNvV3eom8NupV3pp+kwg3XQnEdEdrTGZAN61fU4Hjzh0T80eNn+ZNvlo+LGztb/u8nU5LNCtEmDQmz/vMe3aoeJcKl7K+3EDSLQzjDy1WQSZKsHGxI75o0wWLeP7gMH4W6v6+Mp0rTQ/09DDwMB0U8+LGQ/WPtbQ==
Received: from MW4PR03CA0250.namprd03.prod.outlook.com (2603:10b6:303:b4::15)
 by DSVPR10MB997915.namprd10.prod.outlook.com (2603:10b6:8:3bc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Fri, 13 Nov
 2026 22:35:10 +0000
Received: from EA8PEPF0000000A.namprd05.prod.outlook.com
 (2603:10b6:303:b4:cafe::9a) by MW4PR03CA0250.outlook.office365.com
 (2603:10b6:303:b4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Fri,
 13 Nov 2026 22:35:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 EA8PEPF0000000A.mail.protection.outlook.com (10.167.249.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 22:35:09 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 16:34:11 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 16:34:11 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 16:34:11 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADMYBcG4082212;
	Fri, 13 Nov 2026 16:34:11 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 152549A9C3; Fri, 13 Nov 2026 16:34:11 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH v2] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
Date: Fri, 13 Nov 2026 16:34:11 -0600
Message-ID: <20261113223411.3016433-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261113221542.4188789-1-denis@denix.org>
References: <20261113221542.4188789-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF0000000A:EE_|DSVPR10MB997915:EE_
X-MS-Office365-Filtering-Correlation-Id: 43f0d0c6-e47f-429a-a391-08df41d65f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|10067099003|56012099006|261022115727099003|261022105027099003|261026135527099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022075727099003|261102123227099003|261009223027099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: ih89Z/l9e89aAnvkfasNrFAkJDrUU8oILvBb5PVpcTCdtQEDrczPjczt8m+eWM1sjVmKvkW5uOxL8wy0rTK9IHNwfNDFktaGCFquA2JtGgrVA9Z1mwClX/kfYMXwjlMtWkFC/0pzgGIBM5jCJTYd5t2+vIJD6Bxd83LGZeNN79aZX+O3o2+yl7SJD6hWWqjg0eI78XX8/2Ojiovjq/8uVZEDive6HW+TXwsJR9llc5cCDVUxGZ5PpFJdTRks91kHBb7RdiY0+dqCtVvGkgpPB9FC5ubMlSw1rF2qxG346H8CH0WOodqkW6Dao3RXlCVMMwMPs/DLGjI1dOJeQ8EbDSFdj87QXZGTT0DZOBKvEYjZZozRhjr98nXZcwIxh/6p3wHPmI1nw1XGLQbL+Lq3VPUuKqz5Wk9AYbruChINOd8QI24318KMJGAqY2Rh1yEsIkBCkmLNlhEv/S/hsP5lub9JY49aDl64VwT345H8T+UTD/kUZUGc9N5uglg6GuBauiK48yIX0NFLEL06zYuR/SkDNJv7EgqwmG+nB8dQ4KK8OzH9kd22BbhGPahD6P65iWiIzOGCtW7kBaBEDiW0ZeNRa/bAu7/5Igxa8E79qqZM8Y5cM289pmaSWmikRIUA5BBYqWqzLAMBMnItCvVF4eT+mxFs2k0hPFcg0R43VXY=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(10067099003)(56012099006)(261022115727099003)(261022105027099003)(261026135527099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022075727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nNanTLSPB9WlgMG7gLAnF41do4AdVcAyiBAY1Wkm5znnE3QKm4n+Nw+dlNveDMQoxgoDOsi2c9UzFXku3tMSBa2oiCae0WHgtTO/w4NLkvM/HRM/TS8qfCJ6zs4efR+VxU/QoAOUCWrcLXavTJrKN3JYpPpVUYCyW6aLAhtQyhatCAhG7q4Hm8Cv5WBZeVQiEjfEyJbqbJD31IvZy25NUEOzPfsj8OB0geVydRPbfgRDl7uGHzDHQFdxiEAqpuA9e3gLVwbKn3eYPELha/0mUNbhX31kwejOIBu4yRLm2UFwQrMrxh9/EUboHVtNztu/5edDEIY22GbycQ19y2s3KJMWkppXNDdXJ4ApifAsark3EC/BZ+oDFKvBJLK87z8UWsP7vy1plb24J72zo1KcdayMwiLdWxDIkO7w+GPlkLsRzZn5J57cFbiXJ8ELKteV
X-Exchange-RoutingPolicyChecked: RxmhLhDTFMBooc0rbzNZ4BnLFOzCKxOO1uByt+tTb14hePjkUhyvRvBine8JLYuuPHD/aTNceMrHUZlyJKDJACIjsUSXiCUdppXlOPy1WYzVUUclL6IIpkmfPLVbDp4zjgcnX4ne5FtwTUohdX+x/mSmITOmeVnXQqalRILEwcjLU/MiW8YcOyxXFboYGGVJNARWWhBVqRADdSX7BYQ7w7JesUPquB0QQFGPCVjxmrENpQPgnb7BP6RDhbntxFPWcfCXnt6HRtNlEL8jaEC3PVlwr+gruRQGY14RwNlnf5GeaHmSKyc0BW4v+g388iZwfAcWNhhqHaUdjTnc6AkGng==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 22:35:09.1430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43f0d0c6-e47f-429a-a391-08df41d65f9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: EA8PEPF0000000A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997915
X-OriginatorOrg: list.ti.com
X-Proofpoint-ORIG-GUID: KcRKkGiIC2TObEziLxoleOVx7ik0__El
X-Authority-Analysis: v=2.4 cv=fYI4WEQF c=1 sm=1 tr=0 ts=6af790c0 cx=c_pps
 a=KqPiDrE7WZWwkLuZ9HJZeQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=r70ttzozfG12ViAXQPQA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4OSBTYWx0ZWRfX8TnbLzx+B+t0
 yjrAOq2XDdHalcvrS5HkQuL2akiixFRuJ4c3cOxYaNr0hua1aMZxx365WV2LbTQYV7ADZi3Tzvb
 OMz4+sCZ0zfI/XXCOUsXP8J89qidd0U=
X-Proofpoint-GUID: KcRKkGiIC2TObEziLxoleOVx7ik0__El
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4OSBTYWx0ZWRfXyQV++cf91srF
 HXis7XQiwgmGPQASaUqsvuaCmwHIZOzxA9fkHAlSyQ2erq2S87clBWo917/LznhId2EuPyFxwW8
 W0QyfRRhYos1a9WDi+ACwTCUVrqB6UADMe9mBPIc7l3IrROr/7unK0Ni8PKkdWi+XJkM3d7sFeM
 SdWJ+Ezx4dZamYbuUPUCcz200TMYOI4s306bWYXZrR83R6llgGINmHy33D6XgU49OrauvBbpujn
 wxouf3e7ieaR+SHx+Kn23+IKC8N8kKhaPPpPf8NgRD3CJzMCg4OD4PgNse95EFKiA2gGkF/cxRQ
 Pb+R57NKhwzcUqJY6wNOjccoz6ac6sOG4YzcASr4mCLsrJdHN+98vt17ZumR4CvVjBdGsgotHjo
 FR8my/rTG/JuWgVQLMZXtmQcCrcJ8bW9pFXQT6dv8UoHywsxyrfpzzMa69RpPgq9kSTSdOgBaym
 5mFYxvtVnp/tXcZ3zoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130089
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 22:35:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20548
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261113221542.4188789-1-denis

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH v2] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH v2] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Fri, 13 Nov 2026 17:15:42 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e8f653269aeef95d8169de840792ec3e7cceabeb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: ti-sci-fw: Allow empty SPDX deploy artifacts
- Commit SHA: b3e4f2c6efcc4cca09550f4dfa8d4b87ef5f98f8

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
  yocto-check-layers: FAIL
=========================================================
master - FAIL
=====================

ERROR: Signature change for grub-efi
   grub-efi:do_create_deploy_sbom: 59d008dd124946e74481ff4dde44f981ea6de1e21eef20621e9f4b6b54259d18 -> 533a8ec949e1cfbabd18d84fd5f558b7d509d65e5073601c1f235cafd4c2d076
      bitbake-diffsigs --task grub-efi do_create_deploy_sbom --signature 59d008dd124946e74481ff4dde44f981ea6de1e21eef20621e9f4b6b54259d18 533a8ec949e1cfbabd18d84fd5f558b7d509d65e5073601c1f235cafd4c2d076
      NOTE: Reconnecting to bitbake server...
      basehash changed from 0e84486eb7ac14c2614b55fcbc2b091c717ac1e7006c72c7af76117a9d0aaace to 3fd7c7748f48d21afb7b677dc006f3deebd4bb01e474876e765dcd8e52afac62
      Variable SPDX_DEPLOY_SBOM_NAME value changed from '${PN}-deploy-sbom' to 'sbom/${PN}-deploy-sbom'

ERROR: Signature change for meta-ide-support
   meta-ide-support:do_create_deploy_sbom: ed9e0c8fdfeb91fac9fcfdf6cd07901729a48b4eb80006c05fcf71685d569415 -> 2aa0b434a813c6adac9cf94053f6af7ecc0c74d51448b6e82ad9aca1cb0c5a02
      bitbake-diffsigs --task meta-ide-support do_create_deploy_sbom --signature ed9e0c8fdfeb91fac9fcfdf6cd07901729a48b4eb80006c05fcf71685d569415 2aa0b434a813c6adac9cf94053f6af7ecc0c74d51448b6e82ad9aca1cb0c5a02
      NOTE: Reconnecting to bitbake server...
      basehash changed from 0e84486eb7ac14c2614b55fcbc2b091c717ac1e7006c72c7af76117a9d0aaace to 3fd7c7748f48d21afb7b677dc006f3deebd4bb01e474876e765dcd8e52afac62
      Variable SPDX_DEPLOY_SBOM_NAME value changed from '${PN}-deploy-sbom' to 'sbom/${PN}-deploy-sbom'

ERROR: Multiple recipes found for ovmf
    oe-core/meta/recipes-core/ovmf/ovmf-shell-image.bb
    oe-core/meta/recipes-core/ovmf/ovmf_git.bb

ERROR: Signature change for systemd-boot
   systemd-boot:do_create_deploy_sbom: 7a86fba2a50883a07fba055f61ad6c2e1a201addd7968ebfa3b56897194c8d1c -> 8d9a5b22b07ce37e12fba5e94db067a19951ec4ab6a0ee0544dfdd379358d459
      bitbake-diffsigs --task systemd-boot do_create_deploy_sbom --signature 7a86fba2a50883a07fba055f61ad6c2e1a201addd7968ebfa3b56897194c8d1c 8d9a5b22b07ce37e12fba5e94db067a19951ec4ab6a0ee0544dfdd379358d459
      NOTE: Reconnecting to bitbake server...
      basehash changed from 0e84486eb7ac14c2614b55fcbc2b091c717ac1e7006c72c7af76117a9d0aaace to 3fd7c7748f48d21afb7b677dc006f3deebd4bb01e474876e765dcd8e52afac62
      Variable SPDX_DEPLOY_SBOM_NAME value changed from '${PN}-deploy-sbom' to 'sbom/${PN}-deploy-sbom'



