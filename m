Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.10113.1626971155720165069
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 22 Jul 2021 09:25:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=BBuWX2op;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16MGPsfR096296;
	Thu, 22 Jul 2021 11:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626971154;
	bh=oeQ7KAfTXQJGmF1o/CQpvOpdpbP3C8jT9OO31FNjW4Y=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BBuWX2opqKHQv4WZhIecwsbkalAqwwKkZN6DwBZl/BKNmkOvDJlmE9eQncI0ZDFue
	 IrYfMpVVfP07QvjiMVhWERjN9yfB24IUyIS3t19+MXOVH7jGAhFMW25tgOxX/bpdZT
	 Ga5pBjLrzp4CgS6z5nyD4j8UkpBSw9CAe/594O5A=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16MGPsUx065922
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jul 2021 11:25:54 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 22
 Jul 2021 11:25:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 22 Jul 2021 11:25:54 -0500
Received: from [10.250.38.184] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16MGPr7V077374;
	Thu, 22 Jul 2021 11:25:53 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH v3] ti-rtos-firmware: Add soft link to the rtos firmware binaries
To: Suman Anna <s-anna@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        Praneeth Bajjuri <praneeth@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20210722061728.21100-1-yogeshs@ti.com>
 <1960a02f-3f1a-c583-8263-a6cc07b5edf8@ti.com>
 <1548e945-d99b-a355-0591-8debfcfdca90@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <a9a69493-0069-3786-cdbb-62a561965366@ti.com>
Date: Thu, 22 Jul 2021 11:25:53 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1548e945-d99b-a355-0591-8debfcfdca90@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 16MGPsfR096296
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/22/2021 10:57 AM, Suman Anna wrote:
> On 7/22/21 8:23 AM, Grygorii Strashko wrote:
>>
>>
>> On 22/07/2021 09:17, Yogesh Siraswar via lists.yoctoproject.org wrote:
>>> Changes for firmware update( eff643e5 ti-rtos-firmware: update the
>>> source to ti-linux-firmware) were in-complete without soft link.
>>> 1) Added soft link missing for the rtos firmware.
>>> 2) Updated the IPC am64x firmware name to be consistent with 7.3
>>>
>>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>>> ---
>>> Changes from v2:
>>> 1) Fixed issue with HS build for J7 by using j7 instead of j7-evm.
>>>  =C2=A0=C2=A0 So the same rule apply for j7-hs-evm.
>>> 2) Same changes for J7200 for future HS support
>>>
>>> Changes from v1:
>>> 1) Fixed the j7-main-r5f0_0-fw and j7200-main-r5f0_0-fw soft link
>>> 2) Cleaned-up extra white space.
>>>
>>>  =C2=A0 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 187 +++++++++++++=
+++++---
>>>  =C2=A0 1 file changed, 167 insertions(+), 20 deletions(-)
>>
>> Tested on j721e-evm with updated IPC FW bins.
>> Tested-by: Grygorii Strashko <grygorii.strashko@ti.com>
>>
>>>
>>> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> index e50cb933..84cd98a1 100644
>>> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
>>> @@ -10,10 +10,11 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>>  =C2=A0 INHIBIT_DEFAULT_DEPS =3D "1"
>>>  =C2=A0 =C2=A0 inherit deploy
>>> +inherit update-alternatives
>>>  =C2=A0 =C2=A0 PLAT_SFX =3D ""
>>>  =C2=A0 PLAT_SFX_j7 =3D "j721e"
>>> -PLAT_SFX_j7200-evm =3D "j7200"
>>> +PLAT_SFX_j7200 =3D "j7200"
>>>  =C2=A0 PLAT_SFX_am65xx =3D "am65xx"
>>>  =C2=A0 PLAT_SFX_am64xx =3D "am64xx"
>>>  =C2=A0 @@ -23,8 +24,7 @@ CORESDK_RTOS_VERSION ?=3D "08.00.00.26"
>>>  =C2=A0 PV =3D "${CORESDK_RTOS_VERSION}"
>>>  =C2=A0 =C2=A0 CLEANBROKEN =3D "1"
>>> -PR =3D "r1"
>>> -
>>> +PR =3D "r3"
>=20
> This should still be r2 right..

Yes, will make this r2 when merging to dunfell.

>=20
> regards
> Suman
>=20
>>>  =C2=A0 =C2=A0 # Secure Build
>>>  =C2=A0 DEPENDS +=3D "openssl-native"
>>> @@ -39,13 +39,13 @@ RTOS_IPC_FW_DIR =3D "${S}/ti-ipc/${PLAT_SFX}"
>>>  =C2=A0 =C2=A0 # For back-ward compatability keeping legacy firmware f=
older name
>>>  =C2=A0 # TODO: fix this in next version
>>> -LEGACY_ETH_FW_DIR =3D "${D}${base_libdir}/firmware/ethfw"
>>> -LEGACY_IPC_FW_DIR =3D "${D}${base_libdir}/firmware/pdk-ipc"
>>> -LEGACY_DM_FW_DIR=C2=A0 =3D "${D}${base_libdir}/firmware/ethfw"
>>> +LEGACY_ETH_FW_DIR =3D "${D}${base_libdir}/firmware/ethfw/"
>>> +LEGACY_IPC_FW_DIR =3D "${D}${base_libdir}/firmware/pdk-ipc/"
>>> +LEGACY_DM_FW_DIR=C2=A0 =3D "${D}${base_libdir}/firmware/pdk-ipc/"
>>>  =C2=A0 =C2=A0 DM_FIRMWARE =3D "ipc_echo_testb_mcu1_0_release_strip.xe=
r5f"
>>>  =C2=A0 -# Install
>>> +# J7 HS support
>>>  =C2=A0 do_install_prepend_j7-hs-evm() {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 export TI_SECURE_DEV_PKG=3D${TI_SECURE=
_DEV_PKG}
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( cd ${RTOS_DM_FW_DIR}; \
>>> @@ -54,35 +54,182 @@ do_install_prepend_j7-hs-evm() {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>>  =C2=A0 }
>>>  =C2=A0 +# Update the am64xx ipc binaries to be consistent with other =
platforms
>>> +do_install_prepend_am64xx() {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ( cd ${RTOS_IPC_FW_DIR}; \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 mv am64-main-r5f0_0-fw
>>> ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f; \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 mv am64-main-r5f0_1-fw
>>> ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f; \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 mv am64-main-r5f1_0-fw
>>> ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0 mv am64-main-r5f1_1-fw
>>> ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f; \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )
>>> +}
>>> +
>>> +#Install all R5 & DSP ipc echo test binaries in lib/firmware/pdk-ipc,=
 with
>>> softlinks up a level
>>>  =C2=A0 do_install() {
>>> -=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Do=
wnership"
>>> -=C2=A0 install -d ${LEGACY_ETH_FW_DIR}
>>> -=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>>> -=C2=A0 cp ${CP_ARGS} "${RTOS_ETH_FW_DIR}/." ${LEGACY_ETH_FW_DIR}
>>> -=C2=A0 cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
>>> -=C2=A0 cp ${CP_ARGS} "${RTOS_DM_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
>>> +
>>> +}
>>> +
>>> +do_install_j7() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_0_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu3_1_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_1_release_strip.xe66
>>> ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_c66xdsp_2_release_strip.xe66
>>> ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${RTOS_IPC_FW_DIR}/ipc_echo_test_c=
7x_1_release_strip.xe71
>>> ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 # DM Firmware
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_D=
M_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 # ETH firmware
>>> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_ETH_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitc=
hcfg_server_strip.xer5f
>>> ${LEGACY_ETH_FW_DIR}
>>> +}
>>> +
>>> +do_install_j7200() {
>>> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_0_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu2_1_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 # DM Firmware
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_D=
M_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 # ETH firmware
>>> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_ETH_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644 ${RTOS_ETH_FW_DIR}/app_remoteswitc=
hcfg_server_strip.xer5f
>>> ${LEGACY_ETH_FW_DIR}
>>>  =C2=A0 }
>>>  =C2=A0 =C2=A0 do_install_am65xx() {
>>> -=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Do=
wnership"
>>> -=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>>> -=C2=A0 cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_0_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_test_mcu1_1_release_strip.xer5f ${LEGACY_I=
PC_FW_DIR}
>>>  =C2=A0 }
>>>  =C2=A0 =C2=A0 do_install_am64xx() {
>>> -=C2=A0 CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Do=
wnership"
>>> -=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>>> -=C2=A0 cp ${CP_ARGS} "${RTOS_IPC_FW_DIR}/." ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -d ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_0_release_strip.xer5f
>>> ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu1_1_release_strip.xer5f
>>> ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f
>>> ${LEGACY_IPC_FW_DIR}
>>> +=C2=A0=C2=A0=C2=A0 install -m 0644
>>> ${RTOS_IPC_FW_DIR}/ipc_echo_baremetal_test_mcu2_1_release_strip.xer5f
>>> ${LEGACY_IPC_FW_DIR}
>>>  =C2=A0 }
>>>  =C2=A0 +# Set up names for the firmwares
>>> +ALTERNATIVE_${PN}_am65xx =3D "\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-mcu-r5f0_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am65x-mcu-r5f0_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> +
>>> +ALTERNATIVE_${PN}_am64xx =3D "\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am64-main-r5f0_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am64-main-r5f0_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am64-main-r5f1_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 am64-main-r5f1_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> +
>>> +ALTERNATIVE_${PN}_j7 =3D "\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-mcu-r5f0_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-mcu-r5f0_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-main-r5f0_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-main-r5f0_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-main-r5f1_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-main-r5f1_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-c66_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-c66_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7-c71_0-fw\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> +
>>> +ALTERNATIVE_${PN}_j7200 =3D "\
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7200-mcu-r5f0_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7200-mcu-r5f0_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7200-main-r5f0_0-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 j7200-main-r5f0_1-fw \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> +
>>> +# Set up link names for the firmwares
>>> +
>>> +TARGET_MCU_R5FSS0_0_am65xx =3D "am65x-mcu-r5f0_0-fw"
>>> +TARGET_MCU_R5FSS0_1_am65xx =3D "am65x-mcu-r5f0_1-fw"
>>> +
>>> +TARGET_MAIN_R5FSS0_0_am64xx =3D "am64-main-r5f0_0-fw"
>>> +TARGET_MAIN_R5FSS0_1_am64xx =3D "am64-main-r5f0_1-fw"
>>> +TARGET_MAIN_R5FSS1_0_am64xx =3D "am64-main-r5f1_0-fw"
>>> +TARGET_MAIN_R5FSS1_1_am64xx =3D "am64-main-r5f1_1-fw"
>>> +
>>> +TARGET_MCU_R5FSS0_0_j7 =3D "j7-mcu-r5f0_0-fw"
>>> +TARGET_MCU_R5FSS0_1_j7 =3D "j7-mcu-r5f0_1-fw"
>>> +TARGET_MAIN_R5FSS0_0_j7 =3D "j7-main-r5f0_0-fw"
>>> +TARGET_MAIN_R5FSS0_1_j7 =3D "j7-main-r5f0_1-fw"
>>> +TARGET_MAIN_R5FSS1_0_j7 =3D "j7-main-r5f1_0-fw"
>>> +TARGET_MAIN_R5FSS1_1_j7 =3D "j7-main-r5f1_1-fw"
>>> +TARGET_C66_0_j7 =3D "j7-c66_0-fw"
>>> +TARGET_C66_1_j7 =3D "j7-c66_1-fw"
>>> +TARGET_C7X_j7 =3D "j7-c71_0-fw"
>>> +
>>> +TARGET_MCU_R5FSS0_0_j7200 =3D "j7200-mcu-r5f0_0-fw"
>>> +TARGET_MCU_R5FSS0_1_j7200 =3D "j7200-mcu-r5f0_1-fw"
>>> +TARGET_MAIN_R5FSS0_0_j7200 =3D "j7200-main-r5f0_0-fw"
>>> +TARGET_MAIN_R5FSS0_1_j7200 =3D "j7200-main-r5f0_1-fw"
>>> +
>>> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>>> +ALTERNATIVE_LINK_NAME[am65x-mcu-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>>> +
>>> +ALTERNATIVE_LINK_NAME[am64-main-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>>> +ALTERNATIVE_LINK_NAME[am64-main-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
>>> +ALTERNATIVE_LINK_NAME[am64-main-r5f1_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
>>> +ALTERNATIVE_LINK_NAME[am64-main-r5f1_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
>>> +
>>> +ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>>> +ALTERNATIVE_LINK_NAME[j7-mcu-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>>> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>>> +ALTERNATIVE_LINK_NAME[j7-main-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
>>> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_0}"
>>> +ALTERNATIVE_LINK_NAME[j7-main-r5f1_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS1_1}"
>>> +ALTERNATIVE_LINK_NAME[j7-c66_0-fw] =3D "${base_libdir}/firmware/${TAR=
GET_C66_0}"
>>> +ALTERNATIVE_LINK_NAME[j7-c66_1-fw] =3D "${base_libdir}/firmware/${TAR=
GET_C66_1}"
>>> +ALTERNATIVE_LINK_NAME[j7-c71_0-fw] =3D "${base_libdir}/firmware/${TAR=
GET_C7X}"
>>> +
>>> +ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_0}"
>>> +ALTERNATIVE_LINK_NAME[j7200-mcu-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MCU_R5FSS0_1}"
>>> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_0}"
>>> +ALTERNATIVE_LINK_NAME[j7200-main-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/${TARGET_MAIN_R5FSS0_1}"
>>> +
>>> +# Create the firmware alternatives
>>> +
>>> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_0_release_strip.xe=
r5f"
>>> +ALTERNATIVE_TARGET[am65x-mcu-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xe=
r5f"
>>> +
>>> +ALTERNATIVE_TARGET[am64-main-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_0_releas=
e_strip.xer5f"
>>>
>>> +ALTERNATIVE_TARGET[am64-main-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu1_1_releas=
e_strip.xer5f"
>>>
>>> +ALTERNATIVE_TARGET[am64-main-r5f1_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_0_releas=
e_strip.xer5f"
>>>
>>> +ALTERNATIVE_TARGET[am64-main-r5f1_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_baremetal_test_mcu2_1_releas=
e_strip.xer5f"
>>>
>>> +
>>> +ALTERNATIVE_TARGET[j7-mcu-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.x=
er5f"
>>> +ALTERNATIVE_TARGET[j7-mcu-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xe=
r5f"
>>> +ALTERNATIVE_TARGET[j7-main-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
>>> +ALTERNATIVE_TARGET[j7-main-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xe=
r5f"
>>> +ALTERNATIVE_TARGET[j7-main-r5f1_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_0_release_strip.xe=
r5f"
>>> +ALTERNATIVE_TARGET[j7-main-r5f1_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu3_1_release_strip.xe=
r5f"
>>> +ALTERNATIVE_TARGET[j7-c66_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_1_release_strip=
.xe66"
>>> +ALTERNATIVE_TARGET[j7-c66_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c66xdsp_2_release_strip=
.xe66"
>>> +ALTERNATIVE_TARGET[j7-c71_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_c7x_1_release_strip.xe7=
1"
>>> +
>>> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_testb_mcu1_0_release_strip.x=
er5f"
>>> +ALTERNATIVE_TARGET[j7200-mcu-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu1_1_release_strip.xe=
r5f"
>>> +ALTERNATIVE_TARGET[j7200-main-r5f0_0-fw] =3D
>>> "${base_libdir}/firmware/ethfw/app_remoteswitchcfg_server_strip.xer5f"
>>> +ALTERNATIVE_TARGET[j7200-main-r5f0_1-fw] =3D
>>> "${base_libdir}/firmware/pdk-ipc/ipc_echo_test_mcu2_1_release_strip.xe=
r5f"
>>> +
>>> +ALTERNATIVE_PRIORITY =3D "10"
>>>  =C2=A0 =C2=A0 # make sure that lib/firmware, and all its contents are=
 part of the package
>>>  =C2=A0 FILES_${PN} +=3D "${base_libdir}/firmware"
>>>  =C2=A0 -
>>> +# This is used to prevent the build system to_strip the executables
>>>  =C2=A0 INHIBIT_PACKAGE_STRIP =3D "1"
>>> +INHIBIT_SYSROOT_STRIP =3D "1"
>>> +# This is used to prevent the build system to split the debug info in=
 a
>>> separate file
>>>  =C2=A0 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>>> +# As it likely to be a different arch from the Yocto build, disable c=
hecking
>>> by adding "arch" to INSANE_SKIP
>>>  =C2=A0 INSANE_SKIP_${PN} +=3D "arch"
>>>  =C2=A0 +# we don't want to configure and build the source code
>>>  =C2=A0 do_compile[noexec] =3D "1"
>>>  =C2=A0 do_configure[noexec] =3D "1"
>>>
>>>
>>>
>>>=20
>>>
>>
>=20
