Return-Path: <i-pang@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90500E0094C; Wed, 26 Apr 2017 22:57:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 439B7E00812
	for <meta-ti@yoctoproject.org>; Wed, 26 Apr 2017 22:57:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3R5vFuj031181
	for <meta-ti@yoctoproject.org>; Thu, 27 Apr 2017 00:57:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493272635;
	bh=g59MJepWZaPHxCr+cHIpApwWiAlJk1uvGwrbV46MErg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=f752HqceF4Sr6Q0WnQNXrfNzonx/uyAP9x4GVXVGLb1AfoBZUde6lp8l40s6ELGP4
	zSgmuxt3ikIbB8XPAOlrBEnwFvGGeVL8sj0XSScX5HiYVolr7InXKQrRNzsC9WPbpP
	vyhwsvqgnqf4Jc7LXsj2rDFzB28j1jWl6D80+Onk=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3R5vF3v030215
	for <meta-ti@yoctoproject.org>; Thu, 27 Apr 2017 00:57:15 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Thu, 27 Apr 2017 00:57:15 -0500
From: "Pang, Ivan" <i-pang@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>, "R, Karthik"
	<karthik.ramanan@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik"
	<karthik.ramanan@ti.com>
Thread-Topic: [meta-ti] [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
Thread-Index: AQHSvbbVd8yTrY0dgESAv5LbhH8uzaHXDRoA//+w5nCAAL5OAIAAWmiAgADiumA=
Date: Thu, 27 Apr 2017 05:57:14 +0000
Message-ID: <C45960711C772449A33A51ED1374F08A4060D5D2@DFLE08.ent.ti.com>
References: <1493119564-36769-1-git-send-email-a0393906@ti.com>
	<20170425231916.GT31608@edge>
	<C45960711C772449A33A51ED1374F08A4060D136@DFLE08.ent.ti.com>
	<590036BC.4010306@ti.com> <26eecf02-370c-de7a-eb49-94cff6b5da9c@ti.com>
In-Reply-To: <26eecf02-370c-de7a-eb49-94cff6b5da9c@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Apr 2017 05:57:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Jake, Karthik,

It should be fine to go ahead with the merge then; I can work on refactorin=
g the "linux" and "windows" recipes internally in meta-processor-sdk-intern=
al. I'm not familiar with appending recipes to an existing .bb file, but it=
 sounds like it can be done.

Ivan

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, April 26, 2017 6:21 AM
To: R, Karthik; Pang, Ivan; Dmytriyenko, Denys; R, Karthik
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [morty v3 1/3] ti-cgt-arm: add recipe for 16.9.2



On 4/26/2017 1:57 AM, Karthik Ramanan wrote:
>
> On 26-Apr-17 5:09 AM, Pang, Ivan wrote:
>> Karthik, Denys,
>>
>>>> +PV =3D "16.9.2"
>>   > Would it be better to have this in the recipe filename? I'm not=20
>> sure if there is a preference.
>>
>> Sorry, I haven't kept up with the patch mails. There was a specific=20
>> reason I moved the PV out of the filename and into the .inc file - I=20
>> had multiple recipes in RTOS that would need to align with this PV=20
>> (see ti-cgt-arm-linux.bb and ti-cgt-arm-windows.bb). This would let=20
>> us update only the .inc file whenever we want to bump up the version.
>>
>> Ivan
> Ivan,
>
> Since we decided to remove the linux and windows on the meta-ti=20
> context, we decided to move out the PV to the filename.
> I think we should merge the recipe in its current form and then work=20
> on subsequent changes. Would you be fine with that approach?

Ivan,

the "linux" and "windows" recipe variants simply package the installer, cor=
rect?

If this is the case, you can always create the "linux" and "windows"=20
packages from the current recipe through a bbappend.

- Jake

>>
>> -----Original Message-----
>> From: meta-ti-bounces@yoctoproject.org=20
>> [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Dmytriyenko,=20
>> Denys
>> Sent: Tuesday, April 25, 2017 6:19 PM
>> To: R, Karthik
>> Cc: meta-ti@yoctoproject.org
>> Subject: Re: [meta-ti] [morty v3 1/3] ti-cgt-arm: add recipe for=20
>> 16.9.2
>>
>> Karthik,
>>
>> This looks much better!
>>
>> I would have said there's no reason to split it into a recipe and=20
>> .inc anymore, but we'll probably also need a -nativesdk recipe, so=20
>> keeping .inc for now.
>>
>> There are couple cosmetic nitpicks - there's no space between SUMMARY=20
>> and =3D sign; and BINFILE variable is defined twice. I'll fix those on=20
>> merge though.
> Thank you Denys, I will make a note on these points. The recipe went=20
> through a lot of rework and I overlooked these aspects.
>>
>> --
>> Denys
>>
>>
>> On Tue, Apr 25, 2017 at 04:56:02PM +0530, Karthik Ramanan wrote:
>>> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>>> ---
>>>   recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb |  8 ++++++
>>>   recipes-ti/devtools/ti-cgt-arm.inc              | 35=20
>>> +++++++++++++++++++++++++
>>>   2 files changed, 43 insertions(+)
>>>   create mode 100644 recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>>>   create mode 100644 recipes-ti/devtools/ti-cgt-arm.inc
>>>
>>> diff --git a/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>>> b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>>> new file mode 100644
>>> index 0000000..c4fc7f0
>>> --- /dev/null
>>> +++ b/recipes-ti/devtools/ti-cgt-arm-native_16.9.2.bb
>>> @@ -0,0 +1,8 @@
>>> +include ti-cgt-arm.inc
>>> +
>>> +LIC_FILES_CHKSUM =3D
>>> "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=3Dc32eadd03472353c042a8a7c4=
568438b"
>>> +
>>> +BINFILE_MD5 =3D "7b73e51e9548a4a0bf3923a336b1a974"
>>> +BINFILE_SHA256 =3D
>>> "d1a5c255319088be7d75b3fce1b16a2e3d60c75023db7dad16cab6d4d3425d06"
>>> +
>>> +PR_append =3D "r2"
>>> diff --git a/recipes-ti/devtools/ti-cgt-arm.inc
>>> b/recipes-ti/devtools/ti-cgt-arm.inc
>>> new file mode 100644
>>> index 0000000..8cc1ca4
>>> --- /dev/null
>>> +++ b/recipes-ti/devtools/ti-cgt-arm.inc
>>> @@ -0,0 +1,35 @@
>>> +SUMMARY=3D "TI ARM Code Generation Tools"
>>> +HOMEPAGE =3D
>>> "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/downl=
oad.htm"
>>> +LICENSE =3D "(TI-TSPA & Thai-Open-Source-Software-Center) &
>>> BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT &=20
>>> BSD-2-Clause & PD & BSD-4-Clause"
>>> +
>>> +inherit native
>>> +require recipes-ti/includes/ti-unpack.inc require=20
>>> +recipes-ti/includes/ti-staging.inc
>>> +require recipes-ti/includes/ti-paths.inc
>>> +
>>> +S =3D "${WORKDIR}/ti-cgt-arm-${PV}"
>>> +
>>> +SRC_URI =3D
>>> "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/$=
{BINFILE};name=3D${BINFILE_NAME}"
>>> +
>>> +BINFILE =3D "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>>> +TI_BIN_UNPK_ARGS =3D "--prefix ${S}"
>>> +TI_BIN_UNPK_CMDS =3D ""
>>> +
>>> +do_install() {
>>> +    install -d ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>>> +    cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
>>> +}
>>> +
>>> +SRC_URI[cgt_arm_installer.md5sum] =3D "${BINFILE_MD5}"
>>> +SRC_URI[cgt_arm_installer.sha256sum] =3D "${BINFILE_SHA256}"
>>> +
>>> +BINFILE_NAME =3D "cgt_arm_installer"
>>> +BINFILE =3D "ti_cgt_tms470_${PV}.LTS_linux_installer_x86.bin"
>>> +
>>> +FILES_${PN} +=3D "${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
>>> +
>>> +INHIBIT_PACKAGE_STRIP =3D "1"
>>> +INHIBIT_SYSROOT_STRIP =3D "1"
>>> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
>>> +
>>> +INSANE_SKIP_${PN} +=3D "arch staticdev"
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> meta-ti mailing list
>>> meta-ti@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-ti
>


