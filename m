Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4805EC98304
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 16:03:31 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1373.1790179400784873207
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 09:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=B77Q52O/;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=w1ARzNER;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NG1on01195132;
	Wed, 23 Sep 2026 11:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=HJoAexg79jyc9hy4y8KJnin6Lo6aXCarT72+7aHZY
	UE=; b=B77Q52O/M43NW2mF0/21MIW47MR9V0OzyzSM+Vc949WAY1/xoP7rvX10E
	a/XqhKqRDRoVRTihcShQaUCSiZmm/3Qw6stRHrSLvV3JU3X+H4UrgWE5tH+Ft+UA
	Oc9lM32MvRl6hhRXXv4Xs+7aTxi68EvLGnVHp9Jy8AW033WxNNZfOz3ACxvp7gVb
	ofOsZIR4wAAYpzzsg+t0fFC2JEFT7/FJkiVLTmtRf3W8pM7PBgQ3LQEBSfWi/dp8
	0rWMtG91NzKnlw4LldU5aweWVjYpQCAaxF8GXm9kP9QglPjOa43fyI3t2/aaPlsI
	ZCo7OGR6Z7dofWMVEjbkxxx5J363Q==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010058.outbound.protection.outlook.com [52.101.85.58])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tmu6b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 11:03:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrrfWZ9leHOoo9KAHVvEjNMu2u9f3MFffuARbsRhXPp+52GQvm/Qw6kezmZgKEB9O7U21hafoCLBm2Zx6SsQbjwdOXA+2ai0hnnAHZapArsBXo6Yi27QtBHRKXa9kZjTjyxdAj+GxzoPtCDHHFIVPjVXTdm2vG1oKUBE7UyHnI2ncwIph+p1ef8GQLbFhpjgcpMa+/jaBAxz5ieaz7QDSM5865O08s1vOqbAFY40j+bLk9WOk+fiXWDDHUBGMYK6nw9BHx8adreIwBTDe7fHtnMdeyTR5mG85QoRY+51bRQvVlyfNbWBsLnGFxnZVP9Cmv8R7TIUpldOhGFhltnGoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJoAexg79jyc9hy4y8KJnin6Lo6aXCarT72+7aHZYUE=;
 b=vhs33js6S6r4+A4TnMVJkr3snydVHob9VkN7tZ0qInW4cu0u3nCgC4mgeyGs0vr/dKvWtAp8mVcjJjNfL0YCb7s8kXfcVWNdLchhEm+iK40XuGAoqCM5Z6snscgvYlP1kCYIsV++wt2nTo7TtVXMA1s+uvfoA/MvAUxUxx8oCd4S4Z8+KhFuJ2CGJZB6iMLesZWFFSsvnfp2r1fuLxk40XYe2Q2pgastAgkS2ytiTWzvDy1Aqngw1jkWF7VkTlugkPVsvIo5J8LX9PgRYp19LwtsRAbzlXeczuf0No/y/riyFRBx3uqiuth+vrwFj7b6ABshYuEx+USfuNkruY/pFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJoAexg79jyc9hy4y8KJnin6Lo6aXCarT72+7aHZYUE=;
 b=w1ARzNER+KVB+v1m/U+cG5/p+V6gan6N3IRqx5MgyLXc4SE1Di8M+aiMaCgno/JJ+JPLOdvecMdoO9b/BprIB5Huhyfj6QLc7haMy0wUIs0nPDWQXoPCqwLnCpzN1l5ve36NGne0to8vgsgUAn2LRhhuokwPiSqlBs/ky2ONS0mCWbdZROHEqF6pSwIzFZZ1pChg54gnKSycBM3thOn7P1qZtepgyfM+AbD+eIpaVSeDON4embAhpNJSVB0OY6Mb+u4RtU6ML6EqcYSIJ+Cy+8lPhJiiXl9xnw24pNpZP9d33OVW1Gqfw7AL/tXdea3vgnxV9QKRningq18Bb642ZQ==
Received: from CH0PR03CA0269.namprd03.prod.outlook.com (2603:10b6:610:e5::34)
 by DM3PPF6AE862AC6.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.5; Wed, 23 Sep
 2026 16:03:15 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::74) by CH0PR03CA0269.outlook.office365.com
 (2603:10b6:610:e5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 16:03:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 16:03:15 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 11:02:52 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 11:02:51 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 11:02:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NG2qOA1899032;
	Wed, 23 Sep 2026 11:02:52 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7EACF9A9C4; Wed, 23 Sep 2026 11:02:51 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202609230812
Date: Wed, 23 Sep 2026 11:02:51 -0500
Message-ID: <20260923160251.1756098-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260923155013.3300159-1-lcpdbld@list.ti.com>
References: <20260923155013.3300159-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DM3PPF6AE862AC6:EE_
X-MS-Office365-Filtering-Correlation-Id: 07cb6b7d-3c7e-4b54-fef2-08df198c2d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|10067099003|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Seim3PH1nOhKzKiZ7hCORT/l7cC5yBNHiP9S0843rViJmjWuCq8/befjXiLrQQ3ZmBXHb8O8HuH4yIYklPN80d0sTuTAeLt6oHHRTZPu5gRc+68+jS4h2W4Nwz0VW/xe8TVbwvm7ljvjw6yVYEjuTxgc5HwEL6VwSGRt3Gq/gM0OfvylHwLHziKIiu0MmefG0wws1YaiQQF84RE/JK0VDtPjOjfAvWbI1a+bE1XiIwI+qP9sDCdwwEpTLIrco4t6vUVg0jdi6KLUxtxujCHJH0wSYpi4NVKo++WzAfx9qITJjGnr7Pm8Moi10lc0C7EVnizvH4tG4GaQEdyao7qFbxh8RcqUfwCowShKm3fIQdckFei/2vx3Z0xvWauEmQGxa211JOmFnG4SeBFX1/b/sfffJGHkIpkoyQ2yUvBVCHodu0O4oebt9BtGQfkEZQAjUhisivuybN+i4830oey9l+Y9LPJdlj1QxMpmz+pFv8VwKVJHRi5VujrUtSLT0jVzF3/E8PLrK2AUMyG6v1clwoe4hwde7z4jESa2wcxO6qUY99wjJJezbtwV8mMpqMm0kJqnNtX0xwXxan/ay82N+sSHH41iuMSzony+EjiWk0ZjvTnSKHwNkZBxxsNufSQs20EypRYWOsoTXNN/CUxq7Pe4UoHreqcvCVZkPNzXtLikwFvOFwxdVJyFZ71GJV8MnRfX0xjKZ1xdvTKBk7KowA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(10067099003)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	82Fh5ye73Rb+B1pwKpBZ7Sv76nhExDjP9jZzy3OGsj/XcVkwoRRLuJNrYWzgZGMfjvfpzgLMqxTI+T5vyFOgNG7jFxkKAU+X3jJ2OpXXwFifnvkW6/a0pDHnEoNdmtFh2uLmimRRoPmL0dFwrMCRH2ujxey4TGs2F3zdKyWHL0UJzkciRg3+fi+OK27PLz9kLewEzdE7bU6b/ieV1JbrjL0Ir0dcWVDRLo5mDwktPat2S++Ms9RXmD5x10qER55Wt7TD44pixmJ2IqX1AcjGwoE6OZWJZsMg1MbrobYdcANGZ2eW6xuTExJfjr8bVvIzYNGdZrgKE1n3Bqjlq+fuKxOSKrQOg64al7jZIvNUlNh4aIhy3F860BDFzvuXtzZnxxfBeRqk38u85mNa64DUXhbkOmTXWSOtacaNqW7LP6mt/XvurcbWbM9C1/huxG6Z
X-Exchange-RoutingPolicyChecked: 
	wtBUVR6GqT8aOcl2XXKQUcm5zzMTos4UTEP7IERkgvmT4sf1TD15b3lGKMQ60ctHaYWTpmVz/kuV1oiSFbVsvjpEaff1TQ7HylVecLLCYcKZKwjUXNLH12QDxiakBFq9l4xPhSyVZaPZN9Dk8QjG6s+HKDQV5fsfVsSBvvjnUksQb6EPHVXG+9SVr/ZY9NOx2cDkgp6Wmu9vQcgflEY0rzQGkk/fu6RPtMa1ysjVO0/BuFIM8gRkGP4m7sX8uOZwuZUEFgU4aql+uHMT6pi/rESSB0SKOvVrk31lybIA6+4oaz2GsVXJTi5O5lAA3QbUjD5auTMv6YpwoasJKX6gDg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 16:03:15.5413
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07cb6b7d-3c7e-4b54-fef2-08df198c2d50
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6AE862AC6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfX2NqLNvjQltgL
 1uv3CC5QhEjZ5619A0R/xn1LuUoXUHm8+Jal+O0Gb65I+Uz/Zwp087uYrXQSJk+EB19XT6esReW
 7QuLPUYE/V8Siigp2rybe3+t8/0bXHs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MyBTYWx0ZWRfXwxbbMEWhDqBJ
 IbY7OxME5ysv6UZjJ/xBjmYfC9O5xrXHP8kYs04YcMai4Q8bzXknXG3w2DjLkjcy462Dpf7MB7z
 U6KY+tK7RJ3DOhhemMBWH4XmEprbhBxq36HYZwA3eFG5ZvCikdnoMh10xegpDsxTv+Yr/qtFPms
 4nuj2upvXBNbi/ZD3KXUf0OcbxFpfWzhnJgvG5zADfSXzX0KopUApkIYo+ujYkQCcxbHYEUmvrS
 +e1zTMPpxPPJwY3whzIZ5QzZvodNvglUS+OiN7uKdz/NIK66RUlNVSb6o9mHBNu3NRuVhc9eAAk
 /D69NXwRtBVAwzOaHcHcolpODvypaNqtGfTKc9MaUvhbiCqIQah7eQ4hUu4gfYq1yU4YhHgQy7j
 lpfZSB5Hn1cVGupxfiZIzECSILDHxI2cbJ5AJvLEHZMMdZUtLBBV7G3nRe8rzV+cx7eYW0P4fFH
 uuTcLAoCxur45I5u7Kg==
X-Proofpoint-ORIG-GUID: XirL85e7XqzcV_ZMFQyazW8rvshXALUl
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab3f846 cx=c_pps
 a=oUdh5d0wO9iyjQqwpg+wBw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=nrBokKTXjNqfbvFcs3kA:9
X-Proofpoint-GUID: XirL85e7XqzcV_ZMFQyazW8rvshXALUl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230063
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 16:03:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20407

meta-ti / na / 20260923155013.3300159-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202609230812
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 23 Sep 2026 10:50:13 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 2d568647c728a343e862370731e7f8af79423725

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202608190946
- Commit SHA: ef43a90c91d5a9754b2f28f09debd553fbc6a2d5

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




