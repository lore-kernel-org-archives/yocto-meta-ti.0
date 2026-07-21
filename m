Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86BFC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 19:21:01 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31617.1784661653687944415
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 12:20:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CezlX4lV;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=YL19T8q2;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66LH5vK61424404;
	Tue, 21 Jul 2026 14:20:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=S17ehfcTkJ+h5m9FfH655RnJLOokBiZMRsjkl1Led
	uE=; b=CezlX4lVGarRSlts2xuxrQ8naLgu9JPQh9MsMJtXI6wDeAUvASeSmaOOz
	GMyBh47VvrN5SrarLwWHmerpnmg6/ZcZBZXAoDxElSb5w2DV2Ihgx8Lu4qrWgzKo
	mIpOlzfYqPIWcv3FWl+G26+5nip1VIV0owX5thgX2LL7bYEGZrCRJCs+tVyKDfGD
	8HlzmvuxPYAOm0kSois+irLh6Xzg+BvRI7WUPiCa4133wtkFoHHPkKVtWSNYrB4M
	JpUFuBIwv8B10FHMlxvP2Z0XefGfgEK+1lueu+kxg+U9E84o1S4OLSrIeD7ey80Q
	vv0khqn/rn6hckASK2nZ/TPdw884g==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011050.outbound.protection.outlook.com [52.101.62.50])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fj077natr-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 14:20:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGejZ+gAOG2NMFIRrgRebKuq3GAsv22H69Qzoy7bzmjGSedSDWROM6LAfzK5i5O6O6RQekWlkECAITVhNNwMOByNSI7pvOl422717DQbe4AUO5vRC4vf4bXM0g+gxGESLwOHMEHsHEBayEBxpwtsLxi6oEpVZxrQ5RFh17xcCX3xBdRBOmxHyzhNZMbnHDNKpQ1e2t5VpkjE+aG90+RDpvPNyCMtcn4/4SEt8NUcdQJbZRhW3JAEf7W2pSWQh9DNle5ltXLBpY7YnUmU7CKfcyOjbUN0ROQPM0eh6OObSEzFdBs0zCw86/asLRW1c4zTmFELC8fGdhzfGeXJCDg7tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S17ehfcTkJ+h5m9FfH655RnJLOokBiZMRsjkl1LeduE=;
 b=ekN526J0PqZzFxWmVpzT2hbbnoAWfr2vY5FxL9tcq0m6pTwEG7M4dmyT5H2vwU+zDiNgg7idaoeWNgjbjjAFzDOtl4eZ2MpWt+SKT8W+78dvyuR1oDlvGLduJGrxWIcjmu2VHHfSsWTsowYHNHenBDUJgNZclb3SsYiKhwzWPfaTJbld4cCoAmd7E70gdpaHzY6tZpvBBjiMT7kea6ItHTrz9h6qrfRWP5sL+p6qNP7FgkgUVlhMbGmrngfmOiURGEb7csVY2MJWz/G3hQ/9j6teiaST8oiSc+YM8rAnPFetYFJ52Z7Xjv5HQ+NjVrtX6V+ZPZqS/O6ird4G/rVbHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S17ehfcTkJ+h5m9FfH655RnJLOokBiZMRsjkl1LeduE=;
 b=YL19T8q2Ccm6gjHtAoV5P/xZ5R7ZipazaNCT/wEgSnhy/gLwPbV4D+/s09/QWdLUPJRIlNve+Pz39A4Q189ljRH12V057i+XBIDLP7bIlDz+04ft0F9mh+bA4ACC5toNJ5pIRNu/aYxngzJ1R+xis94ccx7p20VUn4KNxJYdK0U9qfGfs0+7U0xPKxK9PTi1yXMsupc6U+FIX+e0OtS/ytCPXEvQQvJoHS4QGAt0c1WZ7ZmzcAQHvfZ0xSqRWWxW1snNtF62zvMaKFdohVk+tlranfbzLdusUJFPx2dTnHmxqBa+IUO911ejegKV5dMXO7EZVSgD6NoGFr6RY2l9+A==
Received: from SN7PR04CA0014.namprd04.prod.outlook.com (2603:10b6:806:f2::19)
 by SA2PR10MB4635.namprd10.prod.outlook.com (2603:10b6:806:fb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 19:20:47 +0000
Received: from SA2PEPF00003F64.namprd04.prod.outlook.com
 (2603:10b6:806:f2:cafe::79) by SN7PR04CA0014.outlook.office365.com
 (2603:10b6:806:f2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 19:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SA2PEPF00003F64.mail.protection.outlook.com (10.167.248.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 19:20:46 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 14:20:24 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 14:20:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 14:20:24 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LJKN1H2052908;
	Tue, 21 Jul 2026 14:20:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id E66719ACF4; Tue, 21 Jul 2026 14:20:23 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] recipes: Convert to SPDX license strings
Date: Tue, 21 Jul 2026 14:20:23 -0500
Message-ID: <20260721192023.3782020-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721185831.3520170-1-reatmon@ti.com>
References: <20260721185831.3520170-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F64:EE_|SA2PR10MB4635:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b351f4-1e94-4797-1d75-08dee75d2a53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|56012099006|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	glTdo81JiF6zei6KbIzDBWP+tBXfGkCoWDubxWpSdY9/zrkWYrOzFTs11eyr/7XlIh5zz8BG0cVptv2ILcFpbsbKdzQIsFrUemhEAoMoGfhTEIRr1KI/6d4cmz4fDRWNZLuziKSMYPxfUP/C+iFrBgpJcDmQXsNri3VtLCVk5KgJkFiQHS9CKNtmKOUr64CkGzws2J5KevJZufSA9TL/1uAuY1p5TWh5Scl8sk5Nqd5MJh9flnMSG7Of+35AGKxlhUxB/HFwG2pqay/EmwbWSTAAoF1C/H5IAeWM5Xj4AqYse8OrY+CkjQJ3jk7QN5I9BhaNSv69gpgyx9Gr9SyDkhUI7suAvZwNOsGsCv4971kU4jmmQoot/IyyO75Xncn9/+FKLr/esadZ9g//ySq1OnAom0Y6n/1zd+eVuefTQrK7nh2XYvIvy6BZyAYCEY18OE8qiYmIMcjmOs5lnhOsUkBU0/DBr7Clo+udr1coMFvqOZl9Ia1Zx0qAfcZ4n9uoEbRwi5VFpVXdHtPbu3KUDCYdDYwoXcDnend7ADd0fHyceTIf5DutCX/1fsHUrU3yfIXMS2R8OOv4oLiYLK+XcToCyR3vphJaEbOp0YG6/8RzE4u2ATF6I4C6QOs7WPAe7C02CBrH0HKzB6h+7xS+qHlRdemGXaMqnjufaHFSgDy6V9Z27yrxVpheoev3k64w4Hs1MUA9rdSNEy+zO8B0Cw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(56012099006)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qiNltv1GlAJIvxbfp+xX6ZfJkrMIY8mnGWWFSa5jfHRxTm+e17MDHUC8qtDukkjxKu55IWGWdDnJXSlcR72A8+os0lJsSYfmnSWiRemS0AnAnigenRn3kYi29QY8HL5grmUbAN3R3Jm/hH4sOD1Ks/wvjmmO7wTNkoqsd4nlj2BDT7dDAdglI5MCiszk4ilBp9Nf5kZZZlrluRAMkYJ9l/xAsJ672xHlDZen5nqPu4Toa5Ewe1PX4CbR6X3YUllWvImQsed+U7xMoXTYCWCEZn2OCfD/zNFxTKRvC1/QhljbLqvSkrrRv40NAfmEJgWfKE+UJoThaQayzpB/MMLMixDlB7V5LUUYLJ0n0L5LwQd8hhrybUvwvJSbdHz285tvf5bwbTQplgdmVAp9/dH3owNK1VihBvZEc195HRkw+yoeHgPpZ6DIfs0m7mhuBOdh
X-Exchange-RoutingPolicyChecked: 
	jNlpOXrjZP/koqU8KJt3Xb8kkdi0h5DJnYN4WR0XOLQnBXdhWK988uGX3u5+ndtGj8wtIXv2NNuCjaer/miNva8FYHXTflWWLfy2sw8GQNOauS/jW5qH952hvhFcV82qLLKecaRHtkE3zAbTem8YJLCg5Kar4DASsBSXIhTuYYZAma8IwAqI2ntvIkn6y2t3U38i3GDkKzjUV7Ph9nmrvURkESfmCWFMMEvYu2JvANFedjisekxARs/x8ghHqjdBJn6ZnCPzMm8RLkoPDRZyLQKSAR4Q+GSrUVLT18K5souspnEU01Uc7CJffB58dBTiKqkUKSicJaUzcLrUzARm1A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 19:20:46.0907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b351f4-1e94-4797-1d75-08dee75d2a53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF00003F64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4635
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIwMyBTYWx0ZWRfX4SGo3riz83li
 ob5YXf/had3O+TU7GctuRK1O4EHI13djhk13+4uqWbK3eI7VhS1/kWT4Di5/+l1PkT+ECu08F4g
 JSJOX+gKVbMBLPLtdITbHqOASQlgF8FcQZau9HLEAL+MrUPq3GE33redsE2dqHsAp1NlzcnI0zo
 f0LrRSBBzLXj90v1+2So32QdMxozjFB+FcTID6isKWgf6gdmBpyy6eCwi20m94QLcQItD2kPxMw
 vyy4ri0voK0RBqNMEG2DcjAPbJaKrEqtEeIeQZmia3nOAMznbd0q6THdZtqZ4pE5ppiAAV3tpwd
 r421Dg3QU3CC/iHgmzdmVS/INKYlfwfyqIi+rjhQByFinREUeFSfHFFqPqCRSerBRXvaZ/IHRwp
 KJIfO0rHDwyqjrYj2smHiryNFBDO1F0b9xakJH4KJlO0A+ZuO3wGYUB5bmgCmB8iOqlFeHzwhh4
 o6pYwaMjcbLbZk1lx1w==
X-Proofpoint-ORIG-GUID: 3J35EcOkSHQ5Wcj2EQuitvcXM-k-Wg8g
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIwMyBTYWx0ZWRfX/tTQ0cex5jA9
 fWfyjW9DNi9nPzsVWiSW+n+LvRLusZd9URRAHAPfTLEU7ZXJC96cQF051a7AtHI/ssZ99yb2YbA
 HrGcJX3c1ywZV9hsD8688c7oWm+yyqQ=
X-Authority-Analysis: v=2.4 cv=KabidwYD c=1 sm=1 tr=0 ts=6a5fc694 cx=c_pps
 a=Vx/W+/sNOQWsPBnrpFcqzw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=Oi4EmT1nGndpK41IzPIA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: 3J35EcOkSHQ5Wcj2EQuitvcXM-k-Wg8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210203
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 19:21:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20182

meta-ti / na / 20260721185831.3520170-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] recipes: Convert to SPDX license strings
    WARN: Commit message does not include file/recipe name: recipes: Convert to SPDX license strings. (COMMIT-MESSAGE-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] recipes: Convert to SPDX license strings
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 21 Jul 2026 13:58:31 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 620ae308fbb1aadf0d8c4f93660fbff4a29fbed5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202607202200
- Commit SHA: 31de93f3201eabdffcc7ed5ee7faafc00d067ba0

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




