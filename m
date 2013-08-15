Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B12CE0073F
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:41:29 -0700 (PDT)
Received: by mail-oa0-f49.google.com with SMTP id n10so1493081oag.22
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 14:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9KURa0VJtwo71zUaHuAPw2QGeqda6/HfUbyvynwWd98=;
	b=maeRyoU/PY2+LKgJkAHqYopzQSs/zYHzT1GN0NNQNVQx5AIbpGQp5NDBfXvCvlC/CC
	Yu+NUGlYSxaJ9V6MU1J8MqpFfGbjAVpZ04vurS4TiQrfd65ZSkNyYYxT0ttJVooErpqE
	hcvkj5eFHIqbHa0Gl/+/hwDHNzb/Xr7eqggXe9Gqa3mmazopP0oEcYtth8ph4Zq1dfcp
	09CcRBEqaUKoAhSeVCbjfGHGxW6/euxeQW7Oiv/M+a+DeJGAGAlYiDOvPHjwDj55JbGt
	9eyCKs6iA64yuiDZ8ZZs4kPvrVmxBd4HDSafpWAivQUPkaowND1IkVBH/CSYbT/Eq/Yr
	eJFA==
MIME-Version: 1.0
X-Received: by 10.60.56.3 with SMTP id w3mr16176311oep.37.1376602889420; Thu,
	15 Aug 2013 14:41:29 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 14:41:29 -0700 (PDT)
In-Reply-To: <CAMKF1srWwdOs+d5EWFSYbup3hvUmBxXH+wf04msajpcVpYDiAA@mail.gmail.com>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h92PbtVfz3q0nknoRNe3nHaGGNurOa-T0HSGzRinvHCsA@mail.gmail.com>
	<CAMKF1srWwdOs+d5EWFSYbup3hvUmBxXH+wf04msajpcVpYDiAA@mail.gmail.com>
Date: Thu, 15 Aug 2013 17:41:29 -0400
Message-ID: <CAFZh4h-6DydrOUzER79ZyrDknFzV-vokZfFvcxOvm7ERufuhtA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 15 Aug 2013 21:41:30 -0000
Content-Type: multipart/alternative; boundary=001a11c20a72388ae704e4035607

--001a11c20a72388ae704e4035607
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 15, 2013 at 5:32 PM, Khem Raj <raj.khem@gmail.com> wrote:

>
> If its gcc 4.8+ then you also need more patches see my fixes for beagle
> e.g.
>
>
> https://github.com/beagleboard/meta-beagleboard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b
> 
>

Hi Khem,  good to hear from you.

I'll check those out.  On another machine I think I have an older Linaro
4.7 something laying around from last time I built something (well, tried
to.  Wanted DM6446 and learned it was dropped from OE Core) with Arago OE
Core a while ago.  I haven't tried that version on this Cortex A8 part but
I'm guessing I would run into the same issues as the latest (4.8) I
downloaded today???.  I'll apply those and give it a shot and report back.

Thanks!

Regards,

Brian

--001a11c20a72388ae704e4035607
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 15, 2013 at 5:32 PM, Khem Raj <span dir=3D"ltr=
">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmai=
l.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gma=
il_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div style=3D"font-family:&=
#39;courier new&#39;,monospace;font-size:small"><br></div><div class=3D"gma=
il_extra">
<div class=3D"gmail_quote"><div><div>If its gcc 4.8+ then you also need mor=
e patches see my fixes for beagle e.g.</div>

<div><br></div><div><a href=3D"https://github.com/beagleboard/meta-beaglebo=
ard/commit/87efc663c4f76d3051cecf1e2c3e2bbd461d200b" target=3D"_blank">http=
s://github.com/beagleboard/meta-beagleboard/commit/87efc663c4f76d3051cecf1e=
2c3e2bbd461d200b</a></div>


</div></div></div></div></blockquote></div><br></div><div class=3D"gmail_ex=
tra">Hi Khem, =A0good to hear from you.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">I&#39;ll check those out. =A0On another m=
achine I think I have an older Linaro 4.7 something laying around from last=
 time I built something (well, tried to. =A0Wanted DM6446 and learned it wa=
s dropped from OE Core) with Arago OE Core a while ago. =A0I haven&#39;t tr=
ied that version on this Cortex A8 part but I&#39;m guessing I would run in=
to the same issues as the latest (4.8) I downloaded today???. =A0I&#39;ll a=
pply those and give it a shot and report back.</div>
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Thanks!</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Regards,<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Brian<=
/div></div>

--001a11c20a72388ae704e4035607--
