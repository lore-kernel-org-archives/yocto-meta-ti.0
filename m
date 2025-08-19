Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B1DCA0EE6
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 04:46:30 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.6484.1755578780988691076
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Aug 2025 21:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=wc2g9pE8;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57J4kJQG2812546;
	Mon, 18 Aug 2025 23:46:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755578779;
	bh=4Zqr7RFigOi90LjAgQHob5mD+GxrAFNAGgGNqxiwl20=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wc2g9pE80x0dqw808fK7HiP+ZW4GK9VkgT2VvA36Ibupvl5sQVxfZppA7QhIPmJEr
	 9Pe1ikQc2DXvIRJsK0lpWw6hp0g56M3Ek171EQG5hpuNJyGoPfC/TwpiKqVbkJvIRj
	 3Y00ymWPFahU10r9xCMmnQyrLAQyOJizgeEdgI+c=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57J4kJim329275
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 18 Aug 2025 23:46:19 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 18
 Aug 2025 23:46:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 18 Aug 2025 23:46:19 -0500
Received: from [172.24.234.212] (uda0510294.dhcp.ti.com [172.24.234.212])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57J4kGdo2136289;
	Mon, 18 Aug 2025 23:46:17 -0500
Message-ID: <b64661d0-f6bb-437c-94e6-e00ba1c6e2d8@ti.com>
Date: Tue, 19 Aug 2025 10:16:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH v2 1/5] ti-ipc-examples-linux: Add a
 recipe to build messageq app_host
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250806170442.243461-1-b-padhi@ti.com>
 <20250806170442.243461-2-b-padhi@ti.com>
 <3171512f-af2b-47e4-b6a6-77c54a6842a7@ti.com>
Content-Language: en-US
From: Beleswar Prasad Padhi <b-padhi@ti.com>
In-Reply-To: <3171512f-af2b-47e4-b6a6-77c54a6842a7@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 57J4kJQG2812546
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 04:46:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18935


On 07/08/25 19:24, Andrew Davis wrote:
> On 8/6/25 12:04 PM, Beleswar Padhi wrote:
>> Add a recipe to build the Application Host (for A15 core) to demonstra=
te
>> IPC with remote processors through messageq firmware. Also package thi=
s
>> in the /usr/bin directory for testing IPC. This recipe only builds the
>> app_host, and the firmwares are available in ti-linux-firmware
>> repository.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> =C2=A0 .../ipc/ti-ipc-examples-linux_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 68 +++++++++++++++++++
>> =C2=A0 1 file changed, 68 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-extras/recipes-ti/ipc/ti-ipc-example=
s-linux_git.bb
>>
>> diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.b=
b b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
>> new file mode 100644
>> index 00000000..3a64409e
>> --- /dev/null
>> +++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
>> @@ -0,0 +1,68 @@
>> +DESCRIPTION =3D "TI Inter Processor Communication (IPC) MessageQ Appl=
ication for
>> +Linux Host"
>> +
>> +require recipes-ti/ipc/ti-ipc-common.inc
>> +require ti-ipc-rtos.inc
>> +
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D "file://${S_ipc-examples}/src/makefile;beginline=
=3D1;endline=3D30;md5=3Da52324bd5033bb49ea07bade1244ac9a"
>> +
>> +INSANE_SKIP:${PN} +=3D "arch"
>> +
>> +IPC_INSTALL_DIR =3D "${STAGING_DIR_TARGET}/usr/share/ti/ti-ipc-tree"
>> +INHIBIT_PACKAGE_STRIP =3D "1"
>> +
>> +DEPENDS =3D "ti-ipc ti-ipc-rtos ti-xdctools-native zip-native"
>
> Do we really depend on "ti-ipc-rtos"?=20


Sorry, missed this email. Right now, the ipc-examples build depends on th=
e product.mak file which is from the ipcdev repo (ti-ipc-rtos recipe).
So we are dependent on this ti-ipc-rtos repo. Otherwise the builds fail.


> Once we add pre-built IPUMM firmware
> to linux-firmware, we should be able to drop the "ti-sysbios" recipe an=
d
> all the recipes that depend on it, including ti-ipc-rtos.


There would be some work needed in the repos to be independent first befo=
re we drop these recipes.

Thanks,
Beleswar

>
> Andrew
>
>> +
>> +EX02_PATH =3D "examples/DRA7XX_linux_elf/ex02_messageq/host"
>> +
>> +do_compile() {
>> +=C2=A0 cd ${S_ipc-examples}/src
>> +=C2=A0 oe_runmake .examples \
>> +=C2=A0=C2=A0=C2=A0 IPCTOOLS=3D"${S_ipc-metadata}/src/etc"
>> +
>> +=C2=A0 for alt_platform in ${ALT_PLATFORM}; do
>> +=C2=A0=C2=A0=C2=A0 oe_runmake .examples "PLATFORM=3D${alt_platform}" =
\
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPCTOOLS=3D"${S_ipc-metadata}/src/etc"
>> +=C2=A0 done
>> +
>> +=C2=A0 if [=C2=A0 "${PLATFORM}" !=3D "UNKNOWN" ]; then
>> +=C2=A0=C2=A0=C2=A0 oe_runmake extract HOSTOS=3D"linux" IPC_INSTALL_DI=
R=3D"${IPC_INSTALL_DIR}"
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ ! -z ${ALT_PLATFORM} ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake extract PLATFORM=3D"${ALT_P=
LATFORM}" HOSTOS=3D"linux" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPC_INSTALL_DIR=3D"$=
{IPC_INSTALL_DIR}"
>> +=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 oe_runmake -C ${EX02_PATH} all HOSTOS=3D"linux" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX_SYSROOT_DIR=3D"${STAGING_INCDIR}=
" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}"
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ ! -z ${ALT_PLATFORM} ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake -C ${EX02_PATH} all HOSTOS=3D=
"linux" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX_SYSROOT_DIR=3D"${STA=
GING_INCDIR}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPC_INSTALL_DIR=3D"${IPC_I=
NSTALL_DIR}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PLATFORM=3D"${ALT_PLATFORM=
}"
>> +=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0 fi
>> +}
>> +
>> +do_install() {
>> +=C2=A0 cd ${S_ipc-examples}/src
>> +
>> +=C2=A0 if [=C2=A0 "${PLATFORM}" !=3D "UNKNOWN" ]; then
>> +=C2=A0=C2=A0=C2=A0 # Install directory for linux examples
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}/ipc/examples/ex02_message=
q
>> +=C2=A0=C2=A0=C2=A0 oe_runmake -C ${EX02_PATH} install IPC_INSTALL_DIR=
=3D"${IPC_INSTALL_DIR}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX_SYSROOT_DIR=3D"${STAGING_INCDIR}=
" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOSTOS=3D"linux" EXEC_DIR=3D"${D}/${bi=
ndir}/ipc/examples/ex02_messageq"
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ ! -z ${ALT_PLATFORM} ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake -C ${EX02_PATH} install IPC=
_INSTALL_DIR=3D"${IPC_INSTALL_DIR}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 LINUX_SYSROOT_DIR=3D"${STA=
GING_INCDIR}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 HOSTOS=3D"linux" EXEC_DIR=3D=
"${D}/${bindir}/ipc/examples/ex02_messageq" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PLATFORM=3D"${ALT_PLATFORM=
}"
>> +=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0 fi
>> +}
>> +
>> +FILES:${PN} +=3D "${bindir}/*"
>

