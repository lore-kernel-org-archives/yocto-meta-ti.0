Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28700C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:39:21 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.284.1751384356875897322
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 08:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=n10hY+yE;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561FdDRE3354523;
	Tue, 1 Jul 2025 10:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751384353;
	bh=0RHe6tvpmMhgNZ4hcVhDLdsH3RkjEQ2mmKaRmVnrUIs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=n10hY+yExjxoqAy5kLw+KJE+rfuRTnHZSpK3KcDj5hH4KstmQ8HyMQIwvmz8Bdle8
	 jJiYpO9jRQbgMsTin/9ti1yhPPJjCMsYBWETreHMIy0to6/mXcVYaEYRpONd8lIZWF
	 xpNZkCPuoBtFoA1hz9DHeCngx8PD20InzGJlIQw8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561FdDov3038142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 10:39:13 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 10:39:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 10:39:13 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561FdCTY1807848;
	Tue, 1 Jul 2025 10:39:12 -0500
Message-ID: <4db33de9-b674-4221-a3f9-35c5be146efe@ti.com>
Date: Tue, 1 Jul 2025 10:39:12 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/3] meta-ti-bsp: Split out
 ti-edgeai-fw from ti-rtos-echo-test-fw
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20250627202436.582570-1-afd@ti.com>
 <17b5f759-a8f5-4223-8590-339bbb91e233@ti.com>
 <20250701002826.GR18383@denix.org>
 <bde3e8c3-5900-4ba8-9ceb-7882bf64c15b@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <bde3e8c3-5900-4ba8-9ceb-7882bf64c15b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 561FdDRE3354523
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 15:39:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18745



On 7/1/2025 9:45 AM, Andrew Davis wrote:
> On 6/30/25 7:28 PM, Denys Dmytriyenko wrote:
>> On Mon, Jun 30, 2025 at 03:46:14PM +0530, Chirag Shilwant via=20
>> lists.yoctoproject.org wrote:
>>> Hi Andrew,
>>>
>>> On 28/06/25 01:54, Andrew Davis via lists.yoctoproject.org wrote:
>>>> TI EdgeAI firmware is distinct from the other "echo test" firmware
>>>> provided by ti-rtos-echo-test-fw. It belongs in its own package.
>>>> Split out the EdgeAI firmware from the "echo test" firmware.
>>>
>>>
>>> Looks like the corresponding meta-arago patch for adding
>>> ti-edgeai-fw in filesystem
>>> is missing from the meta-arago lists.
>>>
>>> We have added ti-rtos-echo-test-fw in following recipes, so similar
>>> should be done
>>> for ti-edgeai-fw to ensure that CICD builds [0] have EdgeAI C7x IPC
>>> firmwares packaged.
>>>
>>>
>>> ~/source/meta-arago$ find . | grep -rn "ti-rtos-echo-test-fw"
>>> meta-arago-test/recipes-core/packagegroups/ti-test.bb:117:
>>> ti-rtos-echo-test-fw \
>>> meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-conso=
le.bb:70:
>>> ti-rtos-echo-test-fw \
>>> meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-addons.bb:61:UTILS:append:k3
>>> =3D " ti-rtos-echo-test-fw"
>>
>> Instead of doing it in images or packagegroups, a better alternative=20
>> would
>> be to list FW images in either MACHINE_ESSENTIAL_EXTRA_RDEPENDS or
>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS, as we already do for most of the=20
>> FWs.
>>
>> That way it will work for any distro or image built for the same=20
>> platform.
>>
>=20
> I like this idea in general for most firmware, but our remoteproc firmw=
are
> is a little different in that is has multiple valid options and selecti=
on
> depends on use-case. The echo test firmware is probably only useful for=
=20
> test
> images, and EdgeAI firmware might only be useful for EdgeAI images, etc=
..
>=20
> So selection of remoteproc firmware should stay in distro layer IMHO

Is it possible to specify that two packages cannot be built/installed at=20
the same time?  I think there is a way.  For this specific case I think=20
we should use that.


> Andrew
>=20
>>
>>> [0]:=20
>>> https://software-dl.ti.com/cicd-report/linux/index.html?section=3Dpla=
tform&platform=3Dam62axx
>>>
>>>
>>>
>>> --=20
>>> Chirag
>>>
>>>
>>>
>>>> Give this a higher ALTERNATIVE_PRIORITY so that if both are installe=
d
>>>> the default will still be EdgeAI firmware for AM62A devices.
>>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>> =C2=A0 .../recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb=C2=A0=C2=A0=C2=A0 =
| 58=20
>>>> +++++++++++++++++++
>>>> =C2=A0 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 29 +++++-----
>>>> =C2=A0 2 files changed, 72 insertions(+), 15 deletions(-)
>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edge=
ai-fw.bb
>>>>
>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb=20
>>>> b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
>>>> new file mode 100644
>>>> index 00000000..67150968
>>>> --- /dev/null
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
>>>> @@ -0,0 +1,58 @@
>>>> +SUMMARY =3D "TI EdgeAI prebuilt binary firmware images"
>>>> +
>>>> +LICENSE =3D "TI-TFL"
>>>> +LIC_FILES_CHKSUM =3D=20
>>>> "file://${THISDIR}/../../licenses/TI-TFL;md5=3Da1b59cb7ba626b9dbbcbf=
00f3fbc438a"
>>>> +
>>>> +COMPATIBLE_MACHINE =3D "am62axx"
>>>> +
>>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>> +
>>>> +inherit update-alternatives
>>>> +
>>>> +PLAT_SFX =3D ""
>>>> +PLAT_SFX:am62axx =3D "am62axx"
>>>> +
>>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>> +
>>>> +PV =3D "${CORESDK_RTOS_VERSION}"
>>>> +PR =3D "${INC_PR}.1"
>>>> +
>>>> +# Secure Build
>>>> +inherit ti-secdev
>>>> +
>>>> +IPC_FW_DIR =3D "ti-ipc/${PLAT_SFX}"
>>>> +
>>>> +INSTALL_IPC_FW_DIR =3D "${nonarch_base_libdir}/firmware/${IPC_FW_DI=
R}"
>>>> +
>>>> +C7X_1_FW =3D "dsp_edgeai_c7x_1_release_strip.out"
>>>> +
>>>> +IPC_FW_LIST =3D ""
>>>> +IPC_FW_LIST:am62axx =3D "${C7X_1_FW}"
>>>> +
>>>> +do_install() {
>>>> +=C2=A0=C2=A0=C2=A0 # Sign Firmware
>>>> +=C2=A0=C2=A0=C2=A0 for FW_NAME in ${IPC_FW_LIST}
>>>> +=C2=A0=C2=A0=C2=A0 do
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${TI_SECURE_DEV_PKG}/scr=
ipts/secure-binary-image.sh=20
>>>> ${S}/${IPC_FW_DIR}/${FW_NAME} ${S}/${IPC_FW_DIR}/${FW_NAME}.signed
>>>> +=C2=A0=C2=A0=C2=A0 done
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0 # Install Firmware
>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${INSTALL_IPC_FW_DIR}
>>>> +=C2=A0=C2=A0=C2=A0 for FW_NAME in ${IPC_FW_LIST}
>>>> +=C2=A0=C2=A0=C2=A0 do
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${I=
PC_FW_DIR}/${FW_NAME}       =20
>>>> ${D}${INSTALL_IPC_FW_DIR}
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${I=
PC_FW_DIR}/${FW_NAME}.signed=20
>>>> ${D}${INSTALL_IPC_FW_DIR}
>>>> +=C2=A0=C2=A0=C2=A0 done
>>>> +}
>>>> +
>>>> +ALTERNATIVE:${PN}:am62axx =3D "\
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw-sec \
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>> +
>>>> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>>>> "${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
>>>> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] =3D=20
>>>> "${nonarch_base_libdir}/firmware/am62a-c71_0-fw-sec"
>>>> +
>>>> +ALTERNATIVE_TARGET[am62a-c71_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D=20
>>>> "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
>>>> +ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] =3D=20
>>>> "${INSTALL_IPC_FW_DIR}/${C7X_1_FW}.signed"
>>>> +
>>>> +ALTERNATIVE_PRIORITY =3D "20"
>>>> diff --git=20
>>>> a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb=20
>>>> b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>>>> index 7fffc9de..3e4db129 100644
>>>> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>>>> @@ -36,21 +36,20 @@ IPC_FW_DIR =3D "ti-ipc/${PLAT_SFX}"
>>>> =C2=A0 INSTALL_IPC_FW_DIR =3D "${nonarch_base_libdir}/firmware/${IPC=
_FW_DIR}"
>>>> -MCU_1_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu1_0_release_strip.xer5f"
>>>> -MCU_1_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu1_1_release_strip.xer5f"
>>>> -MCU_2_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu2_0_release_strip.xer5f"
>>>> -MCU_2_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu2_1_release_strip.xer5f"
>>>> -MCU_3_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu3_0_release_strip.xer5f"
>>>> -MCU_3_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu3_1_release_strip.xer5f"
>>>> -MCU_4_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu4_0_release_strip.xer5f"
>>>> -MCU_4_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_m=
cu4_1_release_strip.xer5f"
>>>> -C66_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_e=
cho_test_c66xdsp_1_release_strip.xe66"
>>>> -C66_2_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_e=
cho_test_c66xdsp_2_release_strip.xe66"
>>>> -C7X_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_e=
cho_test_c7x_1_release_strip.xe71"
>>>> -C7X_1_FW:am62axx =3D "dsp_edgeai_c7x_1_release_strip.out"
>>>> -C7X_2_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_e=
cho_test_c7x_2_release_strip.xe71"
>>>> -C7X_3_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_e=
cho_test_c7x_3_release_strip.xe71"
>>>> -C7X_4_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_e=
cho_test_c7x_4_release_strip.xe71"
>>>> +MCU_1_0_FW =3D "ipc_echo_test_mcu1_0_release_strip.xer5f"
>>>> +MCU_1_1_FW =3D "ipc_echo_test_mcu1_1_release_strip.xer5f"
>>>> +MCU_2_0_FW =3D "ipc_echo_test_mcu2_0_release_strip.xer5f"
>>>> +MCU_2_1_FW =3D "ipc_echo_test_mcu2_1_release_strip.xer5f"
>>>> +MCU_3_0_FW =3D "ipc_echo_test_mcu3_0_release_strip.xer5f"
>>>> +MCU_3_1_FW =3D "ipc_echo_test_mcu3_1_release_strip.xer5f"
>>>> +MCU_4_0_FW =3D "ipc_echo_test_mcu4_0_release_strip.xer5f"
>>>> +MCU_4_1_FW =3D "ipc_echo_test_mcu4_1_release_strip.xer5f"
>>>> +C66_1_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c66xdsp_1_release_strip.xe6=
6"
>>>> +C66_2_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c66xdsp_2_release_strip.xe6=
6"
>>>> +C7X_1_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_1_release_strip.xe71"
>>>> +C7X_2_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_2_release_strip.xe71"
>>>> +C7X_3_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_3_release_strip.xe71"
>>>> +C7X_4_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_4_release_strip.xe71"
>>>> =C2=A0 IPC_FW_LIST =3D ""
>>>> =C2=A0 IPC_FW_LIST:am65xx =3D=C2=A0 "${MCU_1_0_FW} ${MCU_1_1_FW}"

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

