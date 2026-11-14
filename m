Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4510.1794623775039446257
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Nov 2026 18:36:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=f2a1dIe2;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=Xl4dIlS7;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: afd@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE1wKUb2832873;
	Fri, 13 Nov 2026 20:36:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=J56p/7EsOdWD25pk4OOfmEN82I9jdyAnndvUNiX6q
	9k=; b=f2a1dIe2vyDV03COxFJB9nFZmzowFX/0KDnym8A0yfNZqfxEFJUJct9dG
	gS6ZBt+wRNdOmzRjnwFG6Dr/wkYX9QhqtgvBdkfHHNkSh8P23cUdFx4gB/Zxc5Ua
	payuqauUcj5foCK+j4ELEP9q2K3PDGR8wLAEKFJ3ppfP4LfXw/c7Cl/alhuZWSCI
	9qOhKruuEPJS4HEgu5FfO5XA0cDbsWKEvxjO+/DaVe+t16uBoxBn/xnkBe+k0r5F
	U6ug2pVOw20fUgGS2FSfycuILAwpVWJQz0yLfbcDTsjVYrzLafwEc63M5ctHdefY
	qf0OrgggD84gxB43OdxTUkwhljZNQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hxamxs3ad-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 20:36:11 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SXhqHATe3BnxlW5VQvaRWn4XMFq+gRnpqUxsX7q2j6/Nu3dX/YWOiVBpSFb9cxzys/pDtYI7yQUbTjgAjkn8hF/GqbTFveoDcLLZNRe+WdTUBi8WLcf/YpuBKssH3wa2dy7I0sgdINfrjxBWIPEJZxUVkBRIv95ZgePL2C0tR+YU4p9DghkkqfuU7upYMMhx5VeamEl/rhyEcuS2D6aesyJ1Z34aLqBMXBYS/XZ0LktednMxH1AFpUZhF7O6y2Mb7GatPJ9Xqew4A0NDEbjqdM8Ffcy0PUUkF+mPMYg3ZiLtrAuRdy+zrPXgv1/kj3M9NGLp8Ega7B442mtAJObPIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J56p/7EsOdWD25pk4OOfmEN82I9jdyAnndvUNiX6q9k=;
 b=mVu/fb2n81ppzevsK/9AZxJ1pu90eHjW1IvsIi5/88BmpaWBCDotNmxrJkUDnYFnWkaIV2cLDUJ1guxc46MXC7BOe5TcogtIq2mDpvKaGdb2X+hQtewgHHmGw+4Z9SpUBK/91bZ85Tw+dIhzv5RHeQvli5+g+KVhXv8zHSWTQ+riImkT+3z9aoKUEZb0rXjW3K2VqS9mTwLDeEew5BS+YKP600hVf6WqpQrGtrRQk8RuqNxkBzSK15e33fSe6Ks1RA6m7TDsrVTE92Ug6QGhL2eSrCzYk+NZWScaeBMxanpfQqbkvKkLlNkP3xXn/mwP8OBXPBZb8ENS2liPFimX+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J56p/7EsOdWD25pk4OOfmEN82I9jdyAnndvUNiX6q9k=;
 b=Xl4dIlS78c+BoFKlumXEKBlSvxqLxX5zVvN5Aa6t3P1fxCqExoLzPB0Y/5KDwham0e8nIxVsI423UQ+fi58gCp56xMDsVYz+ylLYsYfPbGw5WQppVAn0n8i3aGlZA/kiroVmGkj2OU5zzKhAkrUxahY24DcLnyHLSTDb1+uGFdI=
Received: from CY5PR19CA0062.namprd19.prod.outlook.com (2603:10b6:930:69::9)
 by IA0PR10MB6817.namprd10.prod.outlook.com (2603:10b6:208:43a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Sat, 14 Nov
 2026 02:35:08 +0000
Received: from EA8PEPF00000009.namprd05.prod.outlook.com
 (2603:10b6:930:69:cafe::ab) by CY5PR19CA0062.outlook.office365.com
 (2603:10b6:930:69::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Sat, 14
 Nov 2026 02:35:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 EA8PEPF00000009.mail.protection.outlook.com (10.167.249.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sat, 14 Nov 2026 02:35:07 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 20:34:43 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 13 Nov
 2026 20:34:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 13 Nov 2026 20:34:43 -0600
Received: from [10.249.34.41] ([10.249.34.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6AE2YhTg1233267;
	Fri, 13 Nov 2026 20:34:43 -0600
Message-ID: <58f60dd1-21d2-412b-92f4-8617d80f9dc5@ti.com>
Date: Fri, 13 Nov 2026 20:34:42 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCHv2] ti-sgx-ddk-*: version bump to
 support wrynose
To: <rs@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20261113212342.1705645-1-rs@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20261113212342.1705645-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: EA8PEPF00000009:EE_|IA0PR10MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a6fe27-c12d-4bfd-7959-08df41f7e584
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|261022105027099003|261021123027099003|261021121427099003|261022113327099003|261028144727099003|10067099003|261021135927099003|261022075727099003|261102130727099003|261026140227099003|261026121527099003|261009223027099003|56012099006|261102123227099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: zh5L5weWxWRpl+s8IIv1n2vo2MkJ+GjBoUA6gWORa61p4db6JRWg9YpmJK19tzPi5Qbj0dlKEq5+KplUqhER7jgbPAuzoS5IPOaG0W26zGluhoEXY+s+QRM49RmeWeEBAr8jMCJKdXBkJF5BhjeV2+FqdhVotnsk21zRtqcP1bg5dOToi0mQ7AJVA/p2n2wL0Z2Bk07gxxzaCSAvsAZhTfwASpsnQ0pWN0vDkxA7QhJe4eGtpqmjwaTjvGEEITVzaboGpjLGKenIrgaKArXXqrngdwcY0zCoD/gKLEJlnf+/qrSwi2rhP/cAtnAANsxS0xIxZI3YHrBfbZYDI09cy4Hgwwl2EjcmKbUEhQHKddqb4SqxrSTZw9IlAa+ulDRsuVuyv7aj5c55UDtjD6EWWP4Yu+TmGps1Kvh5NXvqwHRkMJ+x/ff0EwrocHkeVZ6sEEYVhNqDPt+IliLwlWRwR5oxK+Gr9DlQMHDHqaeXzactqMzL8gDL8IG4pkBTzxrRDsM7t914+sPpcMnhWRmPsgyYNhjK+CaQ8vWc/bauU9uj5aYcb9FkeV47nKAzGI3tiwbR4U0zsFjM5+XUNyv3skJ9rEQYc30LAwDu9IXtWanCl1CmxAo8MkYf6Z/TQLQHlzDt8cyHQCxE3RvmtRWOY1Pk5fxawWwiH7OVsjxU/mPhPFTmBGVDo9NBfSlROc85vGs/0m2NEZPNLh3jzAqqbA==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(261022105027099003)(261021123027099003)(261021121427099003)(261022113327099003)(261028144727099003)(10067099003)(261021135927099003)(261022075727099003)(261102130727099003)(261026140227099003)(261026121527099003)(261009223027099003)(56012099006)(261102123227099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6w05WI9Q3O3QyP3dlsXVTrNIRXkI5tmJto8lk1rP3sOzJ+VJ+HYbZg0lLh8/guEGm2kaZvmnSiE4/dLf9sJxR9bp1mA5zJxg863FUeo14XjAvS52JdIwv/oK8823IBP/j3972Girq6cQyGYmmmdfxp5bCZut1yNnGmdZRLdpbF2r3auzXiweibOwxCnhApOHTyksNURIj01xTZHCtlmAhb5PCFN3oPuvRxaKO5BcbZNPJnXcTwOCGDbJKoEROrlD97whxd8By2PnT2FvYFlZqAWIItl7VobjqMAs20e0jCapLItTxGowBq4VBBensxQPISRLq57tS8SeOb1EN2uUu0tVky64xLL5aVRFABBF9RNfhlMdBmNg1bsLRcpTsxHP927u7OcyJi4GhdG3pxX+prlJWsCaloAjyrKyLnksBuuh5wB5ZfY4VHJJBYWNeXxG
X-Exchange-RoutingPolicyChecked: in5T7mY6e4vqHXCUKI9iwUbDJuyX2ljx+DwnzKEttPtid2zrQ8uDKKugGMHaHKDjx9Qj/iUqqT8gAcm5hE7aZr3rCcrP/FXruFSMJ4PW5a+ytJMYO4i/oMJJZewwtiVkalDLUA4Ej//206O1nFBlxggQw13y8/DJXJhIFxCV76gVHPSXcM9uh2MGTIOdigcC5kaw0IIevXAJE33pflNI8yFhWCP+IB/x0rgD/iaOgyX6LfkP8d4qFEUNgKvAgaASe0fehAz0OxjRENDbkDoEVKVu46f7FsL15EzVCWdK9ghsz83n3FDLFXASzK3SLPaWHkm18z8pKgvBib8Wu1b/BQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2026 02:35:07.1944
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a6fe27-c12d-4bfd-7959-08df41f7e584
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: EA8PEPF00000009.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6817
X-Proofpoint-GUID: _0ane1pDVUBGokT0mqsVAxsQUimgNI80
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwOSBTYWx0ZWRfX0GW+dyWtt4SG
 DscUj6wytteKZeUlD5QplN1S2D9QO+cUjVJS7l1JaTNXmMSCO3tidANlTZyuNnf4r6SJJx3HQsx
 jEL5Prm/N2wZvPx8K8gg4GLtNQfqygg=
X-Proofpoint-ORIG-GUID: _0ane1pDVUBGokT0mqsVAxsQUimgNI80
X-Authority-Analysis: v=2.4 cv=bPODs/+Z c=1 sm=1 tr=0 ts=6af7c91b cx=c_pps
 a=7AyV/nWbqbi5qqSn9KuTSQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=O_n7OeDgjyF21q_Tmw0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwOSBTYWx0ZWRfX++IFpyXo/vo8
 W2aOj+IYXNIy2uK+waRAlQfEA8wAu8QCv/suLF4+wpKiDxud0vFFR8JhMB+BB8GHHFUcw1SIzjk
 NiOjp09wSBNqXPIcFeHXLEp9H75NMpxkClm0yGTrhfEcDu7lgSUUK92AzAxlBswcebnMnzRIqfq
 /veYdtRJeetDbZI4FEXDaThMKv410EctdyZG7gor7dQidZP1EG2X3tyqPaRVBEmlHfwzXSqpkhr
 kYmWJvZPwyg655+rWGaDfEyhq84ektRoZTHDaoviQVeRyoPwsP3YyUqPam2527jPtBdTh0veybz
 ysuJX9yXQj2QFj92OnlOQ3GwVELHGOHG88XaThWQkrvyKnHyXc/OxRQIRvu7JuFQYOk+5H6/VxC
 PpGV5ybVB9TVE8Q2xP9Aw7JWd/SvZ+j8raYaBzTWedB//vuPiiBFjpAJHUAjQa9mZHTz+qPx6BP
 ZezLGBqXHcLKRCzhWbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Sat, 14 Nov 2026 02:36:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20549

On 11/13/26 3:23 PM, rs@ti.com wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> Bump the SGX graphics packages to include support for kernel 6.18 and
> mesa 25.2.8.
> 
> This include initial experimental support for a unified dri interface.
> This deprecates the old mesa interface added for the "sgx" gallium shim.
> 
> This allows SGX devices to use the "pvr" gallium shim currently being
> used by the rogue proprietary driver. It also adds some experimental EGL
> features to accommodate the increased requirements for that interface.
> 
> EGL blit operations are present, but testing is currently limited.
> 
> Prime buffer import and export functionality is partially advertised, as
> required for the mesa pipe loader interface and EGL wayland. The
> functionality provided for these features is currently the bare minimum
> for context initialization. Expect some incompatibility.
> 
> This is the initial version, so you may see some issues depending on the
> application. Please report those issues if they are not covered below.
> 
> Known issues:
>   - Multisampling support is currently disabled as it does not currently
>     work (debug in progress)
>   - A hardware recovery may be seen when initially interacting with the
>     device (debug pending)
>   - DRM EGL format negotiations may fail in some applications with tilcdc
>     (low priority / technical limitation)
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
> 
> v2:
> 	- Unconditionally enable pvr gallium and vulkan components. Though SGX
> 	  doesn't support vulkan it also doesn't break anything on these
> 	  platforms.
> 


Oh nice, glad that worked,

Reviewed-by: Andrew Davis <afd@ti.com>


>   meta-ti-bsp/conf/machine/include/ti-bsp.inc                 | 2 ++
>   .../powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb           | 2 +-
>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb        | 6 ++----
>   meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb        | 6 ++----
>   .../powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb            | 2 +-
>   5 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/meta-ti-bsp/conf/machine/include/ti-bsp.inc b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> index bf90d1da8a12..d9f59159037a 100644
> --- a/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> +++ b/meta-ti-bsp/conf/machine/include/ti-bsp.inc
> @@ -42,6 +42,8 @@ BSP_KERNEL_VERSION:bsp-ti-6_18 = "6.18%"
>   BSP_BOOTLOADER_PROVIDER:bsp-ti-6_18 = "u-boot-ti-staging"
>   BSP_BOOTLOADER_VERSION:bsp-ti-6_18 = "2026.01%"
>   
> +BSP_SGX_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-sgx-ddk-km"
> +BSP_SGX_DRIVER_VERSION:bsp-ti-6_18 = "1.17%"
>   BSP_ROGUE_DRIVER_PROVIDER:bsp-ti-6_18 = "ti-img-rogue-driver"
>   BSP_ROGUE_DRIVER_VERSION:bsp-ti-6_18 = "26%"
>   BSP_MESA_PVR_VERSION:bsp-ti-6_18 = "25%"
> diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> index 343f09de3d86..934e663849bd 100644
> --- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.17.4948957.bb
> @@ -17,7 +17,7 @@ BRANCH = "${PV}/mesa/k6.1"
>   
>   SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git;protocol=https;branch=${BRANCH}"
>   
> -SRCREV = "9ae0fa4998b1c624408945e062bf8fb0ea7efb9d"
> +SRCREV = "cfcc733d3d59f3287574fd4909e2cd4cd9346f3f"
>   
>   TARGET_PRODUCT:ti33x = "ti335x_linux"
>   TARGET_PRODUCT:ti43x = "ti437x_linux"
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> index 2c20a538b2cf..f671f162f39d 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
> @@ -28,10 +28,8 @@ PR = "r1"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
> -GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
> -
> -VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
> +GALLIUMDRIVERS:append = ",pvr"
> +VULKAN_DRIVERS:append = ",pvr"
>   
>   do_install:append () {
>       # remove pvr custom pkgconfig
> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> index 03b0b9bfc886..6519708e17d6 100644
> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_25.2.8.bb
> @@ -19,10 +19,8 @@ PR = "r1"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> -GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
> -GALLIUMDRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', ',sgx', '', d)}"
> -
> -VULKAN_DRIVERS:append = "${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', ',pvr', '', d)}"
> +GALLIUMDRIVERS:append = ",pvr"
> +VULKAN_DRIVERS:append = ",pvr"
>   
>   PACKAGECONFIG = " \
>           gallium \
> diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> index c4cc5f10ef3b..bd0656a3cb7e 100644
> --- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> +++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
> @@ -13,7 +13,7 @@ BRANCH = "${PV}/mesa/glibc-2.35"
>   SRC_URI = " \
>       git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
>   "
> -SRCREV = "84a396a4fb379f10931421e489ac8a199d6a9f2c"
> +SRCREV = "f52f27edce0e961be46eb4426dd030a6ab17ad16"
>   
>   INITSCRIPT_NAME = "rc.pvr"
>   INITSCRIPT_PARAMS = "defaults 8"

