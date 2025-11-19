Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AF9CF58FD
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 21:09:11 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17908.1763586548294346593
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 13:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=UiJStZfv;
 spf=pass (domain: list.ti.com, ip: 52.101.48.59, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoDMIxLDzl/+x4IAIRNpvHpmQ4vAjHSRrMD7RUiD8gFc8Qk+1UzVl3z7e9I5Ao70Ui9hEkI/YTcN8gGtoVcDlVvOHBwc9JmMa1U1K6Cxji43CuX9RNvGYRxL++lnA0HfS5A9Mhy7WjT98OuBaH39RKCC/lh8OFAVcpfnXja+VY98+g2JpNjF4/SaNCtenTwQryYMRK7ym6yCVy9YBI0pDs4OiD8pnRC94CBUdTf8B4yu0PDDESjA7PEFPq0jSLNGEvzuo1xcB+cRe8e0nfb8ZYqkGgENcp6DGIK4Zdk+0SHIfeFdl939xA2rKhyvMgulmTTkqTY188sJmNatRFh5FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=197CTIMNJZ3CNY8oBd1Dv/bHYw568ZkAsqe0zXYNg9s=;
 b=QAk4fMvotBtuXM9xn3eHJfC4RP7UXeU5VPKIcqcgiqnRJ0pFu4dcIfULRP3XX8NQ+S6Bz7kCLHSTG7KS81lb/iBdTIRFtrAhM0tjeQRKmvZb+Lhowyw9KzwJlU8WXhuBY+g3GZO4cn4cvUTk6Rbnsgf+viMJZqk/7hXLRe/55SB4H1no4WDjNLSEuzwxTB8bTLXWX7ktXI2iNKf0HI4rmH9xO09zGTW81vINE6Tt6j2bByZ7AK0m/egzpGd/GqleAU1Dz+EhQKkZDxFxuo1d/Ncaanade3O1OtBp6sBiMk/bHeX1UWRDOM+5zbqXPZ0cets0SgZgWNPkqs+MDr+fMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=197CTIMNJZ3CNY8oBd1Dv/bHYw568ZkAsqe0zXYNg9s=;
 b=UiJStZfvK54zIyJheHqSaespV3/Kuq2ZmR01WCv8/RpgaonCtLZOidC8fCnnX4w/ge+Xu5ZcNReriQRhT1Hv2wKzUKmwYkNdhGTtcSu5yUIlWikWII+L+OdtEoH2rEceNw8wygyNdsrgVrWA8vsFbi2+Ug8+HUAm34zWlqFA9KG+X3OYbTiJo8Gm1huPaihCccnOB4lu+Ct9Kl8SsNez+lKXGNSmlNnsVNGvQO9++BizKB3ncTpImNdXKpm0gB0qgkol5rWUf5asSMXlbPiJlCuT3WlY4Sky57JTGJgnvSksFfOF9QT6LpMZtOUe859NtBpy4xOM8Lt7XI6rtCK85A==
Received: from BL1PR13CA0243.namprd13.prod.outlook.com (2603:10b6:208:2ba::8)
 by PH0PR10MB7005.namprd10.prod.outlook.com (2603:10b6:510:281::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 21:09:04 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::3f) by BL1PR13CA0243.outlook.office365.com
 (2603:10b6:208:2ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.4 via Frontend Transport; Wed,
 19 Nov 2025 21:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 21:09:02 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:08:54 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 15:08:54 -0600
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 15:08:54 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJL8sI82021142;
	Wed, 19 Nov 2025 15:08:54 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 16DF9142E21; Wed, 19 Nov 2025 15:08:54 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 15:08:54 -0600
Message-ID: <20251119210854.2350265-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251119205641.82707-1-reatmon@ti.com>
References: <20251119205641.82707-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|PH0PR10MB7005:EE_
X-MS-Office365-Filtering-Correlation-Id: c5efa660-a4b9-4917-0fcf-08de27afddef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iUK5e2UUemzcmyLB8fIo2jufUydnxdRECg3MHDg+qDooTsdLMIweGRIK2SbM?=
 =?us-ascii?Q?iT8iVmTUVz3eZqS//6EuhwpIWTq20mTq9itxVqvgLY/AgCOMGIhj73UpuLam?=
 =?us-ascii?Q?PY34tufHUNhYswwKQUX4d4unTNxj5fov4Fw0AVhdBE+cu5AGewdQxi0VmZNg?=
 =?us-ascii?Q?jovNh5+zif1R8N8ezFZ/mvx7SFZyYVL8Ybb4iJF29vkVFQJUJ4gJE9xEhRlb?=
 =?us-ascii?Q?rseMvUbjnNT8vbU0JF1gTOJE4rhTPxO5olJxbVmyVZXmyGQNKiMcz14Chfh2?=
 =?us-ascii?Q?bW5qVuQfMI+QGYZDNGGth/PP3eTfoc7WN1L6OABe6WXBLtXRhNEXXSMf04nQ?=
 =?us-ascii?Q?zLMNJ2UHjiqiZVGPLQlfrwQkGeM2W6qqVBTtknwpK3J9AbEJZWKi+1xUZIuZ?=
 =?us-ascii?Q?2xcgC3qL+RpJcCOo1ldXNyLcVfLuOZkVOWTqbnUgYcjTRHfeIVGHbKGxJsrO?=
 =?us-ascii?Q?BFUu48ebGuLM5blyt8LMuw6Ksu1m01fX7Y28rbLp2xJhFyvjqeebIkxWiATX?=
 =?us-ascii?Q?zRP5y0ySs98AFpWR3uwtUSuk3XqySBPnUwXf8I8AgiT/QCEKrsf1XguZwyqr?=
 =?us-ascii?Q?F8oaRZ3KSBZ26ByzpoJNse3uCosN1eWfGpZ5QOXca55gtW42iRHSKXZspl3G?=
 =?us-ascii?Q?zh7RjwVN5ZBmDzfRfkWZWHBMe/udfcPYJQ+fSn/2Qy0R83rPHZ0qPDT1MEtO?=
 =?us-ascii?Q?1Ix7Wl3Z5zkp5Fpf5K3GwFb7TvIwE9ofWD5zU9s4qVYjrMl4DK4qCTPy7Pr2?=
 =?us-ascii?Q?f+nKJ884uKzSiaIrxVWeC3+gtJFGL8IppsHGXlofhkuYk7uLZ4ZJhTXTAnsp?=
 =?us-ascii?Q?QMa8uPXeTQOTMv2K2t5qWR9tvyMRrdauy1qqO6qxYSuzB4kk6XpOR8W7ZBUO?=
 =?us-ascii?Q?74KXpznBypOrjsb84TgLUIFBwJGxjT02Mg2FQr7q1bIcs++aktDvRMyMBX+L?=
 =?us-ascii?Q?3sWKWxoKxkEzlnBgO6qA1YLO2N2dlP02zw1M7dNBEut7Muwfo1/nMqmZenTm?=
 =?us-ascii?Q?hGIiRdg3LrWS0HssAMc96/NASmSxprCZEoQUYVYzExKGkTh+s7/lBR3yBLFv?=
 =?us-ascii?Q?EFPxtRiYySC73m6x0HXXGwIz1KHXCtCcY19cRx/w047XGjZR/FeDdp5/AkEd?=
 =?us-ascii?Q?+fmqE/k7RPiv0pou9gR0yRoLTlzysGFQn5ToKW6v9Oj0Zn5yANIw0XU4co3R?=
 =?us-ascii?Q?+7+7PwWybGE4yOYzw0p5ZcBkMfKoNh7eHQWYSyskenz2eKZ567re6BZsm++P?=
 =?us-ascii?Q?Y+vpSZTcJHAXV4PLK8jHWAvM2ZUZXmTdIXLn5OtDYoG3HwbWFr3tsmPB4Caw?=
 =?us-ascii?Q?uMwZK+bzle2GiDmzrvg41JibKFU42ddg0u2Yo/CQiDGWvI7KHPzpkpXN9Yw0?=
 =?us-ascii?Q?bIoD2cgIIPrDd0yYmVDa+FUHpMDTesOQU9fuxY9U7Djjx9mZiglatqPzgGNe?=
 =?us-ascii?Q?4qCHb+i6FxpLCPpT2KiSaWuXXg7Hhe8d/b7iSdStOmeFSWmGf+P51B/Y0C+e?=
 =?us-ascii?Q?ASIGmIJW6pGAdsavpeHtassDJYQHpXCZik5diedScY8hOGUWzq5Kq/fbCQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 21:09:02.8260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5efa660-a4b9-4917-0fcf-08de27afddef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7005
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Nov 2025 21:09:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19297

meta-ti / na / 20251119205641.82707-1-reatmon

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] check_yocto_rules: Add new PV-1 en=
tries
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 19 Nov 2025 14:56:41 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 4af84c976fb4a98dbc33c30db6f168e8b=
0bd9bd5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202511180100
- Commit SHA: 2676538ee0b9543bc8ed495d4c5a5223e8b48506

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




