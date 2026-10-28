Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1320.1793206882487584679
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2026 10:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=mYZEH+Hy;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vLv1FfLn;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF97L6277930;
	Wed, 28 Oct 2026 12:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=m7XFapxYlp7OWGy81QzH+sLYgwWWwBK3G2B8qy7bt
	y4=; b=mYZEH+HyVuyt32D1DHVb2STbpcWIH3uaCv7wXC5TNU9iVO8UIxm8OWkf1
	ZR40UiuDY4j6O3abKE4+Cyu59Csj1MfH7M+6IZk+dTjpXvRKs0tveSIiwC38Zv+5
	MB1MWUg++3EP68zBKvHjkC2XGDA20iP99CMFkZoSQJ9dy+d7bTtuAzsPcUZ+0H31
	uz1yHAq+6RgtD6m5K0IdYh09t0Qk+YEUHkrb8pKr69ZoLX1zlFJrq+WfvHhvsuFq
	3TLzAwFoowypnQVDoB3myd1bdaLP14b11q1wsaeGS1c894mg4bhSWH5l74aXxkFa
	qArjQlA+At5MdWk8UD7qFa8TT6DjA==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010029.outbound.protection.outlook.com [52.101.56.29])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hk2u5f9v6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Oct 2026 12:01:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bwk5jwqO3fSGVXQ08IUGfGwE1g+UjLu7duJDY/iG1L8HRUPfeS2QzoWp1w5wosf+1e1Q3+Tmi5Z8h5IDSfKNowZo9lDC4PzC1ot8H2jp/9olU2tST2MVtcEdvwTO3b68VmvsISEwA2xaLI94l7QOSTi3Sn+h5jNJ4/OqbJ8xFoToH2w9LVIxA2FuzU5KCQwSD8Rry9U/EiSRB7tZeQEU1hvK9FJhNTJbc+/kJQdjDFeCp8Dhc3+kZy+Ve8DVs4KGAVsd4RXoPWob3Eh+rTm+OsBQNYNb0wHH4ZAlOq+3jq6HjUPHWRETrPtmFAyZWwtBWKESP/dLiHJKF/GtrvXGmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7XFapxYlp7OWGy81QzH+sLYgwWWwBK3G2B8qy7bty4=;
 b=KBm/sW1czDVHOZAd6G36URzTVwJSLRa15GHTh364lYhCvBZ+/8Hdph7rZpskkXvEOfkMWMwnFAHvujh5ggw4aydSaaqfJq+HgAb6RwzX2W62a/JBiTriv1zj9BUXLD40NS/cZWSrdBH5v7M8XMcF5+pSKJ4tdYSFPsc46tP11qHMKMhkZKf7OkmlBxQVR3V7WfVycjJUAjLoc2K3CN5Wtz4HlZVtsr3orGUDbTLducuG6qMwWx0nFv02RulSWJKD8JhoLDMbZ7TGPwbDATBwr7w054ZIy1UuKAsTRcFIxLmEPd33rHTUcAormb7loHVdKHl5rh/GbrjwMGg759rGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7XFapxYlp7OWGy81QzH+sLYgwWWwBK3G2B8qy7bty4=;
 b=vLv1FfLn/tzA5nyIrSFQ54RHSAlq0ZLdWMmMZnWoI0OONSBG8cLLf9rWSIkG5eHzDDcw4XS4KqlVzuE1xlG/1jhQKxKoR7sdWDEODoStmz47PfrJPka3Dw+hLht1HuZyugXKlg2X46ZUv1PxJ+wj5G3PyHKeb+gNTRwO6YhTSnw5p6Z4sAi5H9SHa4sqtB1e5CwoBnr4qUbV//YqcMMl6OVUpOtS1c23OgD74O60mn/8B86v43LG54sNuXi4cxyWAhdChliNxOPF190I1Ic2HnT0KYdd5TkSRz8Ty2nYgR8Peu+lp/533xchA+dmxNrhdtyQXZek6x/SkjdIkKeJxQ==
Received: from PH7PR10CA0021.namprd10.prod.outlook.com (2603:10b6:510:23d::20)
 by CH0PR10MB7410.namprd10.prod.outlook.com (2603:10b6:610:190::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:01:18 +0000
Received: from SJ1PEPF000037B4.namprd05.prod.outlook.com
 (2603:10b6:510:23d:cafe::5f) by PH7PR10CA0021.outlook.office365.com
 (2603:10b6:510:23d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 17:01:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000037B4.mail.protection.outlook.com (10.167.244.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 17:01:17 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 12:00:39 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 12:00:39 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 28 Oct 2026 12:00:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69SH0dVi2283813;
	Wed, 28 Oct 2026 12:00:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 00DCA9A9C3; Wed, 28 Oct 2026 12:00:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][wrynose][PATCH 1/2] linux-firmware: Breakout iwlwifi-ty package
Date: Wed, 28 Oct 2026 12:00:38 -0500
Message-ID: <20261028170038.2544837-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261028165724.2776953-1-reatmon@ti.com>
References: <20261028165724.2776953-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037B4:EE_|CH0PR10MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ad18852-8ca8-4127-c5b2-08df351514f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|56012099006|261009223027099003|261026140227099003|261022105027099003|10067099003|22082099003|18002099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: ZxvixWadyMrVB00PCTG5o94nYkjgrPfLDh4dfBwBuU3u3Dq9lqEdwZ5jfqWEig6GFKOhBinesq4hZIyC4dZcM/BrZHYSsEG8I3I2n3dkwnKTiKU9MBAMxcwrRMvNq0VfeLDevl0sk1/omkCWhngcjjrNbBMWCBp+c5eENzrenSi6MGqjFU3PTsjlrxF4/uokA4GYhRo8AEtwNnKDMyAS9xqHbLD9XfKhEr+4iQ8K8OJ8Dy9NGiMuyMvxD9wbkNisQxgrtrrQFuqUAFOCzuIZcsXn/qAFwzAf794nZh9bcTOIWa4AgVcYUT4n80qZ9aJjxOAKByazHtO03aDu4tUrlBx6QE4tzWxreLrT7/ct3O4UiadzrHiAdUYjNzsfBuTj0GppQ5igOGCfE/SbFRB0r0GI3pUz7LeNd1D38gU4OVt27uvWa+Kw0ZXiES2KbIkcTBxmn3saBhSef6qgQ2iRdzeLlwoMkx7c/RmKPZuyfohlmj3eBlWH934E+a5o02ZdM2H1tqDwmgd1bWw1/Ug0go5AcSguprdsC0ioLnv3eUOPAGQKSnBrxFHnEnrVRV399roWs3HpN+y74h16VZEALJv/EjbY6lKTb9mFlMOqVputNf3AKC7ZrTs5idIKWLnL1h72RaCZp490Ie/wLYsEA/x7TVxIBQ2NfIl9J0r16NsdhgBJJAbaUyitpOuI4nJeR/vVhBe7rmoUIKGiXYGwBA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(56012099006)(261009223027099003)(261026140227099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FPiBejfdWA4FwnHwXMXxJQ0z4rqrF5x8JEJ5uiHILe79sfhrm21iHH1YSi+tcy3ywiAMl+XGCE3mb7DbOWGnf8joQ34DyvdVLwLXLegsrMkrVqEX0cpLv4LMx5y9PpSrFRTEQhqRWXoh3u43Ngmaz5J4t7u/p6rMB2Um3hU/2TmuvN0ZcRHsSTs3JeG2wkM3l/7pEM7+CKHAhbpYS3DNVo7MLpKs8lhiyOejXXTbdiHA6SBXyY3q0u+MeeAt7SUxlFYl0khZ9e0yrNW2MdQo23ADqIUI0NxgQCyOvTkBVBtVoVSpFxX1t/feQ4EFngqKlExatVPYK1thny4UeAghPp1Wz5svQ4lf1gglATd55XZtKa+9CV6m8/bdWKZJYfzwNH7etChiNxt7Z5KgvUAXvo6RqA5o3c7JIpblQZDNunpbsSrPI5Rca7icGrI/Hl0r
X-Exchange-RoutingPolicyChecked: UM+uAswDhNLVO3ySifuPlAeKqZMbKNzaYHfGu3bKu+smQoToHjL168a5XHOTj6w3KBnbvSIX6B2vLyoMbZ8Xo6daX3TEVLLZVex6rUqxgDdhYe+UGjXqcCajv0/j4d2p47+Bi37cuZJrPMs9CyuyUFoCDcvPm387Akqy/ylIrd9R4eo766M8QpdXcV/AH+ej/+KGm4hYdXNaMD9wLQupOqxp3NtDEXx9DMXOGFSCzEnKdeMmq4ZK/TwEdj9jWCONmtuDxvWxJ1y2EfIvB+Tl4dZqRekMHW85Eq2FtuoUEjSHaRFixD+Fl5jHyHDk3QsJ0B+dKidY32iuv85gG+kdwA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:01:17.1182
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad18852-8ca8-4127-c5b2-08df351514f9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037B4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7410
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX93rEa4On8wr/
 ENe0YG/JreFfQ9j6dxm7MdbF3xxhYZGUiCxxfOFwErecJFc1KqSwKNraoXxkmkKU/+ttYsWSuZA
 8oO+fj7k2ml8dsjbB98rdWxtQ6WqJPk=
X-Proofpoint-GUID: QO5NtEgEhM31YKNO7PZin8OJgqXNSaIf
X-Proofpoint-ORIG-GUID: QO5NtEgEhM31YKNO7PZin8OJgqXNSaIf
X-Authority-Analysis: v=2.4 cv=MpbHeGae c=1 sm=1 tr=0 ts=6ae22a5f cx=c_pps
 a=cIeYbKhGSB7Na0nkMajj9Q==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=dalHtdRvv3I9BOmm59EA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2NyBTYWx0ZWRfX52/0C5NjrI5N
 w0sgb6RrtM2GhE57xhh+bMPbRKaWXkOA9Vimj7PtlH1s2EwzzzDEFmH6iIuVLCbGz3HHmu8ZFoZ
 re/jYMB6FjtkdCYKaU5x8pWhu5GK2ngymrwo5mH/zOtPu85fpFbh+6JyGa5kJiW6iFD5oOqYhcT
 Vpv+dvfz3SvY7eLwZ/cEgjTqV+bEN9MCfX73b5+8q91yhPa1xGi5cWW+Nj0miuiQW9z3N6xf2S2
 AeLP/c4z367Cx3rmKWC/eyNtxiOiM3//BCWZ5tB7l8tsNSjolNf4Yi3R4THF7VDRE4CWkzkJbHx
 HYrZvkkDaguyNSmEFh/iNuYu2K2lrEKh8Hv+K2XvK1z2t55bT2m0Sk0y1pybV4PuguoAbaeoe1d
 SBz96xckzFpX4ufIp2xLMzin51znHOdwROhP+vw08bA0s4zjcqt0L/yMV9mLCOy20PQgJiHXbyG
 /SS4ujOqpMHlq+qhhBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280067
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 28 Oct 2026 17:01:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20501
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261028165724.2776953-1-reatmon

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH 1/2] linux-firmware: Breakout iwlwifi-ty package
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 28 Oct 2026 11:57:23 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e20aed4435608f48235a216e86a2a65d60801b14

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Fix inclusion for iwlwifi-ty package
- Commit SHA: edd750eef0c2755a8e78db4cfa273bc446fcb9e1

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed



