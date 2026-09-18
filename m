Return-Path: <a-garg7@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC380C982D2
	for <webhook@archiver.kernel.org>; Fri, 18 Sep 2026 05:57:57 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5024.1789711069371402924
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Sep 2026 22:57:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=dtO/hrCp;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=VVzJ6ohw;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-garg7@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5vWsT3321411
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 00:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=G7crcg8lj8YcZ
	4rZFYx9HQj7QXvdx8fgHqXXjm9avak=; b=dtO/hrCpSM/zLlps1RUghpmIfiLke
	N6HRvCRTIMLibqNhN9LUB1UWHWfSEJJi3O38rP6WnYC99Hr3x7dVhPjy3MI6Ebp8
	fH1bHm8F6Xon/mEBgKuYFG0NKTx2SNrF6tVX+YVdkttrh4dPbna8vRJvp4YjFvRL
	dlfnFO7OhTy1bkfEeLwzfhwO2Eko4Ro8w5m6D3bS/fby1gvK46e/QVV74ymdPykV
	yaC6tkcHJ6BjX7fAvZR922w2bOmw9Kih+cDT8iytHk48H8KRqqAN7GO3xNoIkFvf
	okXVbSa3cQbmAwwKFVEf0KGr37BMyVR4aF84iEBfLCvTBu+xpJCfxrMAA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010001.outbound.protection.outlook.com [52.101.61.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4grutp99fk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 00:57:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ob2XtCB/GrgW8HLdn++l3W7Ou9FYA1xubK2tgUowO0LlCvnBhJ7z9hpfofABqRrHH58aZIP0dPIEc7eFqx/ctXXVXye01eF5IVUHRvrGk0MhRoyX9+sRehFNdYFCtfT5r13tVudhySwe8XvKmfY4tzNcupjOfRqqHduQWmBX7yEHtrWKxIsubWcN6odRH77o+S3ccJLJPpYEAunyDI01HJjSOSPEUucZejOpDhremVyunbyVkJsvJP0V7Lal6Q0OsntwyfnEaRavNAxonku5VXnOaVkftE1arLQLhu13+tqPKPZAeBotdRblP+9wwHrgGFAG/uNc/8LuSx3LrxP2bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7crcg8lj8YcZ4rZFYx9HQj7QXvdx8fgHqXXjm9avak=;
 b=hGwKU2zJqiboVzR7e+e3NzSkuB6Tsp56w5q4po9R6TQ1lyKBLaRC/Wd7eXtD9U2CJSeOw1zEuSar/wmDZ6QZFFGza0nlHGte9oJDNPSuSu+o1UyOr4KDuCsEY372x7BHQ1ZjI7uCbsyoxtxsQYkIWnnhhhafRRy6fM4QSMwVcD13/rSIIZ7y1wq1mFrexY5erezAApAOw7uk5KAS1H/knwlMDKQL9iM0lpvPEz2wHd9FlJEr9Dl0fTXXYILdpIuwc+ykv9pmd/w3JNNOWzxj771GQ9lBZsMJFXdtlr5GN58ECxmWiiBrQqFkrXuTqWpAqaVAVZwnOYmc46/fXWUbig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7crcg8lj8YcZ4rZFYx9HQj7QXvdx8fgHqXXjm9avak=;
 b=VVzJ6ohwc6dQWlTHUd+tRD2R713nVUGKXikoyXgnyqXUwmRedwA3xjZliZZQXvvnJvfmABz0EO4FGuUSJLTorw5SnGLpyZSLVH0xt+0OWtRPgorJIzNq43pMqwqTyJ/nP8HM796U5ulm3IRCvyNTyORTP/XKzjRr1PigyL039rE=
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by CH0PR10MB5019.namprd10.prod.outlook.com (2603:10b6:610:c8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 05:57:38 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::8d) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8 via Frontend Transport; Fri, 18
 Sep 2026 05:57:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 18 Sep 2026 05:57:36 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 00:56:58 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 18 Sep
 2026 00:56:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 18 Sep 2026 00:56:58 -0500
Received: from a0507033-hp.dhcp.ti.com (a0507033-hp.dhcp.ti.com [10.24.68.129])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68I5ut9C1152368;
	Fri, 18 Sep 2026 00:56:56 -0500
From: Aksh Garg <a-garg7@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <c-shilwant@ti.com>, <danishanwar@ti.com>,
        Aksh Garg
	<a-garg7@ti.com>
Subject: [meta-ti][master/wrynose][PATCH] packagegroups: ti-test: package iwlwifi-ty linux firmware images
Date: Fri, 18 Sep 2026 11:26:54 +0530
Message-ID: <20260918055654.180727-1-a-garg7@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CH0PR10MB5019:EE_
X-MS-Office365-Filtering-Correlation-Id: c4076c07-5fd3-48fd-1ffe-08df1549bda5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|6133799003|18002099003|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	VgPUWTwXkyp8zLboh/q+A3m9lW64HytL4tMLDl/jFMcvUJemsbMx1oO8TL1nHIefAXJrIat4OaBMvlBSmyC0w8XdbdJMhww0RehzUnoEwAnrZOxmFmw2FjRn+anFlgp08Pb0Hq+2y1hI/5dkwfjiDsQOzqLu+NJgffn/KVFExGreSSe1EHxr0q//IQfKPC14HN12Fr2vHKUdaVkJHe4iztEA9BzhQG+QJ4jS2OrbnquLd2DnV0OZse7RoCN8M4i6AdD46Ec7IjyTdJAGT9f2efgi3QP0R5F3BmHwpvBlvf3pTVz+DRf5Du3Wcf7cfL5Wt/+jnH5SRSJQ1HarAPVovRSklciiocYtTq+GyUlvFU0UshXQxrj5IMZ+F4NnQ+h6I5NzpB6OralSj+53qDeVB1WUqDQgTegZaPlPZ29jN3Ip/tmGfUfsly66dPMSjkw+OGw4KMbqIYG7maHGfw8B0VqAWMnukkAJhMXkMV1a3U8Qo4xy4JCeiZrkPvY24q5On3O/Be99xYKN3cwvYzlkU+RLCCh0ytGEguV9NU0JDGHkFJd3JaTH7AHeYxxSxE7W/spOKJ02XjxdSPh+q18UA5XAQ7YhN9F6w1KmvfhzjFay9G7ze12clAnTpRsZRBlr6RgyTP+rMu4zX3kkWv/1zA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(6133799003)(18002099003)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	w6gisRMkDUiQ7GqZPc/UxpXJTky5jQafHagPeb2izrRUcD0z/csuFAmFFEQewu1MJZIPlaf/yWVe6HiX5J7qfpdqXitCk/20FXrDrNiLOSMfwf7K4rqsvNdxXsT5b0viyO9UnpQJVjExWCIFrCEWwldfuTUCyVNyoJqXZ8+FUoOeumFMQLMZZcnhS4Y8mwDxOScZs9J0fQEHsbx5/ynpzODeNmqTBMP7vHtrdJqyYQl0wkf9NnqgrlWvIOD+VkI61xSDkc+4jPDopAKWil4Gg75Mjj/16YGaGuibex1NPqYnfiSzEIK62c8wubTsAeF71mFfXJb4OH4R3udu1fmx2SXl5sXAi4sqV8jsgXlDJT9Jgn8aJliBdHDifg1lD6spPv5M3iopG7IxwTySZ/TAYoDQoGj+cOfR4We1ZgAUwmiQP919AwisV7Prtj/ARS3s
X-Exchange-RoutingPolicyChecked: 
	h/Q4w6G/fOsT+Rn/FIE7k3iuf35GLGV+Flk1x6xbZN640rhYjC64311jOle5uUZomsn3WwCzKI5DZURuMZxcQPQmXdyQVXswzciMGMEDbP02hD5raLXzzZQhHHNzo84mzxtoL3KfEo0NXkebzgkxzWxXPW38fx/B2+rAxfg83RZ3EGg+f8p7oaLkPS4Qw4Z8w8aUjih/xCMF5wx0bw/pQPhBzDaUzKYZiJCK3GPO6ewy2/BdanqSOrRetu3/SR6A3ACqWdelT8Mvj/7T7ouDUhz4V7ifBQ2qCAGqNWOBVSkL2mTr04+2ETVP2ZLPYzaFn8qJTcWHLQ+rI9oa9/YoBg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 05:57:36.7070
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4076c07-5fd3-48fd-1ffe-08df1549bda5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5019
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDA3OCBTYWx0ZWRfXwTDzFG83JiHP
 wXv3TpOr1y7++0/VcDBSiwIBG3gla/YSNp3KFuKa/M+pdg1XnN/fAzh0QteFCMuuH0f/mhRJfSk
 IDhhjgb+xekMR9Eh/2PCdBhNOa2DmOg=
X-Proofpoint-ORIG-GUID: ZXg4J6z18-Kh8iUsSk_4JRx8Hwco4oZN
X-Authority-Analysis: v=2.4 cv=BvAIUoX5 c=1 sm=1 tr=0 ts=6aacd2db cx=c_pps
 a=j7tsCyGgeYHcZD8MHzM6Gw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=FkqiSGZCPQsJlUe6d6AA:9 a=zgiPjhLxNE0A:10
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: ZXg4J6z18-Kh8iUsSk_4JRx8Hwco4oZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDA3OCBTYWx0ZWRfX+5MNkbHDPICu
 4Xess6KoSFuFC7sBxmcceBD7rNBaaOFwe3T6viAED0B6iQGmjl/06b5R15YACVe6DQVywPmtBzW
 youOERky2QRPoKeFAGsw6CovUShO8Ftr0kQDeVTHFj5vyB28DLou+tsChSDxSTTcf3hSqr2L1DK
 KnZC7lFbxkaUIc6THQRbXxvjyIBZUJBnJkYYNrCyw/L5CadlMqtheJVNWWJiesgauOV0KKN3fBC
 tJHecqKBuHRML0HY4WgC5qPUPpBxdZrkSJhWUl4ys0A+qv0Ka5/cJDrMveEezCjEOKP57H3CIrx
 y1YGoodkUS7yPuv7Dieb4MJVAWyMiqucMm5W+1W8vLV4zZjFUrlyWtr2AdzrQL/zfe8S9lUi8cw
 /GhYAwNPh954el4VKLgJo87JdOmOs/pY4UH5ohbnEZSnI5vICPCJFMr8npRRWJvrPcgLaihuCuN
 PE/AhNEFiapE0E7hfVw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1011
 impostorscore=0 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180078
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Sep 2026 05:57:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20384

Package linux-firmware-iwlwifi-ty containing the firmware for Intel
AX210 WiFi card.

Signed-off-by: Aksh Garg <a-garg7@ti.com>
---

The patches have been posted to oe-core to add the package support for
iwlwifi-ty firmware to the respective branches:
- master: https://lists.openembedded.org/g/openembedded-core/topic/master_patch_v2/121309633
- wrynose: https://lists.openembedded.org/g/openembedded-core/topic/wrynose_patch/121309627

 meta-ti-test/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-test/recipes-core/packagegroups/ti-test.bb b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
index 8a348c26f6e8..9064bf276d40 100644
--- a/meta-ti-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-ti-test/recipes-core/packagegroups/ti-test.bb
@@ -117,6 +117,7 @@ TI_TEST_NETWORKING = "\
     strongswan \
     tcpdump \
     xdp-tools-ti \
+    linux-firmware-iwlwifi-ty \
 "
 
 TI_TEST_STORAGE = "\
-- 
2.34.1


