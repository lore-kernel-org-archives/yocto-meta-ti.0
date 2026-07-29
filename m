Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E64FC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 10:22:52 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8234.1785320566701956703
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 03:22:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cHZQGcm0;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=lTZU9H90;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7gjsJ1823397;
	Wed, 29 Jul 2026 05:22:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=V78JMaZaTrGn192DbI6LqlOUM8oFyecquY9Z2ZZwy
	Gc=; b=cHZQGcm0Gb1SbqXHL34Xy9BZYaZEaX8ivkDVmpsU1esDqndWSNdsiH7Nj
	iKl7IX0wwr1yPxluuNbIx9R1IAvAx+Ag/+hSutzW4DohEIouNgAoQyf3FL0JmUti
	8RWGVKYBIc0F0yWZ/tJ502QGfJMWhDKPVvesXVSniMyazZUNxP+Hmxn3AOQiueGd
	pZXrT/ws/5AbnJ5VZp/LBsqG95mClRvXrwAxOgQXeeeznhN0Ce10eij8AFPbsNgW
	cmduP6U1/VZ7+X06xIuHcsp1qYPSwtXxkbUp7B02jHGwb9OsmhjJRwzsLSAIRxLH
	cGtYTTRx0MFs2KeFT7veUKsX0vFXA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012019.outbound.protection.outlook.com [40.107.209.19])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fpvexq877-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 05:22:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMWzblRQJLYuIn3+CLpg3EXEv4SEIQG0sYt0ff+32EMzqyCgeq1NDynCTlh6+7XlfNjaZBakKFwY/f4QcAdUbVZDDCMELnhdzh3xBKGYx/kSwtdB5Sfj5qpgPEyd9JLUMn44vod2twzUSGXYOqCUivmoel2cviCRhdaUjevTLG6xENhuUbhotmjY8MA44ZfAEVzecH0fl24i/NDq4lFlDoVhFH6Mtq/Nh2yu66QKtD5vLWCuk2VI5BIKokVNt5v0N4/nSKpodeNQyEV4pVDNe/l2Iedp+9JY7tqsgB5YsMEx8zzAZ8gGMH5B5qav/uE2BLnCIpwbvlZNGURnWf2SgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V78JMaZaTrGn192DbI6LqlOUM8oFyecquY9Z2ZZwyGc=;
 b=bKLcgk5+wMvMuxPW4RauUwt6DKyACRjMiwlLTPzEJCwvOydgk4MQ9kopWCQZvm22GpeRIwOA13/ypIxkTOkzMVZS5ZH7bwMTjS2kl1cn8d3leud2hM24kcAlkzf3c0TwtH1gOjPx2lMOtynk9Ow0C0D3AEgYUcu05MyxK6VvxRf53QaESWOhVxG9Uf/ZNz20NMYONizeh40B6IW7iqS3MA0R0thjZet/FxYkfNsSewcVQCXqzH2K+vkuuqvtWiilmDzAySbv0iSCz1a1EUkk/zbq4KRUiPOv4EJU/sO1S2vshwVjHOmLW7bbpekW3tV5S5gAhMOK7RAIWO5cMEPdqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V78JMaZaTrGn192DbI6LqlOUM8oFyecquY9Z2ZZwyGc=;
 b=lTZU9H90NQn4eqUoi5DI7b4UWUC7zAbfBIqGf6VtVWrfMgrG1Mwqzy/yz0clVx2gJyPm6TwAB+/T2YZIu8RquuuaaWwj/chEOsXouD38UxQ454JDMeE89R+zlbcTHrchPLfiT2LuXFcYmvsMZTjBsynZpblxcJTfsDCq3/F8Jr8oyVBvOqwvb48mJaiNGESJUwNOFrSI7ttWG/2qBHxu/8cXPMOMBCLu49dVjivuXuTC877a78YzEaMUDD4kPlE6pZ7wy/o8fobtBNgUhfF+VwsXZDubtFlIKKCrX44Fs7zLivXeHLRRbL3BfxVb2wbr8wwk1A4ZjxQJ7B1fckMZ0g==
Received: from IA4P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:559::9)
 by DS4PPF80FDA9397.namprd10.prod.outlook.com (2603:10b6:f:fc00::d2f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 10:22:41 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:559:cafe::87) by IA4P221CA0006.outlook.office365.com
 (2603:10b6:208:559::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 10:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 10:22:40 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 05:22:39 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 29 Jul
 2026 05:22:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 29 Jul 2026 05:22:38 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66TAMcwp1096370;
	Wed, 29 Jul 2026 05:22:38 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id D6B389ACF4; Wed, 29 Jul 2026 05:22:38 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607290100
Date: Wed, 29 Jul 2026 05:22:38 -0500
Message-ID: <20260729102238.3272695-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260729101413.2461030-1-lcpdbld@list.ti.com>
References: <20260729101413.2461030-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|DS4PPF80FDA9397:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d7a517-6458-4e8e-9986-08deed5b5209
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	qoQoFUt2n9A5ptLWrMFliPWnwhgHjBzJhYpKPqVnTxMINlpc0CGAy+U0qJN+Y7tvGw4GFxEYuQiPJShUgZfGBe3GVvKKSF32xSplf/ES6X8W3j2Eyvrhv4rLYFdgWDXHoideMByzrf1MYSRJCPR/1ZXKUZTKNFdRrWbL3+HMEDSDE4xvR5KDAIOeIEoKmmq82VWKVTI5IS7OsDwyzjirvzd0/mx9ZR6xxTFbkoStPcTSPAGR35BAsyGBETEpVmFAHNeO609M7iHX5wlaIOM+akiUytj4AH8t6VREadR8xvqiXSEb7dyZmhGqYoDlRcoVj7NqX5He2m2e4Ia1GPKMBZbquLZkE5EYKNnA9yJcVF1XUaMf3S6/NIgCkXhDrH+kZzqMxbViFcqV9RFAp77UToxuh6kILAqbzX6sT2J1OMHFMf6m6do7zgCULEjaQWWtHMI57fS50FyyC4Sx87v5T/BzTHCJ9rCsywbkpgT4Uo69QYf4drFVuv8vZ3pfMKeSfNL6gzbh0COtrBQhq6QyFqGVmZHQE4ZLK1lrFfmX0MN+4NBADmJ+dx0jxFV6z/KwVZ4K9aabjmHhTNsy8p5LVuSytx1+NqAYjI0Yk5jnRK87hG7eNYD+cq+o+zSVqjE4DV+gKDVGOU9T28Zc7dsGUSlaI7qqQLClhVovyNdmB189Mv1HTjDldnq5501+O6Daci0GcLyGWxypfwz/Sv0v8Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	c9w3zniFcyddyA2EeWTmZlGqwpyg8a1aoA/qssAkNY/wIEuzTJBU8x/7QP60vp0n5B++aMffwg1gMQr4jb6qEfil28j+h9/8AWn264IWz8kLsYIScDEY57QPWwLmH9wRgruL4pVYUzZgHWjvovGrQdVcRfwqut0IXEdwJGlYjo7I+Nz4EYcl02Pe69D4Hgya5nRQR42/0G+hk7M6KxF5/W5Xag1nnsv9y5TeyHO36cmOemI15cSVP9x+RWLJ2DKlMhf1fF5PIY5O+ioJHWU75TMJ3MOIcS08qd6CKKOaR1NEt0VvabG3JOjebkLKV6G5u81t/YQten58tXZ89iOZZ/ZrGQvTItutaJc6/lzCu/Y6DCAshv+deDVcFARrXFM2cTGyDPG6ONMXnqWTsWob23DyFfLIY+KVVrw5rQBU8Ma6OpWhPulWdD75X0Nxjvtc
X-Exchange-RoutingPolicyChecked: 
	UWxvbayluA64dx0o9YFng/2Shy4zWrooAL7azUiAeezhhQM6KFmYDPV4H++9I8zDOVrPySkiTT3axu3FhJSprJC6PnWGGRkck30w9H7+YNZVGemaBcylS1jJV9Pwuh5DZNm+oYaSLHhEcFLLaaKBvNWH/rZ0JKx2PJ8MNw29XO6XfRFpOtnbGtaUXLMIqpU6ZetCubpVgpTVoRTTXzbEhcOc8b+aEFItsOAUc8fpzPLS8tNVQviQZJVu7cPCpGQzmmaRiMenLp9WyptwhG/imqlUhR/Zw69m5xo2mkWxdQlxe3PME3mYyvZTPM6aiI33jVJkPBhHHiIZJ/2BRCC3DQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 10:22:40.6232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d7a517-6458-4e8e-9986-08deed5b5209
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF80FDA9397
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NSBTYWx0ZWRfX/or/KHshb5hK
 iaQ98T+iQbEOJFmROQthFpKOyL8TorEoq8Q0BoEc7XE1/bo+h5vpqubFlims7O4efa/Ikxq1Dqn
 bWOEVDuz7X11nIJAmadYayLxpGsCs364k+PgG6ALUjtuV4xwjLrbhwMxcWgnll1mUjVdTLp1aae
 eEYs4GzPFV1uAa1IiGIddPcIcBob+cnuN3kINjHhTKj4aiIAV/e3NbmPJlMRzYcCSioho9pTpzO
 9YXUAWnI8EeaB3GgpffTkiV5sXSpE4oaqv+aA9wr5+u1THuf2G2doeF8BS/ciJQg1XKkdYXMJ0E
 +ldmMkIPFGOy3A4kQTLHqKmp6Uav7x97O3lupxmehk+6vbwm4RJybM3InJ+WR7p3xwOvuDxkKtg
 Qdgn4IZGMdu5O7fIQH3Z5SoSaiE/jVA8pFmlETYrd99dj4Hwlvi2l+dHyFSiG1dmQgu5qVOtpx3
 A7xXZSgrmco+J9IcsTw==
X-Proofpoint-ORIG-GUID: NIDNbCwTVB3km7JAlpgGXeTSojldn4yC
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NSBTYWx0ZWRfX/aTCX7DKPALN
 Z9VhT8m3A/ODMYYGJwXrkWp1FJMyAwanvXu4anmCCVXczDzV/R4uursWkPGuR9VGmwRixl5D1zW
 yBmBFBy5tqAprXyqcxlaN5PX46g5cAI=
X-Proofpoint-GUID: NIDNbCwTVB3km7JAlpgGXeTSojldn4yC
X-Authority-Analysis: v=2.4 cv=IYW3n2qa c=1 sm=1 tr=0 ts=6a69d474 cx=c_pps
 a=fNyNANDL+C7JeK/y+7sGAg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8 a=cN9th1_XAAAA:8 a=aZcaK79EyrAOFk_XV2oA:9
 a=uCSXFHLys93vLW5PjgO_:22 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290085
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Jul 2026 10:22:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20206

meta-ti / na / 20260729101413.2461030-1-lcpdbld

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
- Patch Series: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202607290100
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 29 Jul 2026 05:14:13 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7092e735f345b95faaa1a65ea9288217bfc665c5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
- Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7

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




