Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3881.1795648807261704625
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 15:20:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Pglfny1Y;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=ekCONNmK;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APJAG2Z1209672
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 17:20:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=xWsqgy+ab7Dq3SGbjUAS+BZkAD6bPJ9yWLYZoOCeB
	HY=; b=Pglfny1YevsnlgxUrnwvkg/AJiSiplu0UdRwlECtx4JmdWwKqA8DtM0IV
	KVeEeI6DLVvMdRZ4BSifNLeJGToShK5hvj72u8V7KZzP5GF4gIKO8PdrIO467RzB
	pZZDjWjz3bTb6AcIWTG86P96Lbo3nC69P7uV/V18/6C2nPMLU+rzYk6sx6mHDz+h
	sbZI59WHfRcgJfD0ZtWdKxjCm1yxa5nZLxh+VVDJm1FzCjwPOlej8wiq/2Xh9Ldg
	GdC0c0kmpxpEKNHD99Ex1WFVeuIEimuv02oE7BJ08c0ipyev8FLhv134mBKDrHId
	i4Vt0qqzagrbUKlz2GtdujuamJ8LA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011013.outbound.protection.outlook.com [52.101.52.13])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j5v36vea5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 17:20:05 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQkqOCUk1lq8pBROVoZz9ZU7RtTg9r4ovlcELL/9qKrJbznf64WgLkOipKeNDytcz07y5o9nStQxH6CyEyADvWWiPKhj3wOp6ahjIh0CBOEQnp03478qXwnWU8VrEyLHZjE7et2LzuqWk46hMS2SyUjrsnLy5wy7iwODkopzuR/YJEUQEyPpJ0jGSyOFKwV3BEqhzOqmlOamYJRhdvmrsRe20r8dFEQQ9hQhfvL96dYFQxMUnkr6AhGZWtPTA3B9Lm3YFePhm1AJMnKiUu12jKMvRUT4U8nEM59Xmzk62SOP2V18+8ZeW9xt7N9NwrF2DtVaV09XI5sx+4r4DnZlmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWsqgy+ab7Dq3SGbjUAS+BZkAD6bPJ9yWLYZoOCeBHY=;
 b=Vbv90xem8hFHJOhwjhii6j1aS6KeNCmB4ErEbh7rIEuQNyQgzSGkljqfPLXxZuyZUIKwylLf3ExC2H97OCrMgZ76BuFbRbYviC4s3pIL4CM3xbudN+vC2Hgv7Bn/sRs7RaJiJzWopLU8uGTPOOJWx7sWnVxDPnlK2MKbpqU0vokU6tftADavU9UB2Y/GA1qbqHBM5t2mUsbCsVxr3jTAIFhhwIEhexGD00fa4qObe6EVrHyYPBynm7hXpBtAUCRseU97DTXbVpj8h8rLnrWOcgTxsMhfqiJBuYNWEj2demYzrHqhAzTp6VE8V8MpFR/9Cq3zeBiKg5qK6niREhxoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWsqgy+ab7Dq3SGbjUAS+BZkAD6bPJ9yWLYZoOCeBHY=;
 b=ekCONNmKOC9JJU1neufDEnU+nM6KWe7JjvtFiAVwkoRzxEgBUpMfT/bHvxByz4RKilfrqPLtYp22kW8fAvtzeUBv4rq4De489+lsBAs/Ew1uB6qWaf/BhPhv6/VM1IAoMmL/sXxAw2VnjL0+SA3WHij2+IaP850BIHawVgf5CJqUyn49Pi+Vv8iyEYOB+3LuDx806F09Jlq6rnMC9O3Zx8bl4WYczsXeq6KHGT4/WzAbxbF0zR0T2hAv01bFmOUXx8koiGomglrwbAV3uP4O2XNLqqm4jKuTTF8k7Gh8K2Std8dII2wgT9bBW1P4Ku8+xAHIviP1+MAwclmDdovqag==
Received: from BY1P220CA0003.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::10)
 by DS4PPFA1C1B9420.namprd10.prod.outlook.com (2603:10b6:f:fc00::d3c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 25 Nov
 2026 23:17:00 +0000
Received: from SJ1PEPF000037AD.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::4) by BY1P220CA0003.outlook.office365.com
 (2603:10b6:a03:59d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.7 via Frontend Transport; Wed, 25
 Nov 2026 23:16:59 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000037AD.mail.protection.outlook.com (10.167.244.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Wed, 25 Nov 2026 23:16:58 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 17:16:19 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 25 Nov
 2026 17:16:18 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 25 Nov 2026 17:16:18 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6APNGIZ7161898;
	Wed, 25 Nov 2026 17:16:18 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 1C3F52C86; Wed, 25 Nov 2026 17:16:18 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Sen Wang <sen@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <v-singh1@ti.com>
Subject: Re: [meta-ti][master/wrynose][PATCH] conf: am62dxx-evm: Package TAS67CD-AEC overlay
Date: Wed, 25 Nov 2026 17:16:18 -0600
Message-ID: <20261125231618.1023884-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261125225427.1507410-1-sen@ti.com>
References: <20261125225427.1507410-1-sen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037AD:EE_|DS4PPFA1C1B9420:EE_
X-MS-Office365-Filtering-Correlation-Id: 86727238-f480-489c-1cfa-08df4b4a344f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|1800799024|23010399003|82310400026|261022105027099003|261026140227099003|261028144727099003|56012099006|10067099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: r7hKQlwKYM8ObtxVyzRoO+VeVN9KA1BU2a/7/O8hVBTpQ8rRNDfDy8yq2hJyewoskQsgcwh+difenJoZPLoBDu5lejjNtPEDmzee2QLQG7uskRN0LEZAbBjBu59MWI0EthVJc6QKnUsAp1/O7NovZirNHRRhklwXSY3a9sdKBKt6RHGNcalXFny69BueXb1yPGGwQA9/pAma+AGTNKkz72TtRIwYYst/9HwAPmKdEI2I5kzB/ADm1ouxYT4n9kk4iTXhpQpDJ2d5Fi8KcqtvJmJPidyuh3ZWsmbbfKpsOslHFmFAciuytHifLZ8hKnrFtITkgrq32WJZSpLEpcC6En/kc829prxvd42TPqx/jyuKcGB2bGX3v7664UBXh2G6zhEuVnvA6lZ31D1Jf4wqewNJ2nm+IFYAaQ+8lD5V+CAp/wXwdWqKv1WpYk121jhs3dXjNW1WcHxpenksUImKOBgzTCXABZpbHXD3f2PutcOADjSiJH7yhh9LZrsuDHBkgCkq5lAJ2ILuZ1KMvSjL7HHyXR6qlNxfmSeQJXdbdCeOaA7N9yliTNJ1RkroUIXY8DRYACmbH97C9zr2YnzdL5qOEKYu+BSzgV6R4LvTwNPQ4ZtOPsBjfylTGC5saOfRB0xSZH58TzjsGpgVx9cjqg==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(261022105027099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fdKVP2UfLe5KwFr/EleVokDQJtE6lgh8tfEAiTXeflbvsCfWvGWuajE6bI7fiNfgWAYbql8/2lRVUsc4LduWJ2dpnsH+3MI+SgWhpwsHwFJyDZE3S8BzqnILZ9VgXdEg3+4QIY72oB6XP0kXCXanBKtL8kZ2lE7ORs5U8gJMC+78TWH0jyxUsm0C8lGQkeMOJ5X9MOZFFAt6RiFubz8ymE496TuWC+S326ceylMk0LxbFWhX+dolewDXxdjCgWWYrXUZHRiLzdN2YVZNpHdBCwhKgOB6d5ib4r0EL2dA7KY10CAl2nZE3rLQE/lQH07RDDQq370i0QXPiOjuqZ8fDxo+33LmEkbRHRaGs63kkyOScaFhO/0Cwn+LyNdutGNC7RrxziqNWNtaFgHwer51LdE9w7Hd114ua3DuZfFFHK3HfZqgxa/9TT2HsLAUwPKm
X-Exchange-RoutingPolicyChecked: HTeasDJmoP5udbxEwoGMEYmfLnfBGZb1Zuqt4TRiiM+RXYhj5BkLZR/LjKVRaSkLqUufMjbYU/prcdYiWvJ0D3/hGf5WmZ9Ak5l8yUV/JaWY6JBhf/B5ocj47IxCEEiotSku8Eg+5GBHQi0mjj8sUGm1P8IlGAOTh2YE+9vbVXurahDUE/8vZ38h5BQ0rCjiVhYjUVt1V9ENk1n0nQL4h+dbECgtA+LzbAGau8aAHpg1F2ZHQwEzugJWnm8B3GTjFRWhSqzeS7OcO9ZH20E3r4mKgHvrnsL5+T57RUgLXZZ3r7gxUcZKTQ2HxQLENbs5qlLcyXio6zZ8AYdf7a3TnA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 23:16:58.5920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86727238-f480-489c-1cfa-08df4b4a344f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA1C1B9420
X-Authority-Analysis: v=2.4 cv=aPllOr9m c=1 sm=1 tr=0 ts=6b076d25 cx=c_pps
 a=0XF06BAwF4INxAelKEegqA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=VkkHSWmPFM6PHLY5UBcA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: UxJT9jT306Vvr2wzsT6WTRybHVRkb1Ye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA5MyBTYWx0ZWRfX66STx34nOteE
 FJ3KBLZ9QHwsv0yLPXrcxRQvaQE8u5Z/59mQcRrWxSIE8Bx/swf2YtJ1Tu5Tw+CPe5vhrHjrmpf
 wkRxauKEHHIrknAZRT9Dz8cXYBvAJl4//7eekCL77COdYBSiFMR6PuGdKFfDO19SYKQz92CIL/J
 bnEKd4uyYhYTMnUTZved39l8D2/hZWEM3oGulhzEVRhJZR7lLpK+JF0d2BRr++bIC2qypRbyavP
 /++d3GuqVaBtWVJf3Vs2f8EJfRL0b8yJ8ZyOqwvt3KidsKZ7aodSz2zxfxsmTOOYrDjFdBfwD7I
 EzH1nkpxaabVq52Pjo5GcG0DqixhmumCwFd191bW2T8WJjR3JseXoY5+w5d6h2AtCsbrYzjBzRX
 GZcatD95qC3Rc2in/WBf9wtBN+OiZ/xJpI8T/TQroDDb0+GZjhADWDiQsumoZHHrH/eei/tdohq
 DtIzhx5RoOb+j+X/qKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA5MyBTYWx0ZWRfX7xIBZlbLNuqs
 a7dne9nE1p7Ht1jl5ew6IgBDEFTQiKau4scFkOw3KI0TrbYIkk1RltW2VsYOzKs61DOYHrk9O9j
 nKosMOb3rk9ekqtWXemefUKdnRUzddo=
X-Proofpoint-GUID: UxJT9jT306Vvr2wzsT6WTRybHVRkb1Ye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_05,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250093
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 25 Nov 2026 23:20:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20573
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261125225427.1507410-1-sen

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master/wrynose][PATCH] conf: am62dxx-evm: Package TAS67CD-AEC overlay
    WARN: Commit message should not include directory path to recipe: conf: am62dxx-evm: Package TAS67CD-AEC overlay.
              conf (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] conf: am62dxx-evm: Package TAS67CD-AEC overlay
- Submitter: From: Sen Wang <sen@ti.com>
- Date: Date: Wed, 25 Nov 2026 16:54:27 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 444ddd0d479e14d6051ec888318d786dece1f1fb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: TEST: linux-ti-staging: Add testing dtbo and build command
- Commit SHA: 3fa492d8d22e348e7a1ea4058dec805aa1d3e6a5

Patches
----------------------------------------
All patches applied

wrynose
=====================
Summary:
- Patch Series: [meta-ti][master/wrynose][PATCH] conf: am62dxx-evm: Package TAS67CD-AEC overlay
- Submitter: From: Sen Wang <sen@ti.com>
- Date: Date: Wed, 25 Nov 2026 16:54:27 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 444ddd0d479e14d6051ec888318d786dece1f1fb

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: e9bbaa18b4af7076ac2855282865044d2cbb516d

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



