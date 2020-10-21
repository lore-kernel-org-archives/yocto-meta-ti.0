Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.15775.1603302362700610013
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 10:46:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=oATkV0JU;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 66FC138C0699
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:46:02 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LHk1oI038766
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:46:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603302361;
	bh=gXXrV0L9+VhVtDEK1uN2Lz1FNxcqIUADBWxuvb0keCI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=oATkV0JUnTU56fxoY3EjMSJRsQrM3PrNUE18I7XZYrTLEeTh1YGE7r6XpFFVtF4CV
	 xMx/18ZfwdmolZM6QKb7fMPHxaAceGPSO/S+sWRMWBrBihnHxkYZSYlHNei/+Ns8BS
	 30A5vpyExTQ84GghIbzCbbexWt02YYrhFjTbapIE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LHk1vs017695
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:46:01 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 12:46:00 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 12:46:01 -0500
Received: from [10.250.67.220] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LHk0an041379;
	Wed, 21 Oct 2020 12:46:00 -0500
Subject: Re: [dunfell/master PATCH] ipc: ti-rpmsg-char: Add initial recipes
To: Dan Murphy <dmurphy@ti.com>, Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, Gowtham Tammana <g-tammana@ti.com>
References: <20201021135621.5073-1-s-anna@ti.com>
 <843f5cd3-375d-1cc4-ca7a-981920caca33@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <7a855035-bdea-c7f9-5083-5178f14e801b@ti.com>
Date: Wed, 21 Oct 2020 12:46:00 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <843f5cd3-375d-1cc4-ca7a-981920caca33@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 10/21/20 10:22 AM, Dan Murphy wrote:
> Suman
>=20
> On 10/21/20 8:56 AM, Suman Anna wrote:
>> Add the initial recipes for building the ti-rpmsg-char package.
>> The library and examples are built using two separate recipes
>> in ti-rpmsg-char_git.bb and ti-rpmsg-char-examples_git.bb.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>> ---
>> =C2=A0 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 12 ++++++++++++
>> =C2=A0 recipes-ti/ipc/ti-rpmsg-char.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++++++
>> =C2=A0 recipes-ti/ipc/ti-rpmsg-char_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>> =C2=A0 3 files changed, 42 insertions(+)
>> =C2=A0 create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>> =C2=A0 create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
>> =C2=A0 create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb
>>
>> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>> b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>> new file mode 100644
>> index 000000000000..1d86e95526cc
>> --- /dev/null
>> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>> @@ -0,0 +1,12 @@
>> +DESCRIPTION =3D "TI RPMsg Char Sample Applications and Tests"
>> +
>> +require ti-rpmsg-char.inc
>> +
>> +DEPENDS =3D "ti-rpmsg-char"
>> +RDEPENDS_${PN} =3D "ti-rpmsg-char"
>> +
>> +inherit autotools pkgconfig
>> +
>> +EXTRA_OEMAKE =3D "-C ${B}/examples"
>> +
>> +PR =3D "r0"
>> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpms=
g-char.inc
>> new file mode 100644
>> index 000000000000..454deea674b3
>> --- /dev/null
>> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
>> @@ -0,0 +1,19 @@
>> +DESCRIPTION =3D "TI RPMsg Char Utility Library"
>> +
>> +LICENSE =3D "BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D
>> "file://${S}/src/rpmsg_char.c;beginline=3D1;endline=3D31;md5=3D71987db=
43a2159cff5ea00505c6fce58"
>>
>> +
>> +TI_RPMSG_CHAR_GIT_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git"
>> +TI_RPMSG_CHAR_GIT_PROTOCOL =3D "git"
>> +TI_RPMSG_CHAR_GIT_BRANCH =3D "master"
>> +
>> +# Initial 0.1.0 release
>> +TI_RPMSG_CHAR_SRCREV =3D "9be402c2bf4053900b6b9a8092fbb42e7e303108"
>> +
>> +BRANCH =3D "${TI_RPMSG_CHAR_GIT_BRANCH}"
>> +SRC_URI =3D
>> "${TI_RPMSG_CHAR_GIT_URI};protocol=3D${TI_RPMSG_CHAR_GIT_PROTOCOL};bra=
nch=3D${BRANCH};name=3Dti-rpmsg-char"
>>
>> +SRCREV =3D "${TI_RPMSG_CHAR_SRCREV}"
>> +
>> +PV =3D "0.1.0+git${SRCPV}"
>> +
>> +S =3D "${WORKDIR}/git"
>> diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb
>> b/recipes-ti/ipc/ti-rpmsg-char_git.bb
>> new file mode 100644
>> index 000000000000..c132a390f301
>> --- /dev/null
>> +++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
>> @@ -0,0 +1,11 @@
>> +DESCRIPTION =3D "TI RPMsg Char Utility Library"
>> +
>> +require ti-rpmsg-char.inc
>> +
>> +DEPENDS +=3D "virtual/kernel"
>> +
>> +inherit autotools pkgconfig
>> +
>> +do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
>> +
>> +PR =3D "r0"
>=20
> Is this just for master or is it applicable to dunfell?

It is for both as my patch title suggests. I have generated the patch usi=
ng
dunfell branch, and needed on it for sure for our SDKs. Let me know if it
doesn't apply cleanly on master.

regards
Suman


