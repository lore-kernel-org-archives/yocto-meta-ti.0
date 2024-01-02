Return-Path: <bremenpl@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A272DC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 16:05:08 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.32198.1704211506246832689
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jan 2024 08:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LlE27vBE;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: bremenpl@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40b5155e154so126089425e9.3
        for <meta-ti@lists.yoctoproject.org>; Tue, 02 Jan 2024 08:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704211505; x=1704816305; darn=lists.yoctoproject.org;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzpVOkqAnxyNKVqfRlGaHN7apGLW0O5mwoBIpmaGSh4=;
        b=LlE27vBEdKBuNZww2fpeAAZgQ4yqeWeLFST2wrhX6LbyVez3My6chT1fpGrDMiJ0ZV
         FB+OejGIgMouO8cmt8RS0F77/gD2HQuvPaVwchTYWfGXnW4jTsceqRPNoG/sfMWkfy3k
         yRozWMZq+qRT+5Mb3lL+Ad6QZZOHtNzeLvUeUCaf/mSnClBs1LhKhGkvqaO1FiSPSyWh
         FmLtru4zTAK51kCeifp35QEkoDb6TiTqCxUpmunc1a/13Q2NYSLJ09+t4Sswrg9a6u5A
         5I0OMBonITCKm7LlC7fHjEAYASSPvTRNFNQiL3fb701Cl4x1quLmvy1j5OYorIHXnMhB
         +YOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704211505; x=1704816305;
        h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
         :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzpVOkqAnxyNKVqfRlGaHN7apGLW0O5mwoBIpmaGSh4=;
        b=LsCOWnXqPQUX8/830GG2eDsziKBIUwyukKH/NWLaf2aemjWSWzBxl2J/bLnT3izCQF
         4S3e5Ltu7V75oE3n2UrwM2KjdbszpVa3W2tUChPx67K6qVYvhkmba6Od50OAir+NtOlo
         EN5oatK2/N/7N1+9pykau4/X3xphRfVXdIQi8c50Fo6yaGp884UtlVtT75A6Gx7DhzL4
         kbK9jmoAxjyg5+XioYf4ievwXlNvRi2qTvux2Myu/iE+MGB3n7n0n9sB25xTSMsE+I9i
         KTT3xOqGQqPPROzrul31x7g5kxWjvusCQ1i12zAJuL0mvsHtFFxmiJaxrexoPFwQ3Vzq
         w1lA==
X-Gm-Message-State: AOJu0Yxq1OqzTuRXJC0txy2f/3V5s9197TRFOpwLMTWhkPiV9biEhdEz
	Bwfs7vap7Z34yaO97/6dPGU=
X-Google-Smtp-Source: AGHT+IEQYcyXYimgf6kh0m2cXlWmBn0GugkGpnAvIDJv38kv0+UOgAss/F5r0cVYi3OC6NPddsD2Gw==
X-Received: by 2002:a05:600c:468c:b0:40d:4a7f:2768 with SMTP id p12-20020a05600c468c00b0040d4a7f2768mr9235417wmo.237.1704211504396;
        Tue, 02 Jan 2024 08:05:04 -0800 (PST)
Received: from [192.168.7.17] (epe193.neoplus.adsl.tpnet.pl. [83.20.46.193])
        by smtp.gmail.com with ESMTPSA id r12-20020a05600c35cc00b0040d2dfb10e0sm50572741wmq.11.2024.01.02.08.05.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 08:05:03 -0800 (PST)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Jon Cormier" <jcormier@criticallink.com>
Subject: Re[2]: [meta-ti] Custom dts recipe
Cc: meta-ti@lists.yoctoproject.org
Date: Tue, 02 Jan 2024 16:04:59 +0000
Message-Id: <em43d72f75-9c13-4eaf-b5c1-722f8a25fa3e@c5cd1fef.com>
In-Reply-To: <CADL8D3YkVLQ-6N3g38OUX4ykp6KY3VipT4m8=8ZbHr6Zz9WBag@mail.gmail.com>
References: <tcKd.1703779596370036081.fG9M@lists.yoctoproject.org>
 <CADL8D3YkVLQ-6N3g38OUX4ykp6KY3VipT4m8=8ZbHr6Zz9WBag@mail.gmail.com>
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
User-Agent: eM_Client/9.2.2157.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------=_MB0607EBC7-767A-4932-8894-24EAECC7311C"
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jan 2024 16:05:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17375

--------=_MB0607EBC7-767A-4932-8894-24EAECC7311C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Jon,
Thank you for the answer.

When making any custom changes in Yocto, your always going to want to
create your own meta layer so that you can keep your changes separate
and so you can revision control your stuff.
Yes, this was sort of intuitive to me. That is how I started to manage=20
my custom project based on Yocto here:=20
https://github.com/Beaglenode/BeagleNodeOs/tree/setup_config

I have created this short script (still under development) that does the=20
preconfigurations (adding or removing layers and so on):=20
https://github.com/Beaglenode/BeagleNodeOs/blob/setup_config/setup.sh

I am not sure whether this is the way to go, but could not figure out=20
any better way with this approach, in which I have my own repo and just=20
use Poky (and 3rd party layers) as git submodules.

The other "method" I have stumbled upon is how it is done with for=20
instance openbmc: https://github.com/openbmc/openbmc

The way I see it, its a fork of Poky which is detached from the yocto=20
repo. This way, any changes can be easily implemented by editing any=20
needed files. Its more feasible when it comes to changes, but it felt=20
somehow "not right" to me.

How do you see this topic and the approach I have taken?

This guide from Toradex seems to do a decent job explaining it all.
Though the names of different recipes will have to be adjusted for the
boneblack.
I will check this out, thank you!

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "Jon Cormier" <jcormier@criticallink.com>
To "Lukasz Przenioslo" <bremenpl@gmail.com>
Cc meta-ti@lists.yoctoproject.org
Date 2024-01-02 16:54:49
Subject Re: [meta-ti] Custom dts recipe

>When making any custom changes in Yocto, your always going to want to
>create your own meta layer so that you can keep your changes separate
>and so you can revision control your stuff.
>
>This guide from Toradex seems to do a decent job explaining it all.
>Though the names of different recipes will have to be adjusted for the
>boneblack.
>
>https://developer.toradex.com/linux-bsp/os-development/build-yocto/custom-=
meta-layers-recipes-and-images-in-yocto-project-hello-world-examples/#custo=
mize-the-kernel
>
>On Thu, Dec 28, 2023 at 11:06=E2=80=AFAM Lukasz Przenioslo <bremenpl@gmail=
.com> wrote:
>>
>>  Hello,
>>  For a while now I am trying to create a custom device tree overlay for=
 the BBB/ BBG. It doesn't go so well. I started to think whether it would no=
t be more feasible to have a custom base dts file instead (just like `am335=
x-bonegreen.dts` or `am335x-boneblack.dts`. Based on one of these 2 files I =
could create, say, `am335x-bonepink.dts`. Assuming this `am335x-bonepink.d=
ts` would reside in some dir I have access to, what would be the preffered=
 Poky way of implementing it into the build? By that I mean that during bitb=
ake it would be compiled to a *.dtb and placed in the boot directory along=
 with the other dtb files. Do I need to create a custom recipe/ layer for th=
at and add it to the build via `bitbake-layers add-layer`? If yes, how woul=
d the steps look like in practice (I am quite new to Yocto/ Poky)?
>>
>>  I would appreciate all feedback!
>>
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>  Links: You receive all messages sent to this group.
>>  View/Reply Online (#17373): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/17373
>>  Mute This Topic: https://lists.yoctoproject.org/mt/103402787/7902621
>>  Group Owner: meta-ti+owner@lists.yoctoproject.org
>>  Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@c=
riticallink.com]
>>  -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>
>
>--
>Jonathan Cormier
>Software Engineer
>
>Voice:  315.425.4045 x222
>
>
>
>http://www.CriticalLink.com
>6712 Brooklawn Parkway, Syracuse, NY 13211
--------=_MB0607EBC7-767A-4932-8894-24EAECC7311C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style id=3D"css_styles" type=3D"text/css"><!--blockquote.cite { margin-lef=
t: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px; border-le=
ft: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: center; '], li[s=
tyle=3D'text-align: right;'], li[style=3D'text-align: right; '] {  list-sty=
le-position: inside;}
body { font-family: Verdana; font-size: 12pt; }
.quote { margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb soli=
d; padding-left: 0.3em; }
--></style></head>
<body><div>Hi Jon,</div><div>Thank you for the answer.</div><div><br /><div =
class=3D"quote"><div id=3D"x527516da88794978a5506606d1c1ff83"><div class=
=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3px 0px 16px =
5px;">When making any custom changes in Yocto, your always going to want t=
o</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">create your own meta layer so that you can keep your chang=
es separate</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">and so you can revision control your stuff.</div></div></d=
iv></div><div>Yes, this was sort of intuitive to me. That is how I started=
 to manage my custom project based on Yocto here:=C2=A0<a href=3D"https://gi=
thub.com/Beaglenode/BeagleNodeOs/tree/setup_config" style=3D"font-size: 12p=
t;">https://github.com/Beaglenode/BeagleNodeOs/tree/setup_config</a></div><=
div><br /></div><div>I have created this short script (still under developm=
ent) that does the preconfigurations (adding or removing layers and so on):=
=C2=A0<a href=3D"https://github.com/Beaglenode/BeagleNodeOs/blob/setup_conf=
ig/setup.sh" style=3D"font-size: 12pt;">https://github.com/Beaglenode/Beagl=
eNodeOs/blob/setup_config/setup.sh</a></div><div><br /></div><div>I am not=
 sure whether this is the way to go, but could not figure out any better way =
with this approach, in which I have my own repo and just use Poky (and 3rd =
party layers) as git submodules.</div><div><br /></div><div>The other "met=
hod" I have stumbled upon is how it is done with for instance openbmc:=C2=
=A0<a href=3D"https://github.com/openbmc/openbmc" style=3D"font-size: 12pt;=
">https://github.com/openbmc/openbmc</a></div><div><br /></div><div>The way =
I see it, its a fork of Poky which is detached from the yocto repo. This w=
ay, any changes can be easily implemented by editing any needed files. Its=
 more feasible when it comes to changes, but it felt somehow "not right" to=
 me.</div><div><br /></div><div>How do you see this topic and the approach I =
have taken?=C2=A0</div><div><br /><div class=3D"quote"><div id=3D"x69c79ee=
6bac243b8afccec89aeda830c"><div class=3D"plain_line" style=3D"background-co=
lor:rgba(0,0,0,0);margin:3px 0px 16px 5px;">This guide from Toradex seems t=
o do a decent job explaining it all.</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">Though the names of different recipes will have to be adju=
sted for the</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">boneblack.</div></div></div></div>
<div>I will check this out, thank you!</div><div><br /></div><div id=3D"sig=
nature_old" style=3D"clear:both">--<div>=C5=81ukasz Przenios=C5=82o</div></=
div><div style=3D"clear:both"><br /></div>
<div><br /></div>
<div>
<div>------ Original Message ------</div>
<div>From "Jon Cormier" &lt;<a href=3D"mailto:jcormier@criticallink.com">jc=
ormier@criticallink.com</a>&gt;</div>
<div>To "Lukasz Przenioslo" &lt;<a href=3D"mailto:bremenpl@gmail.com">breme=
npl@gmail.com</a>&gt;</div>
<div>Cc <a href=3D"mailto:meta-ti@lists.yoctoproject.org">meta-ti@lists.yoc=
toproject.org</a></div>
<div>Date 2024-01-02 16:54:49</div>
<div>Subject Re: [meta-ti] Custom dts recipe</div></div><div><br /></div>
<div id=3D"x3a68179002514c7" class=3D"plain"><blockquote cite=3D"CADL8D3YkV=
LQ-6N3g38OUX4ykp6KY3VipT4m8=3D8ZbHr6Zz9WBag@mail.gmail.com" type=3D"cite" c=
lass=3D"cite2">

<div class=3D"plain_line">When making any custom changes in Yocto, your alw=
ays going to want to</div>
<div class=3D"plain_line">create your own meta layer so that you can keep y=
our changes separate</div>
<div class=3D"plain_line">and so you can revision control your stuff.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">This guide from Toradex seems to do a decent job=
 explaining it all.</div>
<div class=3D"plain_line">Though the names of different recipes will have t=
o be adjusted for the</div>
<div class=3D"plain_line">boneblack.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"><a href=3D"https://developer.toradex.com/linux-bs=
p/os-development/build-yocto/custom-meta-layers-recipes-and-images-in-yocto=
-project-hello-world-examples/#customize-the-kernel">https://developer.tora=
dex.com/linux-bsp/os-development/build-yocto/custom-meta-layers-recipes-and=
-images-in-yocto-project-hello-world-examples/#customize-the-kernel</a></di=
v>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">On Thu, Dec 28, 2023 at 11:06=E2=80=AFAM Lukasz P=
rzenioslo &lt;<a href=3D"mailto:bremenpl@gmail.com">bremenpl@gmail.com</a>&=
gt; wrote:</div>
<blockquote type=3D"cite" class=3D"cite">
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> Hello,</div>
<div class=3D"plain_line"> For a while now I am trying to create a custom d=
evice tree overlay for the BBB/ BBG. It doesn't go so well. I started to th=
ink whether it would not be more feasible to have a custom base dts file in=
stead (just like `am335x-bonegreen.dts` or `am335x-boneblack.dts`. Based on =
one of these 2 files I could create, say, `am335x-bonepink.dts`. Assuming=
 this `am335x-bonepink.dts` would reside in some dir I have access to, what=
 would be the preffered Poky way of implementing it into the build? By that=
 I mean that during bitbake it would be compiled to a *.dtb and placed in th=
e boot directory along with the other dtb files. Do I need to create a cust=
om recipe/ layer for that and add it to the build via `bitbake-layers add-l=
ayer`? If yes, how would the steps look like in practice (I am quite new to =
Yocto/ Poky)?</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> I would appreciate all feedback!</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</d=
iv>
<div class=3D"plain_line"> Links: You receive all messages sent to this gro=
up.</div>
<div class=3D"plain_line"> View/Reply Online (#17373): <a href=3D"https://l=
ists.yoctoproject.org/g/meta-ti/message/17373">https://lists.yoctoproject.o=
rg/g/meta-ti/message/17373</a></div>
<div class=3D"plain_line"> Mute This Topic: <a href=3D"https://lists.yoctop=
roject.org/mt/103402787/7902621">https://lists.yoctoproject.org/mt/10340278=
7/7902621</a></div>
<div class=3D"plain_line"> Group Owner: <a href=3D"mailto:meta-ti+owner@lis=
ts.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a></div>
<div class=3D"plain_line"> Unsubscribe: <a href=3D"https://lists.yoctoproje=
ct.org/g/meta-ti/unsub">https://lists.yoctoproject.org/g/meta-ti/unsub</a>=
 [<a href=3D"mailto:jcormier@criticallink.com">jcormier@criticallink.com</a>=
]</div>
<div class=3D"plain_line"> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-</d=
iv>
<div class=3D"plain_line">=C2=A0</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">--</div>
<div class=3D"plain_line">Jonathan Cormier</div>
<div class=3D"plain_line">Software Engineer</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Voice:  315.425.4045 x222</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line"><a href=3D"http://www.CriticalLink.com">http://ww=
w.CriticalLink.com</a></div>
<div class=3D"plain_line">6712 Brooklawn Parkway, Syracuse, NY 13211</div>
</blockquote></div>


</body></html>
--------=_MB0607EBC7-767A-4932-8894-24EAECC7311C--


