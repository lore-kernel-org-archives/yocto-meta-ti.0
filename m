Return-Path: <flavio.alves@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A707BE0133F
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 05:29:01 -0800 (PST)
Received: by mail-oa0-f48.google.com with SMTP id h2so1769753oag.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Nov 2012 05:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xLp4WG6pyBQV7014V8eeWQPWnrfmuiEv9Xuj8mJW2gY=;
	b=U2mOL9awbPg6xR08QC9owcJ5AFp568lJag9hONUdIfTqxrVSithzYlJD11uzzZgNNp
	anPOpzul6kpaJ7jKwsyWpSZvG6akaWzZdr5i6yQXeGz9TNs1YTaoOhuBYNzr1s/SPkaK
	ge7v3Ie+dXMb6e2XilwvX4QA//vbOxQJUHpPsFcYTBYIsABLSwAyKO3o1LUYiLJJHSpE
	VCNrg3gkRuTNqD/5MpeP/xLOIsPOxX6npDkw91XJvyhWrI5M0ZmcFYi/jHTsKbr4uofh
	s3CJ0bWr8fu6zQ98jpLPi5D7PyuIBtMa0bFXMF7Z08g5T25zJ3i9E/LwpM3LVFMAXfua
	Pv/Q==
MIME-Version: 1.0
Received: by 10.60.27.227 with SMTP id w3mr781949oeg.82.1352986140167; Thu, 15
	Nov 2012 05:29:00 -0800 (PST)
Received: by 10.60.51.40 with HTTP; Thu, 15 Nov 2012 05:29:00 -0800 (PST)
Received: by 10.60.51.40 with HTTP; Thu, 15 Nov 2012 05:29:00 -0800 (PST)
In-Reply-To: <CAFNBftc__UJzsjwf0E+ETJecS1EbcvDaWsy8R4=7xUc+MEDWVg@mail.gmail.com>
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
	<CAFNBftc__UJzsjwf0E+ETJecS1EbcvDaWsy8R4=7xUc+MEDWVg@mail.gmail.com>
Date: Thu, 15 Nov 2012 11:29:00 -0200
Message-ID: <CAFNBftcnPO3057-PZg9+4mjeZh2gTUk3XCtS2doqJQ5ra9vZZg@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Nov 2012 13:29:01 -0000
Content-Type: multipart/alternative; boundary=e89a8fb201b0454cb304ce88a2d2

--e89a8fb201b0454cb304ce88a2d2
Content-Type: text/plain; charset=ISO-8859-1

I just would like to inform you that there is a detail regarding the build
od ti-dsplink recipe.

The directory structure must not have any '.' In the path. If it has, the
build will fail.

Best regards,

Flavio
 Em 14/11/2012 16:09, "Flavio Castro Alves Filho" <flavio.alves@gmail.com>
escreveu:

> It worked.
>
> I had a problem with a recipe at a fetch step, but it was an internet
> issue.
>
> That's great!! Thank you very much.
>
> Best regards,
>
> Flavio
>
>
> 2012/11/14 Flavio Castro Alves Filho <flavio.alves@gmail.com>
>
>>
>>
>>
>> 2012/11/13 Denys Dmytriyenko <denys@ti.com>
>>
>>> On Tue, Nov 13, 2012 at 11:10:31PM -0200, Flavio Castro Alves Filho
>>> wrote:
>>> > 2012/11/13 Tomas Frydrych <tf+lists.yocto@r-finger.com>
>>> >
>>> > | make[1]: /arm-poky-linux-gnueabi-gcc: Command not found
>>>
>>> ^^^^^^^^^
>>>
>>> Yes, some of the recipes in meta-ti still use old TOOLCHAIN_* vars from
>>> Classic OE, which were set specifically to allow building packages either
>>> with an internal toolchain or with an external prebuilt one. In OE-Core
>>> or
>>> Yocto/Poky those vars are not set by default, as it's left for the
>>> distribution to deal with setting up any fancy toolchain business.  You'd
>>> need to add something like this to your config file:
>>>
>>> TOOLCHAIN_PATH ?= "${STAGING_BINDIR_TOOLCHAIN}"
>>> TOOLCHAIN_SYSPATH ?= "${TOOLCHAIN_PATH}/${TARGET_SYS}"
>>>
>>>
>> Yes. I did that ant it worked. At least for this recipe.
>>
>>
>>>  --
>>> Denys
>>>
>>
>>
>>
>> --
>> Flavio de Castro Alves Filho
>>
>> flavio.alves@gmail.com
>> www.linuxembarcado.com
>> Twitter: http://twitter.com/#!/fraviofii
>> LinkedIn profile: www.linkedin.com/in/flaviocastroalves
>>
>>
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

--e89a8fb201b0454cb304ce88a2d2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p>I just would like to inform you that there is a detail regarding the bui=
ld od ti-dsplink recipe.</p>
<p>The directory structure must not have any &#39;.&#39; In the path. If it=
 has, the build will fail.</p>
<p>Best regards,</p>
<p>Flavio<br>
</p>
<div class=3D"gmail_quote">Em 14/11/2012 16:09, &quot;Flavio Castro Alves F=
ilho&quot; &lt;<a href=3D"mailto:flavio.alves@gmail.com">flavio.alves@gmail=
.com</a>&gt; escreveu:<br type=3D"attribution"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">
It worked.<br><br>I had a problem with a recipe at a fetch step, but it was=
 an internet issue.<br><br>That&#39;s great!! Thank you very much.<br><br>B=
est regards,<br><br>Flavio<br><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">

2012/11/14 Flavio Castro Alves Filho <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:flavio.alves@gmail.com" target=3D"_blank">flavio.alves@gmail.com</a>&gt;<=
/span><br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"><div><div=
>2012/11/13 Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=3D"mailto:denys=
@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span><br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">


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
iv><br>Yes. I did that ant it worked. At least for this recipe.<span><font =
color=3D"#888888"><br>=A0<br></font></span></div><span><font color=3D"#8888=
88"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">


<span><font color=3D"#888888">
--<br>
Denys<br>
</font></span></blockquote></font></span></div><div><br><br clear=3D"all"><=
br>-- <br>Flavio de Castro Alves Filho<br><br><a href=3D"mailto:flavio.alve=
s@gmail.com" target=3D"_blank">flavio.alves@gmail.com</a><div><a href=3D"ht=
tp://www.linuxembarcado.com" target=3D"_blank">www.linuxembarcado.com</a><b=
r>


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
</blockquote></div>

--e89a8fb201b0454cb304ce88a2d2--
