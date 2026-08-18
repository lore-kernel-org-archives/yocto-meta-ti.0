Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06FB7C5DF7D
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 20:06:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17655.1787083556517669065
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 13:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=CU3vBlZV;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=Ac5vLwwE;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IJVTkF126908;
	Tue, 18 Aug 2026 15:05:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=1WrVZkdjlvJSi
	iQbhpuSMCuJHM96blft+FtGuOhbbbo=; b=CU3vBlZVYjQ79m9EztCd8fPqadpto
	DZyf7eo+LD6skTlQEEi4nv03BLuRi2zg4upZieTOZnyovQ4Uxs8ZF+RmEwfE0WYa
	kfGJGBrEbZANQ0SB/eMgKgNba1XgVXM+o2+lDKhaFVkv+QOLeulx6WJU/Ck1fvVR
	tar9mjdXsHYjbqoO/VQxDi/9be9s84J9cuHvfyNIGmbeBJC+TMC/WHXd7QKJsQtM
	NojbF4vZsvfaexxTLMErC6qH4p7uIGJDheiU5gySghAxF8OQev8lN3nmQ5ZV6lNw
	edwG6Rx0FYr4C3rg9aBt1VJL2KfYxxUQ8xDlCSH/IPfYvQ0sbIZjMCc5g==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012027.outbound.protection.outlook.com [40.93.195.27])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g4mpk3hr5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 15:05:54 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zErWrPiC9ElY1AHVfnViu3qiSgBeiSkKUo/jrPPcTMX6Tyrj+6z1Y/Wt9p5Yl26kDp0/9YswPHrjyFWrcEFTwNYygIau9kQygDlW2tvZbTFDyQJu891/ABHrbzBW38Ll88h3wl19/A00fadBZI/E6Tn94H0fJd/PQJEUlcglBGPdDa4Bp+rGvq+9ZzguZ2dQRA8gRW0Uo4yVKtEnyoGiemkTUsYZx4LNnq5f82NfcmMS1Ty4pc+GV1hWCLCylU8yYO1exPehTVxWIMLF6EbIOF57u3TSIxEYqm+mAaQmOBXw61u4h+tFm6Ugatnkt85/3c2FlxsFPKWIQErAtD1hZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WrVZkdjlvJSiiQbhpuSMCuJHM96blft+FtGuOhbbbo=;
 b=WK9qruTcwCJ1AeeMxuGkc2l0yZlH+F5auIYAAmI3HCsTH7P80TL3XLX7wmehrOzTrFaErAXqFnAvouv9orSJG3UJJ47y9xckBPi6C5NEK9jXgWf668eTxM6U25IlnUflSQxybaGvbNWAFERRFFcmG1sCX8aTZJbqQQOChCkjiGnvYdtdAWJW0N0aQfFAz0y9LqE998sRJgFcEDjofuJCdv2lgF1CTz73Nz98R84MfpP41iw1uDlOQ5CpoCVyToUyRsqrOD7vqtHQJ6N2503oa1jxGjP3bbKmTVfjdKjDw8WtlET4irO6Fd+QNGG0og9Oqb84k4G+tLIXHeyVjq+emw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WrVZkdjlvJSiiQbhpuSMCuJHM96blft+FtGuOhbbbo=;
 b=Ac5vLwwE9UlGHLFwzc8Da2gBBCwM3VXEbxE5v76ezxyoDRc3ReuI9D/VZtwkYHs1NnHxtBq70BmBJCCsdwbEpwdT42zTDBLrBIdtlPtPrwx5iSBu6z/mkaSnFUx1yH3teAKRV5+CA/oqftV2rsv+BiSaQNBLtlRp5I0l0QIGuVg=
Received: from BL1PR13CA0332.namprd13.prod.outlook.com (2603:10b6:208:2c6::7)
 by SJ5PPFACCDEE1A8.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7c3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 20:05:52 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:2c6:cafe::3a) by BL1PR13CA0332.outlook.office365.com
 (2603:10b6:208:2c6::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Tue, 18
 Aug 2026 20:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Tue, 18 Aug 2026 20:05:51 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:05:37 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 15:05:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 15:05:37 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67IK5bJb1001678;
	Tue, 18 Aug 2026 15:05:37 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wwQ41-0000000GcTx-2OL8;
	Tue, 18 Aug 2026 15:05:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: fix pylibfdt build with swig 4.5.0
Date: Tue, 18 Aug 2026 15:05:37 -0500
Message-ID: <20260818200537.3961166-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|SJ5PPFACCDEE1A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 43064176-cbf7-42d6-22aa-08defd641a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|23010399003|36860700016|1800799024|6133799003|3023799007|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yl3qdYlKsGL0wHlsgkruQJDCpYJ36GaxtnKsuClj/zU3sKPcDlpwGHhkStRX43FOBvinkPpVDFQDKpK+MbD+V5Y6/hygwY/4Au1flMa0F4vujE1AfeHsgnnbWMlTma4bgoidUHyXJQyavXr8HyzGt3mxX8V5Qp6ofj5SJvCLsJwUZMUmlK5JJx8pFFZ/tbPt6Gqv5x0IhP42va3XK44X3r6nywHCfM6H3EUiLNbsIH30Oo66DxcCGHhxkuvSa5tTfTEnfZTJemaUfE+fMarWToq59cp2jbFDxxbApMeRUrRajNQhy9SLPWqHnN15vTOIg0Kc9nbInuLt4ykKJ2SMFppkaYE1lvpbA1x9tNKdSclAfwSVKZmmzG9QB9V5stzuc6jPRlPMHLKBZO7VFwJEFtHQ8t6733sOot5sVdIPmI9zLtgkbT+wkDOLd7C39i0MFwkxfJuqlIx9VXccJVLM7qVTvllCajbFkAfNENmXoIvD2R035wtmEaiFaM5ZsmWqbS9jQWJqrvAc9ZXnrQzHO/TF6hu0SQwDcmeX5qePTsOwA8l4D7+1DfzLFx2qurFmNvl3hD/FnbK5aNu1U7Jny+XePi7L+C34s2QJouldKudNRqPLWPfj4rSjkYaCIYmNQ8WHGkfga5mkhpCYitLoOeY8L+sBZqxfCbAdP3DPohg=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(36860700016)(1800799024)(6133799003)(3023799007)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JWTnafTltJcJJ6SQOYXmjwTDvS4/OWb7eauiniKkhW/Dul3l1sAoEXpYeMn+HDgEoO9CWu07wALJcvgzbTD/Ncsli+6bbbSQDt0xJPdoIG/X19wfN0hxoeW5Xt3r7CNDgRgn5GxdZWmur9ofDfZUOcbicjRg8QMhJFOK1X+ducICAldyZvqFmV7MHQ7XFx0Y+AZ1UvFClKAT7DheGAGITMhDCXwFeinq5HI0IO80eJhD7vFsm3wvqAC2npfz/oHhkJfqa7YIgTwWkwcevfS9riNqKPRVLkFfQG8L0P+dZmP8atp3Bh0Ja1jFHTW9KaptDsPdrs4o+62uSCwLTI0vM3LCm/T1f8vo+UiVlfFGLD4kA2soFW/qX1l6CgxnxuSv4/1BZuAFyecdiwz8qPhDWb5DENiV7uPIHnLKDetPkXT+E7BczurCf7SLISMhKSIE
X-Exchange-RoutingPolicyChecked: 
	H/cJPcIQXJC2VWYqGrQ30u5B9ET9OfsMfPwy6A1YBinqVe5WqL/YmOG4KLdvMt120grm08eN630ysP/CXLNSze6ahYlU3iRoW96NLxzZLXeA5yYq9LEsSZv+xpr9hvyfwjQ2pzIADMGa+cSvzApojrx1gATpBl8MhVzNeEFZm2Mv070n5tLkGsMQeuunVPJ0fj4bKQDFMFhYEfHq53DTziBS7t9d4ShF19p7TmAmnQNqQERUC5O0B0G5qsglLcRO1r/U2VZ6L20NKeNZVQVdbwsO/Hue/dpijfzaaGvcBZvEidIe5qkkWmJgrNUU3USxcNQT8fB2c6kiR8Tn7a8yXQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:05:51.0730
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43064176-cbf7-42d6-22aa-08defd641a3d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFACCDEE1A8
X-Proofpoint-GUID: 3b5xwyoMmbzeIiA3PZRiRz78WkTY-sQj
X-Authority-Analysis: v=2.4 cv=Ytc/gYYX c=1 sm=1 tr=0 ts=6a84bb22 cx=c_pps
 a=0pMqp0B7/3h4ah4p3fuJNw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Q4-j1AaZAAAA:8 a=voM4FWlXAAAA:8 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=gXIa7o-KbvLm6WiVocUA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE0NyBTYWx0ZWRfX5A5buJP22rcb
 Lnh2K2l/L8hbO8pnKCLRazHAiguRGwTCX8xCh0GjYMn9s+Tw1zw2NMFcDJi6NAzYmXss8IrDdy0
 TQRF4yy/tYdc/YHRfqx4AghEAu4oZJgB2vTSwoUktXmNqtYH5UAcArLnUmigup7MCF2l3oH8kMg
 OJQz/D3x7dKUHXYK5KVjV+HBJrixTx5Uze+HwQmR3V+hZECvr+CpCgUBCMrUvvxmJSVcFcjyJ4G
 THdEMuMnI0I4nBtCLF17FdLIKl5dQmuFxsi5qE9bKnFR9eo0beAmZELPhw/m49pxyhl2WhixF/7
 0UlMtTNtwqGe5z+amrQqfiHAfUHbeD3XWxyFx87IXaalXfOj0d6qpdezg8n4ga+IdsUWw1CS2Gz
 OsFykybNviwGffF9KEfkf50Va4VaLrSBHsDj3BOqFBjUG7a24Dfw9kDgt9yVchFyADEqugzDNE3
 PV438eFsj0J48N/SnEA==
X-Proofpoint-ORIG-GUID: 3b5xwyoMmbzeIiA3PZRiRz78WkTY-sQj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE0NyBTYWx0ZWRfX2Zqoetcj49dm
 6DxPr7AAsQ9sUB4+0XTtPESuOX+ieQ/JVZlgXfaljPfYPD5ACS/X3kIvKlEXCO30V+oFbKPvQyf
 fX/6TRdLpkFn/uxNWAPYbxz8wkaYBDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180147
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Aug 2026 20:06:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20275

A recent change in oe-core [1] updated the version of SWIG which caused
a build error in u-boot.  This was fixed by adding a patch [2] in
oe-core for u-boot which we are copying into our u-boot recipes as well.

[1]
https://git.openembedded.org/openembedded-core/commit/?id=84476421d9ccfcc1d2714026ad7caa6ca901853b
[2] https://git.openembedded.org/openembedded-core/commit/?id=299a82a9c909b73a9b93877d6c1b381ec8f83b04

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../u-boot/u-boot-bb.org_2024.10.bb           |  1 +
 .../u-boot/u-boot-bb.org_2025.10.bb           |  2 +
 ...-removed-SWIG-Python-2-compatibility.patch | 55 +++++++++++++++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  5 +-
 4 files changed, 62 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch

diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
index 389893b0..23a5a3af 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2024.10.bb
@@ -7,6 +7,7 @@ COMPATIBLE_MACHINE = "beagle.*"
 PV = "2024.10"
 
 SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
+SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 
 UBOOT_GIT_URI = "git://github.com/beagleboard/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
diff --git a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
index 1c4f0691..a6284193 100644
--- a/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
+++ b/meta-beagle/recipes-bsp/u-boot/u-boot-bb.org_2025.10.bb
@@ -18,3 +18,5 @@ SRCREV:pocketbeagle2-k3r5 = "4e0b6294a1185029d34eff6ed91f3ad1734b643f"
 
 SRC_URI:append:pocketbeagle2 = " file://bootcmd-ti-mmc.cfg"
 SRC_URI:append:beaglebone = " file://0001-arm-dts-am335x-pocketbeagle-Add-tick-timer.patch"
+
+SRC_URI += "file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
new file mode 100644
index 00000000..c1d0204e
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch
@@ -0,0 +1,55 @@
+From 886616d03b6afcc5ce8b34e7af91f7ccfbb0a5c Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Tue, 11 Aug 2026 13:21:01 +0000
+Subject: [PATCH] pylibfdt: Replace removed SWIG Python 2 compatibility macros
+
+SWIG 4.5.0 removed Python 2 compatibility macros (PyInt_*, PyString_*)
+from its runtime header pyhead.swg (see commit 79f7a2b7cb7d). Replace
+them with their Python 3 C API equivalents:
+
+- PyString_FromString -> PyUnicode_FromString
+- PyString_AsString -> PyBytes_AsString
+- PyInt_AsLong -> PyLong_AsLong
+
+The replacements are safe since the macros were already aliased to
+these exact functions in SWIG's Python 3 code path.
+
+This is a backport of dtc commit 5008d1d6a356 ("pylibfdt: Replace
+removed SWIG Python 2 compatibility macros").
+
+Upstream-Status: Submitted [https://patchwork.ozlabs.org/patch/2283713/]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ scripts/dtc/pylibfdt/libfdt.i_shipped | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/scripts/dtc/pylibfdt/libfdt.i_shipped b/scripts/dtc/pylibfdt/libfdt.i_shipped
+index e4659489..326a15c7 100644
+--- a/scripts/dtc/pylibfdt/libfdt.i_shipped
++++ b/scripts/dtc/pylibfdt/libfdt.i_shipped
+@@ -1033,7 +1033,7 @@ typedef uint32_t fdt32_t;
+ 	PyObject *buff;
+ 
+ 	if ($1) {
+-		resultobj = PyString_FromString(
++		resultobj = PyUnicode_FromString(
+ 			fdt_string(fdt1, fdt32_to_cpu($1->nameoff)));
+ 		buff = PyByteArray_FromStringAndSize(
+ 			(const char *)($1 + 1), fdt32_to_cpu($1->len));
+@@ -1064,13 +1064,13 @@ typedef uint32_t fdt32_t;
+         }
+         $1 = PyBytes_AsString($input);
+     %#else
+-        $1 = PyString_AsString($input);   /* char *str */
++        $1 = PyBytes_AsString($input);   /* char *str */
+     %#endif
+ }
+ 
+ /* typemaps used for fdt_next_node() */
+ %typemap(in, numinputs=1) int *depth (int depth) {
+-   depth = (int) PyInt_AsLong($input);
++   depth = (int) PyLong_AsLong($input);
+    $1 = &depth;
+ }
+ 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 1c3efebb..9c760854 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -10,7 +10,7 @@ require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
 
 include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:${THISDIR}/files:"
 
 FILES:${PN}-falcon = "boot/tifalcon.bin"
 
@@ -25,6 +25,9 @@ UBOOT_GIT_PROTOCOL ?= "https"
 UBOOT_GIT_BRANCH ?= "branch=${BRANCH}"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH};name=uboot"
 
+SRC_URI:append:bsp-ti-6_12 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
+SRC_URI:append:bsp-ti-6_18 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
+
 # Match the meta-ti trusted-firmware-a specific changes to memory locations
 # for bl33 and k3 hardware.
 TI_K3_TFA_CFG_FILES = "\
-- 
2.43.0


