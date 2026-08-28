Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BBF3C61DCB
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 20:54:49 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4451.1787950482040598741
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Aug 2026 13:54:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nJYmsUIC;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=jXNfJ5OM;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67SJ4jUW1285213;
	Fri, 28 Aug 2026 15:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Y08QBE1kqRnz/cSR4dDsw+bYYx6U8g2810Bo0x4aW
	iI=; b=nJYmsUICnYW1ol2wyQso9a0/4rXGbkCkqyxJ4BnPxZxlcSTzLPYgGcLAs
	Zb5DYxqo7XrhmDlhxlkV1PNeaVxGpUpvahWyt+BKBUR3xVGI27lLRrSt5wWh8T8E
	VB4/Bid8OwvtJDS10/9tIOhYWI/XQdt/JayyGs2Lzjik/Oc+oWiK/EGWv7vnYmPN
	FgKxcH6tEcqBMYTt9Ie2OiBD5+Bb6Lvj6RT09Ep0WWPxKOnp/ut4p2p8m5mo5hzp
	3QpGq01uRmeG5D2hO1crV4va9Vri1bcfpT0vt2dEZv+wPV17Pn8foNqgQTNaRZHg
	jJ5+nAiyman0h3SPSkQvgt96m5MWg==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gb24pdjeq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 15:54:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sviDVGu/hNkrZ2F2HnTLE1xyXcDDlqW8xQqwbJLk0ObzS7x5uin/ybl/JbwI2KPxteVxAmNkHEU8EzL3G72ZG4zmd0+NkppGNw7aTy5oI/r3rx9R3dGgkZApWhbB0w9bcKvb8K1KSkjrYuTJhdChog6FsDGEFWZD3Gv1Po/lkWuOVjXdAUsTyqi4+Auf3BUyD9NkQYABDzAs5gsootIrek7CpzXDDUi56ZwO9Uue4jRTGNBFnl2ID1rf7qrOgjvG4+ogYUdNS93p2rNHdbQkEnDC4+beyFgfQ7Az0V54cY8P8XgpZc6PxQVW/p1m0WSdyjK3wg8/5cYKS6TuAZop3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y08QBE1kqRnz/cSR4dDsw+bYYx6U8g2810Bo0x4aWiI=;
 b=s+v+YhgwjvgIj5pG76vt9v5BKxsbWWiV8vHhbNp4jwAFXoVgFRHqlWhlex6tauQmc+GDJHu6CqAVTPVFZmK++Accgj8wFoTp0AR8qnOOEIGf5bDt/on8S97cAEvBolZQbyhZiIXIOIvfE98uFJw7o5U/a3k9IWUzCQRN3htDScOCzrA2K7VHwLbl+W4OXbaOnQVj1El3wO1+jpEQZTMvJPl2Q9Si1Tjp8Wfe4nDrzSbyExk2Fcd4/ivymrAt11bf74IVyC8ZtwCZwCAVMr3x+kBoywCQBQWboUwlKFTcuc0ZN/ehmpvDOBHGsq3o5X5EVfgSoMm0OTjQq8EG6TGg6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y08QBE1kqRnz/cSR4dDsw+bYYx6U8g2810Bo0x4aWiI=;
 b=jXNfJ5OMCoRDHjWkTSlASezgTs1OAGTub4fIIx4GnBTL+pmAy4wqXIbdrr2wiT04V2sOznPjeydCNL43tIGfynCJ0UQPsy3MDRmC2NOUamfA4Z0valtLRMem2cjNqnLJ8ckK+ML33JjosPi5Wt7etL/dChBH3HQgZ++UC3JPwP8=
Received: from BN0PR04CA0015.namprd04.prod.outlook.com (2603:10b6:408:ee::20)
 by CH4PR10MB8228.namprd10.prod.outlook.com (2603:10b6:610:1f6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.7; Fri, 28 Aug
 2026 20:54:32 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:ee:cafe::74) by BN0PR04CA0015.outlook.office365.com
 (2603:10b6:408:ee::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 20:54:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 20:54:30 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 15:54:00 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 15:54:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 15:54:00 -0500
Received: from [10.249.64.139] ([10.249.64.139])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67SKrxCW3473186;
	Fri, 28 Aug 2026 15:53:59 -0500
Message-ID: <f12fc893-5928-45e0-ad9d-3966d3bbbf87@ti.com>
Date: Fri, 28 Aug 2026 15:54:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap][PATCH v3] ti-vendor-kernel-headers: add
 recipe for TI-only dma-heap.h ioctl
To: Denys Dmytriyenko <denis@denix.org>, <gehariprasath@ti.com>
CC: <afd@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>, <s-kapoor@ti.com>, <p-gupta5@ti.com>,
        <u-kumar1@ti.com>
References: <20260828145834.1304057-1-gehariprasath@ti.com>
 <20260828174448.GK19759@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260828174448.GK19759@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|CH4PR10MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fe7938-8982-4530-0674-08df05468e68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|4143699003|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	eCV4phnTJJ572nwPIHu4bvXJjigch9rMsBxpZ6I57FqOGIwgnQepMI9HneLw4Bux3QVVGZz+a7FgjWVBlbW93Zs4Wgmv5DQc3r+h1der7VIio3kCbrWaqVhHeA3sJvZCN0JmAEBfO3h49KCogwJOu6Lbz7CWRhNIhvwVk3gU7x9gyCrErSr8Zu2/86WbOK/+1OrtdVO4Gqz6mHEXdXZb+nMvha/fMc5BMURcneDDdulD3TSxwTAS8/4VLVzIa+Yq1BqcamjdZ2pmGuDAAr/lTGdWL9mJASBsZyal3JXXNyB/WyXA38JSzBhI1ZmNXxPk0cWv+HP928HH7mJPZnqCrjIC0guE7c6BqFUfPBv9DQ72vUTZ0d5Jwnn00RHGjYLwK6QE/xlJZ23lIz2G8ocFRVUmYret5GThEU82/0o9imshDmxBxF+IBV0wJGCh7oiDGNO8zGjCdzpj0H4B+GgFCFAZQhfZ/FUMGfqbYeEevvCYweNkXgao0rKAGqA6gJIoHYtYwZHMMI8WV9eWRXTtLAP+0oXntWdvcbLIWmYWmbVc88VZ91+fucARDAl+SoAWTRb4c0iEDVE+pO5E8RuWeBj6w7UkDeWipaELLAbBNrz+aBIjWBBtuvOWBt3Jlc90P4F55LWO/9FLX1bwc6Olez0i35sufKbSWn3xCXFhhbQz1asSHG4SY2CHzpQuT6TAaryv4cULu1vDudU7AIkcLQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(4143699003)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	lRn8oKB7ELJlvnC4bmQ5nSlMDxE/Cux8MujJk+UU2Bhy0yJbuos/FiU4sMPckO+2iVYmJ0EWgqfi+UmRhk2qtyoxFC2PLctntyd06/ibBk6UMA/0phJIBTpi3XrApfmGWFuZjd5Z45mNYXZOdZsdAWDj2fc7Pgbbv90ikA+IZG9+XkRVlWQCpG7HGK6TUkgWzynCoLOjcjBAr3teOGlSqsXVihlezfmh8NrYDrSajdNEXZbNpSyUMVfW5b/8focgAuOnOrR/irIMW1MvdE/c6kAReMbc2sjznAfmCIm5kE3fu6PdP63lX7tVRLwJnoklKFp+J3AzLwYu1eKyAGcwKwUe6+OeXbugmV/8VvbbNmYI8kJpG2kT0zLyjTFN5+umWjMvSxrNoh6LhOVW5/bAmbSjUhU7AIKawBqo9eSohkfQv+nxWK3F21jbrcOxFKdB
X-Exchange-RoutingPolicyChecked: 
	OWgQo3P3f+ppu7jdPCZgC3vIoolbiPxnPI1dgmQC0+wIWRV0HNbuCP5rDAVCIK3aC7oVloyFFuXlGxaLNe7lDInhBG6u9UClQN6SA9Pnvg1aHGu22Nz38cdR5srUPEXdaE3QwVlr13x22C8WrWdvQ/u0lQkh+aYsaEWAZnhIim+c/GZnfdNgJyuk8XvaisbIYGo7+ji+qKoVR9hS/SHf3bPLIABnf+GCVAJRca4YA8DwYQ0QH/+U7jc5T/GcifdMgXO7npQxup2hMhuW4KESjM/ie4d1svthTmgSOVHVL/Ki6XlTGDH/GWhkz+kOwA0zVqjUa+E8o5e3s64bXkdu7A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 20:54:30.3697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fe7938-8982-4530-0674-08df05468e68
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8228
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDE4MiBTYWx0ZWRfX3bdtIg8sFRDq
 PHlnWwKGEVLT2lG74fxxqICYLpGpVV3TO3WKR0Fkniu8DFZbCKmbLD5XrK+F+xG9TC2W7/Sx8qB
 E/hJx2H6BiMLwlOc8d7N774JuuXNmaEfDMyp8cQOsrJUvqXMrqFRFuaaaKtK3JC673mdnG4KNZs
 gePct9Ui1PbBRApGuqwWOHyPRS0lAumRbg8XFirkcgmb/TGcAjbh4bJp3RDUUIGohWmhtHYY/w5
 qyslmzQIPkSiaSVNRonu4Wzjd4A2/4dQrjp9xc6p54CFSyADdGCvMxtdw3/R+MxT7gawWl/DInm
 Vjn4s653BmBgVLwccgYCnMukwfEImgPg+0/ycLTqJGYlzsWBUq65ygLKoOHRoI/X6BVY1lIqYED
 oT/iJ/LpZ4YUCELUt9LkzMRymCNI3sp1SjPhjN0k3MjulIg5XkXajXlXghQ3T5asLE7p4JQ2aG1
 2ZfADgl5ubulacHmz1w==
X-Authority-Analysis: v=2.4 cv=A7pc+aWG c=1 sm=1 tr=0 ts=6a91f58c cx=c_pps
 a=y6Y39UqQ09MdvbCyrKLMTw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=2-B5UuxeKmCew2EXUOAA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: 0wk30sW3SbG8U5WLNtJWKl2-pCV9_ca9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDE4MiBTYWx0ZWRfX6e+JM7IqNc7n
 XuvBIy9+egMRhKWB55QxzolQ4/C5ETf2WKsOfkZHqmKEQ0Kw/T1HERcNr/usSsnYXhGSsyO6c0W
 wK/ew2w5n9+NkTBl7Q4lwiEEheXmKwM=
X-Proofpoint-GUID: 0wk30sW3SbG8U5WLNtJWKl2-pCV9_ca9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280182
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Aug 2026 20:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20308



On 8/28/2026 12:44 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 28, 2026 at 08:28:34PM +0530, Hari Prasath via lists.yoctoproject.org wrote:
>> The TI vendor kernel's dma-heap.h carries DMA_HEAP_IOCTL_EXPORT in
>> downstream. The standard header provided by linux-libc-headers' wouldn't
>> have the custom changes.Copy it straight from the kernel's staged
>> source tree (STAGING_KERNEL_DIR) into a separate /usr/include/ti/linux
>> path instead, for userspace code that needs it.
>>
>> Signed-off-by: Hari Prasath Gujulan Elango <gehariprasath@ti.com>
>> ---
>> 	v1->v2: Address review comments in commit message and recipe description
>> 	v2->v3: Fix the patch subject prefix
>>
>>   .../ti-vendor-kernel-headers_1.0.bb             | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>   create mode 100644 meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>>
>> diff --git a/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>> new file mode 100644
>> index 000000000..5d570689a
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-kernel/ti-vendor-kernel-headers/ti-vendor-kernel-headers_1.0.bb
>> @@ -0,0 +1,17 @@
>> +SUMMARY = "TI vendor kernel uapi headers not present in mainline linux-libc-headers"
>> +DESCRIPTION = "Copies select UAPI headers straight from the TI vendor kernel source \
>> +tree into a TI-specific include path (/usr/include/ti/linux), for userspace code \
>> +that needs them but can't rely on linux-libc-headers carrying TI-only additions."
>> +LICENSE = "GPL-2.0-only"
>> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"
>> +
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +
>> +do_configure[depends] += "virtual/kernel:do_shared_workdir"
> 
> Why do you need this dependency for do_configure? Moreover, since you don't
> have do_configure nor do_compile, you might want to mark them as "noexec"
> 
> 
>> +do_install[depends] += "virtual/kernel:do_shared_workdir"
> 
> How do you ensure that virtual/kernel is the TI vendor kernel? If it's not,
> you'll be copying the original unmodified header into the ti/linux location.


Should this just be part of the linux-ti-staging recipes?  That way we 
can correctly only include it in the versions that have this file?


>> +
>> +do_install() {
>> +    install -d ${D}${includedir}/ti/linux
>> +    install -m 0644 ${STAGING_KERNEL_DIR}/include/uapi/linux/dma-heap.h ${D}${includedir}/ti/linux/dma-heap.h
>> +}
>> +
>> -- 
>> 2.34.1

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

