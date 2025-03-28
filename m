Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13971C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 04:45:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.4344.1743137138854982539
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 21:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=NKrJ2/Sg;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52S4jakh2024650
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 23:45:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743137136;
	bh=QNdRv+7AjG7GDkyjhIUrlZ3rtyLiES7Gsp6f8XqnFjo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=NKrJ2/SgtlKMHBNYk3f1gTtKARtbJ0CcPr5jn7h018vOmI0I7nXAwtu8P4QJ2Nv9F
	 oNsfjAIfVDNdavyXkzYk1yN2R9rvMfhoLPc9KxNmtagpTZNdn5tYLcjQDm6MBoGBd2
	 ADbge8QZb6+pmhDUTg4WLNQOBPV0uY79OUfPk5XQ=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52S4jaBc064956
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Mar 2025 23:45:36 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Mar 2025 23:45:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Mar 2025 23:45:36 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52S4jXDa094710;
	Thu, 27 Mar 2025 23:45:34 -0500
Message-ID: <5a5135b3-915c-4fa8-b1db-b323e2e8bdd8@ti.com>
Date: Fri, 28 Mar 2025 10:15:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti] [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to
 export prebuilt HSM firmware
To: Ryan Eatmon <reatmon@ti.com>, Suman Anna <s-anna@ti.com>,
        <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20250327092323.1726839-1-b-padhi@ti.com>
 <850d2bdc-6bfb-a27d-b9d9-d609f401df93@ti.com>
 <ce0a6833-e63f-4629-a0fe-265275f37a98@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <ce0a6833-e63f-4629-a0fe-265275f37a98@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 52S4jakh2024650
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Mar 2025 04:45:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18433

Hi Suman, Ryan

On 27/03/25 22:21, Ryan Eatmon wrote:
>
>
> On 3/27/2025 11:45 AM, Suman Anna wrote:
>> Hi Beleswar,
>>
>> On 3/27/25 04:23, Beleswar Padhi via lists.yoctoproject.org wrote:
>>> Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picke=
d
>>> up by the tisdk-core-bundle for the prebuilt binaries directory.
>>
>> The HSM firmware is only an example/demo firmware, and not a=20
>> production HSM
>> firmware.
>
> Should the recipe name reflect the demo nature?=C2=A0 ti-hsm-demo-fw ?
>
>
>> This is not clear when looking at this commit. Please revise your patc=
h
>> description and the SUMMARY to better reflect this.


Will address this in the revision.

Thanks,
Beleswar

>>
>> Hopefully, the same is captured as well in the commit that added this=20
>> to the
>> ti-linux-firmware repo.
>>
>> regards
>> Suman
>>
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> =C2=A0 .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb=C2=A0=C2=A0=C2=A0 |=
 28=20
>>> +++++++++++++++++++
>>> =C2=A0 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc=C2=A0=C2=A0 |=C2=A0=
 1 +
>>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0 |=C2=A0 4 +=
++
>>> =C2=A0 3 files changed, 33 insertions(+)
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw=
_git.bb
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb=20
>>> b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>>> new file mode 100644
>>> index 00000000..8b225421
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>>> @@ -0,0 +1,28 @@
>>> +SUMMARY =3D "TI HSM Firmware"
>>> +
>>> +inherit deploy
>>> +
>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> +
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> +
>>> +PV =3D "${TI_HSM_FW_VERSION}"
>>> +PR =3D "${INC_PR}.0"
>>> +
>>> +SYSFW_SOC ?=3D "*"
>>> +SYSFW_SOC:j721s2 =3D "j721s2"
>>> +SYSFW_SOC:j784s4 =3D "j784s4"
>>> +
>>> +HSM_BINARY =3D "hsm-demo-firmware-${SYSFW_SOC}*.bin"
>>> +
>>> +do_install() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/ti=
-hsm
>>> +=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-hsm/${HSM_BINARY}=20
>>> ${D}${nonarch_base_libdir}/firmware/ti-hsm
>>> +}
>>> +
>>> +do_deploy() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/ti-hsm
>>> +=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOY=
DIR}/ti-hsm
>>> +}
>>> +
>>> +addtask deploy before do_build after do_compile
>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc=20
>>> b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> index 0d912625..4e9c385c 100644
>>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>> @@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION =3D "1.0"
>>> =C2=A0 CNM_WAVE521_FW_VERSION =3D "1.0.7"
>>> =C2=A0 TI_DM_FW_VERSION =3D "11.00.09"
>>> =C2=A0 TI_SYSFW_VERSION =3D "11.00.07"
>>> +TI_HSM_FW_VERSION =3D "11.00.09"
>>> =C2=A0 =C2=A0 TI_LINUX_FW_SRCREV ?=3D "27003b6bff61a55dd1fff2cc777e5e=
07b092b1f7"
>>> =C2=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
>>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> index 41d4abdd..8a800193 100644
>>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>>> @@ -40,6 +40,10 @@ DEPENDS +=3D "python3-pyelftools-native=20
>>> python3-pyyaml-native python3-jsonschema-n
>>> =C2=A0 DEPENDS:append:k3 =3D " ti-sci-fw"
>>> =C2=A0 DEPENDS:append:k3r5 =3D " ti-sci-fw"
>>> =C2=A0 +# HSM Firmware is only applicable for J721S2 & J784S4 devices
>>> +DEPENDS:append:j721s2 =3D " ti-hsm-fw"
>>> +DEPENDS:append:j784s4 =3D " ti-hsm-fw"
>>> +
>>> =C2=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>>> =C2=A0 =C2=A0 PLAT_SFX =3D ""
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online (#18422):=20
>>> https://lists.yoctoproject.org/g/meta-ti/message/18422
>>> Mute This Topic: https://lists.yoctoproject.org/mt/111933183/4594561
>>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub=20
>>> [s-anna@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>
>

