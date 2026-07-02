Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE541C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 02:06:48 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.60939.1782958006081870495
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 19:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=IRRGxtGE;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=hzhKaSYt;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621LpPc1063593;
	Wed, 1 Jul 2026 21:06:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=7BYsusi0CeV6d
	scE5cDvL6msak9Qx6/8olCvkKbY1DU=; b=IRRGxtGESBDtlplNt7mo0M3B9b0na
	MyBKTyI0YZgxevumOlqeRUxdc7mAsKluNg8X6TMoimPITIgh5xUPTe3/E9Fcc0Hw
	hP6wECdT+mXFq3mjXo+4CKSuCtxosi9Twy7DIJdVJQfcvsaKDVyiYmOsBB2K7q7X
	jAQmEkKSp0Rvm/643ar8pOmQSlv+KYVyK+7zUwe0Rhnjo3jFSeMY4BafAtgQPvNr
	vK1+s0v+4tdr08XusIZzmyrZAKq+O1iMBtK1uN+iGl20F0OSjVIv4Z4owia/Ldfj
	YsbxyR11XTOcEXq9N2kLw+nFyXxPTqJ7imjswzwdoS4dDQgem7uWjzpLA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010038.outbound.protection.outlook.com [52.101.61.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f51vu4y4h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 21:06:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIy3U7iWEOvbuyUIcm5r+TuSkU+nNgiilZLe6fujdWChEnu0EQXSom/UtnFdWytg0AJs1Tak0agcmy6PHVS0tLrPhTVZYfzP+c9506eY9nnF9RTrbtIh9ikOoq1WD7YqkDS5+Petjfd+3u7gB0cArE5BOuiwiL6Jc9K8r3Nhsw8CiTby7XOnp0Qs2cqJg/oQSL1Uxn1Cgk05Zz/Xg6rvIGkXyTmn24wY5shTFZJz15El343pk8nA2tfHQ5FexJ+02VJP2+BJtMMX9U58KVBvxBQO3y6Su5rwpwtr8Hs6hThAV70Y5S8VuW9TvNMHuK5RoiNyGl9Snk+ow391hMEnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7BYsusi0CeV6dscE5cDvL6msak9Qx6/8olCvkKbY1DU=;
 b=ZuZNYurLAY1O6vLheN6zA1xpYkXu4IYhPE7Ph5pI7kelUYhek669Z/ZRykDF/IWO4cUjU3UAyGJhzB1S6pIacIlf7w0plCIa6PUANc/rQfKocI08waGdXq9tPNaQmWJs++pZwuJSLcSmdku4gJVkqpnwZqB6eYSLo0vpzYYLd7Jcs2GIoGTr7xD3ms2Tyec7nhU7j5UwCaJiYAYtbLmE+H7UGrlmHxSZKXQJiANP3aptezSUIYczkwegzuzFgUqs1k2SjyE4o2TdONh6luBeq30/PqhV5XtuGzz83YubOLSHzgHN9A+qkyUb4Dxh8Sc/5/93Pikt3DXuxynv11KRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7BYsusi0CeV6dscE5cDvL6msak9Qx6/8olCvkKbY1DU=;
 b=hzhKaSYtnAZNWXjrgRwEIgG/ryOUE4JsKRJkD5CDlMYtMUoWtqIq0UYzzkjSDZVtOieFCMazm2O/j1d4HN6SnIsm/okB/d+aLjNZt54W1NnSYxL47YXFIp8ifv+5aWtn+QUjD7pZ5udX25htRi3SXcDShNn4clzO/g2koNIQuCw=
Received: from PH2PEPF0000384E.namprd17.prod.outlook.com (2603:10b6:518:1::6f)
 by SA6PR10MB8061.namprd10.prod.outlook.com (2603:10b6:806:43a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 02:06:40 +0000
Received: from CY4PEPF0000EE3F.namprd03.prod.outlook.com
 (2a01:111:f403:f910::2) by PH2PEPF0000384E.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 02:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EE3F.mail.protection.outlook.com (10.167.242.17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 02:06:38 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:06:26 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:06:26 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 21:06:26 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66226Q6w2216985;
	Wed, 1 Jul 2026 21:06:26 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wf6or-0000000CbbE-48Fl;
	Wed, 01 Jul 2026 21:06:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] mesa-pvr: Fix llvm-config handling
Date: Wed, 1 Jul 2026 21:06:25 -0500
Message-ID: <20260702020625.3004461-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3F:EE_|SA6PR10MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: 1505434a-0b8e-47cb-5a61-08ded7de8d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|13003099007|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yXFe0FmDWrl7imUYQFDESOTJ4pVFJjVgpifubOrgVQ6T1byEX6LSEy4H6y2rpGjC7hTkoK+KkDFoYb0jX0Nr9iwB5/eIDq9Kc2SIqJklxyL3CburOOMSIRxhzrcVP0ScADn7wUjuYhNKrOjxaPHrGPmj4hBXX74ABTyLAxWKdaQyGK9Kns4ecQ7u9A7VRL7TomEssEVPoKAIdMV1NywwTYAHqU4Wm/P4F8VeZCwf/q3Gtvt9Xs67OvF2wa8uzo0+LLZOluwoodhfbbaqPfNJPaOHeSmgKlYOY7OhqIwUJD3DBOdkv1sK+SfpmE3VIh7zwEHr2zv2PabI7KIzt/impyANMOwJFYD6Pu8/bFbptNkTi2OlO9da1c4I9dSm4uS8Ij7ijUUNcZbqMvYhOaWQz4vxVkO4snZ/jZpbGCzxQsm0+IFkcysf2nGzeN7EWbzQTTM+agybLAwu2HiS6oKAqkF3CEqeS2yDWOnUIYNYarRIPvxrCYwlokEkvu9WEf7YhCofALgUED75l/+DT8B7UnwlJdh1izzE87FlbawxVa8ZiHVs8dyHmjiCoEtY9AJjlLTAlReQmqDDR/3mTuHRRExduppqYYZz2z8A/VhagAF+Yux37CFJawm066iZ40YjhulIECgEXdNV1EjgRutHGnu20xMX5zpig7oagFD4puAeOPohdWCStG8QTpP/sTUWsMgiDNExir5N44f39yj7Bw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(13003099007)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	VtqR6+4UO8bi+TeiNsBN6i/tsXQ6jdeoYbCgb+Ai6UFxbhnJ0Bulfw2BGNtI6tRqCe7NwATZHSbFils3Tooq8yTCc0UauMYpWlTI/g/NEkzWi1DNOdjV+mv3WKBkPey7ba3520dtPBkEWoa4AQ7WOlD8hxSsEGTYn0wqIowzLlcA4fFFb3lak1tpxv79wFFNBJNs0KJm7SRTqIu/w+4LpY1ECjRNqMz7Di+xMgv1MRwaq/JAljynxPG3tCoYyYgtcUhbfDjMUcmC0yLrqUqmNGqC980XQT9t8gKbbm+B7+G1FNTghOMBFU0C77L7/+cHQzZT0JX7qNhIDgEs5OchyoyjFZ+Ijq6DSvTwxHpwew4q8G92gRoW/f+pBq0apu94G3u15VxxHce5kFTYtQcZSQdhtp4Kq/ZuMvHFwUeJmqLXtoiKdbj+6tymCSImPim1
X-Exchange-RoutingPolicyChecked: 
	jnPxfgEX9cWa8hlkX/8u0ap8pzzrfDa3UfIC/7a0Vvbb6MaNB8Ap4bkzp+uuvsmNv3JkLaB1Rzb6hUAv/8RD+hVOE4hRK8ZprjQJqp8gBuNC+hoz7cq9dLY5jv9scX7aXaL1Mpjy8Wa/kTmXec3KfHu95Kz4zJCsqeyZTbQabxvGuhThYWfFxE929jxiAZwP+0XUVOu2iRmz0hRtESooYpdE6Q8i8plogbNLLaMYu8OpYnWNdOjuQWhfInQc80brIEgNBI+QzMRoieWv6wKbUQscWJOtm8z3GUD5ww57kkYoG8OZYh4zwhYRb2kBGwr2pPCzrvb+v8RnoONNz07CQA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 02:06:38.8013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1505434a-0b8e-47cb-5a61-08ded7de8d70
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EE3F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8061
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAxOSBTYWx0ZWRfX3unnjOhtLpDH
 bGy7ABI24YeBiRka/6SUN1/FMGqZCw8YGHJ9gl0Wmlt86FoflwwzYrSrFmXmusN10fDlWdE4wOo
 ksNy2EdJXDPpgz+U5swl60oCOc4DdWv3TJfzYBnH1vsyG8ALvynR8txReCVgXFhUNVkb/TYg2nn
 hU05fvVLoe8eklhacbExIqm+mAmrjsC0+GI0quq+WdH0kPxeQVC9TCaIya9h8CICkHwghTgDnuR
 S0QMVRJatWl6nWO79+nfUAUH+nSQXiKVS4qld+zVyEOs5oujnk4cwE+WdENWAy7BnCnE9sFuqVl
 PNZa4XJBbkugZh4PjWVcNDnM/c4D5t1rrSJmctSIXiM4Kbuhfey9UA2Ng4tCOIqIpppohxdON9X
 0D/DL6axvjkCwz1zLmdccmXK8wafAgNZdTpaydmmRZ/2jemZXjGgmkOoy5CpOZuvGYfHP0yDSgc
 w1gyvqOxSse9M/WieMQ==
X-Proofpoint-GUID: EKKo3cMhG4FKvQvweOAW8Ua1qWo6keI4
X-Authority-Analysis: v=2.4 cv=FYEHAp+6 c=1 sm=1 tr=0 ts=6a45c7b3 cx=c_pps
 a=uwUl5xS/OuIXHPkYzYKLCw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=ymOni7ib-cu6r2QZjMsA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAxOSBTYWx0ZWRfXz7mpfmap5McF
 mwOpjeHq+8szVqhmzTW8NJRoATmK0HX+a2NycNtzbV6swsJ7Gez0gi6Gtc2+t4OZWYvtHSv7n4K
 toG2aeLPid8G2TJkk6RclEJ40fFCO8I=
X-Proofpoint-ORIG-GUID: EKKo3cMhG4FKvQvweOAW8Ua1qWo6keI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020019
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jul 2026 02:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20118

A recent change in oe-core [1] for the mesa package introduced this
change to properly handle the llvm-config.  Since we have copied the
mesa.inc we now need to copy this change as well.

[1] https://git.openembedded.org/openembedded-core/commit/?id=8aace29b692a8f3902a675fb4c022c223ba49531

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-graphics/mesa/mesa-pvr-25.inc        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
index 71e9895b..9c04fc57 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
@@ -41,6 +41,22 @@ ANY_OF_DISTRO_FEATURES = "opencl opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
+replace_llvm_config_path() {
+    if [ -f "${STAGING_BINDIR_CROSS}/llvm-config" ]; then
+        sed -i \
+            's#@LLVM_CONFIG_PATH@#${STAGING_BINDIR_NATIVE}/llvm-config#g' \
+            ${STAGING_BINDIR_CROSS}/llvm-config
+    fi
+}
+
+do_configure:prepend:class-target() {
+    replace_llvm_config_path
+}
+
+do_configure:prepend:class-nativesdk() {
+    replace_llvm_config_path
+}
+
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
 # here we assume the user will want a release build by default
-- 
2.43.0


