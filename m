Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7955.1794398169961412503
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Nov 2026 03:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=jPFzVYbz;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=p3dm640V;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7HvbW3517225;
	Wed, 11 Nov 2026 05:56:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=qLG/5x6DRuYir0GapuBpz7EBcCzVZTN7oPg6jOw8Z
	FU=; b=jPFzVYbzJAVHbBnSpP/ogahqdvWMptE/fQ9i52XHLdpFHoHu1Bl82gVmf
	qxOdchkaCa5os9MeeNfp9soGLuSe7kHTvdmPhKB8fYjmpcG9sNQwp4BTJk7Uv11b
	mk3HtBQetNJdGjswq4WdEo0gYQTe9exFyXy/GteS+iv9eg+W4Fuw1BVoRtpoOFpY
	SRa83YQfMM3xdHuyrxns7wXyVtDgtwMvMUBcM55iSPeSdAYAdWXbbwlDk3R/n7qA
	HTm/w788ePNNb4UJyLBMPdazucv3KoVEx/XzMEGdOO88+LsYuvGwO4wCSbCtcGAN
	iHU+CesAQt7vzj011LXtba3DPg4nA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011060.outbound.protection.outlook.com [52.101.52.60])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hvgsyj6e2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 05:56:08 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uf/AvZdlOhM4hwBaFRYTp2pT1OO2KDkBynYx5JoIXTdRZWzbdDprASH8CftcokGdJu/YTpEsMUcILpKDKv2pwYPQnTscBygQWrWL/wJtfelcP9nMg26PqewricYcp/KBUPQgbO4LKF5ygrRD9INWHebHjeQdJIeuBkyVUSYnNoURhOuF4NYFbHIJAq58uHXeIGqvyivLNp7QSfynBycO+Js5IYjY1ZHYkc7UflVzZxQ4MdG5mkY3REtPB6Dg8cNZb/k2sYGLyW9+wWEcMx4bx3svVuVxYSk6XOJmJWE7/rrKCpfA4L9XVOnUlftsh4bnZWnkH+ojoIAIEaIIa8pBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLG/5x6DRuYir0GapuBpz7EBcCzVZTN7oPg6jOw8ZFU=;
 b=Ae2zZ959NFBo/N2zORTnwNeeO8ULAV/MIQpv65JTJcNHaRAQSKUhhcWiLuZUUvvCEUsEprzClmb6ZB69goYVw8hEKfeXAgGaJyEa4Eh8OCDRC0SnRWqnTPFHYtRaDMewybBcYLDulBbaAXfJlSDLGL7Hx4ouhlfNqTlynLcOV8qY/AYsBEzsgK2mavmTTzc0KkUsfU255qJlC5NhOx4gV+yvWdBM78bgWhmofHBN9gN+mkiRGgaY1qpOomXxMqiFINVzdPkH2e/Xde5Mbifm42nm7ZzUYKzeCscme+4EnNzeiXv/VYapmYdoLQKSX17Mq/RgKp4k/a3w8bw4t4bLNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLG/5x6DRuYir0GapuBpz7EBcCzVZTN7oPg6jOw8ZFU=;
 b=p3dm640VNOEv8LZCJRccjhlbmtFeonO2ipBNmZbl85nGhxoc8gYSgZBuB1ZPmyEbw+omdHRAyrx89L3FynkjY5nTCYfUYZ9GCsXhhf0MXtKOCti5o3ZSfqsnpMrt/vuB3tkV4GDxob9aiQqG+jkOAchaDlVG927DbsgJyzglto7jeQzFEnyuj6fSDe74tsFaVA0pMdKJ8t0r27jiu8PS0fV4ZrQK/SB+C1u09j/EJBG593SjQr7bgYDd30XncqgXhMVd+VnhaOwoWnfmmA0U59VjVcfxL2I7iTuwotMLTyZ6Eeqhos+gxCfM9sU2hSHXaWp/dXbczB5ksTkJVzM/rg==
Received: from CH0PR03CA0295.namprd03.prod.outlook.com (2603:10b6:610:e6::30)
 by DS0PR10MB6029.namprd10.prod.outlook.com (2603:10b6:8:cf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Wed, 11 Nov
 2026 11:56:05 +0000
Received: from CH2PEPF000166C4.namprd04.prod.outlook.com
 (2603:10b6:610:e6:cafe::7d) by CH0PR03CA0295.outlook.office365.com
 (2603:10b6:610:e6::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 11
 Nov 2026 11:56:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF000166C4.mail.protection.outlook.com (10.167.244.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 11:56:05 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 05:55:55 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 11 Nov
 2026 05:55:54 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 11 Nov 2026 05:55:54 -0600
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ABBtsTr3335598;
	Wed, 11 Nov 2026 05:55:54 -0600
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 318432C86; Wed, 11 Nov 2026 05:55:54 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Rahul Sharma <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
Subject: Re: [wrynose][PATCH v2] am62pxx-evm: Add tisdk-uenv configuration for display support
Date: Wed, 11 Nov 2026 05:55:54 -0600
Message-ID: <20261111115554.2492617-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261111115027.3278105-1-r-sharma3@ti.com>
References: <20261111115027.3278105-1-r-sharma3@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166C4:EE_|DS0PR10MB6029:EE_
X-MS-Office365-Filtering-Correlation-Id: dd734ab3-fd7d-42f8-1c49-08df3feac440
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|6133799003|22082099003|10067099003|18002099003|13003099007|261026121527099003|56012099006|261009223027099003|261102123227099003|261022075727099003|261026140227099003|261022105027099003|261021121427099003|261028144727099003;
X-Microsoft-Antispam-Message-Info: BO/eqzuTc7wb+y53HON++N4RQHmRWaf0vc5siYLbnpVKoVBxVMBaEMHOZueVHZZTd97Kw6vEb8MeITuDLV/z+ddyWPZWmO61it6NGS4C1eIVET84hN3sKq7qrRLtGbinvOHXfJ1oELmolwiHrkxXAAHkNylkiKpj1KftQaPD22C2be2mquSobRgZwwEP2nvddLi2VY8Fq1lRGH53op8jyeiclUEMCXSztVuY/tvno2sOg6ljA8UZKEGccl1ftMY6d3mNaL51+BMP4CMyP535fRSZci+3h3fUh13FUjxrbatnlzmgdhPWGovZaZF0WuBSEEa46AzIk+QJo7iSx52J1ujaNupm4JG3XZOVqwqsx6eBjEwlIatVnwhUup8+sdMvJJc2MsXrtksVcfY2gSxoXibf+TPxFwtOMH9b6XBP6itTUoxJiJ0LNtk69av7rwGcCUmEKiT0c9jkJiLSxs5yktFKZ8q64inOZmvJfhbSmPpLElFuRv74NUwjarv9zqpmfOKi7KMmg9pgOZKi1sCJ/sze0+JDt1uw0kgRD/PFIhHZrKjfB3sHc6SL9AvMzSNIx1aEWQeAc4dWIfHi1Uvz5f2B23kM4SQaihums1khNHUn8c98kvk6oSHVD/akYA2CiPYiQ74teHVBR53PkvHuMlP/rDn0Wrk2BQK8aDf+Mn0=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(6133799003)(22082099003)(10067099003)(18002099003)(13003099007)(261026121527099003)(56012099006)(261009223027099003)(261102123227099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021121427099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EJ3/orMeWPdzcPyzbrV5SDKVjqh5asLreqPL/ar0uBG8ntcXtCFXbDHiA82ojD4wbnBR3i8OfvG1AdBaNHwEKfMwdyegrJ50dvnC3XeRvsIcEqHA3d47EDPl1lmfz4oVCWXVv+HD40tW35/Ixgi2xFtfKmoq8KjIDSGDMe0kSy8Of7aI6aZNwyx4gxsFX9u5tddhHwFJaQ7x4Ur/A+eORPXukbRApXBPquf+XvmLf9AzImcEd3foBEK0lsZnR+giOMgUnefOPL9KEBiOzciuHWGRPacWk1OGDgI5BgokgcUV67bAS4Z9aCQDKIZk0/FHD6CT97qWKLgxYYtuK4jFBcTy7Ecdeyvg7eHKQd+JDjeKEEliLVwFGmig4KyiK9D9SmpN2qyhntmMt7z5gK8I+/hZBgAVtDfBf1mUuYcVRsGFpSSsxZrQk++w6Vy7c6Ru
X-Exchange-RoutingPolicyChecked: rXnqKw0GMwLOLtZCKddCmcHMht4rUKHSQx5asU4HX05cf2bXLikNcxh7KP6wNyExyAw4P9unoumuxVItCQqVapvUmvj55d1dUo+8UdiMamiSVZZk8Nkw6oxO6SV7wtLyTcgzD0k3RppFLgwdw2ffnCeYibqw5lI0krh5N37j8IyPapO2r7yqpyIxxW0JfQ1PlfE/RgChqwpb0CgO+j5WJ1qZgyYl/gdHjnDlCs6zcRd8efys0vbfdv0VATfUmb1jTWUdjb1h3Igd85+oo26sHb/N+YrlI3lE68i4OD7Rg/xZEveuZL10tFdDyv9JW5BoyGNOyOzsYu8x2Sg0r2on/w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 11:56:05.6355
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd734ab3-fd7d-42f8-1c49-08df3feac440
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6029
X-Proofpoint-ORIG-GUID: U55WAohCYnev_6__O17R12Okbt-hiZNW
X-Proofpoint-GUID: U55WAohCYnev_6__O17R12Okbt-hiZNW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfX85DtnUh03Moh
 4r2vUjLTEuGd9K4g7DuVR+U6yEwooUsDZuB1+ZG9GP9NKvLqTi9yAtYEMfWizE5ImF3McfJQo5Z
 ALbswO0AQ0aJJdofs9VPaOUrnJ8n7wOg/GDiy45vGSTH6WCeeOUW0MLu49uT0kA2PhM3yZXA3lq
 EPQCjqMfqx6qtG2AiD2jkl5mh7BM4ldqdEr8kNqKMW9BI6Ukoc3wt1hqDmYxObVxnc+fTgGOysV
 jRu3Xn2a8/LH15FGZSKS8kH61HEdvLe/whRN+iSL6b75ppEZdtz4Xb3+3Br60do/0JlC+oC/o7R
 U86fkdRqOp66p9cJBb9YuQRBEseTYxyyaVTnzY+a3iLoF6me2zkGhn5OCy8RSihlNYJhVYwTPBs
 BLXsHdZjSfiOHliRlhH2B7JRNPXj+vuGHhRWyjS+s69rkEvbnPbi6MDkUAcqkX9qVCar0fWfgnG
 PAZmvleAFDmPt5QcFfQ==
X-Authority-Analysis: v=2.4 cv=SpcFe/O0 c=1 sm=1 tr=0 ts=6af457d8 cx=c_pps
 a=AqWYtYKdvuqIQX7AE/aD9Q==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=T87pTOIYAl7zpa_LeAwA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0NyBTYWx0ZWRfX0tIV1jEgbbZW
 HHPeF9TqzEgiqaHrw8RBkgQi0PdfgaCKsQFeYHEPUU2jsJf2g/87jfnfX7c0Vz/Ic/xHC2LyScE
 1jGuC/PvcuaJQL+psO7k991BCYD7GeI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 11 Nov 2026 11:56:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20526
Content-Type: text/plain; charset="utf-8"

meta-ti / na / 20261111115027.3278105-1-r-sharma3

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [wrynose][PATCH v2] am62pxx-evm: Add tisdk-uenv configuration for display support
    WARN: Commit message does not include file/recipe name: am62pxx-evm: Add tisdk-uenv configuration for display support. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: am62pxx-evm: Add tisdk-uenv configuration for display support.
              am62pxx-evm (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
wrynose
=====================
Summary:
- Patch Series: [wrynose][PATCH v2] am62pxx-evm: Add tisdk-uenv configuration for display support
- Submitter: From: Rahul Sharma <r-sharma3@ti.com>
- Date: Date: Wed, 11 Nov 2026 17:20:27 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7a9b350665c376b35d10a4e148881bd98cad65b9

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
  check-yocto-repo: FAIL
=========================================================
wrynose
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



