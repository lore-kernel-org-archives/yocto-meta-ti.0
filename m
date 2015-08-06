Return-Path: <ankur.tyagi85@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB416E00A73; Wed,  5 Aug 2015 20:41:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ankur.tyagi85[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.179 listed in list.dnswl.org]
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D173E00A53
	for <meta-ti@yoctoproject.org>; Wed,  5 Aug 2015 20:41:27 -0700 (PDT)
Received: by obbfr1 with SMTP id fr1so10174300obb.1
	for <meta-ti@yoctoproject.org>; Wed, 05 Aug 2015 20:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MS3coT0rxplF0KmZ7whsPBaVszOXbcY+Nc2MJXnsPiY=;
	b=d9Lw1u2/xkMypceakjK+d9w+Xbtq+bJpv2a/MFAgYkMPyKZkMt2bJ9yZUeF4qSJVco
	9hLm4BvgKz8YSeo78AL8WIae+5joUZN5sZT8GU6npRm1ZIWg1dKBgEkWMhGWjSG1N5KN
	/Av1CJyxpVfhTg4R+DtfLryhxbWUnPk9rAKHxe6fyJrtMrErjjxPySbFrKImYo3+zSS7
	kPkqWlMaEP0SrfIvdiXZIXzjwdJc6mY2oXS6VG+hu68AFH78D+ev4/XfV4ojTjDy4I7b
	jGJavKgI22yRv6J+31x2Rw0ZPnnvz+t9i67x7iUTVuQpF5T06/NyQctth68Sbg4yYoKI
	H4fg==
X-Received: by 10.60.33.74 with SMTP id p10mr11505099oei.62.1438832487202;
	Wed, 05 Aug 2015 20:41:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.86.131 with HTTP; Wed, 5 Aug 2015 20:41:07 -0700 (PDT)
In-Reply-To: <CAMKF1soasoTP6wYhC8WDEuBn05ROkCKd_AcaoYGWgM+dEWE_Uw@mail.gmail.com>
References: <CADySD0F4suq9YcgUy8HqzH6cYs1j4RZtmwfNTSvWTd+f872LKA@mail.gmail.com>
	<CAMKF1soasoTP6wYhC8WDEuBn05ROkCKd_AcaoYGWgM+dEWE_Uw@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Thu, 6 Aug 2015 15:41:07 +1200
Message-ID: <CADySD0HWA-06wXF34Nh2==K_HCuAMViaFaD1HLGiacMocghqig@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: omap3-sgx-modules-5.01.01.xx ONLY supports hardfp mode for now
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
X-List-Received-Date: Thu, 06 Aug 2015 03:41:29 -0000
Content-Type: multipart/alternative; boundary=089e0115eef84a85c7051c9c4b8d

--089e0115eef84a85c7051c9c4b8d
Content-Type: text/plain; charset=UTF-8

Thanks for your response.

So it is worth trying with TUNE_FEATURE "hfp" and measure the performance.
Do I have to set TARGET_FPU as "hfp-neon" as default value is "vfp-neon"

Does it make sense to push this change upstream as well ?

"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Thu, Aug 6, 2015 at 3:00 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Aug 5, 2015 at 7:47 PM, Ankur Tyagi <ankur.tyagi85@gmail.com>
> wrote:
> > Hi,
> >
> > I am using TI AM335x-EVM kit and while building image using
> > "arago-daisy-config.txt", I saw this warning :
> >
> > omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
> > omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now
> >
> > and TUNE_FEATUREis "vfp"
> >
> > Does that mean GPU is not getting used anymore ?
>
> not really, what its telling is that you dont have
> callconvention-hard in TUNE_FEATURES
> which means that compiler wont use hardfloat ABI when making function
> calls.
> but neon/vfp will still be used e.g. when doing vectorization etc. if
> using hardfp ABI will radically improve performance totally depends
> upon kind of workload that you are measuring. It may vary.
>
> > I am using QT5 with eglfs platform and need GPU support for performance.
> >
> > Please clarify the situation.
> >
> > Thanks
> > Ankur
> >
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> >
>

--089e0115eef84a85c7051c9c4b8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:georgia,=
serif;font-size:small;color:#333399">Thanks for your response.</div><div cl=
ass=3D"gmail_default" style=3D"font-family:georgia,serif;font-size:small;co=
lor:#333399"><br></div><div class=3D"gmail_default" style=3D"font-family:ge=
orgia,serif;font-size:small;color:#333399">So it is worth trying with TUNE_=
FEATURE &quot;hfp&quot; and measure the performance.</div><div class=3D"gma=
il_default" style=3D"font-family:georgia,serif;font-size:small;color:#33339=
9">Do I have to set TARGET_FPU as &quot;hfp-neon&quot; as default value is =
&quot;vfp-neon&quot;<br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:georgia,serif;font-size:small;color:#333399"><br></div><div class=3D"g=
mail_default" style=3D"font-family:georgia,serif;font-size:small;color:#333=
399">Does it make sense to push this change upstream as well ?=C2=A0</div><=
/div><div class=3D"gmail_extra"><br clear=3D"all"><div><div class=3D"gmail_=
signature"><div dir=3D"ltr">&quot;Knowledge is knowing tomato is a fruit, w=
isdom is not putting it in a fruit salad&quot;</div></div></div>
<br><div class=3D"gmail_quote">On Thu, Aug 6, 2015 at 3:00 PM, Khem Raj <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">=
raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<span class=3D"">On Wed, Aug 5, 2015 at 7:47 PM, Ankur Tyagi &lt;<a href=3D=
"mailto:ankur.tyagi85@gmail.com">ankur.tyagi85@gmail.com</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am using TI AM335x-EVM kit and while building image using<br>
&gt; &quot;arago-daisy-config.txt&quot;, I saw this warning :<br>
&gt;<br>
&gt; omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now<br>
&gt; omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for now<br>
&gt;<br>
&gt; and TUNE_FEATUREis &quot;vfp&quot;<br>
&gt;<br>
&gt; Does that mean GPU is not getting used anymore ?<br>
<br>
</span>not really, what its telling is that you dont have<br>
callconvention-hard in TUNE_FEATURES<br>
which means that compiler wont use hardfloat ABI when making function calls=
.<br>
but neon/vfp will still be used e.g. when doing vectorization etc. if<br>
using hardfp ABI will radically improve performance totally depends<br>
upon kind of workload that you are measuring. It may vary.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; I am using QT5 with eglfs platform and need GPU support for performanc=
e.<br>
&gt;<br>
&gt; Please clarify the situation.<br>
&gt;<br>
&gt; Thanks<br>
&gt; Ankur<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" rel=3D"nor=
eferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti<=
/a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--089e0115eef84a85c7051c9c4b8d--
