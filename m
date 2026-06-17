Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6707CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 09:13:38 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11424.1781687610952358062
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 02:13:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=puHyjPTD;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=eMSRmjus;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65H8VCNl249785;
	Wed, 17 Jun 2026 04:13:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nHrsfEjrirNPw5/5S58RY2sG0FMktyqnbWHHIGxBW
	HI=; b=puHyjPTDDn0cPpbVR3gSeo66lEwQb7JTMc4jK/diZSbo7XIrbrlteUfZ1
	ODFy5DqWXxmW4APELe7Ys46HAJcobut7q+C6EPhZv30pYsGdKOOGDsVYmH3UkcU7
	oNumQGecgSICmNfETI1SOU3EH79M1o4Xhzn6kmCQS+DqOj29iCNrnkEvhn1GWN2d
	xYIECGS6N2M4DqEzZLuah3mT6FKJW+/znxBaGsuCnMK1NqOwWwNQrFg5n+dlrX6V
	C+QGuqtsCjq3va53fnU82ZjrW6Y9JQlqYU5LIpCkoK7EcpTtFTApEiLpIclrLB7g
	NSX8dPZ4HbF+U2iSb9BpH+vQPB25Q==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010012.outbound.protection.outlook.com [52.101.201.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4eueffbr0t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 04:13:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bZoyhw7NdZlGNQwYaUUjdR7tHVQ1Gx10BtHcZUrDw5QXuSzudzy4qT5Mxva8zGak195rSDQ9RPZHO4yoTBN4wpMn+M2Qj8E6zIwF5fJ4kUEodlaQ0g/f6rgdJ+NFb6uKYXQtJIjHBEN/jg069cxALIGpjtUAiAoiNLtFl4wrzRyga03lppLxE3P2eqDyQVVNGq709C3ib04gWVUeWoJyMV7HCBsazo0/GjDrdP/usLrt5pyl5ZPIUzmUZnfgBBuaDTtW6fIS+Onl/HXyKf6LXSWq+yxy3DqrW3i80yLnnoMDBqfRLHdaP/dGA+UVvomG6FiO2lEMzBEE/Z8dy5QeCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHrsfEjrirNPw5/5S58RY2sG0FMktyqnbWHHIGxBWHI=;
 b=B/EC1EUfav2a3qa6rC0L72fthERXo0DxQcc14OsuPwAvM4Vr+TAK832fL840FMucUGHDa0rFHlYa47jtUDF64JtIG0qAMzj+zp/9S5sbkbRtXwREG1RIEWDOcn+zDzzrC1c1Maq1DSoi/NpUXvQVJZwiZz1OxODccWjFMgCF9Li1CHQ1colIUVBLmXXr4gXZy6Z6riQMBjo9C5jEHgawoWDvGMxM/RzYFABrZAjN3DUfrLy8CHkkm1sDKrKKh1C/huxCL6XLCuqcvh3MnFgdXvN98lWhT4NJuGKzTF5H+w8LCxdycNEZQaW7clAq6GjIN8HUM6Kd3P/9o5F8RrvvBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHrsfEjrirNPw5/5S58RY2sG0FMktyqnbWHHIGxBWHI=;
 b=eMSRmjusLxJ0okgmU55R8ASGgLo8qyt8h4/oW5gCTeHZ5awhJcxsLW8AB8VGsXbz0oXG+IWgSbdk5wj0DKaz3qXUZSkhxtA3Jwze3Fqiio6aJstsC9RwAAUxm5aPMHCPFcd47L0voPS2e+vOwGTYEcr6l99hW5sPi/e9EDpm+aQsXEuDPWXV+o2qTW2vO1+goJg7PqjfZkLqaEh63mD6DS/QiiG4py4+SS4yyJhZizZkZS5g3vgduzB2/gseC59T1NFDHSuet+O98dsiQ5uI5LUZ8/PX71fbkkW1Tftu24ih6mhCIULJi7G1cS7fMg9ZfF+p9n8vEniRILE3iVhJZA==
Received: from BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14)
 by SA1PR10MB997715.namprd10.prod.outlook.com (2603:10b6:806:4c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 09:13:27 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:2bd:cafe::40) by BL1PR13CA0159.outlook.office365.com
 (2603:10b6:208:2bd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.12 via Frontend Transport; Wed,
 17 Jun 2026 09:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 09:13:25 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 04:13:23 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 04:13:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 17 Jun 2026 04:13:23 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65H9DNXP1405376;
	Wed, 17 Jun 2026 04:13:23 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 010509ACF4; Wed, 17 Jun 2026 04:13:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202606162200
Date: Wed, 17 Jun 2026 04:13:22 -0500
Message-ID: <20260617091322.398914-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260617085426.756396-1-lcpdbld@list.ti.com>
References: <20260617085426.756396-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|SA1PR10MB997715:EE_
X-MS-Office365-Filtering-Correlation-Id: d284c484-6af5-41fd-857f-08decc50b02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	zrf3EzqWQt4XtdK/22Rm2+CxUG88QGqrQiyOJy5yzPv7vKZvWBnIHgCKQyebYiIbt+wdQCvrw8ZK8KLzNbUmJJdJEMEd6gHx8j5JOp8qA+QQjySDplkcBtzbKZFpNt2TIxuuFEs4zBif91MF9tVfl2Oty3EoLXw0eHI3qNlbtPxPrD8vOeJ4gBvcxPCs4gEQ/yk2NvJBCw4sZ7ga646ykiV6uRdmhxDSIZdNAO6KnhWpJTOirtKEJt4Qm02uMsUdEdX2KzbK38IThrEULYHucaRqrp07ucJ4CmSI16Ekt6fFwm++vzrsyTmnkp+0UhoThzOhYMr7JHdNc1p7AEkoLUHZKUJVLULa4K/e8lhBuKzR7SoXPaL0zwrO06tLeUeMcGX4qAczpc5jRXIqtsH1LKHGz5sIcKoZSAenpuaAu/phSCFCjc84EQLtiQtOX9ltzY6mgYczLoXC4aRWoAMQld0PEf/AqabWN+W745R8zPj9aRWs6UWKoSUoJi6O4NKx5aM4cNo1ocmcCDVHtHOaLajB5MyN0P+Puf+5wScGCLKYukItDjkcbLLVadoaYi0TlVehzzErf+5vpcnHA4IrVeHu/oo3QkX/N1mQdiCHYKK7IbiwzfAJoLbMfr5FL1tKYZ313putuHP3kR/SNmOhgK/C+MzZS4G8ft4dYLLeFCEmgedx6qNhLuytKXEkIMN1j2i7+YvBuPkjvPm4tSWqMtaWmEZYcttENiH4L6PPa5c=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4rJqoXFydcCUMv6G8W61zSJrEhjAZuQM1mc/MWGNGALROeH/RDSBrFOTI0DUC0wPitBMI1iDOxig39l2Fxmc3m31/MlTdREoWeXfJxvAvI2nSfbx9Jo6tmyBSdsP73gvkVgpGGPtfEut/3ibiRzFI8ag8YnmKE1XB8VREiCuGWRvjy5Tw77QVyi5pXea4MZyRcyD3VAYn/diptYRplZikweqb4DR/uFIXKbrmWKss9BsP3lt3IRJ96K25m0Ga/4ba3YHekdJtZOh4Zrq3hBkGmYJD0tdxqRuHEOOT7fXNCnsl+A6TV1J1EkJrzo+74Tl4nvgsTnx14zKVnSXIaxmQ+dRrT5d5/dMPuj/pG3ux00NN1jcWCcvSt4sfjAZZYbfISvPxd0p/iHTjrdH9tlcF5UVCTO25jYtP4BMLy9S0EhGYjhin15kf0yeXAPUJQe2
X-Exchange-RoutingPolicyChecked: 
	BvA6wC+SaEtRI0/AP88v5me73XGNQRiE4l0udsLm3axu+Wq4DpRocPxNwroHlRoMK02hKTLUQXLSCrBAN8sOsNbIFCW3iwULND39lPxCRjryM9I9eUNnnrJLdIzaBhx5QwnWq+GJJF2xkeo6KAs6HaCEGqBGtnxYPjJpobdl2tZLhIo6oW4hTMeCuKmto6qUz72X5mlBhBaS95Zr2k7VL2CnbUeppz2Ml2CZNvIZsnzjAAK3TciNhXUNWM3R8EaKPX77iojFNqmXkQc0X260vUIg63I+L9PQKed+up1WQnCk9cbZcEQiRi9AJZZsI0RlN5jog9RveQKHQrXMUKSP6A==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 09:13:25.7039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d284c484-6af5-41fd-857f-08decc50b02b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB997715
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4NiBTYWx0ZWRfX/P3cvd8CtnIZ
 VKNDTLq7SQw8W75fvxEt7yU6KjDfdbIdfJg4InmmkSmcgIZYw6nD2sJbtv2xX0bcVF6QBtQdZ9R
 +RqyvMNcWj50vgckl47w7TsGkFWYQpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4NiBTYWx0ZWRfX2EYI8573OOBa
 YedyR6spyXiD2IusPODXIJ+sCZtysn2E3M/zU/km3HjNJiJ7FpeE3au9/2aEL6v+4So0qSaoOHh
 3qG0rTqk0+4XOLdVsdB+UF7SZpicYrQ2FlVVDPSTix93QiC9hiXj/FG/hNfb3QrxhDtdOs4m8Vv
 Svf9FlHBjehtwMyWXZw7fPtlmb0qvM3+VJex+drj49mscQwtdXhcRxnvp5zrMfF1L/WPHTrpiuW
 meBo0hnBG2pyyZDXMJwzhN0l532KPOBYlQEF2fLSpqYzakueS9fOm8MC71hH4PmrF5OMgq5M6+f
 Q/EkO0SUVemTK0k4lEt/MRDBeJkTYA+T4vgVVTScAMW2pbIb66+YJyD4wSfbMqrqyo1XWUzYJaH
 G0JHR7iU3rgsirSEsAKnmhfPYvgDizB4ACo3aG/UPayhwa/+aHD6XaXY08I33FiiSP6fsafe2QN
 znGRImGQ43VW0PL0goQ==
X-Proofpoint-ORIG-GUID: jtCEzxwjC-l9vQ7mZM-SKhS4Z2EUHyAf
X-Proofpoint-GUID: jtCEzxwjC-l9vQ7mZM-SKhS4Z2EUHyAf
X-Authority-Analysis: v=2.4 cv=KKdqylFo c=1 sm=1 tr=0 ts=6a326539 cx=c_pps
 a=jCxDXDPT0EaKR6BOOOS6sQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=-IAwjkfbkYPWAovTjIwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170086
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 09:13:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20041

meta-ti / na / 20260617085426.756396-1-lcpdbld

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
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202606162200
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Wed, 17 Jun 2026 03:54:26 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 7e3a9ad4efba24bda0c7e2bdd0e170764731a3c7

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: conf: Add falcon support natively
- Commit SHA: d2d075cc819a43946149d76c3a087251bd105aca

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




