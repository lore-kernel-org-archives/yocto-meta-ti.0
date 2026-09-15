Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D0DC88E7D
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 19:36:44 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5371.1789501002562436544
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Sep 2026 12:36:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Vd55q0lb;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=VHmSLHo6;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68FItvWp774926;
	Tue, 15 Sep 2026 14:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=iBb9DY+6tsCZCox/5ajeCKKT5moN3enqpk+dT0LPy
	LQ=; b=Vd55q0lbUV7Eqfm8epc4cppV6kVeVpjPk7P3HAxj7D+rohRNfny0hdUM7
	/liy2qEtR9vibiRv6bC/4aE6ArqLyKyijy+WLFbKKu/YP1C30D92i5IyxBQQdsmr
	gPttHRvuSTHmEMPvKqoHEQJkvedgIP1l5AYJaO5I1PfeIDNsaBOYUs+a0cxuXV5l
	czcLql8eoeO/Izxfpu5L+LgEoLw0vR0zdV9OYFiH5xZCPWXoX5zBkJRxY7uT2+pY
	po/oBo2YTYmfgqJs/H/aQCz9PjP7mb2EpJ4iJ56RqIQqQ7oo2VqTydYaWhLO/bcL
	at3EOrMSm7QPIgH3icWxjiZKZan6A==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gq58jkd0f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 14:36:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HqVbbqZDLxD6kBKkHOB20ZdxWWBoPMRUlDY2TWeS23yNkv0FIX44Uy3gc0t/vhZr+L/MitTGImR0ufY5s3pHt9R5MUXclFXpx52lIGELQxqchz63kEqh9uRQBu15A2C00c9/nxnLk5IkHu6FoCNSvUdXhIg5UmSobUd3IGSU7EHiHBvncr1ALKCjM3OZWK/0+tj1TW+GoVO+ZnWWPlZQXUxFpd0MTs1fQzaGG4T924t/heFE3KjNoMWYDDcmfV3bkW7DExdO7JmhslzaxZYx1A6a6zfmCPexkZT8IyyR3UD/x7epLugZ0R1K1RK2pxkHOb+fwX1pbuQJ2Pe7eKCB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBb9DY+6tsCZCox/5ajeCKKT5moN3enqpk+dT0LPyLQ=;
 b=VNw/QzY1ZCoqqXJIEogB6IdJq5REm591xauQWMQI3lkhpS07VRO2pEnR0Ss05CRn2C0Sqij+B5gLg9yiK3pUnRPui1Iwp+dB+/6ao8qXnc3iJqGkK9EuJApjDEP4E2fDIv/egd+3PQq1eqh0E7JdgUoMsfbwPxb6075BA9e/Cy8V5i8laPnipmgmezdXQR+2mwLLBM2Qfznt/IHaARzdqJwgr7+tQmIRtrd6p6l8AQ2ssegRddI9PhdlbmRVs8tXaBzzWCvdo+vUdQjfzP8Hp0CnrlV40HTBfH2n6xRvC6J8M6eOLxvrJSpUrWbNece3VWeOB08vQfg4JXrtPWo/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iBb9DY+6tsCZCox/5ajeCKKT5moN3enqpk+dT0LPyLQ=;
 b=VHmSLHo69F/97LWf66mIq0iAr7oi4LWg8hnzHaYxLLHBGMzA2vcgEfdEtTp2TV/GrE7BoraMvvzfZxMcostQemBcN9M0FYaP8wxkcp+lRM+tcwo1MCSE2H8LE4ZTXSs8XlyYv+XhJZgahSkolz805wUvEs33DjrRktoit7BiCOzjCUi93SbC1+C2e3ybW8iCN6Dsvp/qLHCVnOFnOVGLvgCrFCKnF9lKd2cIYkvzjEGR31H2gyHmn+szd3JKscH0IHYeNvNX4QLxkMTQwU3juJMkh56kW+VVhwzrHe9CHcxEOe4t+kUx6bWf0D1F58zwa3nPwNldIwBiHcmDc7ZS0A==
Received: from CH0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:610:75::27)
 by DS7PR10MB5136.namprd10.prod.outlook.com (2603:10b6:5:38d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 19:36:34 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::6c) by CH0PR04CA0112.outlook.office365.com
 (2603:10b6:610:75::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 19:36:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 19:36:34 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:35:56 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 14:35:56 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 14:35:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FJZuDm2109524;
	Tue, 15 Sep 2026 14:35:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 6E81A9A9C3; Tue, 15 Sep 2026 14:35:55 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH v2 1/3] Revert "u-boot-ti-staging: Fixes for OpenSSL 4.0"
Date: Tue, 15 Sep 2026 14:35:55 -0500
Message-ID: <20260915193555.2511830-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260915193311.2369532-1-reatmon@ti.com>
References: <20260915193311.2369532-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DS7PR10MB5136:EE_
X-MS-Office365-Filtering-Correlation-Id: ed3357dc-3721-4dd3-6fde-08df1360a684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|56012099006|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	z4Rsl1VPKZeeRWgFzROIi3TvCfXGlspLf21QOV1DJ9XlySXWIPQh9T99OYGNgnFGeT3nZFSjHEQsaCdH4Onl+WtJtNOO+n9IiZjMdFG9ATFk6rf9kMO8eYiq5HtVznbz1TQHOYtIjk1D0MEdnb7HeFp6fUGTrfEoqiUXddjpD4AN+mpgC3PiGxKFHZmxhzGulHTn6zQsBMbE9cz+vtl9t+Z24CD9NrX7GHRhEp5c49YEqdmpAWM+eSyrz5wXVCb1SAoIw5OBs5qokF3yat4UxGnGP9V+Fu710VLfXOlBK9bo4M6xHqEeabYdASobQ/h8sG0Nj6VYoqJe63YERQ8Z8n8/VfKZJ0MPyQ6vRlvh8UvABSut1AB39HZAoxelMukqWqw4+E34imNdjTS88tH5Y8cAoHjbrVuKS4fINmVQQAZSrIaxRe43Qb3I+Y3ENRHwSrR3f8Tm7txJ4Tum3iVLM1UqcqsOyulKS97SQyG50lzXan8kc4wOdZ3VKNncPMAeqVBy/DTXunqJb+ndAg8NOwIoMnW8ItNO88hYCDLpH+cxhwSbwT3Ein/W1Z9ertZ/LbxLLHFO44GNOxqZRNYOcWtip8Op69niIo7+CeiZZ68HbCTz2aj5DuhmClbfFKk/+dpZRdDki1fEf9RMpIhc1Q==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(56012099006)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JDblhFRppPORIV2zZ+CXQGgPHl/SnOHraFu0NYPVUC4ExTDdcug9LI76RsgJf/fSQiGPuDLi4kjKyMIuOy6ykJOBXkgX3OEbN33OVYxBYDUzUHPWurRpXD02n6Sxpj2qXeYJzT17+5nlLao87HGcTJfyVkXr00zbf3KanPJbR6FIcTaGnAUKeyhel++AT2/cXvQcXXnK/l/x3z1YoyOFzhRgbe4QH2Ls4szcdy85Yb0GZvfxZcVHydgmQOw0OkEYQBrDjA+5+N8XkbcqUOL1RdemQmuosL/0d68fEKEnZuMESizikJojdFPYGagsRetUvtKqL0LPolyuVuER7vfaAAvXspNnTPjRMROzAElHQpdP+A/8YGHItg+79Fp++RhZHDR3KM5CsHDIV8qt2dZOXNHUyQyKbTnBQkYkTIsaeyMN/WI7fkU7QTR+ZHQ42hJw
X-Exchange-RoutingPolicyChecked: 
	kOifDwq6ticqC3ZYmpaDfs4e0uwnXxeOArD9gjqbcFAtujOsI/Ca0Bzf1ljiv8h72xI0VJtDvjyF5WAJ01iBnWJWsn4pyPpPNbe+9GBDIhkmgzJLO0CrxyxGyxXiB99XefUJa4abrqoE7VLpYPkwXrUSSx/IZ0GZzdqvrOsgoJrqlEU2ViB3t4mQp6GGDkuPsWucCMHothYjmjpHbLY2gYecBxD9gFoKlEv48dZKQILw6wmMH5Af/6ILiadFrZLNEfCeENFNszUd70wUUW+Mpu1QKoCtetf7YHmrpx6Rlw/7oLp4yPwP6UUEhoJb3j72V7WADER41wSGd067rHeK6Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 19:36:34.0435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed3357dc-3721-4dd3-6fde-08df1360a684
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5136
X-Authority-Analysis: v=2.4 cv=FMaOVOos c=1 sm=1 tr=0 ts=6aa99e49 cx=c_pps
 a=KM6hcDErBpdSH7DPVcpu/A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=ptNznvi-AAAA:8 a=hS9j_YDb9aaG9o7Ki0MA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=__MQohX_fo54y4GeBRKl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4NiBTYWx0ZWRfXzVLfQZ4aLeAc
 3zz4p2ER4xwGnMfr5ehM7onxsvQs8EmwVFKQgyC5bwn1hBsgVkdzCy+JgOv4EDvDC6cS9z0zyb7
 c0vcEUmoZczN/ZChyr8fmTPSMe/1XkOQor19+pYkt0T6Ub8oPcPRGZdkBGz2S/1H2BAp+WCrmpJ
 i0bMsI2/adN2st5Hj+Z8jjE470DCvYfmoAP7DMug8mYCSlQYRZaBdeoan8YafMX0gowxwolX8jW
 EeRWiXV86IFMXOxiVHa4GHXRQoXSLrtittlLo+1eW1GK4jB4ID//GM24C+h2WGH4gLb8pvKuWv1
 JsYFFgnbooiPYM+dv6vWQPO7qEltxSPtutuEE3Lyv/rEIMBNP/EjIU+spUlIQ8idbbuVYSTWFBo
 eybzYjqhI+7vKKkeEHQU+RTZNvourFr46ANp/P7qtUF8r/uIdQoYnXIWqFGfzyCZjgOJjtd9gF9
 1j7iUcouNxoYKwp1QJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4NiBTYWx0ZWRfX2LXkexm5nP+H
 KzhHyYIc7iMG/IMIE/xWWGE2oH/1A2RsujcCuwu6ZMDOpo+qP8eTiUOIeFUEpaJhLSCsIvowzSK
 avuQQeyv+eXyhdSvlTMuLiNz+a56vUc=
X-Proofpoint-ORIG-GUID: GhYgBo9Tz6NcuhiiovW-KnbxpteiAV_0
X-Proofpoint-GUID: GhYgBo9Tz6NcuhiiovW-KnbxpteiAV_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150286
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 19:36:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20383

meta-ti / na / 20260915193311.2369532-1-reatmon

PRC Results: FAIL

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
- Patch Series: [meta-ti][master][PATCH v2 1/3] Revert "u-boot-ti-staging: Fixes for OpenSSL 4.0"
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Ryan Eatmon <reatmon@ti.com>
-From: Eddie Kovsky <ewk@edkovsky.org>
- Date: Date: Tue, 15 Sep 2026 14:33:09 -0500
-Date: Wed, 9 Sep 2026 10:04:50 -0500
-    Date:   Fri Sep 20 19:52:48 2024 +0300
-Date: Wed, 9 Sep 2026 10:04:50 -0500
-    Date:   Fri Sep 20 19:52:48 2024 +0300
-Date: Mon, 23 Feb 2026 09:43:22 -0700
-    Date:   Fri Sep 20 19:52:48 2024 +0300
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: ba762bb54640d2410c7f1b1793cb1de87f56a082

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609142200
- Commit SHA: 7034712771a19a5dfa13a0356e28c9770c226eaf

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    ERROR: SUMMARY cannot be longer than 72 characters. (SUMMARY-2)
        meta-ti-bsp/recipes-graphics/mesa/libclc_22.1.8.bb
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




