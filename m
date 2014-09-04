Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A9DFE00831; Thu,  4 Sep 2014 05:33:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19DA5E0082A
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 05:33:09 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s84CX84l025614;
	Thu, 4 Sep 2014 07:33:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s84CX8Zp023205;
	Thu, 4 Sep 2014 07:33:08 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 4 Sep 2014 07:33:07 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>, "pab@pabigot.com"
	<pab@pabigot.com>
Thread-Topic: [meta-ti] poor performance of OpenEmbedded on BeagleBoneBlack
	compared to Debian
Thread-Index: AQHPyALK2Ec+XpUnLEuLVCxrhUQOrZvxIWOA///HWuo=
Date: Thu, 4 Sep 2014 12:33:08 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE7320EF7E8@DLEE08.ent.ti.com>
References: <5407C780.5040801@pabigot.com>
	<CAMKF1srA8gnfNF+myYTSm+VHjBeGCWwAC22y2OmrKYnkJffuQg@mail.gmail.com>,
	<54084539.9040103@pabigot.com>
In-Reply-To: <54084539.9040103@pabigot.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 12:33:14 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE7320EF7E8DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE7320EF7E8DLEE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

You should be fine, as meta-ti machines now force hardfp...


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Peter A. Bigot [pab@pabigot.com]
Received: Thursday, 04 Sep 2014, 6:56
To: Khem Raj [raj.khem@gmail.com]
CC: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] poor performance of OpenEmbedded on BeagleBoneBlack =
compared to Debian

On 09/04/2014 12:39 AM, Khem Raj wrote:
> On Wed, Sep 3, 2014 at 6:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> debian@beaglebone:~$ g++ -Ofast -mfloat-abi=3Dhard -o card card.cpp
>>    debian@beaglebone:~$ time ./card > /dev/null
>>    real    4m54.846s
>>    user    4m54.627s
>>    sys     0m0.057s
>>
>> With poky master + meta-ti it runs this fast:
>>
>>    root@beaglebone:~# time ./card > /dev/null
>>    real    9m37.901s
>>    user    9m37.200s
>>    sys     0m0.150s
>
> you should enable hardfloat ABI for poky as well for this kind of load.

Yeah, I remember that from the big argument back in oe-core, but what's
lacking in all that is any revelation of exactly how to do that.

The poky build using meta-ti's BSP for beaglebone puts gcc and
gcc-runtime into cortexa8t2hf-vfp-neon-poky-linux-gnueabi which AFAICT
is supposed to be hard-float.

-mfloat-abi=3Dhard is being passed when gcc-runtime is built, and when the
application is built.

What toolchain-build or runtime-build enables hardfloat if that isn't
already being done?

Peter
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE7320EF7E8DLEE08entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black">You should be fine, as meta-ti machines now force hardfp..=
.<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Peter A. Bigot [pab@pabigot.com]<br>
<b>Received:</b> Thursday, 04 Sep 2014, 6:56<br>
<b>To:</b> Khem Raj [raj.khem@gmail.com]<br>
<b>CC:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] poor performance of OpenEmbedded on BeagleBon=
eBlack compared to Debian<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">On 09/04/2014 12:39 AM, Khem Raj wrote:<br>
&gt; On Wed, Sep 3, 2014 at 6:59 PM, Peter A. Bigot &lt;pab@pabigot.com&gt;=
 wrote:<br>
&gt;&gt; debian@beaglebone:~$ g&#43;&#43; -Ofast -mfloat-abi=3Dhard -o card=
 card.cpp<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; debian@beaglebone:~$ time ./card &gt; /dev/null<=
br>
&gt;&gt;&nbsp;&nbsp;&nbsp; real&nbsp;&nbsp;&nbsp; 4m54.846s<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; user&nbsp;&nbsp;&nbsp; 4m54.627s<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; sys&nbsp;&nbsp;&nbsp;&nbsp; 0m0.057s<br>
&gt;&gt;<br>
&gt;&gt; With poky master &#43; meta-ti it runs this fast:<br>
&gt;&gt;<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; root@beaglebone:~# time ./card &gt; /dev/null<br=
>
&gt;&gt;&nbsp;&nbsp;&nbsp; real&nbsp;&nbsp;&nbsp; 9m37.901s<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; user&nbsp;&nbsp;&nbsp; 9m37.200s<br>
&gt;&gt;&nbsp;&nbsp;&nbsp; sys&nbsp;&nbsp;&nbsp;&nbsp; 0m0.150s<br>
&gt;<br>
&gt; you should enable hardfloat ABI for poky as well for this kind of load=
.<br>
<br>
Yeah, I remember that from the big argument back in oe-core, but what's <br=
>
lacking in all that is any revelation of exactly how to do that.<br>
<br>
The poky build using meta-ti's BSP for beaglebone puts gcc and <br>
gcc-runtime into cortexa8t2hf-vfp-neon-poky-linux-gnueabi which AFAICT <br>
is supposed to be hard-float.<br>
<br>
-mfloat-abi=3Dhard is being passed when gcc-runtime is built, and when the =
<br>
application is built.<br>
<br>
What toolchain-build or runtime-build enables hardfloat if that isn't <br>
already being done?<br>
<br>
Peter<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE7320EF7E8DLEE08entticom_--
