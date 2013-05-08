Return-Path: <m-karicheri2@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 066DBE01484
	for <meta-ti@yoctoproject.org>; Wed,  8 May 2013 07:39:18 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48EdItv015838
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 09:39:18 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48EdIQS017302
	for <meta-ti@yoctoproject.org>; Wed, 8 May 2013 09:39:18 -0500
Received: from DFLE11.ent.ti.com ([fe80::56d:4651:6f4f:2245]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 8 May 2013 09:39:17 -0500
From: "Karicheri, Muralidharan" <m-karicheri2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [RESEND: PATCH 2/3] keystone2: u-boot: update to add
	gph support
Thread-Index: AQHOS2k9CQkOGrahU0yP1Wpq5JMXdZj6lzmA//+tzGCAAF+lAP//rdCQgABZjgCAALAVQA==
Date: Wed, 8 May 2013 14:39:17 +0000
Message-ID: <3E54258959B69E4282D79E01AB1F32B7044ED5A3@DFLE11.ent.ti.com>
References: <1367961859-6243-1-git-send-email-m-karicheri2@ti.com>
	<1367961859-6243-2-git-send-email-m-karicheri2@ti.com>
	<20130507215205.GF12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED1DE@DFLE11.ent.ti.com>
	<20130507224012.GJ12982@edge>
	<3E54258959B69E4282D79E01AB1F32B7044ED22D@DFLE11.ent.ti.com>
	<20130507230634.GL12982@edge>
In-Reply-To: <20130507230634.GL12982@edge>
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
X-List-Received-Date: Wed, 08 May 2013 14:39:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

---Cut-------
>>=20
>> Murali,
>>=20
>> Correct, .bbappend is the way to "append" changes to the original recipe=
 w/o modifying it.
>>=20
>> I don't know what you mean by "each of the repos", but yes, you would ne=
ed to place a

In this case, u-boot, boot-monitor and linux-keystone git repos. Based on y=
ou comment, I am assuming, whatever committed to meta-ti need to point to p=
ublic repo and for each of this, a .bbappend is to be added to override the=
 SRCREV in meta-arago to pick the nightly version from the tip.

Murali

>> .bbappend in meta-arago-distro for every component you develop actively =
and for which
>> you don't want to constantly update the recipe with the new SRCREV (or B=
RANCH or
>> SRC_URI etc.)
>>=20
>> By keeping meta-ti pointing to a public git tree with a specific SRCREV =
pointing preferably
>> to a release tag or a stable commit ID you are making sure that it works=
 for everybody. It
>> is an official TI BSP and is distribution agnostic and should be parseab=
le and buildable by
>> anyone out there. On the other hand, meta-arago-distro is our own TI dis=
tribution and you
>> have more freedom there.
>>=20
>> --
>> Denys

