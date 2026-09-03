Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F61C61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:48:44 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4168.1788428915098503415
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Sep 2026 02:48:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=RGj1ohgj;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=fcJf2YxQ;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6839P9oX734788
	for <meta-ti@lists.yoctoproject.org>; Thu, 3 Sep 2026 04:48:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=gaJxgyM+QvShTjItXlcmFOO8e2ngEci7GQ086C9CB
	J0=; b=RGj1ohgjYsWGyb7E58jj2PNUrfdIippGRu60+n6Z0su2dpwpmTcNwOOM9
	OEkx7bv0IQ7NNyjBjOSqg8gwT378/Dlc1rmgNrMUHcToJOPDugJwLPZCJQI0ZJc1
	Ziw/fed45cg8+hgb7DiqRDFJtlMnX9JUIvfIoJcN3smABWyHx5Cowa4h4zTk9K8K
	vQvw0+2pgYrByJzwfggYVFSZIDdDPNYCJ9XAf1VgrI+ajJzaxoJ1fB/YbLF1xch8
	6dzYuQ1czwITShHoEIsysedxdL78e2U+x4pqj9bpSyUmVD2849PSHd3V13VqIa8L
	/34Tz6gsSjRl/w/h30n+DW4NR4vmg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010070.outbound.protection.outlook.com [52.101.85.70])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gf68b838b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Thu, 03 Sep 2026 04:48:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Apjg/+fHBhIDySG3P8qUtbmYO/PMgN+EgDnlTpLgosLmhpuOiRCMIfPB8bzAQvRr0JZwCjMMoHPkhYzGWIo6w+a/fF4xYQqP2vq7sXzRE+GM6qKpHhVIwHQZHgb8JBU6Nk8A9cuc7xu3MMkKgX8Jfn6ItDEdB/39oJvWzwOu5wOgl72xmSMjgwSd7LER9nuEJw6X6yGjj3uEvknCactYKVJVHr8mWi66ZkBmpcTRYlwAKmHnRYIS1yrK0/e3Rc5SYYLSPvppboRGmuZBsPJL8BtMlKNmb5qybDkotQRV7jL1MXj9CndcpsQf7iKCDUjvVnazUB6hQGv/J0yfb1wrZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaJxgyM+QvShTjItXlcmFOO8e2ngEci7GQ086C9CBJ0=;
 b=GtFrStl4/cUeqIuUbwg/CRL4yP7cRCEnwoOYqJzMaVjiLQS/E9cGVH+Bn1BVYTW1LAcQGLnP1R8byKpVB8pXy7gh/KqZT2ZMJWPPHy2D5rKadf1aqoacwcI1VMwRibCCnPENLvMxupXFEks8O67yTyPyJErsHXEjz4qaNKOMO/0qlj3698TbHgt4LHc5KrM1FPKhQph72SJgmuDfdsNpo9o6BaNwoV98Mg0aBS2Hpex1h4bYe2kuP+13vePzHzJ7ixzMpseaTPgMy1xgQ3b0u9ISzpYiRepyI0yMlNH3mSQe8rxP1YRRXK7mGzuCLxW1iHBo4nshKNm+X8e5g3LOwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaJxgyM+QvShTjItXlcmFOO8e2ngEci7GQ086C9CBJ0=;
 b=fcJf2YxQS5RQQVZWZLnIJu6yYw7L5IqBZhQWg/7arLIDwpVg5wUsyPfNegcJuHXrnXi5+ch1lbaO9V154ckknO4IwTwhpcyie3CDbuLfNuDjLcwIkCNN/yWDjPDOL1ee9yrFSQ2vTX46G4uffABt+Wlf6YTMXw/IfSGb0VCY9e8=
Received: from SJ2PR07CA0010.namprd07.prod.outlook.com (2603:10b6:a03:505::27)
 by PH7PR10MB6986.namprd10.prod.outlook.com (2603:10b6:510:27e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Thu, 3 Sep
 2026 09:48:28 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::49) by SJ2PR07CA0010.outlook.office365.com
 (2603:10b6:a03:505::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Thu, 3
 Sep 2026 09:48:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 09:48:25 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:47:43 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 3 Sep
 2026 04:47:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 3 Sep 2026 04:47:43 -0500
Received: from [10.24.50.31] (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6839lfbH1307709;
	Thu, 3 Sep 2026 04:47:42 -0500
Message-ID: <4887b984-c58f-4b5b-a9a2-173661a8b53c@ti.com>
Date: Thu, 3 Sep 2026 15:17:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master][PATCH 1/3] dm-verity-upstream: Add dynamic
 layer for meta-security dm-verity
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@ti.com>,
        <m-shah@ti.com>, <a-limaye@ti.com>
References: <20260825063713.51497-1-a-dubey@ti.com>
 <20260903083710.rvfivmg4s73rclyr@uda1250336>
Content-Language: en-US
From: Atharv Dubey <a-dubey@ti.com>
In-Reply-To: <20260903083710.rvfivmg4s73rclyr@uda1250336>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|PH7PR10MB6986:EE_
X-MS-Office365-Filtering-Correlation-Id: ab84380f-6e45-4b58-d9bc-08df09a07fbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	L+v3aAjSqX/kIOcuWJms1eehS0gR1qqYFQwIR4u5IsF9P0WekiwOfXDP8LkU0v+PWTToa+TFcM8gW+bh7985rnJQvaVlna/Orftqw8zD7b0SYlkj18e2+bOjU4VPURSE67gyUBXKTlA+amkXTyy74RlYeUx4Gbn1TeblgT1bLVLMk0ZPOXAbh7Ru5TUq/f2Fnpp2f7hE+qckU6IEyoBtjeUUT9tjz3vMQMRO9W2qAJmnwvgTL51mOSCN1U+U6nRAT0ujuzavpl3MmPt2jwSAoMcuDwW58Hou6kMqqaQv/QvYXYTO8WvpgYdBtjsi5NiFd1sTJKmfA9UcKvm0CAjUaBgTOVmq+PvGtbkTjBa/pkh2/6y6ERRAyNk0rcCDRSX21evMm78ZImCY5HkZ0bk1nRPk1VlUkKEjHQVbSM7KT6yWW27qrQhlQ//T/FSoQAX+XV2XVxvZPyBP48iG+WqC5pNcrXWq/R06WUvkLLm2SY3T8KIZrKRIDmi7+VD79i87CrJgmXSbMJRcvi36t5DgM2u5FXeEVylj72DgT+7OqR6lEEjZbIMd1/zU7MP/6G88MxDkbEd25OtB3AsON66L8mz/3hEtfbQbabXSU7D+vFGJPw9XEjdOBA/mMB6RCvP0yCVKjpvvDdtuzaGMyU+LlupTJX29FYkm+5vYNWoJoxHERx7f94eYGYtv6UQyUKIA3coLP8/sWY5JY0opc3JmJQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	H/Gx1FxzCL/Pp+NfBaZ0/d/lQ/v6XgknhtzGObJR5l2qc8exhYPHg40hCZItOM2n4asntskuycixRDb+wPt6LCP0rXqKYk/2sXkihEr/CLv/ZtAV4yYC3VTLdvSQTynphk9+QLtvl3s9cAolaOdVAWaZOx3te/PW5Ue7+XiiBSHtCCuU8xJYcAsza/bP5cW89KfpCO4UE0G9wzvKwx+5WgBItGRs/yf945jkI3yPLjQFkwxjDMIz4vZkbeBjQ6I9PlVXidVQ6yky9Gr2R/tpghEt5QDxRknMS8qlxn8al1UV/6yShR2d/5/A78YhmC2z2+m3JBZ3XIK5PqdLp9FCLWg84NuF4oIwJMaUvmUUtulpkaHqZCm2cmbVxNcv1kpqY337OHhQKVhy5YnqTd1aAEr2cuNBL+ehxQPJo8xkf8AEysNrFI9hIxptaRIDRaaT
X-Exchange-RoutingPolicyChecked: 
	k3E3yjJS+rv/3RqWUTFhNNd89UqpWtTOlNYBLLlRVjVxUExNG6DECJYNbURA257nui/o8exXE+HJas07VQHSlG38lFLw52v+WRscV8HxL1hCtcjIQGvsBmjBs63C2NzRNmqdrrXLqMnyeKOqifRgUiZJXjjNVoA4k2k/dQ/fXl4e16mHAGzd01LqmdPPqWQekyNH4eMrYOeaWPtO6F0RbthPh0SiPNhQFtXfaJeKnhGuIqJjdHdnQiEgZ44vnwn9XxkFMuFxqsQvaJEUQ9XQTYvrQKF3/YBavZYVAnupR5VpFirhjDZEslyq57OZGT1OPjuP/g7rCTZiSohDK/cv6g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 09:48:25.1108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab84380f-6e45-4b58-d9bc-08df09a07fbb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6986
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfXyb91VpBPOdrN
 du63ctOezBKubwmofaHSAyz56/BtzwpDRBAUihtLsXlfL/Vi8pJ+RtsBHaKZyzjAu+UsxHBLCmP
 JStBGpYttV+Edkd0cIjga8kKIXvbTB4RsMQ+fMqGGAzB2IbM9ENtRRB0pKB010a3XgZ0X4/zteh
 ofJahSM27C294HxinYW2B0RMLrrp5GqMQe+Gw+8ryhhJMPkCNUK20YInnZCjE7TTsKDOcOlFNBm
 MhuqwQSIkSs4uqkEl3CG4WIOkjeO9Va80Fch4m8jIbdDnOJOnHiUACV6SBlHlXocxRLui/knLE2
 jyjYoQtuc42HrZf3yRGeQ9MWRZRgN+PK5AJmP/ggGBLj/nd2LO2YAEGNBjrtext9w/9qQVaTsYF
 9zTX5yWKCNUksq9uJGR6BC9RVYneBoAIYnYcLZV2401cFmAmaedHY2Li9TXRWjeinJ+JIweLrol
 KMCZ0VuTgD7AhT2oMRA==
X-Proofpoint-ORIG-GUID: OST48GpEdB2C3rNe9mBE7tJi5ICqJsq3
X-Proofpoint-GUID: OST48GpEdB2C3rNe9mBE7tJi5ICqJsq3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NCBTYWx0ZWRfX7V9m6VNSndwt
 qPG31zlLWbqDiQGdrK6qzhe/jf/2LdX+P1LB6ZW7Dy8Oi3IZ5xJPzmIfQKyhQh9ue1FBGVCG3I3
 wQwM+izFjvS+X0zXUwt91p9B0bLniQQ=
X-Authority-Analysis: v=2.4 cv=JdGMa0KV c=1 sm=1 tr=0 ts=6a994271 cx=c_pps
 a=8AG4s+rqopmfoFde1j+oJg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=CxxQj8xiARHook40oEwA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030084
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Sep 2026 09:48:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20325

Hi Yogesh,

On 03/09/26 14:07, Yogesh Hegde wrote:
> On 12:07-20260825, Atharv Dubey via lists.yoctoproject.org wrote:
>> Add an optional dynamic layer enabling dm-verity block-level integrity
>> verification of the root filesystem for TI K3 platforms, using
>> meta-security's stock dm-verity mechanism as-is.
>>
>> dm-verity hashes the rootfs at build time; at boot, a dedicated
>> initramfs loads the root hash and the kernel checks every block read
>> against it. Wires DM_VERITY_IMAGE/WKS_FILE for the K3 boot chain,
>> hooking do_image_wic instead of INITRAMFS_IMAGE to avoid a 3-way
>> circular dependency through kernel-fit-image.bbclass.
>>
>> DM_VERITY_IMAGE selects which image recipe gets verity-enabled
>> (default arago-base-image, overridable in local.conf); all effects are
>> scoped to PN == DM_VERITY_IMAGE, so building any other image type is
>> unaffected. Only active when the "security" layer and dm-verity-upstream
>> feature are enabled.
>>
>> Signed-off-by: Atharv Dubey <a-dubey@ti.com>
> Hi Athrav, Thanks for the patch
>
>> ---
>>   meta-ti-bsp/conf/layer.conf                     |  3 +++
>>   meta-ti-bsp/conf/machine/include/k3.inc         | 10 ++++++++++
>>   .../conf/include/dm-verity-upstream.inc         | 17 +++++++++++++++++
>>   .../udev/files/dm-verity.ignorelist             |  1 +
>>   .../recipes-core/udev/udev-extraconf_%.bbappend | 14 ++++++++++++++
>>   meta-ti-bsp/files/wic/k3-verity.wks.in          |  5 +++++
>>   6 files changed, 50 insertions(+)
>>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
>>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
>>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
>>   create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in
>>
>> diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
>> index 3cc54aa4..aca35cd3 100644
>> --- a/meta-ti-bsp/conf/layer.conf
>> +++ b/meta-ti-bsp/conf/layer.conf
>> @@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp = " \
>>   LAYERRECOMMENDS_meta-ti-bsp = " \
>>       openembedded-layer \
>>       tpm-layer \
>> +    security \
>>   "
>>   
>>   BBFILES_DYNAMIC += " \
>>       openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer/recipes*/*/*.bbappend \
>>       tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
>>       tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbappend \
>> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bb \
>> +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.bbappend \
>>   "
>>   
>>   SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>> diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
>> index 2ebbfb9e..e23e0ead 100644
>> --- a/meta-ti-bsp/conf/machine/include/k3.inc
>> +++ b/meta-ti-bsp/conf/machine/include/k3.inc
>> @@ -64,3 +64,13 @@ FALCON_INCLUDE = ""
>>   FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
>>   
>>   require ${FALCON_INCLUDE}
>> +
>> +# Upstream dm-verity path: meta-security's own dm-verity-img.bbclass +
>> +# dm-verity-image-initramfs, used as-is (build-time hashing). Only active
>> +# when the security layer is present and this feature is explicitly
>> +# requested -- see dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
>> +DISTRO_FEATURES[validitems] += "dm-verity-upstream"
>> +
>> +DM_VERITY_UPSTREAM_INCLUDE = "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc', '', d)}"
>> +
>> +require ${DM_VERITY_UPSTREAM_INCLUDE}
>> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
>> new file mode 100644
>> index 00000000..4de9e2fb
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verity-upstream.inc
>> @@ -0,0 +1,17 @@
>> +# Enables dm-verity to check the rootfs for tampering on TI K3 boards.
>> +DM_VERITY_IMAGE ?= "arago-base-image"
>> +DM_VERITY_IMAGE_TYPE = "ext4"
>> +IMAGE_CLASSES += "dm-verity-img"
>> +
>> +DM_VERITY_INITRAMFS_IMAGE = "dm-verity-image-initramfs"
>> +
>> +python () {
>> +    if d.getVar('PN') != d.getVar('DM_VERITY_IMAGE'):
>> +        return
>> +
>> +    d.setVar('WKS_FILE', 'k3-verity.wks.in')
>> +    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
>> +    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IMAGE_NAME_SUFFIX IMGDEPLOYDIR')
>> +    d.appendVarFlag('do_image_wic', 'depends', ' %s:do_image_complete' % d.getVar('DM_VERITY_INITRAMFS_IMAGE'))
>> +    d.appendVar('IMAGE_BOOT_FILES', ' %s-%s.cpio.gz' % (d.getVar('DM_VERITY_INITRAMFS_IMAGE'), d.getVar('MACHINE')))
>> +}
>> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
>> new file mode 100644
>> index 00000000..5af878c9
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/files/dm-verity.ignorelist
>> @@ -0,0 +1 @@
>> +/dev/mmcblk1p2
>> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
>> new file mode 100644
>> index 00000000..3940a24d
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/udev-extraconf_%.bbappend
>> @@ -0,0 +1,14 @@
>> +# Under dm-verity, the raw root partition looks unmounted to udev's
>> +# auto-mount check, so it tries to mount it a second time on its own,
>> +# outside of dm-verity's protection. This tells it to skip that partition.
>> +FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
>> +
>> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'file://dm-verity.ignorelist', '', d)}"
>> +
>> +do_install:append() {
>> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'dm-verity-upstream', 'true', 'false', d)}; then
> Add `install -d ${D}${sysconfdir}/udev/mount.ignorelist.d` before
> installing the file.

Sure will make the change in the next revision.

>   
>> +        install -m 0644 ${UNPACKDIR}/dm-verity.ignorelist ${D}${sysconfdir}/udev/mount.ignorelist.d/dm-verity
>> +    fi
>> +}
>> +
>> +FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d"
> FILES variable just adds the folder here (misses the dm-verity file) it should be
> `FILES:${PN}-automount += "${sysconfdir}/udev/mount.ignorelist.d/dm-verity"`


Yeah, good catch will update this in next version.

>
>> diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/files/wic/k3-verity.wks.in
>> new file mode 100644
>> index 00000000..6ef2c57f
>> --- /dev/null
>> +++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
>> @@ -0,0 +1,5 @@
>> +# Disk layout for a board that boots with dm-verity enabled.
>> +
>> +bootloader --timeout=3 --append="rootfstype=ext4 root=/dev/mmcblk1p2 ${TI_WKS_BOOTLOADER_APPEND}"
> root variable should not be hardcoded to `/dev/mmcblk1p2`, not all
> machines will use the same partition numbering. Better to use uuid.


Sure will do this in the next version .

>
>> +part --source bootimg-efi --sourceparams="loader=${EFI_PROVIDER},initrd=${DM_VERITY_INITRAMFS_IMAGE}-${MACHINE}.cpio.gz" --fstype=vfat --label boot --active --align 1024 --use-uuid --fixed-size 128M
>> +part / --source rawcopy --sourceparams="file=${IMGDEPLOYDIR}/${DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.verity" --align 1024
> -- Yogesh
>   
Thanks,
Atharv

