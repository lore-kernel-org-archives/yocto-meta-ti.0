Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA5D8C44501
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 07:20:43 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3740.1783581640088941233
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jul 2026 00:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EBHzBuh9;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=kU/2+XWU;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6696Y4wt299113
	for <meta-ti@lists.yoctoproject.org>; Thu, 9 Jul 2026 02:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mh+iuhCn+hy0xrVLW7vgu55ykjWsIgzv1ylIgT/wm
	kk=; b=EBHzBuh94G2SbemSploHURWCekirie2Ds5y7wZrjPbDwkp5WRI+yNqaGZ
	o0D1qGE+LuOHWQzz3UfZ/8WzGkHTRx+S9TyeWidd6s6LPHwLtxKjAZZUbPRl7oc6
	UbPk+AGkbAt6GRLNDDZNms6juisVWuOL+nMghzH/kZnI4nC1JcA9xUns68ktaU3B
	GyhmSpJG0LjZYGORfmuafb6yJzUkSkOpwC4Xvf+xi2fDtkq8HvOPWv00+UYMxiL2
	0zRL+QLhBP82WlPk62Jew91i8tvM8kvi9ID3wgiCtyMdzKNhZnNaRWotC+Dq3TI6
	7RbBIDugM4DZX4u5VjG3HrTKA3Bag==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011065.outbound.protection.outlook.com [40.107.208.65])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fa19622ma-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 09 Jul 2026 02:20:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzcNEk8KYa8p3fS280xwAB3z43O5fwcbIRtY4zabnHKB+LL0g5EWsqztoCoz6vye3d7t0U1oDtizEHVw8t2hF4WiD1QgrcPIfd4NVVzzCxM0F3keL5IOOJ/xkMlC8qzJa4WFMoHpBypiPFRTnoW8IBWYW3y1N1MO9ul/SypCXcb2R9bv0LEBxi132gLV8mV223eRJrN7TZh8ChzZOHy6oQY1ShJitGvWPK4ZG+M1GL5bo1kA+1vLAV1qJ/68zKBNI8F7rz9fXkBT9o8LMPAqNDJqCFQugeb9BpEscTQTXcn+FrCD6ZYIJsaBNV7+Pe5XSS3BdPxXXO9Sgszdpn+iiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mh+iuhCn+hy0xrVLW7vgu55ykjWsIgzv1ylIgT/wmkk=;
 b=sVNIzj+n32GCJ3aHST/39mirM9ns6hzcwdr35SBqhGQNbCwnn/DoU0mPCmzIqDJHDX9yMN6cZIbzMB2YXWaUEQH2+obj5263cSlpCf6EVr2lmsZLhtnTvCamjmImtebamf6/H+q8fcn1XuPk6O1xGlcUclcjwk9nNFMCLHbdn2Nz0Bgf0Dq750skgBPjpL5g/1CYbbIpvDIAj7sZsO7a5I/lSYqJ1/CSX1Gi5+Yek/IYqz4gMVWD5iDZTOJ488L+P+RTkkTA0YNK7Xr6e/zDVSXwr/ocVTFUiKzg/YnM1kodAdNDFnLncMKXKsXY5f7bPDJR/LGN+26FA3pOfJtf9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mh+iuhCn+hy0xrVLW7vgu55ykjWsIgzv1ylIgT/wmkk=;
 b=kU/2+XWUtvdrpVJr9AXfbZvNLMBFDKPeI34C8uliOmYY0N97LkFRr//cjtQ0Wipmi/UJsF/CCve3d24JqcFK6hCy983GrRnKWQ+wgYWv5NHxur+/H4TsI1JPjdMi8BpeGSILO96vZ87Vue6IjvcyL9F3LaHIuWc+Vc8Gd/v3h9GY82J5S5cUnZDTISLL1eGr2+VQXKjySmUR2IID77nvxe7JhDxqj3vh9KbhvVZ3p+EVI1IW7Q0Nl0DCKduCEjAUZVoeLq+gDmCYqMh72rveRsvGW+zcUQBKrwdeTF5mfuZ63xNJzbQxtFND7LjlOdFDJapmVuHxflQxApF72tek4g==
Received: from SJ0PR05CA0162.namprd05.prod.outlook.com (2603:10b6:a03:339::17)
 by CO6PR10MB5555.namprd10.prod.outlook.com (2603:10b6:303:142::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 07:20:34 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:339:cafe::af) by SJ0PR05CA0162.outlook.office365.com
 (2603:10b6:a03:339::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.3 via Frontend Transport; Thu, 9
 Jul 2026 07:20:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 07:20:34 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 02:20:33 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 9 Jul
 2026 02:20:33 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 9 Jul 2026 02:20:33 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6697KX8u3987921;
	Thu, 9 Jul 2026 02:20:33 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 5EE6D9ACF4; Thu,  9 Jul 2026 02:20:33 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: MD Danish Anwar <danishanwar@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <j-rameshbabu@ti.com>, <reatmon@ti.com>
Subject: Re: [meta-ti][wrynose][PATCH v2] ti33x/ti43x: Add prusw-fw for switch mode
Date: Thu, 9 Jul 2026 02:20:33 -0500
Message-ID: <20260709072033.3097142-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260709071759.1470961-1-danishanwar@ti.com>
References: <20260709071759.1470961-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|CO6PR10MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: e5623d2e-5bb1-4765-082d-08dedd8a9118
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700016|23010399003|376014|82310400026|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	Cq6lRxtLaPmcSLUBJFewnvUtFDihoNi1pdhUq01ljx0j53EmH9EmW2qEFtUTUkEjgMnAXv5JR44HuhgAU5SCnGSZyYyy8o1gviuA5FsdY2l9AwJ+w3Sbt9r+uLMc8MKrqD3SonTnu95eCpYd3bBFRnVWgjGGtVeuIk4nX/QgNCBJqCp1O6k7o22LQo0g82Jb7mraf0WnfDYfEIX0YbcS3WU0GljdEE5Q8+dWTl6tInRss5XAtSOzSfBczbJ1+s+vXm7ISLcSiwHVUG8GD0dI8cS2+6tRUjAJdAUT+pNgaWXAPS9DdRZW/VMlCTQTHNg+sOk+iPWgjKwZra89DXFwQHCGbMRPxXNJgGPrkXB9mnykOxrkk8bRCJZ8dM5b+NNVDjiHGYCYQjBElXRbEvupoXwqmQxoL3zy4KgyxKSDfQ6BP04aGLTI0aIhFhXuxYG+fOp0MO8yKz1ygU+YKlN7pbNJI97uif+SqAhYbiD0H+Mj6XGhNHjCG7a14JRCk6hrewKJUcmUnWyHtips0nkkUApMTeV2h58gRqLvI6w8YjBQXSdIQsgslYsXV8c94pX8e7yFqxZBajJ65wePC/JKTfSQEN6FW5JwYGR6zmvuLFKTFIZl22V5EP4TesIAWn9+oMcvG1S1QvQmLGvn+Py5AvxFXAactIDiJN74Va4irVuJ+/fVFGMIglrOpfen+iFa6FRJvXD2mfpiTnXu14u04g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(23010399003)(376014)(82310400026)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7YBoEQBJyq84o+NImIJH3yns2Ur2UxBZdJ6Z04cSiDeO8WuOpr8LZ2kALEP2/+jKr3C8ezKVDSatWXs0Pxlso1i+kk5oQgAn98hBOqcE9H46ZuhF1wBhq0RaXbVX76FR8e4bnR90S4TYYFoYPrqkBzie1AldrmCir1V5WrMy443lsahQY3j3nT4mgkIMZPcWL6B6dsr7gru0s8mwMLfYfiAttjH2J4hSqnEASv6AYFjB09Pp6i0i0URCKGHyzbpbqAMobH28ufN750FdAEnUF9IW3Xzw0Fw6y8rOGBlu0sm05ogOCJdsv/j9uo2Ir2LoNd3qJFAK8N0Y6RYAx9ZBbRfCyMrYCLmLTk/MBXxhA1VJG66jAKiEBEQvtr+q0zfNBa6oPGdVfpGs5LMvRLLde5xthnR/vy3eelNKfzTTp/2lCDEsZ3760QsNr4PoxLSg
X-Exchange-RoutingPolicyChecked: 
	fvXsY5DFR0l3YnapJVIPTdnSqsJLZ6YNhUDu/IEVp3DxrR8e6Y6X3bDbjl9Yl9y0N+VcM+qISE0FFbv+s4oIH5ISruc32GzFGghx4qHJOoirvZXsgAolbKi82RShcqpWQvg4HYROMc7wQ0Xr59mGaWPJ/rdrELf3RbOI+v0xxpidGqs2a9E5qVllQovFFHC8JOSAli4rpFraHhLNJVow/cnKddAEKOlXyFr86Oe1cRxc4P8F3kbSC5Mh5xgQvXnDv14km5IhulvUWRT7akkeffu1UJdIVFKfSlSd9/vubgIDko8PoDDO9b33yZmbzL7HrPMVQXx0j4g+QBol13h2Cw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 07:20:34.1410
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5623d2e-5bb1-4765-082d-08dedd8a9118
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5555
X-Authority-Analysis: v=2.4 cv=Q//iJY2a c=1 sm=1 tr=0 ts=6a4f4bc6 cx=c_pps
 a=qx7sgmNqCaiUqJuMW1Xodg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=QYw3SPUrUWfcgG8UiVsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: JL6XFeCkBIlZp1lvSYgO5IdtCb-xQzVb
X-Proofpoint-ORIG-GUID: JL6XFeCkBIlZp1lvSYgO5IdtCb-xQzVb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OCBTYWx0ZWRfX9W1mwMIW0Q2D
 AwzNvkdXgWEUQTkMBaV6xQOcFqUBm9OcH7IF21GyGCp8t5Je2vEVl+D05Rv+2BsazMy/DKuntN1
 6oNEoa7tH8PQaMgt+a+2asjUqme65oY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OCBTYWx0ZWRfXz1LkLAwiW8UI
 GKU/OzcXfpk44lZ8Wn8n8/nXO63bUr/Oq8zERI+at88oSVPXc7uqeuzYhOhu8u94Tzjbc01d5/B
 whHpOHf8mVgsOJl6fIDrARsyYFCCR5mfYdMJlb15xmryGTuKMnp/8EEpRvNIN+G/aSpEUXuwKVf
 TsbNj3sOHPL12ai77m+jWy3eNQz37Oudptu3pEXMJeN8Jba+k12uMwRyKEnbAxNurAkDiTF2X69
 9JDTcba4oT9akqbzZS0YbrrTaDiVPtOjWE35dTIY+mofDmCtH1G4IjgfidQDUWyJD68CmtmOEXJ
 YGVtDZ9nPArelvb+ovEM3/lyTM4WbQNBTv7IQWEJqUJE52NNAc3oxTRFiliYVcQ3/mx8oc6zYrn
 /fUyHv0q5QPcjJj+kGn7OSl7wioK4KcM9uT9uz5t3ApYlDYyL4e5UeMNs7t5nayHgjVSpwSjVQr
 ZgU5MR60TPe8wbTkuWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090068
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jul 2026 07:20:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20135

meta-ti / na / 20260709071759.1470961-1-danishanwar

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
wrynose
=====================
Summary:
- Patch Series: [meta-ti][wrynose][PATCH v2] ti33x/ti43x: Add prusw-fw for switch mode
- Submitter: From: MD Danish Anwar <danishanwar@ti.com>
- Date: Date: Thu, 9 Jul 2026 12:47:59 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: b412098bdc10c1200263a093560ee7f82eabe221

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: wrynose
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.wrynose.202607021223
- Commit SHA: f24703b72226b6ccdf662379c96bd60c447e4dfc

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
        meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




