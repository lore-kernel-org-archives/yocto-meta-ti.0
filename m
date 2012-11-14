Return-Path: <flavio.alves@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20BFFE0032E
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2012 10:09:27 -0800 (PST)
Received: by mail-ie0-f176.google.com with SMTP id k11so1106392iea.35
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2012 10:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2fTZIWt5gDNEozRbPY7yeGY5ovYy5m+R+N3ULuzozqk=;
	b=GfhU/DQMNWdZE8RwOwUA7Hzr7zNVYU8XvwcpnQ7n6xxcyMuPE+eNKxmk0jnhS5utJp
	Qe7unCNppMgUzAKp+QG6ndVz3JWpBht4bIs06GxHGThN1G+ZMjlYgXqAwbilsQ5Rvsvv
	UjQM1H/GynLWFSjM5lyM8tVShhw5FYvM/QOidTVRP7MLFQaNauoNS+t6EiWT7paavCeT
	x1xbiif+AS/lUUW9ewpQ23WcH/z4QtbWkhlogFyHDekijtGR4jW1QCxJbcYrrOlbnLDo
	36lFIYUuRJ0+sf5gN6TOVFcxdWeSDVfsmct2vfE2c43tfpIbuor61AVLAp7nHJ86whHQ
	FoYA==
MIME-Version: 1.0
Received: by 10.50.0.180 with SMTP id 20mr86763igf.43.1352916566630; Wed, 14
	Nov 2012 10:09:26 -0800 (PST)
Received: by 10.42.24.212 with HTTP; Wed, 14 Nov 2012 10:09:26 -0800 (PST)
In-Reply-To: <CAFNBftfKt8gSrDpSrBkPG=4yzrBynSCFEKKPL=hJthgBDSETNQ@mail.gmail.com>
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
	<alpine.DEB.2.02.1211131041310.4591@oneiric>
	<20121113154444.GB12650@edge>
	<CAFNBftf5ACAEFEtLpoVB3b9pc_d1MROgn19NBJmQWX2u362Ucw@mail.gmail.com>
	<50A2C0E8.9030300@r-finger.com>
	<CAFNBftdZC1BUCUA+zonbgkFshzft=ba=BYyTBKFKTXBOo_DVsA@mail.gmail.com>
	<20121114013751.GB13096@edge>
	<CAFNBftfKt8gSrDpSrBkPG=4yzrBynSCFEKKPL=hJthgBDSETNQ@mail.gmail.com>
Date: Wed, 14 Nov 2012 16:09:26 -0200
Message-ID: <CAFNBftc__UJzsjwf0E+ETJecS1EbcvDaWsy8R4=7xUc+MEDWVg@mail.gmail.com>
From: Flavio Castro Alves Filho <flavio.alves@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Wed, 14 Nov 2012 18:09:27 -0000
Content-Type: multipart/alternative; boundary=e89a8f502fae5d628a04ce786f5f

--e89a8f502fae5d628a04ce786f5f
Content-Type: text/plain; charset=ISO-8859-1

It worked.

I had a problem with a recipe at a fetch step, but it was an internet issue.

That's great!! Thank you very much.

Best regards,

Flavio


2012/11/14 Flavio Castro Alves Filho <flavio.alves@gmail.com>

>
>
>
> 2012/11/13 Denys Dmytriyenko <denys@ti.com>
>
>> On Tue, Nov 13, 2012 at 11:10:31PM -0200, Flavio Castro Alves Filho wrote:
>> > 2012/11/13 Tomas Frydrych <tf+lists.yocto@r-finger.com>
>> >
>> > | make[1]: /arm-poky-linux-gnueabi-gcc: Command not found
>>
>> ^^^^^^^^^
>>
>> Yes, some of the recipes in meta-ti still use old TOOLCHAIN_* vars from
>> Classic OE, which were set specifically to allow building packages either
>> with an internal toolchain or with an external prebuilt one. In OE-Core or
>> Yocto/Poky those vars are not set by default, as it's left for the
>> distribution to deal with setting up any fancy toolchain business.  You'd
>> need to add something like this to your config file:
>>
>> TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
>> TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
>>
>>
> Yes. I did that ant it worked. At least for this recipe.
>
>
>>  --
>> Denys
>>
>
>
>
> --
> Flavio de Castro Alves Filho
>
> flavio.alves@gmail.com
> www.linuxembarcado.com
> Twitter: http://twitter.com/#!/fraviofii
> LinkedIn profile: www.linkedin.com/in/flaviocastroalves
>
>


-- 
Flavio de Castro Alves Filho

flavio.alves@gmail.com
www.linuxembarcado.com
Twitter: http://twitter.com/#!/fraviofii
LinkedIn profile: www.linkedin.com/in/flaviocastroalves

--e89a8f502fae5d628a04ce786f5f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

It worked.<br><br>I had a problem with a recipe at a fetch step, but it was=
 an internet issue.<br><br>That&#39;s great!! Thank you very much.<br><br>B=
est regards,<br><br>Flavio<br><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">
2012/11/14 Flavio Castro Alves Filho <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:flavio.alves@gmail.com" target=3D"_blank">flavio.alves@gmail.com</a>&gt;<=
/span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">
<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"><div><div=
 class=3D"h5">2012/11/13 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D=
"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span><br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">

On Tue, Nov 13, 2012 at 11:10:31PM -0200, Flavio Castro Alves Filho wrote:<=
br>
<div>&gt; 2012/11/13 Tomas Frydrych &lt;<a href=3D"mailto:tf%2Blists.yocto@=
r-finger.com" target=3D"_blank">tf+lists.yocto@r-finger.com</a>&gt;<br>
&gt;<br>
&gt; | make[1]: /arm-poky-linux-gnueabi-gcc: Command not found<br>
<br>
</div>^^^^^^^^^<br>
<br>
Yes, some of the recipes in meta-ti still use old TOOLCHAIN_* vars from<br>
Classic OE, which were set specifically to allow building packages either<b=
r>
with an internal toolchain or with an external prebuilt one. In OE-Core or<=
br>
Yocto/Poky those vars are not set by default, as it&#39;s left for the<br>
distribution to deal with setting up any fancy toolchain business. =A0You&#=
39;d<br>
need to add something like this to your config file:<br>
<br>
TOOLCHAIN_PATH ?=3D &quot;${STAGING_BINDIR_TOOLCHAIN}&quot;<br>
TOOLCHAIN_SYSPATH ?=3D &quot;${TOOLCHAIN_PATH}/${TARGET_SYS}&quot;<br>
<span><font color=3D"#888888"><br></font></span></blockquote></div></div><d=
iv><br>Yes. I did that ant it worked. At least for this recipe.<span class=
=3D"HOEnZb"><font color=3D"#888888"><br>=A0<br></font></span></div><span cl=
ass=3D"HOEnZb"><font color=3D"#888888"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<span><font color=3D"#888888">
--<br>
Denys<br>
</font></span></blockquote></font></span></div><div class=3D"im"><br><br cl=
ear=3D"all"><br>-- <br>Flavio de Castro Alves Filho<br><br><a href=3D"mailt=
o:flavio.alves@gmail.com" target=3D"_blank">flavio.alves@gmail.com</a><div>=
<a href=3D"http://www.linuxembarcado.com" target=3D"_blank">www.linuxembarc=
ado.com</a><br>

Twitter: <a href=3D"http://twitter.com/#!/fraviofii" target=3D"_blank">http=
://twitter.com/#!/fraviofii</a><br></div><div>LinkedIn profile: <a href=3D"=
http://www.linkedin.com/in/flaviocastroalves" target=3D"_blank">www.linkedi=
n.com/in/flaviocastroalves</a></div>

<br>
</div></div>
</blockquote></div><br><br clear=3D"all"><br>-- <br>Flavio de Castro Alves =
Filho<br><br><a href=3D"mailto:flavio.alves@gmail.com" target=3D"_blank">fl=
avio.alves@gmail.com</a><div><a href=3D"http://www.linuxembarcado.com" targ=
et=3D"_blank">www.linuxembarcado.com</a><br>
Twitter: <a href=3D"http://twitter.com/#!/fraviofii" target=3D"_blank">http=
://twitter.com/#!/fraviofii</a><br></div><div>LinkedIn profile: <a href=3D"=
http://www.linkedin.com/in/flaviocastroalves" target=3D"_blank">www.linkedi=
n.com/in/flaviocastroalves</a></div>
<br>
</div>

--e89a8f502fae5d628a04ce786f5f--
