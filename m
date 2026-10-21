Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7722.1792612367511915484
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z/iaaUDW;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=EhBG7Jf8;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LHqlZw2107427;
	Wed, 21 Oct 2026 14:52:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GvXDRtflZFOjTjLeLSPxa7c5Whcm/1XMz22ogbB+k
	/E=; b=Z/iaaUDW/YL3Iy/JDN/2S7NK80b/NQfvyHGdE4yklxMC2m9rNFN9F1hcI
	QDgiqz54ycecMOY1OmwaTPsVs18NKr3brfaw5ht8wQjHwG/RVrTjvuQhuepWWVmU
	VTBi4O7UNjo++ERzTsICVZ2JCxPLOvzKPgfF3cOClw3oIpA3SclE0FjaYuSTm1Os
	+n1g1GSc/YacCFyFon3GY0eZ076K3vOAfohzWw1Nzv59KpNQINSCof0AbJANI6Gw
	ElBtmpbI6XBagLfUSq4TVRUd//pV5RsZXEOMRqhP132/4hNSyHOcBabwGx+ipstf
	RX1X+mf0xvGFpLn3809cDLnX8/p3Q==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010051.outbound.protection.outlook.com [40.93.198.51])
	by m0380145.ppops.net (PPS) with ESMTPS id 4hev9ytvjt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 14:52:43 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyaHhkzx0XR95ZRCgQGvhnfDsHsEy6dGRVWzD1HltKU4OEa48x1k619ILTJJ+SVwBR1SQ0RcxuNs6S1yZTsqxdUeGJWD7870UP1sQRyLh+5DKwCxm4gdq8LBnT+ip7urC0nSl9TkfClrIRLZyJ0JBeL46ShS2mOeNyqbOf2cMXgFSr2Dxtnih0ePD8Eq4OXHpj7sNGfPwR7hgEW7jV5nJNTUD7Jn+bpdwxxKaiMvdHIyFNbLdjFqFIWGxOopNWl+7vrLgw9k7HQ9nZ8eijYvcM5/lI+MI9K6TNoS0r5zCROPYhl5bP5QgJFU1shQk5JhtSnGiAMMXcqVGzvnxJGeUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvXDRtflZFOjTjLeLSPxa7c5Whcm/1XMz22ogbB+k/E=;
 b=YpR44CZYMzVqb3oSmnhxruoRym3xnUYt/LWTlNrqYaVGROETh+fqfsIufSjcv0NvUx347gOpTeyXcUpyYRx5Mz/TxcmxxbVj8fsspnZCg2qRnoH6vn0yLNmablC23HFzRpk9dpRTGMKCQ051JkbeJFKeVv1vaNI6GTa/Kze0OCzGj90NJftZ8Z4SOTlbzr0Zi99r5OYlGPO4yQOTDEqF/Fu4Q0qZ/bKCqzQGYon15VAIwM3j+cbWqJhryiujNs8TL+RLHCDfY2ZgsGW7tPex7XXXa1qamfP0QEmsQtHwPeCRHJJIcGOxu+uLQ6LRumv8l9rMJBhMjdqo1AnvnjkRBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvXDRtflZFOjTjLeLSPxa7c5Whcm/1XMz22ogbB+k/E=;
 b=EhBG7Jf8NM3eT73ZfWQzzXKiaagWVDFx4R67sY3Gqg/Jj+YJrpOFpbjF7G4MafhcDSCX0U//UtewMcez8HVVZ6tjU0DSHXpT0huKGZzrL0fVjinr7+pvYTuEUXQTfuqIewRafucjC6cHn57MaBa4MdxXPtnyLDs8R+ZTDHdoV00=
Received: from BLAP220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::28)
 by SA2PR10MB4459.namprd10.prod.outlook.com (2603:10b6:806:11f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 19:52:40 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:208:32c:cafe::31) by BLAP220CA0023.outlook.office365.com
 (2603:10b6:208:32c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Wed,
 21 Oct 2026 19:52:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 19:52:38 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 14:51:56 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 14:51:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 14:51:56 -0500
Received: from [10.249.66.236] ([10.249.66.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LJpuJG4173682;
	Wed, 21 Oct 2026 14:51:56 -0500
Message-ID: <34808116-bbb7-4c69-99b8-87bd6470982d@ti.com>
Date: Wed, 21 Oct 2026 14:51:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [PATCH 2/2] am62lxx-evm: Add DSI config fragments for
 display support
To: Denys Dmytriyenko <denis@denix.org>, <r-sharma3@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
References: <20261021145213.853962-1-r-sharma3@ti.com>
 <20261021145213.853962-2-r-sharma3@ti.com> <20261021195015.GX4190@denix.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20261021195015.GX4190@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|SA2PR10MB4459:EE_
X-MS-Office365-Filtering-Correlation-Id: 801766df-cf16-4aa3-d86d-08df2facdc83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|18002099003|22082099003|3023799007|10067099003|4143699003|56012099006|261009223027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: c50h4mR+2lrJRbfunC5v2wC0nDKW9oRhLMLmAPuoxFjNsbSWyItmg1JVVb+duEsUzMuDzEP5CaClpi+lsxab13c65YKR+qr+7ImOCe6Cb+Yt9iEFves19A+Hym/2r8KWkgDljrzazAn19JcXWotTJw7RD+vsUwIM1gM7hDTIpcgj8H9aRukjL+nAT+NhToPM7N/F1LmQod2zhGXfeCX6iiv7ThG9cTMxTz8kHF/p212ShvHvo05tw+BPo8Kd7pzgAGCt4r3oa/VF7EeMkCfR4eZVYI3C65Jkc+VilL9unR+D3c+6Sy6dbPnG7iH+wf5x9AAViwAODkQKyTsgL2PyDS7E68gPjknDN3lOs4H69RRAAgcOMbWwbi/EZ/pfA5nrtXuTvJgrCtZy8Oazimaxt1P31+pqWmOlWB19GaT0brHP45MH4AwBm5qUlSKUXSRqPoWnGMxEWw9dWpgrD6a6Ak+KCwqT31b9Zw2waZzYOS7aPmWchv2eGbuYYVsD8MpRudBzIJu4Sx9sqkbWoYmcbd8srxVLfugNuua8ehklUCzlH6nVXE2grOshWSX9Vztv7kcwGCQXItzEZj3jw9bz8Uz7K/LFf5AQvdZnmf/mAwoo/87n/UOVKqtemtnxXXd/LzbX477+43EZhtINA4CuWjYrhv/2uofHWfwnnKtzb0w=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(18002099003)(22082099003)(3023799007)(10067099003)(4143699003)(56012099006)(261009223027099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eqAaWh2cgfcHCAa9KzKaD2l7jqidzahTFASBZEzNJYqU+tV7q7nS7ZAgFdEaRgt00M0isluiI9hoeDvoU9VRzJATAdoAeE+JA07H7a4bjfSOkUGctVOmE8k10+4QC9+4W1f4W7oSV/qFtDUOaMlIX8KMunz4CZrutewH5qE1QmpDayuJq0qqyr33zG5V/upicnWmYW1hyEeTgGIKJWwMIww2dZ9bdF3uN0Hl3YEuEqi0xzvo1StH4a0S+rP1AW7Q/T/lJbuLu+3WHDN556s/GexUUyR2iues8/euYc3Ehs6nQG7+B9NXGCQl+KvQwHcMjKsmHUo8xOaWta0S83jka3p4Z8hxJpr15TG/mDTixX+m8KdbzinO1dFTCskSFYh3HXkc2OmcWFyEQbSELVphmJeR85vNO3GCNArRTv3H/oCrZisR5OnwiIAgIMLVNR11
X-Exchange-RoutingPolicyChecked: JB/8CZ1zZRiUU/vtTs7dcHXyFvmGLmcVwhO8xBQ9FH0NURXNLgo4aUaDuWBsHO8xUWlGjka26wmHr8VChe4KgghTNw5udPtnZKMeE2e9fBRqvhLqaelhdh837Axr0+PeNvETpzYnqyUbY7klbgZ9azijx+eqb/k8eKL5y5neb35tQlF+iyGglKzRFSHvzQi26DhH40pkzo+EhYOEk71Ig4CUoF21KJxmiHHNOoTeG3uRLb6QTbl5WOTmLIiAe20FdqYxyG8xcot8v3I612Fs3cFRhl3noX1Q9LS8CwhCk4Yb0D9G4AhIHwcGFKQuVpm67AYpcA45iH6cLm49KX+K4A==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 19:52:38.9285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 801766df-cf16-4aa3-d86d-08df2facdc83
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4459
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3OSBTYWx0ZWRfX3yDF02JUGhbK
 QioLaj9hOR0F//AlwzikA1+xd1rTRSdiJA28O5rl+SPBv5gzsVcrswxDEpXeQ8mKGys//BYVVmV
 OKi1qvz+6MKP6Jv3TUi3VZipzKji5PA=
X-Proofpoint-ORIG-GUID: CQglb1VzYC-VL-zn0ioIxwLyw0Z-_MNo
X-Proofpoint-GUID: CQglb1VzYC-VL-zn0ioIxwLyw0Z-_MNo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3OSBTYWx0ZWRfX96TXpcx/gve5
 tMiZWLLaQYa0zyHCjr7ysaBX+Ff4JIhTEEaN5IU2TNiCwXb7mzMuydXMwfNLGqM41cQauhCbd61
 rBacHOb1aKIBqC+wQIit931y8JmPdngfzjZKpB/skkEXecOlu+9GqcQ8a8EHZTYvqGpug2cdbUs
 XLJMgdxzDN0Igq6C9LfBais23uLFNFGTqwtur6+vk0uOUm8M2tZ8YpdqupFbwsaiQTBmtxthwP3
 GxcwbcUta6ElCtJFDl0iltzcK/NoLeGKZ9MizuJg+YtaeGzs/SChwLOKjWUFs0vC5nJfndJgFhZ
 hrvSKtYsKpbvWySvCLKlDbJfePxIjSrBvWXUgh+QNVFG0V22Oqix2s2NNe1uPsT39VIVTpfwmlw
 xTCpGb+B6nDi4qaSg/+qvFoTp+qv9zV8Zut08VWcdV1B8JRLcRLCFtZgKacMNAfjiUMwHf3tvX9
 SwF3H/CY4ETXo9LQKjw==
X-Authority-Analysis: v=2.4 cv=R+uWitRX c=1 sm=1 tr=0 ts=6ad9180b cx=c_pps
 a=PojWdYBvulneKNx6glcDcw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=1lRIkFS1o3lSlqOkjGsA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210079
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 19:52:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20478



On 10/21/2026 2:50 PM, Denys Dmytriyenko wrote:
> On Wed, Oct 21, 2026 at 08:22:13PM +0530, Rahul Sharma via lists.yoctoproject.org wrote:
>> Add U-Boot configuration fragments for DSI display support with
>> Raspberry Pi panel on AM62L EVM.
>>
>> The fragments enable:
>> - am62x_a53_splashscreen.config: Splash screen on Cortex-A53
>> - k3_a53_dsi.config: DSI support for K3 Cortex-A53
>> - am62lx_evm_dsi_rpi_panel.config: DSI Raspberry Pi panel support
>>
>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/am62lxx-evm.conf | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> index 7a422617..e3d3bdd9 100644
>> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
>> @@ -26,3 +26,6 @@ UBOOT_DTB_LOADADDRESS = "0x84f00000"
>>   UBOOT_DTBO_LOADADDRESS = "0x84f80000"
>>   
>>   TFA_BOARD = "am62lx-evm"
>> +
>> +# DSI config fragments for display support
>> +UBOOT_FRAGMENTS = "am62x_a53_splashscreen.config k3_a53_dsi.config am62lx_evm_dsi_rpi_panel.config"
> 
> Do these config fragments exist in every U-Boot version we support?
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/u-boot
> 
> Same question for the other patch.

Good question... I didn't think about that.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS
