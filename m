Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A9CC5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 04:53:33 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.79454.1749531212339842271
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Jun 2025 21:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=PGoKDwwS;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: p-bhagat@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55A4rTir2191220;
	Mon, 9 Jun 2025 23:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749531209;
	bh=etyNJOMvMVr4mT+1H/OL64Fy4n3XDLuVQnbKgqI4GXc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=PGoKDwwSjPpyMI5q4quvYpw196SROAuccVgDllLoDAlwzFaeeS60AXpfNRy67DKPI
	 EhR1wY16U+cZHCqc2LHP/1JsUGNyI1nvUkSwbUKYI4X1fH9BAqNjMWcvswXTVI3GqM
	 RHS+J+DdsHu6jxfFtcsuUjDSG3H9jaG+jOvRyAeA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55A4rTrt116755
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 9 Jun 2025 23:53:29 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Jun 2025 23:53:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Jun 2025 23:53:28 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55A4rP0c2351504;
	Mon, 9 Jun 2025 23:53:26 -0500
Message-ID: <509621e3-5d19-467c-abf7-94b090dab5e8@ti.com>
Date: Tue, 10 Jun 2025 10:23:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [scarthgap][PATCH] meta-ti-bsp: ti-rtos-fw: Update IPC firmwares
 for am62dxx
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denis@denix.org>, <praneeth@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <afd@ti.com>, <khasim@ti.com>
References: <20250609092640.1751993-1-p-bhagat@ti.com>
 <241aed51-1993-42d4-8aba-49d7864ac2d3@ti.com>
Content-Language: en-US
From: Paresh Bhagat <p-bhagat@ti.com>
In-Reply-To: <241aed51-1993-42d4-8aba-49d7864ac2d3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 55A4rTir2191220
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Jun 2025 04:53:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18632

Hi Ryan,


On 09/06/25 20:07, Ryan Eatmon wrote:
>
>
> On 6/9/2025 4:26 AM, Paresh Bhagat wrote:
>> Previously, AM62d build reused AM62a's IPC firmwares. Now that
>> dedicated AM62d IPC firmwares are being pushed to ti-linux-firmware
>> repo, package the new IPC firmwares.
>
> So... question for Andrew (and anyone else)...
>
> This recipe is for the ipc-rtos-echo-test-fw, so that implies that=20
> this recipes installs only that.=C2=A0 Should this commit add in a=20
> different firmware, or should commit make it so that this recipe adds=20
> nothing for am62d and then a new recipe for the new file?
>
> Thoughts?
>
> I know we previously accepted a commit that did this same kind of=20
> thing, but now I'm rethinking that.


Just trying to clarify, since the new firmware is also for ipc or echo=20
test, shouldn't we add it here?
>
>
>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>> Boot logs
>> https://gist.github.com/paresh-bhagat12/6fef215c80fa03c8ea55952f46328b=
83
>>
>> =C2=A0 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 25 +++++++++++--------
>> =C2=A0 1 file changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git=20
>> a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb=20
>> b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> index 1fe67be8..d43e8a8c 100644
>> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>> @@ -20,7 +20,7 @@ PLAT_SFX:am65xx =3D "am65xx"
>> =C2=A0 PLAT_SFX:am64xx =3D "am64xx"
>> =C2=A0 PLAT_SFX:am62xx =3D "am62xx"
>> =C2=A0 PLAT_SFX:am62axx =3D "am62axx"
>> -PLAT_SFX:am62dxx =3D "am62axx"
>> +PLAT_SFX:am62dxx =3D "am62dxx"
>> =C2=A0 PLAT_SFX:am62pxx =3D "am62pxx"
>> =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D=20
>> "${METATIBASE}/recipes-bsp/ti-sci-fw/files/:"
>> @@ -39,6 +39,7 @@ INSTALL_IPC_FW_DIR =3D=20
>> "${nonarch_base_libdir}/firmware/${IPC_FW_DIR}"
>> =C2=A0 MCU_1_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_te=
st_mcu1_0_release_strip.xer5f"
>> =C2=A0 MCU_1_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_te=
st_mcu1_1_release_strip.xer5f"
>> =C2=A0 MCU_2_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_te=
st_mcu2_0_release_strip.xer5f"
>> +MCU_2_0_FW:am62dxx =3D=20
>> "ipc_rpmsg_echo_linux.mcu-r5f0_0.release.strip.out"
>
> Any reason not to add more spaces to all of the other lines so that=20
> everything continues to line up?


Will update this, I was confused earlier whether to line them up but=20
will do.
>
>
>> =C2=A0 MCU_2_1_FW =3D "ipc_echo_test_mcu2_1_release_strip.xer5f"
>> =C2=A0 MCU_3_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_te=
st_mcu3_0_release_strip.xer5f"
>> =C2=A0 MCU_3_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_te=
st_mcu3_1_release_strip.xer5f"
>> @@ -48,6 +49,7 @@ C66_1_FW =3D=20
>> "ipc_echo_test_c66xdsp_1_release_strip.xe66"
>> =C2=A0 C66_2_FW =3D "ipc_echo_test_c66xdsp_2_release_strip.xe66"
>> =C2=A0 C7X_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_1_release_strip.xe71"
>> =C2=A0 C7X_1_FW:am62axx =3D "dsp_edgeai_c7x_1_release_strip.out"
>> +C7X_1_FW:am62dxx =3D "ipc_rpmsg_echo_linux.c75ss0-0.release.strip.out=
"
>> =C2=A0 C7X_2_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_2_release_strip.xe71"
>> =C2=A0 C7X_3_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_3_release_strip.xe71"
>> =C2=A0 C7X_4_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "i=
pc_echo_test_c7x_4_release_strip.xe71"
>> @@ -98,13 +100,6 @@ do_install:prepend:am62axx() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>> =C2=A0 }
>> =C2=A0 -# Update the am62dxx ipc binaries to be consistent with other=20
>> platforms
>> -do_install:prepend:am62dxx() {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( cd ${S}/${IPC_FW_DIR}; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 ln -sf am62a-mcu-r5f0_0-fw ${MCU_2_0_FW}; \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>> -}
>> -
>> =C2=A0 do_install() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # IPC Firmware
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for FW_NAME in ${IPC_FW_LIST}
>> @@ -149,8 +144,8 @@ ALTERNATIVE:${PN}:am62axx =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 =C2=A0 ALTERNATIVE:${PN}:am62dxx =3D "\
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-mcu-r5f0_0-fw am62a-m=
cu-r5f0_0-fw-sec \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw-sec \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62d-mcu-r5f0_0-fw am62d-m=
cu-r5f0_0-fw-sec \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62d-c75_x-fw=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62d-c75_x-fw-sec \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 =C2=A0 ALTERNATIVE:${PN}:j721e =3D "\
>> @@ -243,6 +238,11 @@ ALTERNATIVE_LINK_NAME[am62a-mcu-r5f0_0-fw-sec] =3D=
=20
>> "${nonarch_base_libdir}/firmwar
>> =C2=A0 ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=20
>> "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] =3D=20
>> "${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
>> =C2=A0 +ALTERNATIVE_LINK_NAME[am62d-mcu-r5f0_0-fw]=C2=A0=C2=A0=C2=A0=C2=
=A0 =3D=20
>> "${nonarch_base_libdir}/firmware/am62d-mcu-r5f0_0-fw"
>> +ALTERNATIVE_LINK_NAME[am62d-mcu-r5f0_0-fw-sec] =3D=20
>> "${nonarch_base_libdir}/firmware/am62d-mcu-r5f0_0-fw-sec"
>> +ALTERNATIVE_LINK_NAME[am62d-c75_x-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>> "${nonarch_base_libdir}/firmware/am62d-c75_x-fw"
>> +ALTERNATIVE_LINK_NAME[am62d-c75_x-fw-sec] =3D=20
>> "${nonarch_base_libdir}/firmware/am62d-c75_x-fw-sec"
>> +
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw]=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D=20
>> "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw"
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw-sec] =3D=20
>> "${nonarch_base_libdir}/firmware/j7-mcu-r5f0_1-fw-sec"
>> =C2=A0 ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D=20
>> "${nonarch_base_libdir}/firmware/j7-main-r5f0_0-fw"
>> @@ -364,6 +364,11 @@ ALTERNATIVE_TARGET[am62a-mcu-r5f0_0-fw-sec] =3D=20
>> "${INSTALL_IPC_FW_DIR}/${MCU_2_0_F
>> =C2=A0 ALTERNATIVE_TARGET[am62a-c71_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>> "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
>> =C2=A0 ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] =3D=20
>> "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
>> =C2=A0 +ALTERNATIVE_TARGET[am62d-mcu-r5f0_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0=
 =3D=20
>> "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
>> +ALTERNATIVE_TARGET[am62d-mcu-r5f0_0-fw-sec] =3D=20
>> "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}.signed"
>> +ALTERNATIVE_TARGET[am62d-c75_x-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>> "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
>> +ALTERNATIVE_TARGET[am62d-c75_x-fw-sec] =3D=20
>> "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
>> +
>> =C2=A0 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=20
>> "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}"
>> =C2=A0 ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw-sec] =3D=20
>> "${INSTALL_IPC_FW_DIR}/${MCU_1_1_FW}.signed"
>> =C2=A0 ALTERNATIVE_TARGET[j7-main-r5f0_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=
=20
>> "${INSTALL_IPC_FW_DIR}/${MCU_2_0_FW}"
>

