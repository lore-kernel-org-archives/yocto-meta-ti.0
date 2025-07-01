Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F03C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:58:31 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.763.1751385506578348324
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 01 Jul 2025 08:58:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=v/WJFdtT;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561FwMpt2957280;
	Tue, 1 Jul 2025 10:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751385502;
	bh=sJQCJR4ifUD0HI1nZ/e80dvwZBHhzYqUg9RrSKUyHD4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=v/WJFdtToq6WJcccdS7l/KZQ+yV2GmQ7r2L9vcnpuPsOBwG9HBEGkm+6BtYR5E2Sq
	 NCYkouNqV0CAG1aKV1D28m9TXNQdk/ayLNnjhG1m+46zHXxWQM4f2H6I+OVA2hiaJn
	 c9sqk2I3wHMheBtOc0K1L0OUzfFSf64Y0SE/Bfyk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561FwM1E2697664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 10:58:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 10:58:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 10:58:22 -0500
Received: from [10.247.21.247] (ula0226330.dhcp.ti.com [10.247.21.247])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561FwMIU1835110;
	Tue, 1 Jul 2025 10:58:22 -0500
Message-ID: <62a7bf55-e13c-4775-89d7-a3c0cfa9344d@ti.com>
Date: Tue, 1 Jul 2025 10:58:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][scarthgap/master][PATCH 1/3] meta-ti-bsp: Split out
 ti-edgeai-fw from ti-rtos-echo-test-fw
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <c-shilwant@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20250627202436.582570-1-afd@ti.com>
 <17b5f759-a8f5-4223-8590-339bbb91e233@ti.com>
 <20250701002826.GR18383@denix.org>
 <bde3e8c3-5900-4ba8-9ceb-7882bf64c15b@ti.com>
 <4db33de9-b674-4221-a3f9-35c5be146efe@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4db33de9-b674-4221-a3f9-35c5be146efe@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelvem-ot01.ext.ti.com id 561FwMpt2957280
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 01 Jul 2025 15:58:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18747

On 7/1/25 10:39 AM, Ryan Eatmon wrote:
>=20
>=20
> On 7/1/2025 9:45 AM, Andrew Davis wrote:
>> On 6/30/25 7:28 PM, Denys Dmytriyenko wrote:
>>> On Mon, Jun 30, 2025 at 03:46:14PM +0530, Chirag Shilwant via lists.y=
octoproject.org wrote:
>>>> Hi Andrew,
>>>>
>>>> On 28/06/25 01:54, Andrew Davis via lists.yoctoproject.org wrote:
>>>>> TI EdgeAI firmware is distinct from the other "echo test" firmware
>>>>> provided by ti-rtos-echo-test-fw. It belongs in its own package.
>>>>> Split out the EdgeAI firmware from the "echo test" firmware.
>>>>
>>>>
>>>> Looks like the corresponding meta-arago patch for adding
>>>> ti-edgeai-fw in filesystem
>>>> is missing from the meta-arago lists.
>>>>
>>>> We have added ti-rtos-echo-test-fw in following recipes, so similar
>>>> should be done
>>>> for ti-edgeai-fw to ensure that CICD builds [0] have EdgeAI C7x IPC
>>>> firmwares packaged.
>>>>
>>>>
>>>> ~/source/meta-arago$ find . | grep -rn "ti-rtos-echo-test-fw"
>>>> meta-arago-test/recipes-core/packagegroups/ti-test.bb:117:
>>>> ti-rtos-echo-test-fw \
>>>> meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cons=
ole.bb:70:
>>>> ti-rtos-echo-test-fw \
>>>> meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisd=
k-addons.bb:61:UTILS:append:k3
>>>> =3D " ti-rtos-echo-test-fw"
>>>
>>> Instead of doing it in images or packagegroups, a better alternative =
would
>>> be to list FW images in either MACHINE_ESSENTIAL_EXTRA_RDEPENDS or
>>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS, as we already do for most of the=
 FWs.
>>>
>>> That way it will work for any distro or image built for the same plat=
form.
>>>
>>
>> I like this idea in general for most firmware, but our remoteproc firm=
ware
>> is a little different in that is has multiple valid options and select=
ion
>> depends on use-case. The echo test firmware is probably only useful fo=
r test
>> images, and EdgeAI firmware might only be useful for EdgeAI images, et=
c..
>>
>> So selection of remoteproc firmware should stay in distro layer IMHO
>=20
> Is it possible to specify that two packages cannot be built/installed a=
t the same time?=C2=A0 I think there is a way.=C2=A0 For this specific ca=
se I think we should use that.
>=20

In this case, we can build and install both at the same time, they both u=
se update
alternatives and should live happily together. EdgeAI firmware, if instal=
led, will
be higher priority so will be the default loaded by kernel, this matches =
existing
behavior (once we add ti-edgeai-fw to the images).

Andrew

>=20
>> Andrew
>>
>>>
>>>> [0]: https://software-dl.ti.com/cicd-report/linux/index.html?section=
=3Dplatform&platform=3Dam62axx
>>>>
>>>>
>>>>
>>>> --=20
>>>> Chirag
>>>>
>>>>
>>>>
>>>>> Give this a higher ALTERNATIVE_PRIORITY so that if both are install=
ed
>>>>> the default will still be EdgeAI firmware for AM62A devices.
>>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>> =C2=A0 .../recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb=C2=A0=C2=A0=C2=A0=
 | 58 +++++++++++++++++++
>>>>> =C2=A0 .../ti-rtos-fw/ti-rtos-echo-test-fw.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 29 +++++-----
>>>>> =C2=A0 2 files changed, 72 insertions(+), 15 deletions(-)
>>>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edg=
eai-fw.bb
>>>>>
>>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb b/m=
eta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
>>>>> new file mode 100644
>>>>> index 00000000..67150968
>>>>> --- /dev/null
>>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-edgeai-fw.bb
>>>>> @@ -0,0 +1,58 @@
>>>>> +SUMMARY =3D "TI EdgeAI prebuilt binary firmware images"
>>>>> +
>>>>> +LICENSE =3D "TI-TFL"
>>>>> +LIC_FILES_CHKSUM =3D "file://${THISDIR}/../../licenses/TI-TFL;md5=3D=
a1b59cb7ba626b9dbbcbf00f3fbc438a"
>>>>> +
>>>>> +COMPATIBLE_MACHINE =3D "am62axx"
>>>>> +
>>>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>>> +
>>>>> +inherit update-alternatives
>>>>> +
>>>>> +PLAT_SFX =3D ""
>>>>> +PLAT_SFX:am62axx =3D "am62axx"
>>>>> +
>>>>> +require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
>>>>> +
>>>>> +PV =3D "${CORESDK_RTOS_VERSION}"
>>>>> +PR =3D "${INC_PR}.1"
>>>>> +
>>>>> +# Secure Build
>>>>> +inherit ti-secdev
>>>>> +
>>>>> +IPC_FW_DIR =3D "ti-ipc/${PLAT_SFX}"
>>>>> +
>>>>> +INSTALL_IPC_FW_DIR =3D "${nonarch_base_libdir}/firmware/${IPC_FW_D=
IR}"
>>>>> +
>>>>> +C7X_1_FW =3D "dsp_edgeai_c7x_1_release_strip.out"
>>>>> +
>>>>> +IPC_FW_LIST =3D ""
>>>>> +IPC_FW_LIST:am62axx =3D "${C7X_1_FW}"
>>>>> +
>>>>> +do_install() {
>>>>> +=C2=A0=C2=A0=C2=A0 # Sign Firmware
>>>>> +=C2=A0=C2=A0=C2=A0 for FW_NAME in ${IPC_FW_LIST}
>>>>> +=C2=A0=C2=A0=C2=A0 do
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${TI_SECURE_DEV_PKG}/sc=
ripts/secure-binary-image.sh ${S}/${IPC_FW_DIR}/${FW_NAME} ${S}/${IPC_FW_=
DIR}/${FW_NAME}.signed
>>>>> +=C2=A0=C2=A0=C2=A0 done
>>>>> +
>>>>> +=C2=A0=C2=A0=C2=A0 # Install Firmware
>>>>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${INSTALL_IPC_FW_DIR}
>>>>> +=C2=A0=C2=A0=C2=A0 for FW_NAME in ${IPC_FW_LIST}
>>>>> +=C2=A0=C2=A0=C2=A0 do
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${=
IPC_FW_DIR}/${FW_NAME} ${D}${INSTALL_IPC_FW_DIR}
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644 ${S}/${=
IPC_FW_DIR}/${FW_NAME}.signed ${D}${INSTALL_IPC_FW_DIR}
>>>>> +=C2=A0=C2=A0=C2=A0 done
>>>>> +}
>>>>> +
>>>>> +ALTERNATIVE:${PN}:am62axx =3D "\
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am62a-c71_0-fw-sec \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>>>> +
>>>>> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D =
"${nonarch_base_libdir}/firmware/am62a-c71_0-fw"
>>>>> +ALTERNATIVE_LINK_NAME[am62a-c71_0-fw-sec] =3D "${nonarch_base_libd=
ir}/firmware/am62a-c71_0-fw-sec"
>>>>> +
>>>>> +ALTERNATIVE_TARGET[am62a-c71_0-fw]=C2=A0=C2=A0=C2=A0=C2=A0 =3D "${=
INSTALL_IPC_FW_DIR}/${C7X_1_FW}"
>>>>> +ALTERNATIVE_TARGET[am62a-c71_0-fw-sec] =3D "${INSTALL_IPC_FW_DIR}/=
${C7X_1_FW}.signed"
>>>>> +
>>>>> +ALTERNATIVE_PRIORITY =3D "20"
>>>>> diff --git a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-f=
w.bb b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>>>>> index 7fffc9de..3e4db129 100644
>>>>> --- a/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>>>>> +++ b/meta-ti-bsp/recipes-bsp/ti-rtos-fw/ti-rtos-echo-test-fw.bb
>>>>> @@ -36,21 +36,20 @@ IPC_FW_DIR =3D "ti-ipc/${PLAT_SFX}"
>>>>> =C2=A0 INSTALL_IPC_FW_DIR =3D "${nonarch_base_libdir}/firmware/${IP=
C_FW_DIR}"
>>>>> -MCU_1_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu1_0_release_strip.xer5f"
>>>>> -MCU_1_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu1_1_release_strip.xer5f"
>>>>> -MCU_2_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu2_0_release_strip.xer5f"
>>>>> -MCU_2_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu2_1_release_strip.xer5f"
>>>>> -MCU_3_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu3_0_release_strip.xer5f"
>>>>> -MCU_3_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu3_1_release_strip.xer5f"
>>>>> -MCU_4_0_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu4_0_release_strip.xer5f"
>>>>> -MCU_4_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_echo_test_=
mcu4_1_release_strip.xer5f"
>>>>> -C66_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_=
echo_test_c66xdsp_1_release_strip.xe66"
>>>>> -C66_2_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_=
echo_test_c66xdsp_2_release_strip.xe66"
>>>>> -C7X_1_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_=
echo_test_c7x_1_release_strip.xe71"
>>>>> -C7X_1_FW:am62axx =3D "dsp_edgeai_c7x_1_release_strip.out"
>>>>> -C7X_2_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_=
echo_test_c7x_2_release_strip.xe71"
>>>>> -C7X_3_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_=
echo_test_c7x_3_release_strip.xe71"
>>>>> -C7X_4_FW =3D=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ipc_=
echo_test_c7x_4_release_strip.xe71"
>>>>> +MCU_1_0_FW =3D "ipc_echo_test_mcu1_0_release_strip.xer5f"
>>>>> +MCU_1_1_FW =3D "ipc_echo_test_mcu1_1_release_strip.xer5f"
>>>>> +MCU_2_0_FW =3D "ipc_echo_test_mcu2_0_release_strip.xer5f"
>>>>> +MCU_2_1_FW =3D "ipc_echo_test_mcu2_1_release_strip.xer5f"
>>>>> +MCU_3_0_FW =3D "ipc_echo_test_mcu3_0_release_strip.xer5f"
>>>>> +MCU_3_1_FW =3D "ipc_echo_test_mcu3_1_release_strip.xer5f"
>>>>> +MCU_4_0_FW =3D "ipc_echo_test_mcu4_0_release_strip.xer5f"
>>>>> +MCU_4_1_FW =3D "ipc_echo_test_mcu4_1_release_strip.xer5f"
>>>>> +C66_1_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c66xdsp_1_release_strip.xe=
66"
>>>>> +C66_2_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c66xdsp_2_release_strip.xe=
66"
>>>>> +C7X_1_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_1_release_strip.xe71"
>>>>> +C7X_2_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_2_release_strip.xe71"
>>>>> +C7X_3_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_3_release_strip.xe71"
>>>>> +C7X_4_FW=C2=A0=C2=A0 =3D "ipc_echo_test_c7x_4_release_strip.xe71"
>>>>> =C2=A0 IPC_FW_LIST =3D ""
>>>>> =C2=A0 IPC_FW_LIST:am65xx =3D=C2=A0 "${MCU_1_0_FW} ${MCU_1_1_FW}"
>=20

