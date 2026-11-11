Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3100.1794373341428693170
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Nov 2026 21:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=aSwk8PCM;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=dh4k2kk2;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1vqOJ3648633;
	Tue, 10 Nov 2026 23:02:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=d0ewcHlDCGCtmOG9vUzWZwOz5G7BNSWmeXuqm1716
	lg=; b=aSwk8PCMb6aL0Ff9Xm3XLPJUOp9kvX/xdKIrzdr3lWizBj4UYa6ObZj0b
	baaMlOlKW3UlBNWtKlJUiYtSXyUfs18f72h+rd9Scg9R2DSAd1c6y6dPrkR7Q+u9
	ZEihf5RDYk9E2Xo6HN8wHm4aMeGppWU0aAnUBv6LWE+jVSlGNy3qGjozWAlj3eVO
	v4Qe7l75BDxACuX66gyJdGuwWClvbQti6xag0My67G3VJGKGAXDyFSKMsEV2ncc6
	rKRULIgSVs5EB8qbcXGto3hCtJo1wUlgMasaZigNc95FzZDgTHx+0TKD+EyYbVgv
	vEHArDHkVrRKbUCapPT2UYEoqtyeg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010048.outbound.protection.outlook.com [52.101.61.48])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hv9pjtm8q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 23:02:19 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMQARKOayvEJdd592JFoVhGAgE0GaTsFn3oOPNKhAu49xSz8Q2hYb1gcjcSNFHZmafkYGb9Tz7rPhwRzyiVIuYgTG0qncuJ4K4TrVjDYdtYiupSIfUpQQ3/oVn/iI9OQVDEbS9pNZzixYlwoouLNVlH0kMf1Vvim/+1bXZF/BPZKQ7sp1i81TpgmICN2QpWm4X7ihxfmtpKmKrH/h6SfEcxelk60tGvIfqROT3bc5ddEGD7f6oZV33uUF2LLSZXW3q5J7hUZcmZNM1847PpfRMNbyEt1I9IGR+flpjE6vopVkDTaeUByRYWZvulx+USR1fmsIQ4kGAMNxK9O7ZX18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0ewcHlDCGCtmOG9vUzWZwOz5G7BNSWmeXuqm1716lg=;
 b=X12MjH6jmSIrME1JtiUygF5N0EYP6RE2qA+4IXm5rXuqYaCWt54mN2AvE+Fu5z9//8oyvB6bLjk9950lgc6P9vqaG19VXj2M9ErlU1+GGSaalNI7Poz0syrknvYXuU5Jd9LIWx3DMHCPwYkV1Sc/XtmHhpcTmMU86o89OnHmznBSXFbgjdmsO31tIhCpMLuNjrZ35uMjlvNmb3Yf+w86eG2luRlIIVqNdh+VHLkGPy53FSwdwqdZEsjRkhtG9CyEVjRXbzltvaqOJ+bkIrV2r34jXXiX4Q/m7R2Hz/ggrZclftYjXoMGwg68DD/WtJRFlSg82PBj9m/yz0w9zNS4gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0ewcHlDCGCtmOG9vUzWZwOz5G7BNSWmeXuqm1716lg=;
 b=dh4k2kk2pEg3ygxbrrOMDQ9xH3bnYSYv330IgZYKGHCYaVU2CwfgakDgLMquE3LDv0BpgQBDBkLx5pUR2CltsQXIoh7adkGbrkYGkuxMSFpZveggxji3EhaSpH+ryLtZTFjSTSmewHCmZOOfQI7FSovEuR7nBBYjdTIFQkrclb/Jr9dtSGnOhEICuA5XEdsUYWe1eHN9TyEogSPd6DY8y9NnrWbQlPWNFQs2ipE15h9Q3sw76nsAhZ3dJyP6YxAk5o1d265ItrOlOocZ9ki7uyXLIW/MegJudlCcAWd7gtL2lJb7ue+i3x+Y4wlHJ8lTxVK+f2/+idQwj4ohvKyhAA==
Received: from SJ2P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::16)
 by DM6PR10MB4172.namprd10.prod.outlook.com (2603:10b6:5:220::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Wed, 11 Nov
 2026 05:01:40 +0000
Received: from SJ1PEPF0000231B.namprd03.prod.outlook.com
 (2603:10b6:a03:5da:cafe::87) by SJ2P220CA0013.outlook.office365.com
 (2603:10b6:a03:5da::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 05:01:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF0000231B.mail.protection.outlook.com (10.167.242.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 05:01:39 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 23:01:22 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 23:01:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 10 Nov 2026 23:01:22 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AB51MPO3221965;
	Tue, 10 Nov 2026 23:01:22 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A7AE69A9C3; Tue, 10 Nov 2026 23:01:21 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [wrynose][PATCH] Revert "am62lxx-evm: Add DSI config fragments for display support"
Date: Tue, 10 Nov 2026 23:01:21 -0600
Message-ID: <20261111050121.2909325-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261111045551.3719301-1-r-sharma3@ti.com>
References: <20261111045551.3719301-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231B:EE_|DM6PR10MB4172:EE_
X-MS-Office365-Filtering-Correlation-Id: 635010ea-4646-4b60-b3a2-08df3fb0dec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|23010399003|261022105027099003|261026140227099003|261009223027099003|56012099006|261028144727099003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: mMcmcC5DzyoFGKOwaawNH4Irjvsxn3u3jdmUOTQDZ9W0jV0uA/07gB9vTgEaaN/SEg1dNziDmofECx6WKS6cmAnQL9f3KVhKB6hJEc6UeuC3FRnTeq1LwkUbN73U5ZUbmv66e5ZycbOhcBtzt6GKoTH4aD99kfSWQ/QVs4BjxvkPccJ4WRwVGRBo53uHYLqM01+wtMpC+2vmvP3xRQrkY8oKu6Q7sL0s6ugFjSdiZxLv5CK+RDYfEPbDGgmrKCaN3/Qh5PmWnFw5Lew8axXFdhCirpWKiLgCmCXOmt9X79SuSr7lxnjOdq1/D+8F17tkMsIbziarbU1Hq78OlOPXQfHTMXBhVd/ayS1xc3a2975bRQt0qie+jvbby4WBj6ULYAc0W1LzlhvpDXl45lg9aCHjDJFBiao7BOhqbsDB8HUuVTXi5R0ew2TjEpvEg77jTvYNJKWP4gh3VIvajPAu+/ypEK2wegQ0L1YvK7t6za+o26JTuLntWSsyc6YEQe6VizZ9QXhi04WY/lqtM8M898WDAuXg4eWEw8L915K2mAiFBulTSHW10bXmF+ieiR7jMJ3d8jvM9rXu4iKyhqXV4WQ+Y8/G3QyAQawn6Ex5Tg4yxuBDv8wGHXt6RtnLY0ZuGsEkDsw+1j1DfIli2N1YBDJ5oQVUehtBRGWF3TO+o3v/9zL+d8rAMvPhwRsJdpr7eeW+tIT+iSB4dRPHg15DJQ==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(23010399003)(261022105027099003)(261026140227099003)(261009223027099003)(56012099006)(261028144727099003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UeEN/B3F5cCT5M/8zgYe0KugJfph27RIFzMX8isth7mKQTRVD/eFHTEsbyrYI409zXv4gnQqcGjJ+m65WVQ8JsJODun9+Wi/MWCNhf/v0yeolKMH1H3OSB4IDUl71fZER2ZE3L+c9AHcaI0VKjKIlqyrtaTYUk+AXIRhKQSTQ0Jd/zsQxWasS3sU4x9kbpUYFkDgVCLoHKpqNYRohwy+zDfV2Nae/mclAJQJdeeZ5daliFGoOm99r5sckbhRT8nwnU//5YfxDflux+0SH48rNGs+ln8kMqcc84s9HvzvPXr6kCfhNsQK/9NJp0OIuIdMfI2IpUuX4EIF3TLh0iKEXT2bpUJUzldxKxNNYgtjJYi+NlEkWAB+Bwz9WtLvyKluSFSqMIjkVMt/ZGgjwN3f7RnrqJGKxEZH0bL7nLedFAl+2bAVLKMX7eU5CKPUMcx7
X-Exchange-RoutingPolicyChecked: 2em/6b/oaJzBKCaWxqp6KNPsV1iv6PxjW4XATNYpQdg41UHbFBDGa4z8c6us5q696gNFz9LwV82MZ42KFuRuPseoBjtnUEOJLamyfsS4GNapwnnnqK4KsFYzW3WV5QzZwaIgSb4xqiwg8FpzRVz+75ZeNYuhCVWr24DK0j/F/W85HBLH0gjotO28BcJLZK6JIGsVn/KOiAy0gfbVCdSMijq1sGqZh/utM1VGumQxc9MSa7WDKLckjV6UxGgYkfquthZOBPfqVHqBxX+xXnlDt+xbRkdYUSN3BqQ2aVqa/qIDG0bbyhQNz/zOzCPjExjScObZk5CRCsG1VdX2gWiC1g==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:01:39.2760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 635010ea-4646-4b60-b3a2-08df3fb0dec4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4172
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX2Dq6hjgRwLY3
 qpHs0QkWD/Nq/3xTori9fOyPCk9koWm+DPzmnGkIud3xL7+mob53meIIHI18wY9tmuQdi8u+E9c
 Rb1WeSbDUcIPxCj2gCPplVGQf8tnOminwpkXllSMa260AM76zMnnKVyvlBICYEPokAxVvMoOHIV
 /GXEkxDZ2jhms3LFeWh7VxjDRmGi5xY3HRE/9aM05iGCMvtbbDf9dMFohe2FlzvDQ7pYANXngW+
 JsPtkqzWTmnhLR55E/jWaYkgN/mvldKy5xuQi3lIxoDQeQ65n6rcfetbhCTkF5DxQWdD3Dwtupa
 aFBuIuj5BJghw7j+uEJ+LotM3fjwoB06ajSuuraIOO+9ioyWdmhASJbXXfMJvzlExPTUEMlhujn
 C0ctDC8LCnn3M17SCLpkThE4osf225xeiMF+LDlzlaJd5giXZ/Yq/DRzMvIv1OvL/ZEf5AbpEWT
 +y59HicTtTTmTEWPS7A==
X-Proofpoint-GUID: z7S_Zovb-pv3JMJ436INp7IxFezqqfN3
X-Authority-Analysis: v=2.4 cv=ebOo7LEH c=1 sm=1 tr=0 ts=6af3f6db cx=c_pps
 a=MmwiYf2CWIeG5bfvH5NISQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=9vpPvfGotGxCy51145oA:9
X-Proofpoint-ORIG-GUID: z7S_Zovb-pv3JMJ436INp7IxFezqqfN3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxOSBTYWx0ZWRfX1jmULn3Cu5ut
 8yCADjgOxp7bSBoFHWmERgzEjzZl/t/PuE2t2UEvZpuc9/E7cU4PPoq43R03n1NGUr3dnK/PXDo
 9KbG/ma20wU15PmmxsilK3KE83u2Ecg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110019
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 05:02:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20516
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261111045551.3719301-1-r-sharma3

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
wrynose
=====================
Summary:
- Patch Series: [wrynose][PATCH] Revert "am62lxx-evm: Add DSI config fragments for display support"
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Wed, 11 Nov 2026 10:25:51 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 22f2c3a82dde3fbd0be2b9e04d74a452425919a5

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose-wip
- Commit Author: Rahul Sharma <r-sharma3@ti.com>
- Commit Subject: am62lxx-evm: Add DSI config fragments for display support
- Commit SHA: ce7e8077fa980d8e634db3340f6f9e8d81a12123

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
wrynose
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
wrynose - PASS
=====================
All checks passed



