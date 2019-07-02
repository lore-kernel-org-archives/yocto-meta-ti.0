Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B0F2E00D74; Tue,  2 Jul 2019 14:56:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CC7AE00BB5
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2019 14:56:16 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62LuGdT062871
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 16:56:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562104576;
	bh=tfyPtwr99UA0Gh1rRY3qMHB/lFJwY5mYtldAQelPQj0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=FHhO2G4u0Gw/S7gGelKZCwUIeQqlVu1gefVPgupC1EzWAEVndKSsDB6BaItJSF/VY
	O61asxFK+1bY/Q+SFXUH4CgFJGmVms0Q+uhdNFvOuhmtpu/Yz2Lgs9Hpg9uXctYimf
	b7yVx2Q17JZNA4SUj+ytE5hraYYydazjxfhQag0A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62LuGWp073642
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 2 Jul 2019 16:56:16 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 16:56:16 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
	DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
	15.01.1713.004; Tue, 2 Jul 2019 16:56:16 -0500
From: "Tammana, Gowtham" <g-tammana@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti][thud][PATCH] ti-img-rogue-umlibs: Add missing wayland, 
	expat rdepends
Thread-Index: AQHVMGcVuWiqPqg7xEONEcan0Jz9nqa32paAgAAF2EA=
Date: Tue, 2 Jul 2019 21:56:16 +0000
Message-ID: <fb29616e83c04ba9b1ef981bc207caa4@ti.com>
References: <20190701234727.20511-1-g-tammana@ti.com>
	<20190702163249.GR21181@beryl>
In-Reply-To: <20190702163249.GR21181@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.184]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [thud][PATCH] ti-img-rogue-umlibs: Add missing wayland, expat rdepends
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
X-List-Received-Date: Tue, 02 Jul 2019 21:56:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


>From: Dmytriyenko, Denys
>
>> +++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5187610.bb
>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D
>"file://LICENSE;md5=3D7232b98c1c58f99e3baa03de5207e76f"
>>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>  COMPATIBLE_MACHINE =3D "j7-evm"
>>
>> -PR =3D "r6"
>> +PR =3D "r7"
>>
>>  BRANCH =3D "linuxws/thud/k4.19/${PV}"
>>
>> @@ -24,10 +24,10 @@ inherit update-rc.d
>>
>>  PROVIDES +=3D "virtual/egl virtual/libgles1 virtual/libgles2 virtual/li=
bgbm"
>>
>> -DEPENDS +=3D "libdrm"
>> +DEPENDS +=3D "libdrm wayland expat"
>
>I don't believe you need these in DEPENDS - these are build-time dependenc=
ies.

I agree, they probably are not needed here, just rdepends is sufficient her=
e.
Will push a patch.

Thanks,
Gowtham

>>  RDEPENDS_${PN} +=3D "bash"
>>  RDEPENDS_${PN} +=3D "python-core"
>> -RDEPENDS_${PN} +=3D "ti-img-rogue-driver"
>> +RDEPENDS_${PN} +=3D "ti-img-rogue-driver wayland expat"
>>
>>  RPROVIDES_${PN} =3D "libegl libgles1 libgles2 libgbm"
>>  RPROVIDES_${PN}-dev =3D "libegl-dev libgles1-dev libgles2-dev libgbm-de=
v"
>> --
>> 2.22.0
>>

