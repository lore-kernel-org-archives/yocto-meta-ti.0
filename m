Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D8F6E0144E
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:14:12 -0700 (PDT)
Received: by mail-oa0-f52.google.com with SMTP id n12so1268887oag.39
	for <meta-ti@yoctoproject.org>; Thu, 15 Aug 2013 12:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fliyB3tYSHCFf9n8cIlkW/+p95IB8dZjh8ljwWkhDy8=;
	b=zYqml86sJxdVhJIr9ovFMYRsyt/tWfoHMTG7aarz2PvWzFcDiBByj3sPt5VfffQPol
	CXZ/+SIXxpSzxKcj5T/pc+MMjvmfNuKsTpClzS49ZyQPKMEYt/is0lpWg5DODkZm6MwM
	F5tqY9mQuWibCl72XB391jKf1wmnCzccXrsO28fE77455WSyD+4iqBsMs43hxjI0vOIR
	RZAjMODnMmixgL+d1c2AZco/vf/DS2y10+IwCJz9EEOlQN9XAME1l6BtzgffwiexvFAg
	S3eCgB0ahKjIvCyfp7xgqt2746kY2+jB14075FiWsXYs+Bpo4niG/U/4TItc2MYgjUHJ
	tsAQ==
MIME-Version: 1.0
X-Received: by 10.182.51.228 with SMTP id n4mr1500731obo.70.1376594052048;
	Thu, 15 Aug 2013 12:14:12 -0700 (PDT)
Received: by 10.60.142.41 with HTTP; Thu, 15 Aug 2013 12:14:11 -0700 (PDT)
In-Reply-To: <20130815190600.GF2190@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CABcZANkNbqisKRLHTGmRSs=mbR4VBg2TqfV+CJp54R3G2eNUng@mail.gmail.com>
	<20130815190600.GF2190@edge>
Date: Thu, 15 Aug 2013 15:14:11 -0400
Message-ID: <CAFZh4h_q=heKGES0pQ=kkUJ5vnxK6PSm-OXFg58OTFx7GauANQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Chris Larson <clarson@kergoth.com>
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
X-List-Received-Date: Thu, 15 Aug 2013 19:14:13 -0000
Content-Type: multipart/alternative; boundary=089e0158b65678ebbf04e40147db

--089e0158b65678ebbf04e40147db
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 15, 2013 at 3:06 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> Yes, it is often a PITA to get old kernels build and work properly with new
> toolchains. E.g. you are aware of the alignment issue with 4.7, right?
>
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-kernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch
>
> --
> Denys
>

No, had not come across that one yet but it sounds like it is on the right
track after having read this thread:
https://lists.yoctoproject.org/pipermail/meta-ti/2012-May/001144.html

I'm trying to make sense of all this ... we need to keep syslink working
too which sounds like it (mailbox) needs kernel options which may cause
problems too.

Regards,

Brian

--089e0158b65678ebbf04e40147db
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On Thu, Aug 15, 2013 at 3:06 PM, Denys Dmytriyenko <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.c=
om</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:=
solid;padding-left:1ex">
<div class=3D""><div class=3D"h5"><br>
</div></div>Yes, it is often a PITA to get old kernels build and work prope=
rly with new<br>
toolchains. E.g. you are aware of the alignment issue with 4.7, right?<br>
<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-k=
ernel/linux/files/0001-arm-fix-builds-with-gcc-4.7.patch" target=3D"_blank"=
>http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-kernel/linu=
x/files/0001-arm-fix-builds-with-gcc-4.7.patch</a><br>

<span class=3D""><font color=3D"#888888"><br>
--<br>
Denys<br></font></span></blockquote><div><br></div><div>No, had not come ac=
ross that one yet but it sounds like it is on the right track after having =
read this thread:</div><div><a href=3D"https://lists.yoctoproject.org/piper=
mail/meta-ti/2012-May/001144.html">https://lists.yoctoproject.org/pipermail=
/meta-ti/2012-May/001144.html</a><br>
</div><div><br></div><div>I&#39;m trying to make sense of all this ... we n=
eed to keep syslink working too which sounds like it (mailbox) needs kernel=
 options which may cause problems too.</div><div><br></div><div>Regards,</d=
iv>
<div><br></div><div>Brian</div></div><br></div></div>

--089e0158b65678ebbf04e40147db--
