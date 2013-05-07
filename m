Return-Path: <m-karicheri2@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8BC38E0127D
	for <meta-ti@yoctoproject.org>; Tue,  7 May 2013 15:51:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r47Mp1fV026460
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 17:51:01 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r47Mp1Mk000302
	for <meta-ti@yoctoproject.org>; Tue, 7 May 2013 17:51:01 -0500
Received: from DFLE11.ent.ti.com ([fe80::56d:4651:6f4f:2245]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 7 May 2013 17:51:01 -0500
From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "Zhang, Hao" <hzhang@ti.com>
Thread-Topic: [meta-ti] [RESEND: PATCH 2/3] keystone2: u-boot: update to add
	gph support
Thread-Index: AQHOS2k9CQkOGrahU0yP1Wpq5JMXdZj6lzmA//+tzGCAAF+lAP//rdCQ
Date: Tue, 7 May 2013 22:51:00 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7044ED22D@DFLE11.ent.ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
	<20130507224012.GJ12982@edge>
In-Reply-To: <20130507224012.GJ12982@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "Rini, Tom" <trini@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [RESEND: PATCH 2/3] keystone2: u-boot: update to add gph support
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
X-List-Received-Date: Tue, 07 May 2013 22:51:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>> > >> See below about pointing SRC_URI to an internal git server.
>> > >>
>> > >>
>> > >> >  BRANCH =3D "master"
>> > >> >
>> > >> > -# DEV.MCSDK-03.00.00.07
>> > >> > -SRCREV =3D "82f40e857d853165310d0753e79235aefb65d7ba"
>> > >>
>> > >> Please use the format above - it avoid unnecessary breakages when
>> > >> git-ls-remote is not working...
>> >
>> > Adding a commit id means every time we push something to master, I
>> > need to go and change this. This is not practical. Better point to the
>> > tip for getting the latest for nightly. What am I missing?
>>=20
>> The problem is that meta-ti is public and constantly used by many people=
 outside of TI -
>> every time they parse the recipe, it will hit the server. If you point t=
o arago-project.org, it
>> may bring it down, as we have seen before.
>> If you point it to your internal git server, that is not accessible from=
 outside of TI, it will
>> break parsing for everyone and render meta-ti unusable!
>>=20
>> See my next comment for details on how to do it in meta-arago instead.
>>=20
>>=20
>> > >> > +# for nightly switch the two below #SRCREV =3D
>> > >> > +"DEV.MCSDK-2013-01.10"
>> > >> > +SRCREV =3D "${AUTOREV}"
>> > >>
>> > >> Same as before - please no AUTOREVs in meta-ti.
>> > >>
>> > >> If you need to track daily/nightly progress from an internal git
>> > >> server, please use a .bbappend in meta-arago, while keeping meta-ti
>> > >> pointing to a piblic git server and using a specific commit ID. Let
>> > >> me know if you need existing examples - we just released Core
>> > >> TI-SDK 2013.04.00 which used to track the latest linux-ti-staging k=
ernel by setting
>> AUTOREV in meta-arago.
>> > >>
>> >
>> > I don't know. Please give me an example or help me figure this out.
>>=20
>> Use something as simple as below, but for the kernel:
>> http://arago-project.org/git/?p=3Dmeta-
>> arago.git;a=3Dcommitdiff;h=3D32ec5282fd0248581d57ed2a0d66d4c47c275e8c

Hao,

Can you make an update for this in meta-arago so that our nightly points to=
 tip of the master or whatever branch?

Denys,

So for each of the repos, do we have to use a xxx.bbappend, where xxx is u-=
boot, boot-monitor and linux-keystone?
So I assume the build still uses the meta-ti version of the recipe, but ove=
rride the SRCREV with whatever set in xxx.bbappend?

Murali

