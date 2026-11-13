Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2442.1794600665874385959
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 12:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=RKj24Jwp;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=RdvUjGf+;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: rs@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADIwLVm2820680;
	Fri, 13 Nov 2026 14:11:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=nWgDQFMEfjsvf7TuGJ1YFY8enBgoZX+PLW/dIjXzL
	Hk=; b=RKj24JwpxLb++cnma4C5FxsnrW2tgAwMrh+wHf4QkReWlQ8v2dICYL+JB
	HUMLejRTVf7uB3sLaax4yHxNyVEBRa35533sA7gwCy58BNbdmxAb1FF22zDjxwQw
	8An0Zjhvz7aGIoRicZ+Nq3DP9Q14aaDBjRwIaUMjOzSLYpl+8K02YxPdMkSbuMUb
	eILQMA43pOcwUSA0j7oq/Pl11MagZkHRskepAm5yyCj0+T7nx//Q7DzmJq3dqzoD
	RtCTZlBqrU7D11dFzAQC36X0nH0gZ35+APMw0XswQvozjTOfjLL4+B1P4AxCXQBv
	soiM6RKtWu6AK8b4rw0i+AU3Ydntw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010050.outbound.protection.outlook.com [52.101.56.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hx8600dax-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 14:11:03 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gUcaQp77Lj+n2xF4q2KrpWG5tQC5baZ6YLnkl3hxFNMqbvi2IV0/V6i63g0chi4YQ+phh3PqSCgnkhJfOd3wtMczMBDCuqr2cdQlCrANFiuHRmim3z1VQONke7Z4Day9mF1lQmQ4wyqYXF/mP3FBRYs47YOgxggHUqCx8I4MYFEzAMLDUxB2GUn9yw/i4+kvxYLAjwHCUn4yXZSzfQZr+pM5IMhX6TgNubauQ7KbdeN4nWFCBwA8dy206Uqxh/aKm/3GM+8aLGRQnciRdzUrdtEe7vEMQxAlR2uhzkxd43srWJCerjv01nnowcrz5bDsF7h4ShA7An/98f8I2/I5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nWgDQFMEfjsvf7TuGJ1YFY8enBgoZX+PLW/dIjXzLHk=;
 b=EZrm8g6obydtKiu4fC3o296afZvFUevpquBkAV//08QsVHzR5vCEGPVKMfNB+KxqSmvBzVClsgjQQ8vRdOijdz//wiV5oI0j2q2/l1N9SS7jXpCI3V9FhzCTtyyNrVBQSCFnJVRN9iKzrtZLYhKCcx6UbYRY544xW3jhw20T4eUc9W/6kEScpAYnV6C3QGkFZkd+JgE5tQV7yMEe/kJGDNCm2hF0FlOZzB0Jh+ZrV31HmYNDWwl3fSimYzX+mAMuucQ2UmUTDwp1l0BAG+pevdCar7IWZBvEDCiglne1ddc2EHzDKOhjTakmLo2ZZvv3O+9OffXUbXC5TsWPlt2EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWgDQFMEfjsvf7TuGJ1YFY8enBgoZX+PLW/dIjXzLHk=;
 b=RdvUjGf+OsSQvvl8SwBR/CH26ur6Ht0GqefWUTCGA7UstfmpBOpvchRNBkU+2kWZt+VNb6qEhVRZhUOpPE/owfqJQjr2lIbBDQIeamvf7Wy2UvEUrHaDCvBKGqay8/l5imRBctH8we1XBiL3e0OXpbPqOkouTCYXO8HWg2MdhXo=
Received: from MW4P223CA0011.NAMP223.PROD.OUTLOOK.COM (2603:10b6:303:80::16)
 by DM3PPFA632C0238.namprd10.prod.outlook.com (2603:10b6:f:fc00::c3e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Fri, 13 Nov
 2026 20:08:30 +0000
Received: from MWH0EPF000DD311.namprd05.prod.outlook.com
 (2603:10b6:303:80:cafe::1) by MW4P223CA0011.outlook.office365.com
 (2603:10b6:303:80::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Fri, 13
 Nov 2026 20:08:30 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000DD311.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 13 Nov 2026 20:08:28 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 14:07:37 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 14:07:37 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 14:07:37 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.75.60])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6ADK7bxP645462;
	Fri, 13 Nov 2026 14:07:37 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 13 Nov 2026 14:07:37 -0600
Message-ID: <DMUCROR5YB40.39CTYNATDAFYQ@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master/wrynose][PATCH] ti-sgx-ddk-*: version bump to
 support wrynose
From: Randolph Sapp <rs@ti.com>
To: Andrew Davis <afd@ti.com>, <rs@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>, <detheridge@ti.com>, <praneeth@ti.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261112223746.1226911-1-rs@ti.com>
 <b5cb59c8-2e08-44b2-9271-b3766085772f@ti.com>
In-Reply-To: <b5cb59c8-2e08-44b2-9271-b3766085772f@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000DD311:EE_|DM3PPFA632C0238:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf8b05e-2eae-4cf2-fbe0-08df41c1e235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|261009223027099003|261028144727099003|261102123227099003|261022105027099003|261026140227099003|261021123027099003|261022075727099003|261026121527099003|261102130727099003|261021135927099003|3023799007|261021121427099003|4143699003|261022113327099003|56012099006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: wzwv58p4YdMx2OteQfMiOj2OjQ/U1e8cqt/6Q4JyPeNyRAe4fib1v3UbTH4QtPf1WPePKjt856qX28mfRI3zUub/NfzRw6hpgR1//0y+3TfqZjsFL7r9bP7zgpXGIERN34BLarSjG48owTDSXPb79xJNaDMtN+ZVUXY0+qH1Sc5f6GV7LG5q62V3/DwQdTcFe98AVvKlLKamHQ08mRO3SNTWn48Mlrao17q/hM8zNm7hROpenc47C5cAf/Y8r/eqhPzRPKs4MdeShrwJQ/Id9LO3fTlv0QUjhPeBs7znxZnm0qZNRCikXaM8WCU9/WdeTu1lxa2UMxjtgLbGsmYmAxh0T08N4JyRh95FrXf48YtG6UKBWeVp6rB1KBjjrhzYsRm/IEAKzbg83G2NSgGxK00nfiOeWeq7OAmRuFU80ppTpn221bRK2J4Pt7Hd8Am9OqsgWWi8z/QRzJme/F7UUT1a9LRIZigSEj/GoX6JyX4yQEMbFjWVXN84buvblkbxdWTrRHlpYnrduckCmllub0kkPgPRU+rzXUx/s0Pdn+504KnKDt1xcZZf9i5Cla3IOXM0/wc5Ow9lU41u0eIYQc54JTeqUOZab+Q0BN1NymJkD93T5XL2cbHSP0TfvwHwRMQ3Xd7dzghTLPF3/fv/kcXyHJy4i9Jk9f4jvHJfRPQV+DlTuWqZfQfOdXWDASzLAx+9xIHzSXZovVOrcYCmjg==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(261009223027099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261021123027099003)(261022075727099003)(261026121527099003)(261102130727099003)(261021135927099003)(3023799007)(261021121427099003)(4143699003)(261022113327099003)(56012099006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wpEyILqiIEIpTjT2kdeiFHAGUigoaKnX1dhosddhXd39ucEEByaygXaH7aQOueXO+Fkli/1QlTk8V18ArAQeyC1IT5XCAxRBe6+8YugBiKhbJ8AIjS396BpM9GBhIEfGp+ZkT1nrljE0SbACa27y+St5Yp/MKDVUb4K25V1flJXiYRtA4ZBkXSontosjEu/WlU8FT13QwPHNx3T+zw/K21GU5qWYULRXDz2cRbaWttoaT3LSaFJqFK9gRni3w8Zj67jVxWpOMK+fw5vkgjJIY6ItSI3nyjU5DzKy3aK/ZYz+CFul69U7GjqdlFFn9XZEQt23fWRLLsuL7giliea0RmSXhG7mwKX5lU3Oa6fO1F5w9Fkv6g6x96C8zvY9Am+uFkT7mCHKXVrByfiqQZp23QpR6a+VSoKw/BQ6aCaase96YSMhhra5PSjFKBQRVp7q
X-Exchange-RoutingPolicyChecked: aPU8tUUvV0sw/AMvzitXvKsklkUTzFJoYT0Qxaal8We/GQg8C0RJ0y8958IJjZtKeSwigWRIfvmbtA6/bwjlYaUpRXq7201ZrUKlDlKmKZb2zJPv17Z2CygI9K7s1gNAdNi4TU8lkIXM2SdkQKRM5DIhIUXrJ+bi7/Oe4ogbANrNgDBkgSbiFMM930/L827cjWLmllLGDCfnVLROvADXeNuf2wbVKYMa8ZW+mKZeckNjjIaKyaunpcZY6Il0cnQ6XPvusW+mfJ4kng2e8285LUagqa4z1CVQg6G+qUS6Ruwf1jud8cGMXBi0VttWEoxuRkap5IhqpB0MgOi+AMBLmQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2026 20:08:28.8280
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf8b05e-2eae-4cf2-fbe0-08df41c1e235
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000DD311.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA632C0238
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4MCBTYWx0ZWRfXzHqZJ4cl8Pfo
 8/6ZZOuiK87f3lCHCEahIVR3F4qKQUaBEo4Sk/5MSSL5k7wJ4OA8Y0q935A6BoaB2BO2+srT4FQ
 vgaJ9aXxKNzS1xYHkgIfmgs3Jjo9qtmS9lwTx/pQKz76If7xqBWgXgiekK2ZprZe5SRVhKSvJpP
 F4LhrlhUBAu3RbesOqIvbCQ099OGJMRFKGcw4s/Z6yqgdyIgOdliZyDXGWs/kY6vgqh5AcEpOQv
 TpvpmOTlbkWHQzvfyp51w3skf6iJSbG9cTrJG99pwR8UippcclHc/XXS2K3FlpfVs+ryRKA8OXN
 5L7qFCKgjemLOe/FUMevXaGxVF1ET3LPtaQFhLzGh8qhvWTz9YakqAqeFvOKLrsYQD88xqU5Vcc
 gNS5BaNPWWEP8/NadgIjciBGGAbqymO1Pj10DaJ/8o60MNTdYMIZyJyS7AB6zndXwUUUGJtRSQ8
 O70Td+oyHdPTuLX1OWw==
X-Authority-Analysis: v=2.4 cv=HK9WhYtv c=1 sm=1 tr=0 ts=6af76ed7 cx=c_pps
 a=9FhzUGQqNQs6ZJfz/MkW+g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ZS-ztjz8f-HFJ_5cLgIA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: ypJN-7qGrjWB60tacNufvw9E6V754k0H
X-Proofpoint-GUID: ypJN-7qGrjWB60tacNufvw9E6V754k0H
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4MCBTYWx0ZWRfXzsrpmOfn50jK
 cp5SZu86eb5JCf5KIihp0tBn8NjJmWjonITJXmQjMT+Gh6fsLp0JSzudsTNkRcqM3INNSgzSFDQ
 rw1m25MimU9PZizxrN/COw4yLQE/qiA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130080
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Fri, 13 Nov 2026 20:11:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20542

On Thu Nov 12, 2026 at 4:54 PM CST, Andrew Davis wrote:
> On 11/12/26 4:37 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>=20
>> Bump the SGX graphics packages to include support for kernel 6.18 and
>> mesa 25.2.8.
>>=20
>> This include initial experimental support for a unified dri interface.
>> This deprecates the old mesa interface added for the "sgx" gallium shim.
>>=20
>> This allows SGX devices to use the "pvr" gallium shim currently being
>> used by the rogue proprietary driver. It also adds some experimental EGL
>> features to accommodate the increased requirements for that interface.
>>=20
>> EGL blit operations are present, but testing is currently limited.
>>=20
>> Prime buffer import and export functionality is partially advertised, as
>> required for the mesa pipe loader interface and EGL wayland. The
>> functionality provided for these features is currently the bare minimum
>> for context initialization. Expect some incompatibility.
>>=20
>> This is the initial version, so you may see some issues depending on the
>> application. Please report those issues if they are not covered below.
>>=20
>> Known issues:
>>   - Multisampling support is currently disabled as it does not currently
>>     work (debug in progress)
>>   - A hardware recovery may be seen when initially interacting with the
>>     device (debug pending)
>>   - DRM EGL format negotiations may fail in some applications with tilcd=
c
>>     (low priority / technical limitation)
>>=20
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-ti-bsp/conf/machine/include/ti-bsp.inc                     | 2 ++
>>   .../recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb   | 2 +-
>>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb            | 2 +-
>>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb            | 2 +-
>>   .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb                | 2 +-
>>   5 files changed, 6 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/c=
onf/machine/include/ti-bsp.inc
>> index bf90d1da8a12..d9f59159037a 100644
>> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
>> @@ -42,6 +42,8 @@ BSP_KERNEL_VERSION:bsp-ti-6_18 =3D "6.18%"
>>   BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 =3D "u-boot-ti-staging"
>>   BSP_BOOTLOADER_VERSION:bsp-ti-6_18 =3D "2026.01%"
>>  =20
>> +BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-sgx-ddk-km"
>> +BSP_SGX_DRIVER_VERSION:bsp-ti-6_18 =3D "1.17%"
>>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 =3D "ti-img-rogue-driver"
>>   BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 =3D "26%"
>>   BSP_MESA_PVR_VERSION:bsp-ti-6_18 =3D "25%"
>> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.=
4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.494=
8957.bb
>> index 343f09de3d86..934e663849bd 100644
>> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957=
.bb
>> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957=
.bb
>> @@ -17,7 +17,7 @@ BRANCH =3D "${PV}/mesa/k6.1"
>>  =20
>>   SRC_URI =3D "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;pro=
tocol=3Dhttps;branch=3D${BRANCH}"
>>  =20
>> -SRCREV =3D "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
>> +SRCREV =3D "cfcc733d3d59f3287574fd4909e2cd4cd9346f3f"
>>  =20
>>   TARGET_PRODUCT:ti33x =3D "ti335x_linux"
>>   TARGET_PRODUCT:ti43x =3D "ti437x_linux"
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta=
-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> index 2c20a538b2cf..f5dc5301e757 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> @@ -29,7 +29,7 @@ PR =3D "r1"
>>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>  =20
>>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vi=
rtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vir=
tual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
>> +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vir=
tual/gpudriver', 'ti-sgx-ddk-km', ',pvr', '', d)}"
>>  =20
>>   VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vi=
rtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
>>  =20
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta=
-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
>> index 03b0b9bfc886..1b53ac39d55e 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
>> @@ -20,7 +20,7 @@ PR =3D "r1"
>>   PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>  =20
>>   GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vi=
rtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vir=
tual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
>> +GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vir=
tual/gpudriver', 'ti-sgx-ddk-km', ',pvr', '', d)}"
>
> Could we just do:
>
> GALLIUMDRIVERS:append =3D "pvr"
>
> now that everyone who includes this will want the "pvr" driver?
>
> Andrew
>

Yeah, but I'm waiting for an additional build to finish to see if we could =
also
get away with enabling the vulkan components even though those are actually
unusable under SGX. Just want to make sure it doesn't advertise anything we=
ird
to other userspace tools.

People wanted some revision to test so this was safer / more obvious change=
 for
anyone following along at home.

>>  =20
>>   VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PREFERRED_PROVIDER_vi=
rtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
>>  =20
>> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1=
.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_=
1.17.4948957.bb
>> index c4cc5f10ef3b..bd0656a3cb7e 100644
>> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.494=
8957.bb
>> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.494=
8957.bb
>> @@ -13,7 +13,7 @@ BRANCH =3D "${PV}/mesa/glibc-2.35"
>>   SRC_URI =3D " \
>>       git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=
=3Dhttps;branch=3D${BRANCH} \
>>   "
>> -SRCREV =3D "84a396a4fb379f10931421e489ac8a199d6a9f2c"
>> +SRCREV =3D "f52f27edce0e961be46eb4426dd030a6ab17ad16"
>>  =20
>>   INITSCRIPT_NAME =3D "rc.pvr"
>>   INITSCRIPT_PARAMS =3D "defaults 8"


