Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C96F6C79F80
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:52:10 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10360.1788515521341261894
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Sep 2026 02:52:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=byH6l+v/;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=gxMdEbyR;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68461ACp3096712
	for <meta-ti@lists.yoctoproject.org>; Fri, 4 Sep 2026 04:52:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mQzV/oX0UU7cHF+i2VaHQ7R7r1jjhir7//9irpag9
	8o=; b=byH6l+v/mWMUimeHSyC66cMn7OAxLxsxbcBv0gH+SshAwYrsbB4nd1Zqf
	S+gI7Mzw8YV9HrYs+PZsGgLcQj83rrWBE0IcGajmlgix7xkBCf98LXydpycCpE9R
	Zz4LpS0pFGQN27qSHwxlyAve8hfvtsJc7S8nLwyCvfYdQ4MsckUc1AtjNwR2CzNm
	XJzMvez24RfeapYjmr2Un6yOlX7px2Rw2nwA9kkbvmNSNbF0WaFhZFLaAsVrd25D
	gTuNAhp2yBgHpe9A5fmV8Pz1dxcGlV37TEAQDsMo6eK23XfXxOGr7g5URTH0amfI
	bXZFfjekPoViMiJ1b4mi9VFGwjPWw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012062.outbound.protection.outlook.com [40.93.195.62])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfdfq59nq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 04:51:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xUhkQX6nbWzUQolgrML58CGyI9zqW1FHfBpShfQbTOtDrz4OSdRnRvN5d6pWdFw9bnT0d1liBO2txWgeAWRrOstTNFOAcGVJaOB59HLFagNCHh3Zo5uS2NxwKqf6lGEZQ4vVnDnlqw7mPsHDsYjnfGopQWtkdxF4Z0ZP+lOfPlHjqwTeplsrX9Tt6WzFPGIShyBS2SITOfZUhQ31CosBZAP3WgoYgwtze+R3Zunlfb1B3Bvke63UIBo0+Ui+hHBNEY7NO9wQrdvgfyyYueMrD7iF6sG/4gXdFYkZMQles6IcXXRSRi1Oo1LEr02iucMG8LyX0YrstBVFFSsgt7puKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQzV/oX0UU7cHF+i2VaHQ7R7r1jjhir7//9irpag98o=;
 b=C6miBOrBGBV71/W1Ut1l/qyxCFSZjxQYN5PLTJO2xWlfBmwIMEOk9EAo898cfyc0K1Mhk0Icj/RhGj4j09oSg70FB1zMTu65Mt+AVRPA4tykTapBcVo1AaHpz1fPrWc9jm6PIhsBS2u6eAKrBBaFOXfgfS5x9A1tc4jeBg1BYrqR56pRu0nX2NDZMpyVL73NDGpwyIvJM7mc2hzepuwIWhXChPnkiAxmCemadMFSTpuSJpu30alo41Q4LLZ8wmlWLv4gBrsunxUQG8OlturS3ozCAZ7M8NX0pcVU8E4R9kVfgf7VEX9YD+jFR625ky3fHnJmwyh+KEouxDJwgWCwlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQzV/oX0UU7cHF+i2VaHQ7R7r1jjhir7//9irpag98o=;
 b=gxMdEbyRo+mf3KsjYyYUpGVSNUckRwGcore45ouH4qHXe0K6PdtjV49oOxd66hgubrr+vCtN8Ig4zpDBcJgbCxlZ+RRVpjzikGyBdbVnHmhmzcyv/GDI2SAtn5sei+SF1cBimPH0OJuFN46l8/xJFaWki+qRFq+JtjCJnWVLhKSEIQAXVz5oAV1NSQVCCdH/+sd0dZgegkQUKU1gvbeDmpB5ujtfTLPBpopHNfdiMWrOj2z3N95hkIzoLwRFNog8CqUk7xCi15kLgpnWEOxxtU0gs9yvyLhIbyEg8HReJY32+mtkBs/STXIN8aTWvHZqBMoLOF0lJKURbSdBZZifww==
Received: from CP5P284CA0223.BRAP284.PROD.OUTLOOK.COM (2603:10d6:103:22b::17)
 by BN0PR10MB5141.namprd10.prod.outlook.com (2603:10b6:408:125::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 09:51:55 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10d6:103:22b:cafe::3d) by CP5P284CA0223.outlook.office365.com
 (2603:10d6:103:22b::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 09:51:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 09:51:52 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:51:03 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 04:50:51 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 04:50:51 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6849ooLC1646013;
	Fri, 4 Sep 2026 04:50:50 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 4944E9A9C4; Fri,  4 Sep 2026 04:50:50 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Atharv Dubey <a-dubey@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <m-shah@ti.com>, <a-limaye@ti.com>, <u-kumar1@ti.com>
Subject: Re: [meta-ti][master][PATCH v2 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Fri, 4 Sep 2026 04:50:50 -0500
Message-ID: <20260904095050.3924233-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260904094606.3233160-1-a-dubey@ti.com>
References: <20260904094606.3233160-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|BN0PR10MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6f3435-98a8-4808-798a-08df0a6a25df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|13003099007|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	LwE5EWxm+9yymUK++TVJpAWc4+JNDxAaepC8rmokb2uWPx3JBAs/RFc6KbO5+/HWZGJJk9E/UZ+MUyRl3R+h36ru4LW9rLovnyOKuDlrtt1mmTwPTpXpH/ARhfneRBeKHHDPebGpf1ot41kc0kn0kIobS2P9TQi19WMDnP9CFFbUOHkyu1dlMbyzfipF8v4oTD3K2MYtCHTbJE3vGoVUiQvZF0zRwTa4nL1soNiuhUmKsbio3ct0OB4ytTxc/d1TN83IV79mDWjvKODnCwkyyYbruCVscmbePSNl1KnqnjC/OsunW/S72DWlryseEbg9nSOB+1hHoXBAvWGkiM5ymv/2ldy82rCpm0xewXtBxpNJtMs+TP3mkrNS7327qhQdUdglyypMqXaB9cp8GnD0CPw2dYqjxLR/sr0zIdVG3B0DzTfL1CnMCs4mpf5Qo5YorHstBmAwYUPT8ktORWbJBq3wszt++IuXEDwC6ZNYrOUuco5RAO0F3Mk68tRY5tVYqOCLgV0L6sDE3VIrF/yWwb3aATai+MQCYdm5IK9Q9ocVsDLTgXN02rKHEc3S5Flfas/o8MP/1bqWZbzFhKZXypiYIlukS/CD1rKZoDoT9wMW9l0eGCWrniBlF/xaY7XFRGmDzVZTrxvT3CvttVYBzA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(13003099007)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	wBaJ2hjxbS9ZHu/6GS0LBJPhEAiRl4apC9o39+qYtHGRxlVI2LVoUpliJSzZW6YIDIUJLZNn5vQuqSP2wDowHgqOiBHV02vGmXI/k2A1JgG3ikeXKInvT1YmBtO+fjSglk1GUW93wELhMVET43pPXObT5PAkA2Ltf5vm6YmuU9L6qB4gDVmjh4mvFbMkp0X+7apTjChuhGPYjs8YrQsHQTse7oXWlhXh8+81yWBqLWthmi4VlzrQVvISe1XnsKPPvj5sz7hyrXPJ9UBctHkSz+sKmSWZYUvSggaYx+y2BXMJ9BWtt/bSrsxUACYl9S6L7n5g0b3/FrPMQzNNjXjiQyFs3zvav/2JH525lqQAESVOkmMT6iyyY+q/JLSFQpAQEtaPU2N54dfaZ9Cvd5Fqaa9b34JrHJs5JxdGHmWhvnnAu6TgVEw4DYYMyCmE7VqC
X-Exchange-RoutingPolicyChecked: 
	FTyZYclpsrkgiaL+AVD92vLpu6fjNRXpQ8oVPtPZiW0hEsMs0aSI2aj1LINOwZ/kuLc0oDi2/Udw5yMPMZJBDb1R8kDb+vfFRmcAEGU2DtY5SH1+wLUGXEnlzZ2jqDEtdcqYOUbcGL6O8QVvTnz+6LQRKE3uRO0S4cXU502kZasBWwdCdMWouPLJQb2aDmcoPMGhmC8YbADVVrOQbi7S2SoALwd2tnv8/+Dz16ar++zgyKmvDcaF6p1Mu9c8ud6IFB45Z+zROpDOSO1BU3wUNcrtrSAjxJg1EhHW+217jBQRe9YSJHWxhfVYARbIh1WmAom+FSkMeZ+plPDBjiv89Q==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 09:51:52.6889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6f3435-98a8-4808-798a-08df0a6a25df
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5141
X-Proofpoint-GUID: uVkTLL_wOZc4OLie6oq9M3gQn6gTaqXT
X-Authority-Analysis: v=2.4 cv=K8YS2SWI c=1 sm=1 tr=0 ts=6a9a94bf cx=c_pps
 a=KmUIp0grITFNz0c0ipdWMg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=Vs-ZokuVWRQA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=Uq63lamayipZNw47p-IA:9
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX2EcxW85NcziT
 y+GTS41eBph4k+TpMHo9AaKMIs1Wp7kS+JLCU9aXxoGo3sLjP4Z4cbGJKvt/93hcSPiy8bmTwWH
 se+qiyir/b4SBpJfbTXCiSgfWZungMohdERC9AFjs7AZG697nQs31BSJ1ZDIjm9CLlyjh5QLdI6
 xLcxlmDB98xrzHbTxHiMSNGyfRjhblUs/pw4oLSTbIQh5CK2HXLAAY7x3Q/uzZyyu9LeYZ8T6tw
 DcG9FuNI+2m6eBpohlTMcVW3QfCgiZitBuUktvYOTMhnUMeYcBm6jcCyXEvCUccENVRvXVNJeYG
 cN65TklqfhSJIQGM5pt1fIfcHvVwA7GkLgEUz/oa8c/IgqBvrt3V2uk+LOdq/0n+7BtUCYApLRk
 mtXmMa16eBiFQD6FlntUkOZ+wqMSqekyoFltzOG1RIGzpvza7sLjQ010/rSbeBa523GZyjjiDnx
 arfZocDIl9YC3eKe0bQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OSBTYWx0ZWRfX5++6gA8G9ly2
 7K2r9PjK0TF2bhrerbiz81AILERIMefpLzCm2+56sZ3N0EODL6+c6M5U0yuq8M+0s9IaaQxZzc4
 q6gJyEOmBpDrHa4Ybm7c/ozgPuHJof8=
X-Proofpoint-ORIG-GUID: uVkTLL_wOZc4OLie6oq9M3gQn6gTaqXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040089
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Sep 2026 09:52:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20329

meta-ti / na / 20260904094606.3233160-1-a-dubey

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v2 2/3] linux-ti-staging: Add dm-verity kernel config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v2 3/3] tisdk-uenv: Load dm-verity initramfs from U-Boot boot script
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v2 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
- Submitter: From: Atharv Dubey <a-dubey@ti.com>
- Date: Date: Fri, 4 Sep 2026 15:16:04 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 24744ad23b657a1a6c370c9642c3de554e56b0f0

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609011013
- Commit SHA: 0424eea6b0f3f37e57500b6a65a24cbe39427ad8

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: FAIL
=========================================================
master
=====================
FAIL
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linux-ti-staging_%.bbappend
    
    WARN: .bbappend files might need a guard to make them check-layer compliant. (GUARD-1)
        meta-ti-bsp/dynamic-layers/security-layer/recipes-tisdk/tisdk-uenv/tisdk-uenv.bbappend
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887




