Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.15744.1603302400225544105
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 10:46:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=NO6zxecl;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id ECA4A38C0699
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 10:46:39 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LHkdw9044313
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603302399;
	bh=OafUFGpSyLMP5D1ZmqGCR74nQQjT/9ST1h5GKtsbjJ0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=NO6zxeclGELADRH+vevRiatyq8ZY5/78Aejzqu3dsgyr/IpYKtFpnCpCi/GDzig/8
	 a+XUedJ4FIVNwqIUj0VoswozYRveZeoFG2PamzIHyK6a1dOmTATEzC5fRL1LwaP1O8
	 OBizq3KzZdfAS9YQsw7tW3rPc3dGe/0WH4qewbQM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LHkdKo041248
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 12:46:39 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 12:46:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 12:46:38 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LHkcTW067614;
	Wed, 21 Oct 2020 12:46:38 -0500
Subject: Re: [dunfell/master PATCH] ipc: ti-rpmsg-char: Add initial recipes
To: Suman Anna <s-anna@ti.com>, Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, Gowtham Tammana <g-tammana@ti.com>
References: <20201021135621.5073-1-s-anna@ti.com>
 <843f5cd3-375d-1cc4-ca7a-981920caca33@ti.com>
 <7a855035-bdea-c7f9-5083-5178f14e801b@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <a1f46448-8436-7199-949b-a8bd6ae32496@ti.com>
Date: Wed, 21 Oct 2020 12:46:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7a855035-bdea-c7f9-5083-5178f14e801b@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Suman

On 10/21/20 12:46 PM, Suman Anna wrote:
> On 10/21/20 10:22 AM, Dan Murphy wrote:
>> Suman
>>
>> On 10/21/20 8:56 AM, Suman Anna wrote:
>>> Add the initial recipes for building the ti-rpmsg-char package.
>>> The library and examples are built using two separate recipes
>>> in ti-rpmsg-char_git.bb and ti-rpmsg-char-examples_git.bb.
>>>
>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>>> ---
>>>  =C2=A0 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 12 +++++++++++=
+
>>>  =C2=A0 recipes-ti/ipc/ti-rpmsg-char.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++++++
>>>  =C2=A0 recipes-ti/ipc/ti-rpmsg-char_git.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 11 +++++++++++
>>>  =C2=A0 3 files changed, 42 insertions(+)
>>>  =C2=A0 create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.=
bb
>>>  =C2=A0 create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
>>>  =C2=A0 create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb
>>>
>>> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>>> b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>>> new file mode 100644
>>> index 000000000000..1d86e95526cc
>>> --- /dev/null
>>> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>>> @@ -0,0 +1,12 @@
>>> +DESCRIPTION =3D "TI RPMsg Char Sample Applications and Tests"
>>> +
>>> +require ti-rpmsg-char.inc
>>> +
>>> +DEPENDS =3D "ti-rpmsg-char"
>>> +RDEPENDS_${PN} =3D "ti-rpmsg-char"
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +EXTRA_OEMAKE =3D "-C ${B}/examples"
>>> +
>>> +PR =3D "r0"
>>> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpm=
sg-char.inc
>>> new file mode 100644
>>> index 000000000000..454deea674b3
>>> --- /dev/null
>>> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
>>> @@ -0,0 +1,19 @@
>>> +DESCRIPTION =3D "TI RPMsg Char Utility Library"
>>> +
>>> +LICENSE =3D "BSD-3-Clause"
>>> +LIC_FILES_CHKSUM =3D
>>> "file://${S}/src/rpmsg_char.c;beginline=3D1;endline=3D31;md5=3D71987d=
b43a2159cff5ea00505c6fce58"
>>>
>>> +
>>> +TI_RPMSG_CHAR_GIT_URI =3D "git://git.ti.com/rpmsg/ti-rpmsg-char.git"
>>> +TI_RPMSG_CHAR_GIT_PROTOCOL =3D "git"
>>> +TI_RPMSG_CHAR_GIT_BRANCH =3D "master"
>>> +
>>> +# Initial 0.1.0 release
>>> +TI_RPMSG_CHAR_SRCREV =3D "9be402c2bf4053900b6b9a8092fbb42e7e303108"
>>> +
>>> +BRANCH =3D "${TI_RPMSG_CHAR_GIT_BRANCH}"
>>> +SRC_URI =3D
>>> "${TI_RPMSG_CHAR_GIT_URI};protocol=3D${TI_RPMSG_CHAR_GIT_PROTOCOL};br=
anch=3D${BRANCH};name=3Dti-rpmsg-char"
>>>
>>> +SRCREV =3D "${TI_RPMSG_CHAR_SRCREV}"
>>> +
>>> +PV =3D "0.1.0+git${SRCPV}"
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb
>>> b/recipes-ti/ipc/ti-rpmsg-char_git.bb
>>> new file mode 100644
>>> index 000000000000..c132a390f301
>>> --- /dev/null
>>> +++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
>>> @@ -0,0 +1,11 @@
>>> +DESCRIPTION =3D "TI RPMsg Char Utility Library"
>>> +
>>> +require ti-rpmsg-char.inc
>>> +
>>> +DEPENDS +=3D "virtual/kernel"
>>> +
>>> +inherit autotools pkgconfig
>>> +
>>> +do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
>>> +
>>> +PR =3D "r0"
>> Is this just for master or is it applicable to dunfell?
> It is for both as my patch title suggests. I have generated the patch u=
sing
> dunfell branch, and needed on it for sure for our SDKs. Let me know if =
it
> doesn't apply cleanly on master.

Applied to dunfell-next

Dan

