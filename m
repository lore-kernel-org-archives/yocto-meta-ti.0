Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B26F7E00B85; Wed, 21 May 2014 13:22:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4AAF1E0077C
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 13:22:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LKM927013790
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 15:22:09 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LKM9Tv008389
	for <meta-ti@yoctoproject.org>; Wed, 21 May 2014 15:22:09 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Wed, 21 May 2014 15:22:09 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH 9/9] omap5-sgx-ddk-um-linux: Add version
	1.9.0.12
Thread-Index: AQHPdS2d2+64wSWHZ0azrrbXKHD1ZZtLecDw
Date: Wed, 21 May 2014 20:22:08 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D03B815@DLEE11.ent.ti.com>
References: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
	<1400527188-16951-10-git-send-email-Chase.Maupin@ti.com>
	<20140521194820.GI21819@edge>
In-Reply-To: <20140521194820.GI21819@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 9/9] omap5-sgx-ddk-um-linux: Add version 1.9.0.12
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
X-List-Received-Date: Wed, 21 May 2014 20:22:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Dmytriyenko, Denys
>Sent: Wednesday, May 21, 2014 2:48 PM
>To: Maupin, Chase
>Cc: meta-ti@yoctoproject.org
>Subject: Re: [meta-ti] [PATCH 9/9] omap5-sgx-ddk-um-linux: Add
>version 1.9.0.12
>
>On Mon, May 19, 2014 at 02:19:48PM -0500, Chase Maupin wrote:
>> From: Mrinmayee Hingolikar <mrinmayee@ti.com>
>>
>> * Pulled in latest version 1.9.0.12 from meta-ti-gsldk and
>>   preserved authorship for Mrinmayee
>> * Mark this recipe as providing the gles1, gles2, and egl
>>   libraries so that it doesn't conflict with other recipes like
>>   mesa and will be pulled in to satisfy those dependencies
>>
>> Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
>> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>> ---
>>  .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |   30
>++++++++++++++++++++
>>  1 file changed, 30 insertions(+)
>>  create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.12.bb
>>
>> diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.12.bb
>> new file mode 100644
>> index 0000000..e36cc58
>> --- /dev/null
>> +++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-
>linux_1.9.0.12.bb
>> @@ -0,0 +1,30 @@
>> +DESCRIPTION =3D "Userspace libraries for SGX"
>> +HOMEPAGE =3D "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
>> +LICENSE =3D "TI-TSPA"
>> +LIC_FILES_CHKSUM =3D "file://OMAP5-Linux-Graphics-DDK-UM-
>Manifest.doc;md5=3D360d293df455e4f2d363bb4014a49603"
>> +
>> +SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-um-
>linux.git;protocol=3Dgit"
>> +SRCREV =3D "994922a5655c63b05343a9238cb30e6ef61744be"
>> +
>> +PR =3D "r2"
>> +PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2"
>> +
>> +RREPLACES_${PN} =3D "libegl libgles1 libgles2"
>> +RREPLACES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev"
>> +RREPLACES_${PN}-dbg =3D "libegl-dbg"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_install () {
>> +    oe_runmake install DESTDIR=3D${D}
>> +}
>> +
>> +PACKAGES =3D+ "${PN}-${PV}"
>
>What is this ^^^ for?

I missed this line.  I think it should die.  I'll send version 2

>
>
>> +FILES_${PN} =3D  "${bindir}/*"
>> +FILES_${PN} +=3D " ${libdir}/*"
>> +FILES_${PN} +=3D  "${includedir}/* /usr/share/sgx-lib/"
>> +
>> +INHIBIT_PACKAGE_STRIP =3D "1"
>> +
>> +INSANE_SKIP_${PN} +=3D "dev-so"
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti

