Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28858C36013
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 05:04:34 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.4759.1743138270012772777
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Mar 2025 22:04:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=XwlMKuIh;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: b-padhi@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52S54S0m2070702
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 28 Mar 2025 00:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1743138268;
	bh=W6jZISsE4V79NNEgoCtnwCK4xyZ2Gv1dy/k8aeRqTs4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XwlMKuIh/Eet7Qd2HBq40vmbsxzC0k08HKomyZY5o0ePdT0H67P163LGfdV6CTlsc
	 m/yx9GUf/QDgD2zFZiNuqQpWQdV7LJDddKkBwJf9sc5O/JSK6O016Ka5g2HQzvQH6N
	 3V+aWirnKkcz6F/oNYp1JQbXR97Irrp+/bOLiOYM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52S54Sg8088297;
	Fri, 28 Mar 2025 00:04:28 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Mar 2025 00:04:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Mar 2025 00:04:28 -0500
Received: from [172.24.227.151] (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52S54Pb6118256;
	Fri, 28 Mar 2025 00:04:26 -0500
Message-ID: <14f7bdad-bd66-475d-860e-86bec93d482a@ti.com>
Date: Fri, 28 Mar 2025 10:34:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH] ti-hsm-fw: Add a recipe to export
 prebuilt HSM firmware
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>,
        "Anna, Suman" <s-anna@ti.com>
References: <20250327092323.1726839-1-b-padhi@ti.com>
 <1d0eeedc-8574-487b-aada-871668ad3679@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <1d0eeedc-8574-487b-aada-871668ad3679@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 52S54S0m2070702
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Mar 2025 05:04:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18435

Hi Andrew,

On 28/03/25 00:19, Andrew Davis wrote:
> On 3/27/25 4:23 AM, Beleswar Padhi wrote:
>> Add a recipe to deploy the HSM firmware to the DEPLOYDIR, to be picked
>> up by the tisdk-core-bundle for the prebuilt binaries directory.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> =C2=A0 .../recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb=C2=A0=C2=A0=C2=A0 | =
28 +++++++++++++++++++
>> =C2=A0 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc=C2=A0=C2=A0 |=C2=A0=
 1 +
>> =C2=A0 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=C2=A0 |=C2=A0 4 ++=
+
>> =C2=A0 3 files changed, 33 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_=
git.bb
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>> new file mode 100644
>> index 00000000..8b225421
>> --- /dev/null
>> +++ b/meta-ti-bsp/recipes-bsp/ti-hsm-fw/ti-hsm-fw_git.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY =3D "TI HSM Firmware"
>> +
>> +inherit deploy
>> +
>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> +
>> +PV =3D "${TI_HSM_FW_VERSION}"
>> +PR =3D "${INC_PR}.0"
>> +
>> +SYSFW_SOC ?=3D "*"
>
> Was this supposed to be ""?


Hmm, this recipe is supposed to be built only for j721s2/j784s4=20
platforms. So ideally this should not be built for other platforms. But=20
if it does, you're right; it's better to put it as an empty string to=20
keep the package contents empty rather than copying everything.

>
> Also, thinking on this, since these binaries have different names
> when deployed, do we really need this package to be different
> per machine? Why not have this recipe generate two packages,
>
> ti-hsm-fw-j721s2
> ti-hsm-fw-j784s4
>
> each containing the firmware for that SoC. Then in u-boot-ti.inc
> have:
>
> DEPENDS:append:j721s2 =3D " ti-hsm-fw-j721s2"
> DEPENDS:append:j784s4 =3D " ti-hsm-fw-j784s4"


Sorry, I am confused. The HSM binaries have different name corresponding=20
to each device. Do you wish to see one same package deployed in every=20
machine which has all HSM binaries? Or do you wish to see different=20
package deployed for every machine which have only the binaries it=20
needs? If its the later, then this patch already serves that purpose, rig=
ht?

Thanks,
Beleswar

>
> Then you can drop the PACKAGE_ARCH line above. I'm thinking about
> doing this for the other firmware. I'd like to keep removing
> machine dependent packages to push us closer to common rootfs
> images that work across machines.
>
> Andrew
>
>> +SYSFW_SOC:j721s2 =3D "j721s2"
>> +SYSFW_SOC:j784s4 =3D "j784s4"
>> +
>> +HSM_BINARY =3D "hsm-demo-firmware-${SYSFW_SOC}*.bin"
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${nonarch_base_libdir}/firmware/ti-=
hsm
>> +=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-hsm/${HSM_BINARY}=20
>> ${D}${nonarch_base_libdir}/firmware/ti-hsm
>> +}
>> +
>> +do_deploy() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${DEPLOYDIR}/ti-hsm
>> +=C2=A0=C2=A0=C2=A0 install -m 644 ${S}/ti-hsm/${HSM_BINARY} ${DEPLOYD=
IR}/ti-hsm
>> +}
>> +
>> +addtask deploy before do_build after do_compile
>> diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc=20
>> b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> index 0d912625..4e9c385c 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> +++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>> @@ -16,6 +16,7 @@ IMG_DEC_FW_VERSION =3D "1.0"
>> =C2=A0 CNM_WAVE521_FW_VERSION =3D "1.0.7"
>> =C2=A0 TI_DM_FW_VERSION =3D "11.00.09"
>> =C2=A0 TI_SYSFW_VERSION =3D "11.00.07"
>> +TI_HSM_FW_VERSION =3D "11.00.09"
>> =C2=A0 =C2=A0 TI_LINUX_FW_SRCREV ?=3D "27003b6bff61a55dd1fff2cc777e5e0=
7b092b1f7"
>> =C2=A0 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
>> diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc=20
>> b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> index 41d4abdd..8a800193 100644
>> --- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> +++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
>> @@ -40,6 +40,10 @@ DEPENDS +=3D "python3-pyelftools-native=20
>> python3-pyyaml-native python3-jsonschema-n
>> =C2=A0 DEPENDS:append:k3 =3D " ti-sci-fw"
>> =C2=A0 DEPENDS:append:k3r5 =3D " ti-sci-fw"
>> =C2=A0 +# HSM Firmware is only applicable for J721S2 & J784S4 devices
>> +DEPENDS:append:j721s2 =3D " ti-hsm-fw"
>> +DEPENDS:append:j784s4 =3D " ti-hsm-fw"
>> +
>> =C2=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xer5f"
>> =C2=A0 =C2=A0 PLAT_SFX =3D ""

