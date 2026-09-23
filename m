Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 333A1C9830E
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 15:40:08 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.779.1790178006706560422
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 08:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=W1d3EZAI;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=aEucH3yY;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: p-bhagat@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDdrG5299789;
	Wed, 23 Sep 2026 10:40:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=b3S8qQpRCMEPfcW9u/Gsh0hkiKOks224mm7J6zvg6
	js=; b=W1d3EZAI416YHtHYbFb3jkDf6OqlxFzl3f/prp5ENx3P8YtyJtIFcROfs
	FKRe8XXqHCdspzziM9m8+ShuvROEUTKUltdxUgWpCwOqx24izHJTaGdFNSgZMJbt
	YVLGvd3dqz01uondR4fZef7sfzuo8zDAyqz7jR8ZoyQNOELN/RSYwWmNjgT1O1Sx
	wkyRhfBGOBLwMN36W3gNHCOnZ36a/GmIgcJLlaRJ/QSz0gLM3FiNX1Zsr6oov+aT
	L25CapceS61T6aNFTjHQ31pqOSq8QCMcr2I9RWQz6knXjCfUC6Sfcv7J1WjCrbim
	Je3cPQuqidOSN05Q1nrclA+B24DIg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013044.outbound.protection.outlook.com [40.93.201.44])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gv54tmpbe-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 10:40:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlCWpPu/16jDl1RSy3C/wZBi8mt4+dsa80tM+uGH9wnLgOk89ydL6/DfeI9JI0Yi3gUvtjUdu3i8u9KdWI8NyDT8gqNJTY4oIrpWNfsA0opnRT2ibYtazomfgXXwBdFqoxu3f6Wh0K1Y40o5pYXVEyR7XZwqlxug3i5JK/cdj8YQhJSUly98uHmvWPT3TrkTiUGaXZjxqnHED0I1ZI2cMaPXuMZ6vhiFcYDG7OCQNX8K+nslGK5dvChgbIjgxYcNzVq/EcljIJb868Rbg7ivvW9jojhu5rN4KKl69zBU6jQmHW4aseJj68W84xUIcavsFoVUf9yXF5y0jlfd6Swqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3S8qQpRCMEPfcW9u/Gsh0hkiKOks224mm7J6zvg6js=;
 b=nJvaj8StfoQQV7/nzpswhRhxxgg8HUf9uaVVHTJQ4sX73trAM618JlUYzK08F95Ku1k8OFegHQG5gKD4XRN7wxkriCauIsahg+rzkuOeQHWFe7WkDt1df+6aPS9GWR/NI/T2s+eUKZtsKSnnx3QGHVwHxJxiGY0HSW2/qBctyW84zRbtusH0ig4b0Q13Ak7xKEjcqWDKTffBLw1Yw8GAbo1FxnMm3kN8rVe+pslrASHkpoJTP5M7sngKUUHh6aEocjR4rq7HPsxY4/vxCOfq+m4K1Zy0eKFFmjVUSUv3Im0fLLgqx0yWsqBfVnacaVAEpkuBKXWTO2p3A8byHTF0kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3S8qQpRCMEPfcW9u/Gsh0hkiKOks224mm7J6zvg6js=;
 b=aEucH3yYBMbukLxxf9SOx2u79iG7Rb7p+ynS3csoxNTId8uQ8lwNtMkzs3xiVa3COrps1ES6GLdpAj1MQHIvsXUoo7eyrXAbMd3IONwIzC4eEWZVjh48ISS/XvKw1lLSaKMjZzPkTxrYZEvRLcLVip8PPYKmvX+HiVk6f5QdPLY=
Received: from BY5PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:1e0::22)
 by SN4PR10MB5542.namprd10.prod.outlook.com (2603:10b6:806:1e9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 15:39:56 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::64) by BY5PR03CA0012.outlook.office365.com
 (2603:10b6:a03:1e0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13 via Frontend Transport; Wed,
 23 Sep 2026 15:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:39:54 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:39:18 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 23 Sep
 2026 10:39:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 23 Sep 2026 10:39:18 -0500
Received: from localhost (ula0502350.dhcp.ti.com [10.24.52.241])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68NFdHE83195990;
	Wed, 23 Sep 2026 10:39:18 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <v-singh1@ti.com>, <afd@ti.com>, <denis@denix.org>,
        <j-sahu@ti.com>, <p-gupta5@ti.com>, <r-soni@ti.com>, <reatmon@ti.com>,
        <s-kapoor@ti.com>, <s-sinha@ti.com>, <sen@ti.com>, <y-hegde@ti.com>
Subject: [master/wrynose][PATCH v2 2/2] layer.conf: Add multimedia-layer support
Date: Wed, 23 Sep 2026 21:09:04 +0530
Message-ID: <20260923153904.2153823-3-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923153904.2153823-1-p-bhagat@ti.com>
References: <20260923153904.2153823-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|SN4PR10MB5542:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d8f9c6a-afe2-4f48-295f-08df1988ea60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	TxjKakRhPJrSUEXb8z8AdfzUeFKY4F9Zgqp95v2ji9/XdRKAF5VvbCaDo1BTgc6dyhjCId62HQs0LF4TtYmjffLVS5jElQI4vLpHZ1e/ThdcrpwlGHQAAz76FCqK7JNd8H6TGenAnvhVyWPtaqKjzv0/EhyLosSslgE9p3HeDdQO4HA9JmMxzzPE0vDWWncNZGD8vWz4iekpQhbyignphDK7ud6cC0dPCbvucwcc72LOF601WaWr7BVIPz30NJVQZuU8W5xsY5D+UNPILCin6f8fCuYRDpbM1t/CM4H7rVa7hIn9Wghii8haSdg4FEci5C/clqiXhIk/37AmyJ/bk+rKn/4ucDOTbBw7KNugsl8eOV9/wsC+8rEfk7MkWx2zWER8/WMQUaIjiO1b/NviPjAUnL9BnS80puntDQeaUgt+ex0Evd50B/61ACmfMjbU8ynI+GSzXo1UOnQngSFXhImtDkYJVEmBjp9fyrTg40h1tGdnKKyhsX1N/qbAuSdOfSn8XP+35EngPmacVSmmmnWMT9iD+nbcwGEoPAjqVp2QWHUVvxyPRtV1RMe/z8n3KuTLfJCL/7I+2DsW6R9vWrMF/3zv5q+T4GM95x7CBXPZyMQui4KxeI771PKaqxlb1DX+l9akp/k3buDKSRzCeo9NVZhUueJsvOxr5LbzYXR7/XJmfLAy7LFHueuzA7Vbg1RAJ3JsamL6uZ6JTT3Gog==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8hYCtIbdvwl5IpuTbo3o7E9bbmDXk1TEO1vLb0GOuL0nkakRG3kIO8RkODE/VVLP2RQlV8luW55X/HafNQHmjMujN7Yzx+tToncIhcj0YSFCGhYj37QCTM1Ci63BBVlKF9COufGMhnOVAJwnWzQ0bgDvKQeVWPrHDyOW8/X7dafTqQ7QrrgmuC6R/6XsUF3Q6mFGC5pZBr9QHvRtOklvRsOivtzocxP2cGXXSfqXeRTfHQfAkDAOll8CyiJpNXspZXYCs6NivjzbWiKF1F85TwMCDu67Vka8plZMttvNQW6IdG/DCVVoOCzHpBPNt2VeJkXs3q1/JkRjdlrVhEhRDuNNzdcdEWuxoRiEKjvz6eDApF0AuBljNmF7ev2agmdHQ0mVuF7ErHgvW6qgblABpZXqbRsoGoFBpGWEPiCm1Nz/GiB0UQREoofw4ADzzkbl
X-Exchange-RoutingPolicyChecked: 
	Kck9S2BLAKDth06EUhCUWIfQZdLU9Mb3M0GfzrKdB8Z676xWgy6s0SwRcKkHTd519ab7qikqNRQmLK4fNTmnbXHnhbnN0nWxAuQ5NfH+i8fXV0V3c7SZIodeByfHyoR5K2bNzOrrj1pBC6iZ6Jrmyu33juK6y7tbkGVxChOzHBmw0s+LmK/cMAS8t3ekPnQGO+C/NVLq4IUocg309XaJwakIWKrRBYvJJ+l7wpAW4JwguJZ6H8pVVo1kOdvyJA3/51wUJZaMFKex5py2JUY8Ug7zThHTiiJ9g1w2S0b04rcfZxSHw1yRNax8b8JanJAn38n5oAhWfjqawnFqPy0C+Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:39:54.7314
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d8f9c6a-afe2-4f48-295f-08df1988ea60
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5542
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfXzWw9+vWgLskM
 XBBTtBiP9Dsl6dYZHxFMbi841gclMYnMfugZuiKBUU8Et+1IBxYW4iDWo19gBdQLuTrxeQU4o5N
 3RzSmXZvlK55c2H5UK9h39jovwHek74=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA2MiBTYWx0ZWRfXwnK9wONmfG0Q
 alppVecO5AYMf3eKXKbXdRikVumWCvMXVqK51oUDKQ/sMagJ35TFEjN3bKzRX63ocGg3s9Wga8/
 wX1u6IZLSNA7j1Z9SP8F3Pp2TweItt6IVKNmXEYQcEixUxI3WnYfDNeB187Tt9leSLG9h37XOCr
 gRUbPJnUE7FEJC27y744kNDSlRZrmn6zIavWG1KyHL1xTby5xuVcy2EwWs4RK0Y+ljCdk0rOE8m
 MqrotpcqHgnOZYX+sLINra7GWY8X7+5E33rXHMxaIbjHG9VotX68AaUXhTfO82AiewDQPAWcgEA
 YM+ufIzPmiPGdgmAKl1H8Y5+nEHfzuVfmyCK+K+pjr8vIURIouFDOX4lClEymNW/Waffnw0mBN+
 kI2gq12MQERrsuGfapmw/TwNYuk9FWqk1IWb5WFB9Ot3Dt65xA65UjWtYW7IdkeqmRb2/sgdTPq
 I/enGFpdxNXuQViGsFg==
X-Proofpoint-ORIG-GUID: sQRCWcmsCHt9BaDHSwSwOyRrMhsMndCN
X-Authority-Analysis: v=2.4 cv=TpFzFzXh c=1 sm=1 tr=0 ts=6ab3f2d4 cx=c_pps
 a=fVVZRgaqDuj868rfKEvgUg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=sQQm3S36W9SQQXdefqgA:9
X-Proofpoint-GUID: sQRCWcmsCHt9BaDHSwSwOyRrMhsMndCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230062
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Sep 2026 15:40:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20403

Add multimedia-layer to the recommended layers and configure dynamic
layer support.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
Add a new multimedia-layer to include pipewire

 meta-ti-bsp/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index c8e4cd39..1b76292f 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -19,11 +19,13 @@ LAYERDEPENDS_meta-ti-bsp = " \
 "
 
 LAYERRECOMMENDS_meta-ti-bsp = " \
+    multimedia-layer \
     openembedded-layer \
     tpm-layer \
 "
 
 BBFILES_DYNAMIC += " \
+    multimedia-layer:${LAYERDIR}/dynamic-layers/multimedia-layer/recipes*/*/*.bbappend \
     openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
     tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
-- 
2.34.1


