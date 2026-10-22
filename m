Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1431.1792700117591514354
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Oct 2026 13:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fB2TkBjk;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=aVtuNN2w;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69MHsXIl3652525;
	Thu, 22 Oct 2026 15:15:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=z4s28YvruHevWtLEXVMSkVCLv0Gx0L9O3RV5ubqlE
	z8=; b=fB2TkBjkBfexoOoStv/U70S+8DmsmvvX0p2mpHvpsOVn6FbAYsQD5w1dr
	hdKsOxp5MS21bx5RNLOFAJ5oMGBowC0+TagrNUJj+blKFGANn9cxroObdovbesw7
	R59abdY1EE0IPV61Fa3Mklk3tW4jEJPSX+tSLOBBArInJkKpOrFKNfD6TWyIS6L5
	vYq7cAAt+VFKupmXw2c7NLPj8CTDDT4x+E+NJ9J5JN+HTdEokKthLwE7oPmWejLW
	Ku/4MnUVM2ZcJBkYh691v93cK1j+70jbUJ0hNbMusLn0lDH8wOd70qDdZ98LSmdj
	KD53n12w2lzqSUhr2W261e6EnwbbA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012012.outbound.protection.outlook.com [40.107.200.12])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hfmg8226v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 22 Oct 2026 15:15:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pkjCsw8ZGRsG33i3/kLglqIxuZKNsGJAQnGw9mNAUisF9EGMMEl1r/fOoBLpN+aWApngLi5DfJEcHMNCTy69XhEK2lfOoWCRMt1XMF6i/K1uAMZ1AKF9SDOh+p215Xd+6MKI4dg7qAP+hJ69GESNjrsu7t16yUtX9gaHBOZ3FiKYBtfeuQTZqSV0pvxNu3JUAPOqQfmWUa2wIX6sLAHwxalG9kzkVKFTn+Re+VlRswoX85kwZEcj/3CLK2F5COSVDOLVg/VZYy+QpsTmOzEq2q1G3pMhDirXVa+Y07e0FWHQWxpHwS5HrGTlflV2UovIHDBdh9d5CDmUWfNkDG99rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4s28YvruHevWtLEXVMSkVCLv0Gx0L9O3RV5ubqlEz8=;
 b=SkS8R2KgyMR4ExGROwpvWRL2K/8OGMMftlLc7dOMeiduTCgldgqXp745MKWRgCLdjKFPaWioURLQVSvfHULUb17nHUPDKVsXUt/7p8Z2EE0YgpYrerUYYd24XCA3Rf4MBtOlIt5ilfxoIwtJFzMxAfOzxzjwVqpOyFHYWoOGdtfHXM6X8wq6bpUUNasJ1YX+uhO9iFIKJKFPFX0cF4PWBawhV1nvCHrJijGnXTgatFEkuILJcqRVvL1mgdqmmhHFu6uClIn0IN9k/GwtJMD1eChpBFWVTsj2Ql0XR0SweNZaRP06pndcWO5WBqjQRzhOWAqb7dhCzJ/ddb6KggdWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4s28YvruHevWtLEXVMSkVCLv0Gx0L9O3RV5ubqlEz8=;
 b=aVtuNN2wmOrNGh8ZKtp+M5LNyPCuRnC9rUOSRk5+aqhg+RUlI2Ym6yqeXlz8bDfKLzSfvABKb6lSSsPo3MZIQCtxb9dC1n8wRkYF5ZrbHhNKEMrjeAYpDXWPNgJr/MV/14U1+yXapE5zw6sKidpkDVEvaMCaP6YJwGYkD9f8hsU=
Received: from MN2PR14CA0025.namprd14.prod.outlook.com (2603:10b6:208:23e::30)
 by MW5PR10MB5689.namprd10.prod.outlook.com (2603:10b6:303:19a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:14:07 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:208:23e:cafe::9b) by MN2PR14CA0025.outlook.office365.com
 (2603:10b6:208:23e::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.17 via Frontend Transport; Thu,
 22 Oct 2026 20:14:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Thu, 22 Oct 2026 20:14:07 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:13:45 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 15:13:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 22 Oct 2026 15:13:45 -0500
Received: from [10.249.66.236] ([10.249.66.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69MKDjGG2026782;
	Thu, 22 Oct 2026 15:13:45 -0500
Message-ID: <f523668d-e5dc-4cc6-acdb-e5774d278d0f@ti.com>
Date: Thu, 22 Oct 2026 15:13:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] k3r5: Fix mc:k3r5:libgcc build error
To: Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20261005130234.1532926-1-reatmon@ti.com>
 <20261015235114.GW4190@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20261015235114.GW4190@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|MW5PR10MB5689:EE_
X-MS-Office365-Filtering-Correlation-Id: f75d588c-9de0-48bf-29f4-08df307906e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|18002099003|10067099003|22082099003|261021121427099003|3023799007|4143699003|261009223027099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info: ka30b0qreM8qNh3n7nGnsaUvCAO4cMwVat2LJZ+BcaSssY+Dhy1eZuVOuw9RD4bXTDw94nfgIvBCwtu2uJtxhxQYayHH9xA/kqHEXy2QRH8YAZZ0LGBz+vimrLHjUY3gX6/9KZw51zWTQOiAwDOj3F48ePO1XGN7li6Y4iRaT0LHS9l6gaiN7HPcYVrZpuOMvDOIfg69zSjwcV3fugQXjLh5686Vrls5l5P9vD5wPUP5k+Ky5wBqrdj9soTVK7rzT73thxGhAcffnspGrAR6WcjU8JvBlsB9xu84NmlM8iuiupr/yohGsgy/uKUmU9Z4JOjovR6TkeCl+ESnFuxcRhdqXvrc2Dob0si4SPeSiTl8dJ/qq3VjB8nqH1mtntSDH7BweRxQydAF72CQ2zHcwAE3JhgDNYGu+lbWJaI7ZeaxyEHmxheZZr40mmwrwTJrIU27ppAfq7MQpLhrXSx91OX6FcnKTFLGWcegWATdbfCtnriW7dGBM/cO2z1wIzf8J5SyrxB+HCS3Yog9Df35Sfys6SArxDfDi6pxawWqJQojNNAr+Q7RVCyChU4d911rMFti3uErbK65NciybUYz9PFBHDXz126ympgYhAMSvI6XxQOB93tM+WDpPpXjVJl5RSmeAOeQnrsfYyt7If7wHzwFKCwFPuEh1fSKEAvIwbI=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(18002099003)(10067099003)(22082099003)(261021121427099003)(3023799007)(4143699003)(261009223027099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W4+zOaEz0SRccvbLCm5uMf+cEs3xOi7yx8AHX+s4xonAH+fjqpwnvucJW0jX8pnD7Th4Gah5MyBgv+9ej/LhTVZ7juS5SUW9Ve9wLLWK5iRcMOxLT6smBWqnO3q2ZjudFl4wNNCWxwdifkst3t+hPipaYvnLylGC1akOk6mBY+gnGc5jM6aOUo2ymB7bQgDyNRcWXsNNqdVFW9h8Gvx9jynJUY9pE+aqnBLGrl+7H4quR/maOAVeqLNSdlJrUT6/oSCY+cvfCb0WOLOChu2cavi2IsmY2P8hCDuiT0A846eVLF8KnUyFgLqcHr1LB/pB7VcmLouhFkIGC0CGcB8pCVj1yWtF8ha+jEXFpxoP2thUP/QN7zj2LdOREuJdi7XhW2zCO8kDbgMuyYJboS37sLw6B0VskHL4nz3LsLEY2NLtscSUffQepmMkNkWOKZf9
X-Exchange-RoutingPolicyChecked: TPOeg5ouFEjCvojTDz70bG0SpltEP0TWULIR7rYHzGFJmfHVO9zfOnh2X6Svd6zzvVQKm022snz5555xVrtWY/JoLE9Yie4Uw9+kjXvTbtHzfjGI5TPq25jpy5C00txWaTxk7HEhlxU/n5x6lMmF0TH8VZjR81DEBMTWaB2gqrwRBiRDARBvbykdqnSUVkktBXelNA6wgxbK3zbP+edxrWekQ/rpl2Bm+QZncNPZM6HqLWCO4f4JpO+eaDiJkWlu0Cbpi0Pcjmeenyu+ozZ0g1/n8lFTmleB1CuQC1qd2KjWj7lvdeFe7Cy8ZLnuR9Fqm91QdvHtrlQzZx1Gm4L60A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:14:07.3600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f75d588c-9de0-48bf-29f4-08df307906e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5689
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX0xnesuLuaFAP
 3jF/T71Ajc+mWMhmOFZ1+uF60wT7q0rmJ+s4dHh6NeUMECbQnDZGiP2kX8Zhy8fzGB46F0BlWwO
 xsuIJ+A6hEVaiXr9ON9flNaYArPents=
X-Proofpoint-ORIG-GUID: cizs_qq_5yyKDQ3Fa_6QWxofbTW_xLjG
X-Proofpoint-GUID: cizs_qq_5yyKDQ3Fa_6QWxofbTW_xLjG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4MCBTYWx0ZWRfX/F7MGHWxt0fE
 +H25oslVXVz9UDm+4+UU2rFi51ccAd9Er0crduLGwwruowopHFFWuiMn8uqVlqUY40o2nFkE8lY
 jMLXhGSoxTLRPm+NK04/c2jS3Q6Djr9VkIKexnjgw92nA9nua3SRYZwKXgEV0XEaWrYweYKR2L+
 rKB7anHBGYNCKxd6GyV205uwisMBeBtitdPDrS8YvqSAqqADoPlYxNt9jbMw0J2GB8AmnqReUbn
 bfoXixjbuUUTz2e4jwHsHYwmrH+2ZhFlmuv+ZNjLbiht3qpr8Gjxr7dJth/GIcCCsq/LtiBCnNB
 gvkjyhKYjXZorNqR4Hnx1/h5WnUfpNVbXwz66IfMfKgXgmcj4AJjLMBED0EhsZHdBlq1KHeprNx
 NQgPmcY/qm8tyHClmg1KeL4Ah3JmVpe0eGM9SuSwGftXB1u6AazAyiTvb56x1+dSV9MmgWi+xk+
 CUaCq2UYNJ9CMPc8I5A==
X-Authority-Analysis: v=2.4 cv=H/1OUOYi c=1 sm=1 tr=0 ts=6ada6ed0 cx=c_pps
 a=dctP2Ni10a9Sh7weZd+SyQ==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8
 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=J4qPjrzQuEuaaRTUcaAA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220080
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Thu, 22 Oct 2026 20:15:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20487



On 10/15/2026 6:51 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 05, 2026 at 08:02:34AM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>> A recent change in oe-core [1] is causing a build error in the
>> mc:k3r5:libgcc do_configure step.  We need to track down why this change
>> causes this error, but in the meantime we need to get builds working
>> again.  Add the removed line from [1] to the multiconfig/k3r5.conf file.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=020d5f018616bc48eae3a23d5498dec3c78a1386
> 
> We need to revert this, as the proper fix has been in upstream for a while:
> 
> https://git.openembedded.org/openembedded-core/commit/?id=2f5c2b696bcd8e02eac6b06bb0cdace0fa86eb44

I've been trying to do this, but I'm getting build errors on am62a, 
am62p, am62lp, and am65:

mc:k3r5:u-boot-ti-staging - do_compile()
----------------------------------------
spl/u-boot-spl.bin exceeds file size limit:
   limit:  0x300cb bytes
   actual: 0x3350c bytes
   excess: 0x3441 bytes

I'm guessing what we turn off, what was turned off for the longest time 
made something smaller... and with moving to the fix in oe-core it makes 
things just a little bigger.  So we might actually need to keep this in 
place.  At least until someone figures out what is going on...


> 
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>>   meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> index 936bce2f..fd871dca 100644
>> --- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> +++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
>> @@ -8,3 +8,5 @@ TI_TMPDIR_APPEND ?= "-k3r5"
>>   TMPDIR:append = "${TI_TMPDIR_APPEND}"
>>   
>>   SDKPKGSUFFIX = "k3r5-nativesdk"
>> +
>> +EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS
