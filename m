Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3357.1795139729775165793
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Nov 2026 17:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CtuGgdex;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=MPORXF2J;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK0FNqe2265789;
	Thu, 19 Nov 2026 19:55:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=tGacP5O4sh+LKzfx7yuC1HKukNfjFrcHko7PIsDCb
	Kg=; b=CtuGgdexybr38mX9uzVQ4S+c9OprD0NsNIikZhHHMyCl57VoWfygxmPVR
	6V4LFXbSIUDOy1XHl/FJZwNkI0kD+jP3rpQrl2BqgJ5ztYn5g/cS6HLIs5OWZrce
	tip6j7WXSMHXn7zCEtydr9UeNJfaRarSVxQP2ZvtfxMQYtAnhlrFQpYifgKYpUxa
	5Vbzq2lHp79s5NnLUaZUtBvFjbYmdOg6E9gbIUyIWZyn5y9ERkPhy+tU1SShH49L
	qLf2UicNT6SthnCuhhCj4uPMQJbVmPtSV9B5AkU4cAGIAjbzPQORA8ydeVCKcchW
	o0qx6P4k9UmCn36WHuur4ZH19SaSg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4j281nhfsf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 19:55:27 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3ldwlg9gHS9fdinELqWz/yaEDBEId3ls227A/+WvcDy1+dkB7imAc6iR8UIuTQyt6lezed/XxYu7jWTcnhJyWzQHkUtKCWqjT/CZW8cmV9rhCem092HpLcquOvGmLxp1G69TzcLLEgP+sDRC4hhP8HjHIMxLGq9MvEdM7s00pcQkZrwHKirWJTeEw0UtO7gr1VREtqHfDlzxnZY1TwPKLhoz+MZuq/uWTdHO/RogEc6FS3poK+JyFKl+y4A1dhbtBQBcjGIm5Fn+CRCE0oV5CSVbHOxDWnRIOpVdlMgYzwZgPkHszUoOnDRBF2LRmztfOkVQHM6zWHA7mKn2MsXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGacP5O4sh+LKzfx7yuC1HKukNfjFrcHko7PIsDCbKg=;
 b=uTAHwxfa5n+zfRZ1m+J3X0qOh8yxGQjZyCqqhposUBbuFnXbLMiWadbq94D89c/wGL+/qGQKqSLBebOoCG5SouVPQ1AT5KoLWzOOBLunqRU9cCyiTuZRB3dIMYkuykXAX5VoZj+/Q05Ay0kbg24qjD9XTrxLj9F/1zK/ULgy2iZX/Q1ftgN/bXgNb+VXUcV6D6bjxD85MEADh2i4F2omFbHb7AXA/xG7FYAL3JWVTJxinPQqPJEy+bD0Kkwgq6aZYvJ4egfrCFGCLdpGX8oKxN3VzbKIUrUNJjYJdIp11uvu8CBB4FlkX1KPmvx8FxvDFwfr6gfuMN+94JEa9IrZ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGacP5O4sh+LKzfx7yuC1HKukNfjFrcHko7PIsDCbKg=;
 b=MPORXF2JGmiZY1vfp13WHV3jpjYMZ1M2XwUCN6fVLCgsMWy1Qx/FdNCcZkH0l8QsGZubvE6hVCM/LLqRxIC3ZOgnu6xG2EaNizl/V42GdNofqa3Hsjp98Q1g4s95W79sP+11F0X7IZKwKpdw7oLvXCoOuDVga1CMYARBkeW2ecn9EuMSIrAdYLbGs3vGH8mZk1ah4iY23bvhMUiwG6TmwwTPHGuVjTgtatZBn/Yl8xOkbbOwR9nQ2wRbZq3PQH+x7nqeZuezN1EMLC8ZV5o5cS5hHsgjMgwMFnjVSH0lPjo9vws7LZ4JOWVQdXoJ+uM8i/n6osZE4CEQt7wDcMm8fw==
Received: from BY3PR05CA0023.namprd05.prod.outlook.com (2603:10b6:a03:254::28)
 by DM3PPF612E8E8B0.namprd10.prod.outlook.com (2603:10b6:f:fc00::c2c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Fri, 20 Nov
 2026 01:55:24 +0000
Received: from CO1PEPF00018860.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::72) by BY3PR05CA0023.outlook.office365.com
 (2603:10b6:a03:254::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.0 via Frontend Transport; Fri, 20
 Nov 2026 01:55:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00018860.mail.protection.outlook.com (10.167.249.249) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 01:55:24 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 19:55:03 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 19 Nov
 2026 19:55:03 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 19 Nov 2026 19:55:03 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AK1t3hF1948060;
	Thu, 19 Nov 2026 19:55:03 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6B6469A9C2; Thu, 19 Nov 2026 19:55:02 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] k3r5.conf: Add k3r5 override for SPDX_DEPLOY_SBOM_NAME
Date: Thu, 19 Nov 2026 19:55:02 -0600
Message-ID: <20261120015502.1247983-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261120013922.1625745-1-reatmon@ti.com>
References: <20261120013922.1625745-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00018860:EE_|DM3PPF612E8E8B0:EE_
X-MS-Office365-Filtering-Correlation-Id: be491fe5-488d-4d25-be29-08df46a95792
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|18002099003|261009223027099003|3023799007|22082099003|261022105027099003|261026140227099003|261028144727099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 7rPEkkeV42Zq9Eqg5GNT6tGn3eJww/Y5v+/+PsIoGKdnClQnGYMtCrO12byU1O7sCwGF9SZyLvBEvjZKvNmsHQn7bNN7BYlfLayrw46brBIZeK7KQCb/O2vNM5NTwePe/iHLRRWvfsCuooULzRSwUKMd92CyLYFEk4Mp+IdK/HXOJCBQkiG4mH1FNwoKA3iErG4JncjuQx2gfeQ57I5lfS2X9h0d9/pKamFnWzcO6p96WtOmDNi/9NWJX42cJhxkFD7VlCkVltDZh3m45iG7wrkhUbiSQ2/1YgQrqecjAR/kRZU+YQIO5GNw3IxXfoPTBclDMow7lFD/Pr7URhAaq8It7fIGdAYXZCr0PI57Tf3USiYD5aJXUuMTHG+rSlssaU2d5s/NwbWmyBkCNrXPWWiAaGxHsWGlaec7BZRREeIx79PoiA4MpFOod8fvzw1yrHa11Z77D9qnMhPOGlQUxJPiUjwLXDhUWyhDfjEtwDkeeVodx/RdsGjkdZD2kJLfjQPnctDkDmXcKRRFbuuDMhHxzetgk+NpCV1d76jKPzX6E5Ux65KrvF5OmK0vm29ooKaZkqOdw76gcbr7voBSkWQmSCv0YvpSfxpY8Lcs5N+aH7iholKKxNxJc/L5IyOx5dvl4DAKU/67NstSF9wj7PIKkG0+unjpR+HJVl8b1YpNlWrPTjoyz+8m4OgIzW0fI6GuzmPdMMe5LkWcZ6Yf6w==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(18002099003)(261009223027099003)(3023799007)(22082099003)(261022105027099003)(261026140227099003)(261028144727099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6PHI7UVCv2I0cQZQM1VXTMrQcOWl99baFGYlEwgEJNJGgUZO0H1bNNq/DD3Z0IbKjWCoDuizmEb2w+SJEFK5+7FTSN7S5pRbAk39medUQcFHmKhDPpBihTR4h6s91d89kHU3lrnoHQFcKP95PPiMdrnn2YILQXh6f7mI6EGO+UnwXweKSNiK1I9NYyuUoLxNbBtjJbhFkqjgBeJIzkPAqmDHo8fgnteytyyLO19kT/l2x0Q7ed4hcQTnyUQaAm5jFPtfq+8dxhYyL8lNJsQpUJ0vtI4SofG4pa4/LhsI/UcCdocsSTAHXQ9Tx8rkf7mex9/xIwx2B2qcgz0D8+zVYYjV0hySzeq6zQqAAhwlTzqedL9did9ue73IlCZQKrc+7nwkbnqrCgL4DxJC/KVfePA4KlCpjAwrTozXx/s/Bn+mEb4ut+MAAnV6qvXoIWXT
X-Exchange-RoutingPolicyChecked: klO0mFswiAanTBdpMmlP3ZGyx53Yum9rAQ0YsgqIIysxPFRNE8J7SA2bHoQBW1hM7yR/ZjppFgSKJ3+TW9FmnXYBJsqRrqAlhNrAh33p/9iK6i+4jqord7P8A8KSMIAku4W/ruOjPEi46+XaskLxrX1iW8VSG6kPy0FGDCHqW6j08cOA0m0X/EJAzFqqe6xrgqDx+iAFJmO/YY8LyShRgtsHE20UoX1I4chSTCp3iurbPaxPifIPsAIyiFFRzpDBlWHwqygyqCmE1kS50AgRB8kbnnNO+AtKIceI2BbeUbUurJs03P/I5Z3DqQ7XZ2XiLHXEQeBidHpcsQhamSdiSw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 01:55:24.1273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be491fe5-488d-4d25-be29-08df46a95792
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00018860.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF612E8E8B0
X-Authority-Analysis: v=2.4 cv=aIZlOr9m c=1 sm=1 tr=0 ts=6affa88f cx=c_pps
 a=nBoeifw3k4y6eW1CqgP3Vw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=jUlkGxq2KewpJKcvX9AA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAwNyBTYWx0ZWRfX5U26mEuSZaVH
 bvfDU00aTmOMoj3UHLYf2UQuDGoqJESBznpVZhLoj83DAbR889dBZV14rLtvnlwxeLQKKPDSavt
 iUMK4XuYEZFroWN54gLvXNp2DHkRWVI=
X-Proofpoint-ORIG-GUID: eObtInx-SJ3QfskxLU_mAFfuAheRvEqc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAwNyBTYWx0ZWRfX8zEAvJrRY2T8
 4ezb1nh3zPpTC0CUrk2Eh7m0IW95W4Vd+5AN7L/FuVNexALIMCe6qc0uaTxyML8+Idw3OYiVIOX
 QAKwnYKeUNg/ECGtHwtUvjCtVq75GLSec8hRinbGbNwAOpho2pDfs3cFqZCRGr8TKWG94nfrpvt
 ragtCcIrJlnAd826f8ZfDJDTtRnbb6emAENPLLsBmUkAy1bsMRJirVbFhEN2a3kR3Hrk3fAg4bL
 jljyrGOAVZQ+G761FuhSjy6v1RdUjFDRtRuThkqukubDbLgTBC0aXvxGGkuGDMrRLFIkjXlQu7c
 khGhArzq/hwF3AX8iRPmK6+0wChOdS67njCBdavJ+ALiMuLCMCzDuqethkTNPj+/C9cKysLLfo0
 j3S/vW4lZqSdXqW+dOz5r8gomYlkmJuk8Y83i8UNJA0X1MsKS9gG49zR17iKoxNVKFU+zOu/w5g
 oX+wj27EdOZbP5Aff8A==
X-Proofpoint-GUID: eObtInx-SJ3QfskxLU_mAFfuAheRvEqc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_01,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200007
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 20 Nov 2026 01:55:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20563
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261120013922.1625745-1-reatmon

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
- Patch Series: [meta-ti][master][PATCH] k3r5.conf: Add k3r5 override for SPDX_DEPLOY_SBOM_NAME
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Thu, 19 Nov 2026 19:39:22 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6f9fccbf84655dfe6ce8d37b642e12298af7ccf1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Fix uboot_config for am62lxx
- Commit SHA: 0965779c6ba73772a0781b081e02d4e6e02f97c9

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



