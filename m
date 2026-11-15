Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13726.1794773318021461114
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 15 Nov 2026 12:08:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=o6Dt+lWg;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=tip4C58m;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIQma03788532;
	Sun, 15 Nov 2026 14:08:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=o1G4IG2wwGieKDE1w8oz8niSzBTr4LNTpuxR3skua
	B8=; b=o6Dt+lWgOk7rYAENsErHSfUXujjk7KsH5jma8rWLdUZFoCD6ae7TJXrvh
	if21aqi6Z/xPUtnDZAkuZQtsUPW8II8YEYb6ahURzYRBeUhaKzAez6HvAzdZ0TGc
	UY+feNeOdmSBplJu+sBVEQv45bDm3tbf65LYSuY7f2IJM6iJ1sDLRrjP+jEWw6f0
	TtA2Lzfzz0cDxPe46xABwUHZl04qT77SEnmScsqNxV6/AwAcQex0JplhC20ZeStU
	NZDzOEdjkrtbP+YsZCWHxWwT+xZ7xp2bTDnDmin6IRuTPMwHvlX3KFSa095qwRWc
	9WfqrsvvvoLS1Ow7Li/dwt7ouTP2A==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013065.outbound.protection.outlook.com [40.93.196.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hy7w9hw1p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 15 Nov 2026 14:08:34 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RP9B7iqd+B1pXL3DwQxVe6TtgKjpAbf3h2Cnr7gEO3DyeAjmyGkYz/wGNd78dsOu1CfGIixW1en2LjjoJjlStNJYyKAEfWs5drd67H5yJpNykf5D7M3fywmw4K+ir3vYwZYtC/V3jR2d2N/HMCtt7BZtUVxhrr2ljALLTMyC4Sryk+gPARi7EL6sFEONnvdpcZVdZQll+T/h3iQDtmgPK9p+St+gxYLKHb5S84l+y/lDoOrV5vDLjV8hQ5ziJxxIaPcoRO86gReidvyvJBHslNVmW/jCbEBTqXsOEn1pCFCwuWK5HYpWfLlrSuHlixM6D0n38ljNgvp+/AERUbb8PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1G4IG2wwGieKDE1w8oz8niSzBTr4LNTpuxR3skuaB8=;
 b=nqrWgxDD9gAa/yS27KGYGba5h8hzKJmOrUBJpzjjoSQrRt4MCkldyH/ZPEw2fji28J++75kKkNHtMIFgeJxTTCbfRLFrydWncMBEdKCu0QTX+KFbrNxhvPiVyNDGfB4Bbi0yzxiXV1X1pnC2kjOu+to4OwRgRlEvHBf6bFNU61Jsswo/S3XbphGhhkiADrm6oHc1SYO4ZVxlBgBYSgw/FBR+r/YR5MD6FkBTiC2cWjkvOiOW6AbLqXZGHaa45KkMxKuQTlTQGsjlmKvNo+O96IbnqX2H0e0MN1UzHkZZmGT8yhmydDgV2HlTU13AvQ95GHVlZ/cnsf0BjJSdU7ETSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1G4IG2wwGieKDE1w8oz8niSzBTr4LNTpuxR3skuaB8=;
 b=tip4C58mNsW44eCYbL7A4ZyEzBOGf5K74ZnpJnslwT3JMrlT8DkQ3xnJ1+tqXCbtGd+XuyCBbqU8krNyoer9vCw1frTEARgHe6poCasMeX+zgnPFEpHS0tzDUsqshjUH1NBhuPgB5UnZb6u5YopYhs3NKInL6p0MZI6ppbTBbEWvkMJbNHtFhbbec7yzWI+oAXKZ+xVlgkmiuZhonKZDzzJdKeic3tsRqTf37kAwx9t1pPrDdCK8+vitDomxRYAneQCLBYGYunYMN4g/qXxukwbKVzRD/IAQriG+OkBXvcPWTNk1Wd6gyiOjDyJngrB/tiP0kDC3WTEHIWVWqFpHWA==
Received: from BN9P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::17)
 by MN2PR10MB4350.namprd10.prod.outlook.com (2603:10b6:208:1da::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Sun, 15 Nov
 2026 20:08:32 +0000
Received: from BN3PEPF00022BD5.namprd03.prod.outlook.com
 (2603:10b6:408:10c:cafe::9d) by BN9P222CA0012.outlook.office365.com
 (2603:10b6:408:10c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.12 via Frontend Transport; Sun,
 15 Nov 2026 20:08:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN3PEPF00022BD5.mail.protection.outlook.com (10.167.248.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 15 Nov 2026 20:08:32 +0000
Received: from DFLE20.ent.ti.com (10.64.6.57) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 15 Nov
 2026 14:07:49 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 15 Nov
 2026 14:07:49 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 15 Nov 2026 14:07:49 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AFK7m2K3518145;
	Sun, 15 Nov 2026 14:07:48 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 47A7C2C8E; Sun, 15 Nov 2026 14:07:48 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH v3] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
Date: Sun, 15 Nov 2026 14:07:48 -0600
Message-ID: <20261115200748.3486067-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261115195411.4926-1-denis@denix.org>
References: <20261115195411.4926-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BD5:EE_|MN2PR10MB4350:EE_
X-MS-Office365-Filtering-Correlation-Id: 4610c047-d6ab-42a8-a752-08df43543912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|260925022911599003|260925021911599003|260925021311599003|261026135527099003|261026140227099003|261028144727099003|261022105027099003|261009223027099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info: BoAQ6UgumyZZV3tICVncXz/zORre/A6so6C0/wBbRmkfkSQGaqJkGxT6nGiTSZHMJfptOE+JPLA5Qyn255YudRcLJayoDXd3imLQdcR2FE0ULl1GmSWTx0tHzHjW4TbKz7a6xeGkXHG5tan7KXcrp75gJj3C3aXEYLoBfZ9O58N7AFq1tKlNiFBumSh7WlehGWX/PYW2Rjaqvg9oo3H4IC5/gv+B8L/hZWZIYKkN9DI9x9WL2EkkeO/okkOPmIE7a6YBUaS9rNDEfWiZDY2j4K41e2fOF7n3cEcmUoNxc7h0hDH/65V4qnwDOORjCuJ0p3rzimQ0QyOc1mFg1ZRTCZL3BUr34seHeRCeGO0RoZE/e0rpn7It0KRrxMUYyM1Javmdxqw8HrlElQPaUeUe+cc2hLWAAjTXeKvdx6I2QvoKjz7TI3q9unbKMBDYR1qeSjCdK2SbD7C4MqPj+xitG9qAJU9BdcTI5wdBMKhBmoFVZ8rHZAWacakHzWx64RL5618Do5vjujnDALIZRjVIxgGyaMVK9mo5P3MoOtkutW7prZE1/clQi/ZGz8BgCZrILT9ImfSdreJ6qrdOxcZimh8yseUVEHRf3NlB77SZgzwOOahZpZX7y2Nbd4Bwz9eYlUVTHGIMRfY3RQXbU/p4oQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261026135527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261009223027099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UaxV9nArFuzQf3LLIKMA+9aM78pCNimEd88WH8KoVuthS2iIvQwoqAbChn7k5jL5CAzNcTg/hPBOJIXesdrK0hiDp9UyCjElSGLeM9n1XhOOjCOu/54RLwwfRg3yo/KzwoZJVIH0yub6epXR/1q9+VkrG1zxKi7acai0NkWW4Id83YPgGqYSxAK8ZzDJOtSjzASQr24yWsZk3TFPF+YnJniwK1XczCspi5wWa1nsTuJ8IYneK1veH+f9BG0BvGyT2PigX0+OeHc1ptWy/EVTkxBvGiZZHwyFFnJM6LDX5APzr66ZNuIxmZhbG6inGD6tb+x9l9Q+MTe0h6Ws9M+s41p4bBZWBftLn5L/qV1eklPcWhqslWoXJAwxq6TSoPhd9gmZzAm1Bm/c8WTHP5IyoCFyHCQo775zoXbSmfAkeYHRMcbffSBUEDaVbiPgJzH3
X-Exchange-RoutingPolicyChecked: tzjcXUHX4I3CiVPjOYmYdm63cl7sgfrNALN2j15Vrit5Mw33VXd9fYhyUSkQst+UbIpVGzAwsWzpnLoivb5IuuLvQiqzdW/iysSnKyS9RGDO4LIbt45Ny2+iV8I6tvO00rETYZwdzP6Ba33SvsXfaHXCPy33XQhBVTP8KWWhYZLXczqF2Hj1htzv4CxjwHNVH/dxGBkAccapiC0enx6oBppDQCIp+HOf7U2RlOKhD71PCjbSwqbxFC26RIYAendwBSEz83Dn93EtqokHus0WvF5y+fj2H+0Q/589FFp+V0PsG5gMnuu/hEUrFE77lsocs58pVYUX/0O5ZIyQi6RIdw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 20:08:32.2540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4610c047-d6ab-42a8-a752-08df43543912
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF00022BD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4350
X-Proofpoint-GUID: 6hTHuMBNCtpnrjSMOU9avAa-8YmuZsjY
X-Authority-Analysis: v=2.4 cv=NexzRGD4 c=1 sm=1 tr=0 ts=6afa1142 cx=c_pps
 a=fgNoY2FrYBgJmLE9YDNrYg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8 a=sozttTNsAAAA:8
 a=tFqEb-pJPcc5FQIJlkIA:9 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: 6hTHuMBNCtpnrjSMOU9avAa-8YmuZsjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MCBTYWx0ZWRfX8x2X+ngXly9r
 UGPzYT8Vzeh8A0EQ3uVNNTQKMWJ7pqNiwW59LH3TtFKQQ89BXcJ6mmSG8u264G3M5kq3mKhkFf2
 C3lGt0A277ehesjFjO/xQwfAa6EGD4ydqe0T3YK1qIJl/r3zzWRsVHFWrihM4NXovt90OkztvFT
 9iuDoBuDiL3pnsK+M9WaD4UyIPtFqQBJackNukDOH4hxp4tEUDkBcbpHcrPvexjQ0cizB4yC5xX
 Q6m280lCYUx7HblAV6Yi6HeQLdJq7X/BecLV6HPDLd/Ud40wWWpPgFRk/AKxBM/lFDp1Km+Dj2Z
 TpPksO237Kbp+hmjAB755O4ZLq6kAzJ6MLuS1mrMnY1nQcNccHY96ojWQbUvaOu9wOVnbIBHVug
 qkrWQjoi72/M+fy1na9Qd68IW8dLLdFACHXuUp+5Xs5xKxaX5IJ2S1+wvt1MqLQNqtfDayJO34R
 gxAkP5r8l0xqoxiaIEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MCBTYWx0ZWRfXx1sZBsSCjsfK
 dtxQ4whGQTECtSj4Fj20LkAAaSMtqOwmCRo8NYQd4ZgXMv4b/nwqAW8xhMpFIJrNi5GPvl2iFh/
 H5hKeitGH0WaOEoM3SWg9dTIdeQhCkc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150080
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Sun, 15 Nov 2026 20:08:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20551
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261115195411.4926-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH v3] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
    WARN: Revised patch missing a comment. (REVISION-1)
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
- Patch Series: [master][PATCH v3] k3r5.conf: adjust SPDX_DEPLOY_SBOM_NAME to avoid clash
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Sun, 15 Nov 2026 14:54:11 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a224aac7101324c5328f303c3953664091f95369

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202610262200
- Commit SHA: 9132d7b6b3ed4b6aaf9bef79ea0e12bf8cff5fe3

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



