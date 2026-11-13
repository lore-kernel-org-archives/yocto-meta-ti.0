Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1115.1794587141923329240
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 08:25:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SoGJPj8i;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tR+nBDAf;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRkNJ2411456;
	Fri, 13 Nov 2026 10:25:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=/rIjhtVlzYnlqgG895mBbSU+GzaiYdkigwpX62VFr
	WQ=; b=SoGJPj8iwb7/g9swIn6zqWQ4iafhEbP8Sinvey0i1V0etOMsoUX1CNe9q
	zPtjPshVwlN8h3qm0nNN8MnXZzamrmmmnB/qw/qZmtxyvp0Pv4Vj9RhdyFnuljRc
	dJAC1Z1bmco4kCBwuSTFCe4JSK9YSlbUmIMHkyHyC32aMiPaEsl/lFAYc04OX14j
	XDBb4NiTiz2X3G9IZ93w7Env/OUx8SM0oPlQZG5QV5Sk4rjwVSSKS5wlFT250zq9
	e+X90/n0fn2dsa0k0D23IGT+fNTlcfR12xq7DORe9z2AZNSgdXly9V9c7+kwvFwS
	kIWZmViQw+eEHUPNPikrN0bt7Iz7w==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012036.outbound.protection.outlook.com [52.101.53.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hwg9rxwvf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:25:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kk3lOyv1Gp6XKFNukY3CU5G3tndIIahNRMBLWbt+AP79dHTXmQHGEOwxqrRUoiNrjwk32cfErq9lRgGBoMsvY/c+2M2jDMfiFsHalyZGlhMKhnp2Q1lRZ9JP2aQJhu04Ah9HZdIkQVurykFp6w/QceiWyGDx2iTHbJdAvfDkv8+nB4MN/hnMC1e+06foZ5oRvwQ456a06QwTdUxMP+KcIbj4THdG6Jnx4AYglaP4+mE8S+q4ZjwWMYCCT1IKzXEBWsWvYO0Q3KqSVwxOxtH0xlNvBmm6fz1D4OGc5G/dvkrv5f6IsyXd3LQHeun1Y8w6zY5oBCL6LP7JzlsEhLxNDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rIjhtVlzYnlqgG895mBbSU+GzaiYdkigwpX62VFrWQ=;
 b=F4//gZUgua4xHG1z+N2jDBiinuDjI93SZEgijs7pu83EuoWYLvyI06ohknH5xxxnUFyIruKZFvB6HDSaJCs7jNv9mhHeLmf07ku2SgJ6mtZIthWtULtNA9q4zPjzxtNNwOpIsI4eGjGIGikPALdDWn9sE3cxeNIiPw/7Ob5+FGPBxqteW9e/BiRw+7kGCafBjOg9q3WLrT8ctVHQzPYSvtD6dvMV4CQi9A/dy1DArqam0T4wCfAovgzgHLc3kh4v5yhkm+lgFzjMKAa6JMoFJyI9W+yz0ElfhwsGmGzokw4mOMj1xahBDJ+VT1xYoR92KAKQPSS1+8I7DzAz0ys71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/rIjhtVlzYnlqgG895mBbSU+GzaiYdkigwpX62VFrWQ=;
 b=tR+nBDAf/g3RJiCfs+Hic90/feB6UM7nXMBRDXcvY2hqNAX1Mw59QmqPMWLxBo3FCYT7ds5N0PIi7ss+CMZN7Y0cCjPeQqXlLbJblnYL4/nTbHHBqY5S6ec67uFV1TDJB3ziWDDGiPC+KtrDkDL08798ZyND0qD/n4FxMk2vghjg0hYY/LmnLS9crFIiN++XWNKnLE9lUByap0TnqJ6uiI4F1tbxcexEbbHowr9RvXqgmIwKJFIr/wrUcopTRsgXnj24wMmCe76atGdLRaEe9wOd6e6BVmb7KQaMFdoaea57bp0rHTWjDBrip4CrTFuNIwNmMz22nW2NaPZfAAQo/Q==
Received: from BLAPR03CA0138.namprd03.prod.outlook.com (2603:10b6:208:32e::23)
 by LV3PR10MB7796.namprd10.prod.outlook.com (2603:10b6:408:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 13 Nov
 2026 16:23:19 +0000
Received: from BN1PEPF0001806F.namprd04.prod.outlook.com
 (2603:10b6:208:32e::4) by BLAPR03CA0138.outlook.office365.com
 (2603:10b6:208:32e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 16:23:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF0001806F.mail.protection.outlook.com (10.167.245.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 13 Nov 2026 16:23:18 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 10:21:50 -0600
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 10:21:49 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 10:21:49 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADGLnfW290603;
	Fri, 13 Nov 2026 10:21:49 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 07A912C91; Fri, 13 Nov 2026 10:21:49 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202611130704
Date: Fri, 13 Nov 2026 10:21:49 -0600
Message-ID: <20261113162149.3155899-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261113161001.2221621-1-lcpdbld@list.ti.com>
References: <20261113161001.2221621-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0001806F:EE_|LV3PR10MB7796:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c290f6-7903-4046-4b9f-08df41a26d2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|22082099003|18002099003|10067099003|56012099006|261022105027099003|261028144727099003|261009223027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: yZbCAHC1S2ErUC85UDO9KK2AjbtGsOHegSJGOYRnCaUaar1EU4A++5QJPp++O3xdfAZUhlpQpSGM4ljXUJ6CglW+zKD0AcOCm89Xhw3fMVj5MbpCocd5+ualpZjmxbH5D9einV2LtERnZKovgezeJZq8esnI5VN/ZuVG+hcopupSV4UhTCHQs2DG46646prlAtrfQWaCs19cgEodua+PDnCWiv/2J7tG1K8b5P5UUpkzk0celo+Hh4sJTDb/IEd56jf56jXU6TnVyOjdujVF8xQdEOtpAAHwlejSCV+5QX1AOT2Zjd0Yj8gMei0so63xRVcvIv/PXM/8soCfSuKbrxIg1K9oH+V4Gfsldt01apdcDmrgZMEKrz0qUJ0CUhotfwagCvL+SF/bYYnzanBQ+jyFBE+mKVJIf/W433EerCQhK0YZtsAM0GS2QQP2DiqOTk1EucktAhaYE4SZns5WyJWNUbLdCtAwk0T/aDF6RCzN1zrU53RlgvGuEcY38HEZNSSaUkBEwy2f9/ZkXJpccpCkDQ35k7e67/MCsMDG0oYMJwgSKXy7yqWcsURDBlZCA1NEnMT2hGw9EgmhVRixCOZia4lIRl8N+dPuiAw2NMd2wTmQLkYWFuPs4QS0DdwlsqQTMSFHXfEcFYfKlP9clXdshr+xl5rnRrnxdss/hswu4TfOp/YRTXIj1Fo3M2TjOkCCGSh61rHm5N9S4kpu+Q==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(56012099006)(261022105027099003)(261028144727099003)(261009223027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: lcyeD4c7pUJsQ9CuMw78GHP4tHoo9ptzAY3qbTwG78kjJ5pzQEnyE/dBKDCCaxaSyB/YeluL5B+hEXE5J6z1h5kYTPTr1c4xkKnCvqgSqLBdqjX74AFPzoCyZ5Ng+mfQg/ETI9dLu03U8rapcGXieymzPikGCsu70xfHOnjSBxwWpq6rKvczsio85SE1qu02ZFPVqX32FSBA40/4qANvGHBTWkwH+4YsaFllB4F0HA4UhTtPRbA8NH/gfFX946yJJg/WHmGmx9B02NQbR9V/dm+Zjl6nJAoO2HcP1FXFCPBQddBWqOqeLJ3kxZUXMdUfvBp1qcRLfCbSLQRhnD0trttF37oV0IYkwST/jDz/VGZ4dTzFGXDJsqkREZsiMOGvGOQ1EDjDptR9JTnuqYirG6AF6akwLp2oKcAdKXCs0aa7foWgLibixdkwwAOtBc6J
X-Exchange-RoutingPolicyChecked: mLto8D3dzdKhBm8zKbvKwQc42tnBkoIHxYl4MappnWx2hxlBQb6d2oJGqg+Rv13FviyDk/NLOootRGmwoU4hVHHHi32t2N1HlDy8LWoYlnh3aXkEoRXgE03+/9qXgPCByZN5ZOHR1LwdeZFZTkDLbzytTSO652FUDHudIrANyiCGyLlo9ylk002xX18edOMWOSivUME1z5dNK8WldM+yQzAt14tU91m1SmZAt2/4TPJYa5SxuAgsAjyU8XfLVj5vHqAruXow64+68SEJrCBvPFm1eyvoSCBTnzl3u0UTGgJd7LhJX/btXLCFGESLD/Bn9fDQ/RGdne8p1B0psRX+ww==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 16:23:18.0827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c290f6-7903-4046-4b9f-08df41a26d2e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0001806F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7796
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfX3GLZ/SHwgfPe
 mTD/qD1gWHuGVi/YwYlgJzWdBv0hlVniE5fYAoDoRafyWEA36261LWmw3bbLH/Dr6q/D2oJjJ40
 C/FayTUrX8c2278vkhlG/751rqHYzcwqv68HhZf8WTjKdkPbLFs2ig9DzM0xln5c1LhnDVlyonk
 xnQ5lE+q5FIHTfrsNVsewd/PlJ0o9rRI3KPDJsnqL2DTFG/kxKXClip0vvu0OXIPtS+Kgc3aETP
 gIcZIMPrZX7AVGbfpN6ydhP7P+2wYG3hdJZARnO8WmslezvDSEr4IXUaEkXd/zm3DWi4uFh8FzL
 czQf908/oAGVax+b7FkoPkXzBZQn6Y5iEDH9J3BOsIWFvsRdeu6AbiVcqsUcfHxImnETnOumRVe
 eUUh0AeFCHwA9m0XT89G/EQDAhZW1XZdrvHtU5nOjQExQJrvsdfvUkvnPrZB5ZPw/Ydl3j9ueVI
 2L5EAqxug8CzJ0zlO8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2NSBTYWx0ZWRfXzqeFzVVBSzqR
 pyOpibbTzCM5d4np5a9E7EShg3eoPXRNag1VQjZbmIwapHiX46BIVJY8AemIBV3D2+r21OrGbyz
 XvgfyjynhuLlY8GImNYzXrH2lYcT4gc=
X-Proofpoint-ORIG-GUID: 1Oo1oy-zcc57_HA3HAT-4sLyoeYyPQFw
X-Authority-Analysis: v=2.4 cv=b7oncdGx c=1 sm=1 tr=0 ts=6af73a04 cx=c_pps
 a=9fgoEbmtC9fw8tSBsklw+g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=I8auufxzcAn8cz0q1kQA:9
X-Proofpoint-GUID: 1Oo1oy-zcc57_HA3HAT-4sLyoeYyPQFw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130065
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 16:25:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20541
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261113161001.2221621-1-lcpdbld

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
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202611130704
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 13 Nov 2026 10:10:01 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 313f19c80031a06a78282d3b7e15dc1db9b6cc79

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202611130704
- Commit SHA: 1b07747ad068ca7debcd3c7a6c8f9f9cb3ba4301

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
scarthgap - PASS
=====================
All checks passed



