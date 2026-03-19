Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A3B5108E1D8
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:25:56 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com (CH1PR05CU001.outbound.protection.outlook.com [52.101.193.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8006.1773915945891354943
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 03:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=xKaSD51k;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.193.4, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vbj97nXDtC2rRXtAD4dDJ0L7dTBPdPhACC09+UZTCkJFw2n1ybxfOjQ0BOJfQbayrh7UXYMdF+OzYJxN44WO47N9uxfYJjyQAN6DruCY7GYTmmKh//YL5Z8t72deubA+1ChDBmgpaP3QUvSBeSJ1SuyUbjcZ//+5CFmHogN9no+eSjfmrOFqu1nI11FrDVHpVxLZ7CwWATcpuniOUkC7FRMdnqXlzxVyaKsWcqtju8E7aKVRbbqjFddvQWHuCXVDjdLNUkCzQrdDH1i8ykkFHyhChIwPnn6PdaO6zX8x+GaLBckgCBoRRTRuYJ3h1M+mLr7/jeiDsufJfn5/7PsDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOgxp+skRbnjW0NppeUSP8MXW7I8dLefA2l9N9HuFxU=;
 b=EGwUs82dNNozaj+XS03Vius/eAThzxNb6WC33DGz8V6dz1l+3LXQSzSYTHyiRXQsq3qS8GoNc58K9uSQEi1k0zHlaQBIxQUkJOqomTXusPSLQVtBLZe8B2UD0GUR9ScNwnyfB/NibZxglJVWiWZYmOnAPzpoykwqIDjBteMy8p5dLkSbp3AVbb+3J3MfQU1YekLTbEnFnbybAKSSf+ZMNebqnGmSOOssgXLxFlCcnd8vfydT8BgRqVzXBJ/3CS4WF2bTOAqOu1Ufg3PEE3U/7JVuB2CpFaz9SULJfUYs+5Stynr65T2RXY+/hapraKIJCy5fxGYCzYLQuPnwVuB46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOgxp+skRbnjW0NppeUSP8MXW7I8dLefA2l9N9HuFxU=;
 b=xKaSD51klpByph+aeDSBuB8cxHm1S6+Gh2a95iGiPIwSu1ixNTiUfYTqyzZJz52cGRTBNFe73VPczmYlIRPfFfXV6Ie7XSDaBifGXrfKm2S9MPUEXrFZ75gCLbaeefhSqEmwaMhslj6IVQhGz/s5eXBPCNRP0mBx7dp1y2nBK64=
Received: from BN9PR03CA0939.namprd03.prod.outlook.com (2603:10b6:408:108::14)
 by SJ1PR10MB5980.namprd10.prod.outlook.com (2603:10b6:a03:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 10:25:42 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::3e) by BN9PR03CA0939.outlook.office365.com
 (2603:10b6:408:108::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.20 via Frontend Transport; Thu,
 19 Mar 2026 10:25:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 10:25:39 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:25:36 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 05:25:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 05:25:35 -0500
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JAPWkw2420231;
	Thu, 19 Mar 2026 05:25:32 -0500
Message-ID: <c33250f3-dc63-44fa-b450-0e01adfdee5d@ti.com>
Date: Thu, 19 Mar 2026 15:55:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v5 0/3] Add LUKS encryption with fTPM
 support
To: Andrew Davis <afd@ti.com>, Jon Cormier <jcormier@criticallink.com>, "Denys
 Dmytriyenko" <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <rs@ti.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<vigneshr@ti.com>
References: <20260306163735.1316257-1-s-tripathi1@ti.com>
 <20260317195210.GB11121@denix.org>
 <CADL8D3YiVyFD_89BH67ioe1PUOtszGtoHZAPkvP4Syucc=Y=Jg@mail.gmail.com>
 <94e2affb-ddc2-4a84-aec2-708b4a53ce89@ti.com>
 <8b9660ac-0ced-48b2-876c-170e43f774fd@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <8b9660ac-0ced-48b2-876c-170e43f774fd@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|SJ1PR10MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c70783-f72e-4505-5310-08de85a1de04
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	cyfsLn4vTTtnDyxEcT9Cn2d2TQ41+xzLR4kIMTbjVTM+EfdD7obMLpCam3xWncJv47ejPp4dhho1+iJuihX9rr9KGz0vYf3fCrpC/pTwyaAmsfOSHGnlDh1fvaihiubLwYA6Kf24CJ2GpSzM6MIL2pEwzEhCo2vw7sLgmSLieQa2tWf55r7+q1AzLln6EmlwHMdl10NSyS4xlwEgb0yycxBo8zllKoi0y5Z5OvnqyaeMGN+lqVJMiih7qV4kT1KKTS3dFOr/fnqc35s7E3GdRANDPGkdzNFiu+S8dcw6luIyfMB6ryAgi/dVaAF/FYdwsj3qC5jkH7MDBvuoxzTfP7WDIYI/qNSlM8k92kLS1gDaOIp22/ojqPfLzwf+om/ffHn+H1Fo+gd5zFvZhKYDu8jDo8ltopJMsLuy8QJIeQ8322UhTirpIrDRd3RyGhI/zLARs291wx8qJqleSBUuVD3M9lWfiAE7rqbJ10ibgm3edZ4yNlc+WWGQsCn9pHj/vgkvmLauvqyr6KKzQuq6yWcZUv2O2NKzwyyOXSJ0VZUzqZ9/V/qWNXFkXbpfoveIYaXqNL424BhlFivJvl18m9QreUjhsl4L3QYdD6DXTKyN0RbNfotWPTnIje7tNQFohgzhCclv8IBMCEJ41avcIXySf4VJG60gXLp2qeBS4sTAJE5ulWaFzRfln7G+8Db/neVDE7iZW2bNc9jyAGXGASmPOaXxN0jvyS6/Bg3zHmE=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	uUi2TTh8KY4fHUBdLuI/prZY8+Dvru1euhrJKXb4N6kteSmjSlW/nefuThHuAbdzl82IZdyOis2htFtTYGSrWhKy8uFqejTLICvE+0uQDBFKT7HGH6ilPszNZv6hurZoqxiZh8J0PN6NHSgn1J1WJngHPZ9BCy6bWbWCd36FIf5FCGx3VQcqOCJdQIWXb0eNPaCN/gy4LZLoMoiK0YSGw9FCyxiwGowIVZ0i3tdvK03wQKjCrt9fT7ihR8LmSwoNNwh4K1Ur0ZGynmCUqyd6AMoNDJ173a6zrUb9aiue/a+WLErTTO3E4CjxoFmWA/+XgYQzY6Dp3BKlqL58/weZgLiuKxgagzwEXk9xjI15Bz+OT2sULIY5eMLQBJ3JsxYTz38eFwScqSepawgqIwHq0B3Xm5B2uFkaUTO82rbK1teZo3gADLgiShMXY+11f1x5
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:25:39.2979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c70783-f72e-4505-5310-08de85a1de04
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5980
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 10:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19771



On 3/18/26 21:42, Andrew Davis wrote:
> On 3/18/26 9:47 AM, Shiva Tripathi wrote:
>>
>>
>> On 3/18/26 19:42, Jon Cormier wrote:
>>> I am following this discussion as its pretty relevant to us trying to
>>> get a full end to end secure boot implementation.
>>>
>>> On Tue, Mar 17, 2026 at 3:52=E2=80=AFPM Denys Dmytriyenko <denis@denix.=
org>
>>> wrote:
>>>>
>>>> Sorry for the delay and thanks for waiting!
>>>>
>>>> Below are some high-level questions and comments I've got reviewing
>>>> your
>>>> patches.
>>
>> Hi Denys, Jon
>> Thanks for the review. Adding my comments below:
>>
>>>>
>>>>
>>>> On Fri, Mar 06, 2026 at 10:07:32PM +0530, Shiva Tripathi via
>>>> lists.yoctoproject.org wrote:
>>>>> This patch series adds LUKS full disk encryption support using
>>>>> firmware TPM
>>>>> (fTPM) for TI K3 platforms. The implementation provides hardware-
>>>>> backed
>>>>> encryption with keys sealed by TPM running in OP-TEE and stored in
>>>>> eMMC RPMB.
>>>>
>>>> What are the HW requirements for this implementation?
>>>> Does it work on any K3 platform, even GP, or does it require an HS
>>>> variant?
>>>> What about eMMC requirement?
>>>>
>>
>> Yes eMMC with RPMB is mandatory for this implementation to work since
>> the TPM sealed key (handle 0x81080001) is stored in RPMB, leveraging the
>> replay-attack protection. Since OPTEE FTPM is enabled for K3 [1], this
>> implementation is applicable for all K3 platforms (GP and HS both
>> inclusive). It would make more sense to use it for HS devices with
>> authenticated boot chain present, and fTPM based encryption providing a
>> better security model.
>>
>> [1]:
>> https://github.com/YoeDistro/meta-ti/blob/master/meta-ti-bsp/conf/
>> machine/include/k3.inc#L41
>>
>>
>>>>
>>>>> Background:
>>>>> TI K3 platforms do not have integrated discrete TPM hardware. To
>>>>> provide
>>>>> TPM 2.0 functionality, this implementation uses firmware TPM (fTPM)
>>>>> - a
>>>>> Trusted Application running in OP-TEE secure world. The fTPM provides
>>>>> standard TPM 2.0 interfaces while leveraging ARM TrustZone for
>>>>> isolation
>>>>> and eMMC RPMB (Replay Protected Memory Block) for secure persistent
>>>>> storage.
>>>>>
>>>>> Key features:
>>>>> - Conditional builds: Enabled via DISTRO_FEATURES +=3D "luks" with
>>>>> MACHINE_FEATURES as 'optee-ftpm'
>>>>
>>>> Why is it being added to meta-ti? This seems heavily distro-
>>>> specific, maybe
>>>> even product-specific...
>>>>
>>>> Moreover, there are run-time dependencies on TPM packages that are
>>>> not in any
>>>> of the layers that meta-ti depends on.
>>>>
>>>> In order to enable this feature, you'd need to add a corresponding
>>>> layer to
>>>> bblayers.conf - should this at a minimum go into a dynamic-layer?
>>>>
>>>>
>>
>> The reason to keep it in meta-ti is, optee-ftpm recipes and TI K3 OP-TEE
>> integration are already in meta-ti-bsp.
>=20
> Which means they will also be available in any layers that depend on
> meta-it-bsp such as meta-arago..
>=20
>> This LUKS module implementation
>> is K3-specific, relies on TI's OP-TEE implementation and uses K3
>> hardware features.
>=20
> How does this rely on TI's OP-TEE? The API's exposed from our OP-TEE
> are all standard APIs. I'm not seeing what part of this is actually
> TI specific?
>=20

You are right, I misquoted it. The OP-TEE APIs are standard, not
TI-specific.
Following Denys's recommendation I have moved recipes to
dynamic-layers/security/ making this conditionally available on
meta-security presence.

Thanks,
Shiva

> Andrew
>=20
>>
>> Agree, we can move it to dynamic-layers/security. I'll shorty send the
>> v6 patches with this change.
>>
>>>>> - No impact on default SDK builds
>>>>
>>>> Since this is disabled by default, this never gets built by the CI/
>>>> CD and
>>>> hence, there's no way to ensure future changes don't break this.
>>>> Arguably, there are other features that are not enabled by default
>>>> (jailhouse, falcon), so it may be a moot point...
>>>>
>>
>> Agree with your concern, we are planning to automate testing for this
>> feature starting from am62x platforms. But it's not there in place today=
.
>>
>>>>
>>>>> - In-place encryption on first boot
>>>>> - TPM persistent handle for key storage (0x81080001)
>>>>> - Secure key storage in eMMC RPMB via OP-TEE
>>>>> - Security model similar to CIP Core
>>>>>
>>>>> Use case:
>>>>> This is designed for K3 platforms requiring secure boot and encrypted
>>>>
>>>> How are you protecting boot partition from getting tampered with?
>>>> Besides encrypting rootfs, are there any other Secure Boot steps
>>>> taken to
>>>> protect the boot flow from a MITM attack?
>>> The guides for secure booting u-boot and the kernel are pretty decent.
>>> But currently it gets a bit fuzzy when it gets to securing the
>>> filesystem.=C2=A0 And integrating that with Yocto.=C2=A0 The current gu=
ide
>>> instead of encrypting in place, copies the unencrypted rootfs data
>>> into a new encrypted partition during first boot.=C2=A0 And the encrypt=
ion
>>> key isn't protected at all. So this does seem like a positive step
>>> forward.
>>> https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/11_02_08_02/
>>> exports/docs/linux/Foundational_Components/System_Security/
>>> Auth_boot.html
>>
>> Boot partition isn't protected in this implementation. This is
>> data-at-rest encryption only. For a complete secure boot flow, this
>> should be combined with TI's secure boot (ROM =E2=86=92 SPL =E2=86=92 U-=
Boot =E2=86=92 FIT image
>> verification), as highlighted by Jon.
>>
>> Secure Boot + LUKS: Protects against boot tampering + data theft
>>
>>>>
>>>>
>>>>> storage, such as industrial automation, automotive, and IoT
>>>>> gateways where
>>>>> discrete TPM chips are cost-prohibitive but security requirements
>>>>> demand
>>>>> hardware-backed encryption.
>>>>>
>>>>> Testing:
>>>>> - Tested on AM62x platform with kernel 6.18
>>>>> - First boot: Successful in-place LUKS encryption
>>>>
>>>> Have you considered pre-encrypting the image during the build and then
>>>> only changing the key, if needed, on the first boot?
>>> Would that be any faster?=C2=A0 I'd assume re-encrypting with a new key
>>> would take just as long if not more than encrypting once.
>>
>> I have followed the CIP core's security model approach here, which does
>> in-place encryption to avoid shipping images with shared encryption key.
>>
>> I think approach you are suggesting would make use of updating LUKS
>> keyslots (dummy with TPM key) but i am not very confident about it at
>> moment - on speed and any new security attack surface it exposes.
>>
>> Would it be fine to take the in-place encryption approach time being ?
>> We can do more analysis on the method you are suggesting and improve
>> going ahead.
>>
>>
>>>>
>>>> How long does it take to encrypt the rootfs on the first boot? I
>>>> would imagine
>>>> it being very expensive operation to encrypt and overwrite the entire
>>>> partition.
>>>>
>>>> Also, have you considered binding the key to a PCR, so it is not easil=
y
>>>> extractable during a MITM attack?
>>>>
>>>> Anyway, I'm guessing this is just a sample implementation of this one
>>>> particular feature - encrypted rootfs - and not a complete Secure
>>>> Boot ready
>>>> for production...
>>>>
>>
>> I see "17.4 MiB/s" as the encryption speed. For a minimal image (~ 315
>> MiB) it takes around 17 seconds.
>>
>> Binding key to PCR would be a next phase improvement. We haven't enabled
>> measured boot too yet, in the current series keys are sealed to TPM.
>>
>> Yes, the whole idea of this implementation is to give a reference to
>> users who want to use hardware backed solution with RPMB and fTPM and
>> perform disk encryption. They'll have to analyze their security model
>> requirements and fine tune this reference implementation.
>>
>> Thanks,
>> Shiva
>>
>>>>
>>>>> - Subsequent boots: Successful TPM unsealing and boot
>>>>>
>>>>> The series is structured as follows:
>>>>> 1. Kernel configuration for LUKS and crypto support
>>>>> 2. LUKS encryption initramfs module with fTPM key management
>>>>> 3. Initramfs generation trigger and packagegroup with dual gating
>>>>>
>>>>> ---
>>>>> Changes in v5:
>>>>> - change from MACHINE_FEATURES 'luks-encryption' to DISTRO_FEATURES
>>>>> 'luks'
>>>>> - implement dual gating using existing MACHINE_FEATURES 'optee-ftpm'
>>>>> - optimize kernel config - remove unnecessary CBC, ECB, ESSIV, LRW,
>>>>> PCBC, SHA256_ARM64
>>>>> - packagegroup-ti-core-initramfs.bb changes moved to patch 3 from
>>>>> patch2
>>>>> - Link to v4: https://lore.kernel.org/all/20260305172115.3684326-1-
>>>>> s-tripathi1@ti.com/
>>>>>
>>>>> Changes in v4:
>>>>> - remove encrypted-boot-common.inc and use existing ti-core-
>>>>> initramfs.inc
>>>>> - Link to v3: https://lore.kernel.org/all/20260304193824.2495898-1-
>>>>> s-tripathi1@ti.com/
>>>>>
>>>>> Changes in v3:
>>>>> =C2=A0 - remove separate sdimage.wks for encrypted boot, default work=
s
>>>>> =C2=A0 - update encrypted-boot-common.inc to use existing hook for
>>>>> adding TI_CORE_INITRAMFS_ENABLED dependency on luks-encryption flag
>>>>> =C2=A0 - add logic to verify if partition has enough space for LUKS
>>>>> header before starting encryption
>>>>>
>>>>> Changes in v2:
>>>>> - changes to use existing ti-core-initramfs instead of adding separat=
e
>>>>> - cleanup in previous init script as per comments in v1
>>>>> - /usr/bin/busybox logs updated to echo, mesg, info
>>>>> - WORKDIR changed to UNPACKDIR
>>>>> - Link to v1: https://lore.kernel.org/all/20260302144647.1705408-1-
>>>>> s-tripathi1@ti.com/
>>>>>
>>>>> Shiva Tripathi (3):
>>>>> =C2=A0=C2=A0 linux-ti-staging: Add LUKS encryption config
>>>>> =C2=A0=C2=A0 initramfs: Add LUKS encryption module with fTPM
>>>>> =C2=A0=C2=A0 ti-core-initramfs: Enable initramfs for LUKS encryption
>>>>>
>>>>> =C2=A0 .../machine/include/ti-core-initramfs.inc=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 2 +-
>>>>> =C2=A0 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg |=C2=A0 22 ++
>>>>> =C2=A0 .../linux/linux-ti-staging_6.18.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
>>>>> =C2=A0 .../initramfs-module-luks-ftpm/luksftpm=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 341 +++++++++++++
>>>>> +++++
>>>>> =C2=A0 .../initramfs-module-luks-ftpm_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 41 +++
>>>>> =C2=A0 .../packagegroup-ti-core-initramfs.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
>>>>> =C2=A0 6 files changed, 417 insertions(+), 1 deletion(-)
>>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-
>>>>> staging-6.18/luks-ftpm.cfg
>>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-
>>>>> module-luks-ftpm/luksftpm
>>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-
>>>>> module-luks-ftpm_1.0.bb
>>>>>
>>>>> --=20
>>>>> 2.34.1
>>>
>>>
>>>
>>
>=20


