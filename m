Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD40EC9830E
	for <webhook@archiver.kernel.org>; Thu, 24 Sep 2026 14:07:55 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8771.1790258871655430371
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 24 Sep 2026 07:07:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=p0vIDYFV;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=UksUD+jE;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68OC62oI3678220;
	Thu, 24 Sep 2026 09:07:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=QGOss0nhu7mgarPqCrESv6AZHCM4up+GgE50UCnMH
	jQ=; b=p0vIDYFVbgCLNjTVuFOJsi6hd2qn3BgX5rdCn26emkofYekPvmA5Z+kBB
	iPakl2ieJY9C+RcmfFTSos1eA3KrWsEO7oOAaMfagd947aV+bZFdifGuWIdXWYTB
	Iw9joB2GARh80CFcp3kglz51ua0/C2L6lpSfKyD/j0I6lymfIQ7mmUAd2owL9Hml
	tOXUIohE9De4NBXU1YPXY/02yonjhvoHTQVdNyTi8rk24g+99jOAd/zpEdkvvguv
	QRO0ptTtYIlypT3WgvNy39wXATHNsg/762e+mq/RGDuolhaLUbq+z8MUy/d79bBg
	fd0fjQkevckXf9MQ+nX14jyu0hiww==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gw13r9k3q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 24 Sep 2026 09:07:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=COwV5o45QK6e/SKUkq+/jr8PnB/Bxd6axscg0/1mHbQD9F0u0f0wGXZq0iDTR2SLOrMzcWYZdlg3MGad6XURHMQEyRYVp1G0o34Uwr3tCupHGgKmfpqsow5icDVU9xreJ+B2UFSnI+brDrbRE5R5Xrid6PDt6CMWWDQ/iYl2Ct9WEtF7m/9AXMafsBitdfX6TWC9DfruVnyr5VrIbm2yih/05RgOLwvdBmIXXTJpDI/u9P3QztYEYDRCPykn+hS8xZMLU5efNMbDETPcXyvSmpOz8+pMbGF6ITissO8soZFdwpB3Wy1TFY+sT4i7/G27WHMYiUbr6yupjQuw2Wliwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGOss0nhu7mgarPqCrESv6AZHCM4up+GgE50UCnMHjQ=;
 b=Tzu2b4MWL5srj6h9P/8revVRtRu9Wt1C6a9OqfNvrg3sIblgwbImx4TjwYeXz6oafcuscEJYv+qIeaQkBYSkaoTCKTtD01sXlMAd0PSNwhozS8LipHjsFfjUPVLBX3KzfIb2WuHmj+v54/c2LhkOU2ZteBXNw6pDLJHYOqEqtT80vexKgZG1Ttm/BRi5dKLgEwss9p28MzM2UMIq+9fjjd90+iI37ozkVI5KAukMjyMMi+Xmol2f048zbVaInV1lwgOBH7KLygw098br1UtQFEaJirRpUibC0z0ybNk6QFM4i6T+knjmUsq6zmM8ZZ6aMQJTPt5lODqfdTC7Q8cX9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGOss0nhu7mgarPqCrESv6AZHCM4up+GgE50UCnMHjQ=;
 b=UksUD+jEV7jJibtYdIuRSZY2EnNnjtTulM6iJCbK1YvLwLh+zmV+0j/kH/yS+qC/XIpKsAFWgTU4BKM0fxBViB3+faxT7LlSeYWZQTKXFtenMhsSWPctSjy6CmD97m6COt/qo72lZC7bh8uSgTxoBFhIofPFLpnlFA8icYBzeso7LLyttvDVG8UMs7tBBhtbchZWMFNrUlM0joKv/2DhWczaTnlDR3ct+NuaScioRU7UlEsaTE5COPhaAocDmPk78/L9JGH4lZYLU9BWwd64bBMisvMtR411XrHOEzPSa60Q/8+io7VnqqnMXY6Cv+wFBtQCbvTdtzdqPBB+2I8TfQ==
Received: from DS7P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25b::6) by
 CH2PR10MB4166.namprd10.prod.outlook.com (2603:10b6:610:78::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.7; Thu, 24 Sep 2026 14:07:44 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:8:25b:cafe::35) by DS7P221CA0008.outlook.office365.com
 (2603:10b6:8:25b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Thu,
 24 Sep 2026 14:07:44 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 24 Sep 2026 14:07:42 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 09:06:35 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 24 Sep
 2026 09:06:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 24 Sep 2026 09:06:35 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68OE6ZAQ932528;
	Thu, 24 Sep 2026 09:06:35 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C5F039ACF4; Thu, 24 Sep 2026 09:06:34 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
Date: Thu, 24 Sep 2026 09:06:34 -0500
Message-ID: <20260924140634.1492479-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260924134457.1405695-1-denis@denix.org>
References: <20260924134457.1405695-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CH2PR10MB4166:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ef1b6a2-b075-4141-6cf9-08df1a453397
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|22082099003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	3kWa5oKRNFwmjnuGsr6L+PfSdVccW9/XG2GN2kRfqxSTO3rf214IqP0JlorIpjExQdByTGGDNM9QxEttiWyDXqQdBwT3/BhkYe6Xla7aRKUEnpybzbgxJVbXrMj8sTms/sHx2ljYQiWQ9wLmgl2hzD2hwUzzMQd0mq9ydCMnLD2J5bxzt2rTCAP+//AWyZHKGGtAOPZRhz7ZpfpNRBTHyR/TFh4Tr7jIKcooClPwKObTcq5VL9GgvwEEPpK7obBniT7cqRAGVQIB/gPRXjBqE7VTlHE/6SYh6mn155CV6r1BUcTeldov367x01r7mA3hovEznGUKtAyx+1F6ZJlRC5Dw2XnFQT8GflJVV9dL+J1CtWHpHve8EkkezGr2Y36hSKfZEOzlg6S/tp4VA3DMwpBKROHCHm749hseXtCnfbEf+bPEOpXfX+L9/qAZ/NT0KHyDOLOgnuq281+vmrE3MpsP3JgkscqH+i5Ngoz8lfzlXGJPTsr6LsP9pIgJILcGI/pdS6ICe5QY5Ehor2UQn+GmbluSoppav8fJVZo7/4HUSBStL0Aq+e5QVi/W5k/IMXiYvfPEifFba1Qgkel5loFUs7sA9RzbUyILsqK2KNnbipWU6WHhoqy4etQJS/gUFR8V2uYOOn/OLlI2LVrpmQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ll3GCyIHiYYvMlTmNTFoHvHFW4FYwx3KAkeEvVrrp/sjWS7CeNaTCVaDtt/bgl9CzYQcaSCalatuc4lFcQWfE8oJwLeGqo+7LioSctjn+Gn4gnJIQ7fSsyfsOSEY73weYJTpb4MZ4MShU5UBVZqAUWiqq08LcAt0afr8dNKFrbkGj6FmtbvGmghaI4BRDqM4KxALiUh/i99OuxNDJx+6mz9+jhtQrtFZ3b3x8thVWKHX5ayJuhiKzCxNmbIE5aAB7FWfJ5C2d3qDPjHEzG4NKk08SOlz4CblNVQbVzEizJ0e/LdUgQ8M9S0tbaMZa4hDZAnxqpJlhB3ZwTXXWzYGM+FYRft7HCRi5ww4qZ+WxIdF5/kdfHk6wiKqFiMRBEkdBaeJYoo9eLTrOF627Ry3n0ZokNcskUyL6Zd+HmGmHo5Ef91WmkrW6oPI8Nu2fXpK
X-Exchange-RoutingPolicyChecked: 
	F/2QjfjhNrPRzuk3ncRmOoMLpCybFipTmEMbb5Ci7NH1KOfolqIWgzyFy77XPGrCly6IM53pXaqK6OjEcOA4C9yjPbaP8mFZJOVOPiASDhClU+cJGmsEw2PtAZXg6E2qNys/g7ODwNIPUPbvobp/ru8rib3wy+XkqJhvZX05hMsoFJU0CptKjJegbrD++yjNCPDi33T6W1wKGdnycQCQEj/VL8sTzVBBWCKu9LsYXf/9wnUQKGEAQD4WXJMc7ZiMZFWoSf3pfv0+Fpl90s36s4fa+RxjPAJpoxeg8ywWR7+t7z0EfAb+6xfoO0lxzjSSq2KC3jwECEpr5UvcGZseyA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2026 14:07:42.9527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ef1b6a2-b075-4141-6cf9-08df1a453397
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4166
X-Proofpoint-ORIG-GUID: nfh559CjCk01uVBl6v3hNZ8bM7p24gZu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1OCBTYWx0ZWRfX55bATWgzJ6sG
 oK61qArEl0DChzC2ynVxmaP6E71mIKV8iKps6e0+RbvYzNAKzpzHXVo43BktC6gSQzvQ43sBHiK
 Lwv5e+XSXp4R7YypeYAIPb3wJDBEpwxmBlzSPHWKNQg9ae7zl28a/XhaX3UY5NHi1YqrLS//k71
 UYzyNweQIV2Vl9h75rwRwsW+gjQyAOLq5x8RUEWoWDIrZIkaH8BRY3pFEiYNTy1tuGqbxVUXiEQ
 Ej9TZdDxSCSJPsvN9SWG46cUUq9GpEEs1xfPeSdfdJFeO1T40ESYbNizRNf8Mm5EYCec4LkQydY
 X9Lw7PDxVgjqSAz0OvsJ/NjlWbgp/o1Q18Veyj+rsXg+s1nVEluVZNN+R4YGCPyQ+bfPDi0W1bQ
 ue1Ch56C7T9bUnyTz3jTepuAxk4gnFw0hw0lP24zi5blYp5dbaCb1hI2R1JN8pfQaKQVeKq8sdr
 c6DOTi7pqwB9Ap7DuGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1OCBTYWx0ZWRfX/8Iw0FxPOaIi
 7mXgFuQn1rBpNLl9ZrnrQdBy6Q0dVXgzeIE+fXeSLKvpe8wfd3nXDabhpm0L3chRjafp6gbFSvz
 anOZOIcOU+c+TDPkTyYaPG3fd5iXURU=
X-Authority-Analysis: v=2.4 cv=OICyTiaB c=1 sm=1 tr=0 ts=6ab52eb3 cx=c_pps
 a=CjRpyDoPu1ZhyeacGh9KdQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=WijOw4v5pOzzlz9VkwIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: nfh559CjCk01uVBl6v3hNZ8bM7p24gZu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240058
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 24 Sep 2026 14:07:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20416

meta-ti / na / 20260924134457.1405695-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
    WARN: Commit message does not include file/recipe name: meta*/layer.con: update layer compatibility for blacksail. (COMMIT-MESSAGE-2)
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
- Patch Series: [master][PATCH] meta*/layer.con: update layer compatibility for blacksail
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Thu, 24 Sep 2026 09:44:57 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9efe59332c21a0d96d79f9c07ad393871eb18f1f

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Paresh Bhagat <p-bhagat@ti.com>
- Commit Subject: ti-rtos-fw: Set EdgeAI DSP firmware as default for am62dxx
- Commit SHA: 345798758183d19076a1afb7ae71be570d06bece

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




